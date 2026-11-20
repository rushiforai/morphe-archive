package app.windowshopper.extension.meesho;

import org.json.JSONArray;
import org.json.JSONObject;
import okhttp3.MediaType;
import okhttp3.Protocol;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;
import java.util.Collections;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.junit.Test;
import retrofit2.Invocation;

public final class UnclutterTest {
    private static String transform(String text, String path, boolean... f) throws Exception {
        return Unclutter.transform(text, path, flags(f));
    }

    private static String transform(String text, String path, Unclutter.Filters flags) throws Exception {
        return Unclutter.transform(text, path, flags);
    }

    private static Response filter(Response response, boolean... f) {
        return Unclutter.filter(response, flags(f));
    }

    private static Response filter(Response response, Unclutter.Filters flags) {
        return Unclutter.filter(response, flags);
    }

    private static Unclutter.Filters flags(boolean... f) {
        boolean[] all = Arrays.copyOf(f, 5);
        return new Unclutter.Filters(all[0], all[1], all[2], all[3], all[4]);
    }

    @Test
    public void filtersResponses() throws Exception {
        boolean assertions = false;
        assert assertions = true;
        if (!assertions) throw new IllegalStateException("Run with assertions enabled");
        String input = """
            {"cursor":"next-page","count":100,"products":[
              {"product":{"id":1,"ad":{"active":false},"catalog_reviews_summary":{"type":"product","rating_count":5}}},
              {"product":{"id":2,"ad":{"active":true},"catalog_reviews_summary":{"type":"product","rating_count":999}}},
              {"product":{"id":3,"catalog_reviews_summary":{"type":"product","rating_count":50},
                          "supplier_reviews_summary":{"type":"supplier","rating_count":90000}}},
              {"product":{"id":4,"catalog_reviews_summary":{"type":"supplier","rating_count":999999}}},
              {"product":{"id":5}},
              {"product":{"id":6,"catalog_reviews_summary":{"type":"product","rating_count":50}}},
              {"product":{"id":7},"catalog":{"ad":{"active":true}}}
            ],"non_endemic_ads_config":{"enable_widgets_order_details":true,"timeout_widgets_order_details":5000}}
            """;
        assert Unclutter.isTarget("prod.meeshoapi.com", "/api/1.0/search/products");
        assert Unclutter.isTarget("prod2.meeshoapi.com", "/api/1.0/feed/search/data");
        assert Unclutter.isTarget("prod.meeshoapi.com", "/api/1.0/anonymous/search/products");
        assert !Unclutter.isTarget("prod.meeshoapi.com.evil.example", "/api/1.0/feed");
        assert !Unclutter.isTarget("prod.meeshoapi.com", "/api/1.0/user/orders");
        assert !Unclutter.isTarget("prod.meeshoapi.com", "/api/2.0/user/login");
        assert !Unclutter.isTarget("prod.meeshoapi.com", "/api/1.0/cart");
        assert transform(input, "/api/1.0/search/products", false, false, false).equals(input);
        JSONObject output = new JSONObject(transform(
            input, "/api/1.0/search/products", true, true, true));
        JSONArray products = output.getJSONArray("products");
        int[] expected = {3, 6, 1, 4, 5};
        assert products.length() == expected.length;
        for (int i = 0; i < expected.length; i++) {
            assert products.getJSONObject(i).getJSONObject("product").getInt("id") == expected[i];
        }
        assert products.getJSONObject(0).getJSONObject("product").isNull("supplier_reviews_summary");
        assert products.getJSONObject(3).getJSONObject("product").isNull("catalog_reviews_summary");
        assert output.getString("cursor").equals("next-page");
        assert output.getInt("count") == 100;
        JSONObject config = output.getJSONObject("non_endemic_ads_config");
        assert !config.getBoolean("enable_widgets_order_details");
        assert config.getInt("timeout_widgets_order_details") == 5000;
        JSONObject unsorted = new JSONObject(transform(input, "/api/1.0/feed", true, false, true));
        assert unsorted.getJSONArray("products").getJSONObject(0).getJSONObject("product").getInt("id") == 1;
        assert !unsorted.getJSONArray("products").getJSONObject(1).getJSONObject("product").isNull("supplier_reviews_summary");
        JSONObject sortOnly = new JSONObject(transform(input, "/api/1.0/search/products", false, false, true));
        assert sortOnly.getJSONArray("products").length() == 7;
        assert sortOnly.getJSONArray("products").getJSONObject(0).getJSONObject("product").getInt("id") == 2;
        Response response = new Response.Builder()
            .request(new Request.Builder().url("https://prod.meeshoapi.com/api/1.0/search/products").build())
            .protocol(Protocol.HTTP_1_1).code(200).message("OK")
            .header("Content-Length", Integer.toString(input.length()))
            .body(ResponseBody.create(MediaType.get("application/json"), input)).build();
        Response filtered = filter(response, true, true, true);
        assert filtered != response;
        assert filtered.header("Content-Length") == null;
        assert new JSONObject(filtered.body().string()).getJSONArray("products").length() == 5;
        Response untouched = new Response.Builder()
            .request(new Request.Builder().url("https://prod.meeshoapi.com/api/1.0/user/orders").build())
            .protocol(Protocol.HTTP_1_1).code(200).message("OK")
            .body(ResponseBody.create(MediaType.get("application/json"), input)).build();
        assert filter(untouched, true, true, true) == untouched;
        assert untouched.body().string().equals(input);
        Response nonJson = response.newBuilder()
            .body(ResponseBody.create(MediaType.get("text/plain"), input)).build();
        assert filter(nonJson, true, true, true) == nonJson;
        assert nonJson.body().string().equals(input);
        Response failed = response.newBuilder().code(503)
            .body(ResponseBody.create(MediaType.get("application/json"), input)).build();
        assert filter(failed, true, true, true) == failed;
        assert failed.body().string().equals(input);
        assert transform("{\"products\":[]}", "/api/1.0/search/products", true, true, true).equals("{\"products\":[]}");
        JSONObject legacy = new JSONObject(transform(
            "{\"search_id\":\"s\",\"catalogs\":[{\"id\":1,\"name\":\"a\",\"catalog_reviews_summary\":{\"rating_count\":2}},"
            + "{\"id\":2,\"name\":\"b\",\"catalog_reviews_summary\":{\"rating_count\":8}}]}",
            "/api/3.0/catalogs", true, true, true));
        assert legacy.getJSONArray("catalogs").getJSONObject(0).getInt("id") == 2;
        JSONObject sdui = new JSONObject(transform("""
            {"section_layouts":[{"grid":{"dynamic_components":[
              {"card":{"component_props":{"model":{"id":1,"name":"a","catalog_reviews_summary":{"rating_count":2}}}}},
              {"card":{"component_props":{"model":{"id":2,"name":"b","ad":{"active":true}}}}},
              {"card":{"component_props":{"model":{"id":3,"name":"c","catalog_reviews_summary":{"rating_count":8}}}}}
            ]}}],"ocp_pay_later_ad_banner":{"enabled":true}}
            """, "/api/1.0/feed/search/data", true, true, true));
        JSONArray cards = sdui.getJSONArray("section_layouts").getJSONObject(0)
            .getJSONObject("grid").getJSONArray("dynamic_components");
        assert cards.length() == 2;
        assert cards.getJSONObject(0).getJSONObject("card").getJSONObject("component_props")
            .getJSONObject("model").getInt("id") == 3;
        assert !sdui.getJSONObject("ocp_pay_later_ad_banner").getBoolean("enabled");
        String adGroups = """
            {"products":[{"id":1,"ad":{"active":true}},{"id":2}],
             "non_endemic_ads_config":{"enable_widgets_order_details":true},
             "ocp_pay_later_ad_banner":{"enabled":true}}
            """;
        Unclutter.Filters flags = new Unclutter.Filters(true, false, false, false, false);
        flags.orderAds = flags.confirmationAd = false;
        JSONObject sponsoredOnly = new JSONObject(transform(adGroups, "/api/1.0/feed", flags));
        assert sponsoredOnly.getJSONArray("products").length() == 1;
        assert sponsoredOnly.getJSONObject("non_endemic_ads_config").getBoolean("enable_widgets_order_details");
        assert sponsoredOnly.getJSONObject("ocp_pay_later_ad_banner").getBoolean("enabled");
        flags = new Unclutter.Filters(false, false, false, false, false);
        flags.orderAds = true;
        JSONObject widgetsOnly = new JSONObject(transform(adGroups, "/api/1.0/feed", flags));
        assert widgetsOnly.getJSONArray("products").length() == 2;
        assert !widgetsOnly.getJSONObject("non_endemic_ads_config").getBoolean("enable_widgets_order_details");
        assert widgetsOnly.getJSONObject("ocp_pay_later_ad_banner").getBoolean("enabled");
        flags.orderAds = false;
        flags.confirmationAd = true;
        JSONObject bannerOnly = new JSONObject(transform(adGroups, "/api/1.0/feed", flags));
        assert bannerOnly.getJSONArray("products").length() == 2;
        assert bannerOnly.getJSONObject("non_endemic_ads_config").getBoolean("enable_widgets_order_details");
        assert !bannerOnly.getJSONObject("ocp_pay_later_ad_banner").getBoolean("enabled");
        String feed = """
            {"catalogs":[{"id":1,"format":"REEL"},{"id":2,"format":"product",
            "media":[{"type":"video"}]},{"id":3}],"cursor":"next"}
            """;
        JSONObject withoutReels = new JSONObject(transform(
            feed, "/api/5.0/for-you", false, false, false, true));
        assert withoutReels.getJSONArray("catalogs").length() == 2;
        assert withoutReels.getJSONArray("catalogs").getJSONObject(0).getInt("id") == 2;
        assert withoutReels.getString("cursor").equals("next");
        assert new JSONObject(transform(feed, "/api/1.0/reels", false, false, false, true))
            .getJSONArray("catalogs").length() == 3;
        assert new JSONObject(transform(feed, "/api/5.0/for-you", false, false, false, false))
            .getJSONArray("catalogs").length() == 3;
        String priceFeed = """
            {"catalogs":[
              {"id":1,"min_product_price":321,"secondary_price_type":"MEESHO_BNPL",
               "secondary_price_view":{"amount":293}},
              {"id":2,"min_product_price":200,"secondary_price_type":"PREPAID",
               "secondary_price_view":{"amount":180}},
              {"id":3,"min_product_price":150,"secondary_price_view":{"amount":140}}
            ]}
            """;
        JSONArray prices = new JSONObject(transform(
            priceFeed, "/api/1.0/feed/search/data", false, false, false, false, true))
            .getJSONArray("catalogs");
        assert prices.getJSONObject(0).isNull("secondary_price_view");
        assert prices.getJSONObject(0).getInt("min_product_price") == 321;
        assert prices.getJSONObject(1).getJSONObject("secondary_price_view").getInt("amount") == 180;
        assert prices.getJSONObject(2).getJSONObject("secondary_price_view").getInt("amount") == 140;
        assert !new JSONObject(transform(
            priceFeed, "/api/1.0/product/dynamic", false, false, false, false, true))
            .getJSONArray("catalogs").getJSONObject(0).isNull("secondary_price_view");
        assert !new JSONObject(transform(
            priceFeed, "/api/1.0/feed/search/data", false, false, false, false, false))
            .getJSONArray("catalogs").getJSONObject(0).isNull("secondary_price_view");
        String widgets = """
            {"header_widget_groups":[
              {"id":51712,"component":{"components":[{"ac_data":{"screen":"bnpl_webview"}}]}},
              {"id":53269,"component":{"components":[{"ac_data":{"screen":"bnpl_webview"}}]}},
              {"id":51712,"title":"Repayment due","component":{"components":[{"ac_data":{"screen":"bnpl_webview"}}]}},
              {"id":123,"component":{"components":[{"ac_data":{"screen":"bnpl_webview"}}]}}
            ],"widget_groups":[{"id":53269}],"orders":[{"id":1}]}
            """;
        Response ordersWidgets = widgetsResponse(widgets, "orders", "prod.meeshoapi.com");
        Response filteredWidgets = filter(ordersWidgets, true, false, false);
        JSONObject remaining = new JSONObject(filteredWidgets.body().string());
        assert remaining.getJSONArray("header_widget_groups").length() == 2;
        assert remaining.getJSONArray("header_widget_groups").getJSONObject(0).getString("title").equals("Repayment due");
        assert remaining.getJSONArray("widget_groups").length() == 1;
        assert remaining.getJSONArray("orders").length() == 1;
        Response otherScreen = widgetsResponse(widgets, "cart", "prod.meeshoapi.com");
        assert filter(otherScreen, true, false, false) == otherScreen;
        Response otherHost = widgetsResponse(widgets, "orders", "prod.meeshoapi.com.evil.example");
        assert filter(otherHost, true, false, false) == otherHost;
        Response disabled = widgetsResponse(widgets, "orders", "prod.meeshoapi.com");
        assert filter(disabled, false, false, false) == disabled;
        Unclutter.Filters financeOnly = new Unclutter.Filters(false, false, false, false, false);
        financeOnly.orderFinance = true;
        assert new JSONObject(filter(
            widgetsResponse(widgets, "orders", "prod.meeshoapi.com"), financeOnly)
            .body().string()).getJSONArray("header_widget_groups").length() == 2;
        Unclutter.Filters sponsoredWithoutFinance = new Unclutter.Filters(true, false, false, false, false);
        sponsoredWithoutFinance.orderFinance = false;
        Response preservedFinance = widgetsResponse(widgets, "orders", "prod.meeshoapi.com");
        assert filter(preservedFinance, sponsoredWithoutFinance) == preservedFinance;
        String wishlist = "{\"widget_groups\":[{\"id\":1,\"title\":\"Buy now, pay next month\"},"
            + "{\"id\":2,\"title\":\"Top picks\"}],\"header_widget_groups\":[{\"ac_data\":{\"screen\":\"bnpl_webview\"}}]}";
        JSONObject wishlistLeft = new JSONObject(filter(
            widgetsResponse(wishlist, "wishlist", "prod.meeshoapi.com"), true, false, false).body().string());
        assert wishlistLeft.getJSONArray("widget_groups").length() == 1;
        assert wishlistLeft.getJSONArray("widget_groups").getJSONObject(0).getInt("id") == 2;
        assert wishlistLeft.getJSONArray("header_widget_groups").length() == 0;
        Unclutter.Filters keepWishlist = new Unclutter.Filters(true, false, false, false, false);
        keepWishlist.wishlistAd = false;
        Response keptWishlist = widgetsResponse(wishlist, "wishlist", "prod.meeshoapi.com");
        assert filter(keptWishlist, keepWishlist) == keptWishlist;
        String trays = "{\"widget_groups\":["
            + "{\"id\":1,\"source\":{\"source_system\":\"DYNAMIC_FEED_IN_FEED\",\"source_meta\":{\"filters\":[{\"field\":\"highASP_enabled\"}]}}},"
            + "{\"id\":2,\"source\":{\"source_system\":\"DYNAMIC_FEED_IN_FEED\",\"source_meta\":{}}},"
            + "{\"id\":3,\"source\":{\"source_system\":\"SUGGESTION_QUERY_FEED_IN_FEED\"}},"
            + "{\"id\":4,\"source\":{\"source_system\":\"FY_POP_UP\"}}]}";
        Unclutter.Filters goldOnly = new Unclutter.Filters(false, false, false, false, false);
        goldOnly.goldTray = true;
        JSONArray trayLeft = new JSONObject(filter(widgetsResponse(trays, "catalog_search_results",
            "prod.meeshoapi.com"), goldOnly).body().string()).getJSONArray("widget_groups");
        assert trayLeft.length() == 3 && trayLeft.getJSONObject(0).getInt("id") == 2;
        Unclutter.Filters allTrays = new Unclutter.Filters(false, false, false, false, false);
        allTrays.goldTray = allTrays.suggestionTray = allTrays.similarTray = true;
        assert new JSONObject(filter(widgetsResponse(trays, "catalog_search_results",
            "prod.meeshoapi.com"), allTrays).body().string()).getJSONArray("widget_groups").length() == 2;
        trayLeft = new JSONObject(filter(widgetsResponse(trays, "search_pop_up",
            "prod.meeshoapi.com"), allTrays).body().string()).getJSONArray("widget_groups");
        assert trayLeft.length() == 3 && trayLeft.getJSONObject(2).getInt("id") == 3 : trayLeft;
        assert new JSONObject(filter(widgetsResponse(trays, "fy_pop_up",
            "prod.meeshoapi.com"), allTrays).body().string()).getJSONArray("widget_groups").length() == 3;
        Response keptTrays = widgetsResponse(trays, "catalog_search_results", "prod.meeshoapi.com");
        assert filter(keptTrays, new Unclutter.Filters(true, true, true, true, true)) == keptTrays;
        Response invalid = response.newBuilder()
            .body(ResponseBody.create(MediaType.get("application/json"), "{invalid")).build();
        assert filter(invalid, true, true, true) == invalid;
        assert invalid.body().string().equals("{invalid");
    }

