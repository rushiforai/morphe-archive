package app.template.extension.extension;

import org.json.JSONObject;

import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/**
 * Myntra listing responses as handed to the React Native layer.
 *
 * <p>Search / listing pages are layout documents ({@code PRODUCT_TILE}, or
 * {@code PRODUCT_TILE_V2} with the rating and ad label under {@code productImage}):
 * {@code components[] = {id, itemType, itemData: {widgetType: "PRODUCT_TILE",
 * data: {productId, adLabel, ratingInfo: {rating, count: "12.3k"}, ...}}}}.
 * Banners and other widgets live in the same list and keep their position.
 */
final class MyntraListing {

    private MyntraListing() {}

    private static final int SORT_PAGE_SIZE = 60;

    private static final Set<String> LIST_KEYS =
        new HashSet<>(Arrays.asList("components", "products"));

    /** The product payload of a list item (layout tile, or a legacy flat product). */
    private static JSONObject data(JSONObject item) {
        JSONObject itemData = item.optJSONObject("itemData");
        if (itemData != null) {
            String type = itemData.optString("widgetType");
            if (!"PRODUCT_TILE".equals(type) && !"PRODUCT_TILE_V2".equals(type)) return null;
            return itemData.optJSONObject("data");
        }
        if (item.has("productId") || item.has("styleId")) return item;
        return null;
    }

    private static final ListingSorter.Rules RULES = new ListingSorter.Rules() {
        @Override
        public boolean isProduct(JSONObject item) {
            return data(item) != null;
        }

        @Override
        public int ratingCount(JSONObject item) {
            JSONObject d = data(item);
            if (d == null) return -1;
            JSONObject info = d.optJSONObject("ratingInfo");
            if (info == null) info = d.optJSONObject("rating");
            if (info == null) {
                // PRODUCT_TILE_V2 keeps it under productImage.
                JSONObject image = d.optJSONObject("productImage");
                if (image != null) info = image.optJSONObject("ratingInfo");
            }
            if (info != null) {
                Object count = info.opt("count");
                if (count instanceof Number) {
                    int n = ((Number) count).intValue();
                    return n > 0 ? n : -1;
                }
                if (count instanceof String) return ListingSorter.parseCountText((String) count);
            }
            Object legacy = d.opt("ratingCount");
            if (legacy instanceof Number) return ((Number) legacy).intValue();
            return -1;
        }

        @Override
        public boolean isAd(JSONObject item) {
            JSONObject d = data(item);
            if (d == null) return false;
            JSONObject image = d.optJSONObject("productImage");
            return !d.optString("adLabel", "").isEmpty()
                || (image != null && !image.optString("adLabel", "").isEmpty())
                || d.optBoolean("isPLA", false)
                || d.optBoolean("isAd", false)
                || d.optBoolean("sponsored", false);
        }
    };

    static String process(String json) {
        if (json == null || json.length() < 64 || json.charAt(0) != '{') return json;
        Diag.dump("myntra", json);
        if (json.indexOf("\"PRODUCT_TILE") < 0 && json.indexOf("\"productId\"") < 0) return json;
        SortState.noteListing();
        if (!SortState.sortOn() && !SortState.hideAds()) return json;
        try {
            JSONObject root = new JSONObject(json);
            ListingSorter.Stats stats = new ListingSorter.Stats();
            ListingSorter.rewrite(root, LIST_KEYS, RULES, stats, 0);
            // The page echoes its pagination context back on the next fetch:
            // ask for bigger pages while sorting so one sort covers more items.
            boolean bigger = false;
            JSONObject pagination = root.optJSONObject("paginationContext");
            if (pagination != null && SortState.sortOn()
                && pagination.optInt("pageSize", 0) > 0
                && pagination.optInt("pageSize", 0) < SORT_PAGE_SIZE) {
                pagination.put("pageSize", SORT_PAGE_SIZE);
                bigger = true;
            }
            if (!stats.changed() && !bigger) return json;
            SortByRatingsHelper.log("myntra " + stats);
            return root.toString();
        } catch (Throwable t) {
            SortByRatingsHelper.log("myntra rewrite failed: " + t);
            return json;
        }
    }

    /** Blob path: React Native's fetch stores response bodies as raw bytes. */
    static byte[] processBytes(byte[] body) {
        if (body == null || body.length < 2000) return body;
        int i = 0;
        while (i < body.length && body[i] <= ' ') i++;
        if (i >= body.length || body[i] != '{') return body;
        String in = new String(body, StandardCharsets.UTF_8);
        String out = process(in);
        return out == in ? body : out.getBytes(StandardCharsets.UTF_8);
    }
}
