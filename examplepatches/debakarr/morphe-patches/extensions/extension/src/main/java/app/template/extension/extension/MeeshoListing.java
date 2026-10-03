package app.template.extension.extension;

import org.json.JSONObject;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/**
 * Meesho listing responses ({@code 3.0/catalogs}, {@code 1.0/search/products},
 * {@code 1.0/clp}, collections, ...). Products live in {@code catalogs[]} /
 * {@code products[]}; each carries {@code catalog_reviews_summary.rating_count}
 * and ads are flagged with {@code ad.active == true} (app) or
 * {@code isAdProduct == true} (web feed).
 */
final class MeeshoListing {

    private MeeshoListing() {}

    private static final Set<String> LIST_KEYS =
        new HashSet<>(Arrays.asList("catalogs", "products"));

    private static final ListingSorter.Rules RULES = new ListingSorter.Rules() {
        @Override
        public boolean isProduct(JSONObject item) {
            return item.has("catalog_reviews_summary") || item.has("ad")
                || (item.has("catalog_id") && item.has("name"));
        }

        @Override
        public int ratingCount(JSONObject item) {
            JSONObject summary = item.optJSONObject("catalog_reviews_summary");
            if (summary == null) return -1;
            int count = summary.optInt("rating_count", 0);
            if (count <= 0) count = summary.optInt("review_count", 0);
            return count > 0 ? count : -1;
        }

        @Override
        public double rating(JSONObject item) {
            JSONObject summary = item.optJSONObject("catalog_reviews_summary");
            if (summary == null) return -1;
            // The average's field name is not confirmed on every feed: accept the usual ones.
            for (String key : new String[]{"average_rating", "avg_rating", "rating", "average"}) {
                double d = ListingSorter.toDouble(summary.opt(key));
                if (d > 0) return d;
            }
            return -1;
        }

        @Override
        public Product describe(JSONObject item) {
            String id = ListingSorter.firstString(item, "catalog_id", "id", "product_id");
            if (id.isEmpty()) return null;
            // Meesho's product links are "meesho.com/<slug>/p/<code>" where <code> is the
            // base-36 of the catalog's hero product id (hero_pid) — NOT of the catalog id
            // (verified: /p/99ecyr == hero_pid 559982115 of catalog 197079887).
            String code = id;
            long hero = (long) ListingSorter.toDouble(item.opt("hero_pid"));
            if (hero > 0) code = Long.toString(hero, 36);
            return new Product(id, ListingSorter.firstString(item, "name", "title"),
                ListingSorter.firstNumber(item, "min_catalog_price", "price", "min_product_price"),
                rating(item), ratingCount(item), "https://www.meesho.com/s/p/" + code);
        }

        @Override
        public boolean isAd(JSONObject item) {
            if (item.optBoolean("isAdProduct", false)) return true;
            JSONObject ad = item.optJSONObject("ad");
            return ad != null && ad.optBoolean("active", false);
        }
    };

    static String process(String json) {
        if (json == null || json.length() < 64) return json;
        if (json.indexOf("\"catalogs\"") < 0 && json.indexOf("\"products\"") < 0) return json;
        Diag.dump("meesho", json);
        if (json.indexOf("\"catalog_reviews_summary\"") < 0 && json.indexOf("\"ad\"") < 0) return json;
        SortState.noteListing();
        try {
            JSONObject root = new JSONObject(json);
            ListingSorter.Stats stats = new ListingSorter.Stats();
            ListingSorter.rewrite(root, LIST_KEYS, RULES, stats, 0);
            if (!stats.changed()) return json;
            SortByRatingsHelper.log("meesho " + stats);
            return root.toString();
        } catch (Throwable t) {
            SortByRatingsHelper.log("meesho rewrite failed: " + t);
            return json;
        }
    }
}