    @Test
    public void sortsLoadedCards() throws Exception {
        Object heading = new Object();
        Card low = new Card(new Summary(5, "PRODUCT"));
        Card high = new Card(new Summary(50, "PRODUCT"));
        Card tied = new Card(new Summary(50, "PRODUCT"));
        Card supplier = new Card(new Summary(9999, "SUPPLIER"));
        Card missing = new Card(null);
        List<Object> rows = new ArrayList<>(Arrays.asList(heading, low, high, tied, supplier, missing));
        int sorted = LoadedSortCore.sort(rows, Card.class, Card.class.getField("catalog"),
            Catalog.class.getField("summary"), Summary.class.getField("count"), Summary.class.getField("type"));
        assert sorted == 5;
        assert rows.equals(Arrays.asList(heading, high, tied, low, supplier, missing));
        Card nextPage = new Card(new Summary(500, "PRODUCT"));
        rows.add(nextPage);
        LoadedSortCore.sort(rows, Card.class, Card.class.getField("catalog"),
            Catalog.class.getField("summary"), Summary.class.getField("count"), Summary.class.getField("type"));
        assert rows.equals(Arrays.asList(heading, nextPage, high, tied, low, supplier, missing));
    }

    public static final class Card {
        public final Catalog catalog;
        Card(Summary summary) { catalog = new Catalog(summary); }
    }
    public static final class Catalog {
        public final Summary summary;
        Catalog(Summary summary) { this.summary = summary; }
    }
    public static final class Summary {
        public final int count;
        public final String type;
        Summary(int count, String type) { this.count = count; this.type = type; }
    }

    private static Response widgetsResponse(String text, String screen, String host) throws Exception {
        Invocation invocation = Invocation.of(UnclutterTest.class.getMethod("filtersResponses"),
            Collections.singletonList(Collections.singletonMap("screen_name", screen)));
        Request request = new Request.Builder()
            .url("https://" + host + "/api/1.0/widget-groups/fetch")
            .tag(Invocation.class, invocation).build();
        return new Response.Builder().request(request).protocol(Protocol.HTTP_1_1)
            .code(200).message("OK")
            .body(ResponseBody.create(MediaType.get("application/json"), text)).build();
    }
}
