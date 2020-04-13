-- 1. Get all customers and their addresses.
SELECT "first_name", "last_name", "street", "city", "state", "zip" FROM "customers"
JOIN "addresses" ON "customers"."id" = "addresses"."customer_id";

-- 2. Get all orders and their line items (orders, quantity and product).
SELECT "orders"."id", "line_items"."quantity", "products"."description" FROM "line_items"
JOIN "orders" ON "line_items"."order_id" = "orders"."id"
JOIN "products" ON "line_items"."product_id" = "products"."id"
ORDER BY "orders"."id";

-- 3. Which warehouses have cheetos?
SELECT "warehouse", "products"."description", "on_hand" FROM "warehouse_product"
JOIN "products" ON "warehouse_product"."product_id" = "products"."id"
JOIN "warehouse" ON "warehouse_product"."warehouse_id" = "warehouse"."id"
WHERE ("products"."description" = 'cheetos');

-- 4. Which warehouses have diet pepsi?
SELECT "warehouse", "products"."description", "on_hand" FROM "warehouse_product"
JOIN "products" ON "warehouse_product"."product_id" = "products"."id"
JOIN "warehouse" ON "warehouse_product"."warehouse_id" = "warehouse"."id"
WHERE ("products"."description" = 'diet pepsi');

-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "customers"."id", COUNT(*) FROM "addresses"
JOIN "orders" ON "addresses"."id" = "orders"."address_id"
JOIN "customers" ON "addresses"."customer_id" = "customers"."id"
GROUP BY "customers"."id";

-- 6. How many customers do we have?
SELECT COUNT(*) FROM "customers";

-- 7. How many products do we carry?
SELECT COUNT(*) FROM "products";

-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT "products"."description", SUM("on_hand") FROM "warehouse_product"
JOIN "products" ON "warehouse_product"."product_id" = "products"."id"
WHERE ("products"."description" = 'diet pepsi')
GROUP BY "products"."description";