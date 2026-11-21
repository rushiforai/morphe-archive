package app.windowshopper.extension.meesho;

import android.util.Log;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import okhttp3.MediaType;
import okhttp3.Response;
import okhttp3.ResponseBody;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import retrofit2.Invocation;

public final class Unclutter {
    private static final long MAX_BODY = 8 * 1024 * 1024;
    private static final String TAG = "WindowShopper";

    private Unclutter() {}

    public static boolean hideAds() { return false; }
    public static boolean productRatings() { return false; }
    public static boolean sortRatings() { return false; }
    public static boolean hideFeedVideos() { return false; }
    public static boolean hidePayLaterPrice() { return false; }
    public static boolean loadedSort() { return false; }
    public static boolean hideFinanceProfile() { return false; }
    public static boolean hideSearchTrays() { return false; }
    public static boolean hideNavTabs() { return false; }
    public static boolean hideReferEarn() { return false; }
    public static boolean blockTelemetry() { return false; }

    public static Response filter(Response response) {
        Filters flags = new Filters(Settings.enabled(Settings.Feature.SPONSORED),
            Settings.enabled(Settings.Feature.SHOP_RATINGS), Settings.enabled(Settings.Feature.AUTO_SORT),
            Settings.enabled(Settings.Feature.FEED_VIDEOS), Settings.enabled(Settings.Feature.PAY_LATER_PRICE));
        flags.orderAds = Settings.enabled(Settings.Feature.ORDER_ADS);
        flags.orderFinance = Settings.enabled(Settings.Feature.ORDER_FINANCE);
        flags.confirmationAd = Settings.enabled(Settings.Feature.CONFIRMATION_AD);
        flags.wishlistAd = Settings.enabled(Settings.Feature.WISHLIST_AD);
        flags.promoPopup = Settings.enabled(Settings.Feature.PROMO_POPUP);
        flags.referEarn = Settings.enabled(Settings.Feature.REFER_EARN);
        flags.goldTray = Settings.enabled(Settings.Feature.GOLD_TRAY);
        flags.suggestionTray = Settings.enabled(Settings.Feature.SUGGESTION_TRAY);
        flags.relatedTray = Settings.enabled(Settings.Feature.RELATED_TRAY);
        flags.recentShelf = Settings.enabled(Settings.Feature.RECENT_SHELF);
        return filter(response, flags);
    }

    static final class Filters {
        final boolean ads, ratings, sort, videos, hidePrice;
        boolean orderAds, orderFinance, confirmationAd, wishlistAd, promoPopup, referEarn, goldTray, suggestionTray, relatedTray, recentShelf;

        Filters(boolean ads, boolean ratings, boolean sort, boolean videos, boolean hidePrice) {
            this.ads = ads;
            this.ratings = ratings;
            this.sort = sort;
            this.videos = videos;
            this.hidePrice = hidePrice;
            orderAds = orderFinance = confirmationAd = wishlistAd = promoPopup = ads;
        }
    }

    static Response filter(Response response, Filters flags) {
        String host = response.request().url().host();
        String path = response.request().url().encodedPath();
        boolean meesho = host.matches("prod[1-4]?\\.meeshoapi\\.com");
        boolean widgets = meesho && "/api/1.0/widget-groups/fetch".equals(path);
        boolean home = flags.recentShelf && meesho && "/api/1.0/home-page/fetch".equals(path);
        if (flags.promoPopup && meesho && path.matches("/api/[0-9.]+/inapp/popup") && response.isSuccessful()) {
            ResponseBody popup = response.body();
            if (popup != null) popup.close();
            return response.newBuilder().removeHeader("Content-Length")
                .body(ResponseBody.create(MediaType.get("application/json"), "{}")).build();
        }
        Object screen = widgets ? screenName(response) : null;
        boolean orderBanners = flags.orderFinance && "orders".equals(screen);
        boolean wishlistBanners = flags.wishlistAd && "wishlist".equals(screen);
        boolean searchTrays = (flags.goldTray || flags.suggestionTray || flags.relatedTray)
            && "catalog_search_results".equals(screen) || home;
        if ((!isTarget(host, path) && !orderBanners && !wishlistBanners && !searchTrays) || !response.isSuccessful()) return response;
        ResponseBody body = response.body();
        if (body == null) return response;
        MediaType type = body.contentType();
        if (type == null || !"json".equals(type.subtype())) return response;
        try {
            // ponytail: buffer at most 8 MiB; use streaming JSON if discovery responses outgrow this.
            if (body.contentLength() > MAX_BODY) {
                Log.w(TAG, "Response too large to filter: " + path);
                return response;
            }
            ResponseBody peek = response.peekBody(MAX_BODY);
            if (peek.contentLength() >= MAX_BODY) {
                Log.w(TAG, "Response reached filtering limit: " + path);
                return response;
            }
            String original = peek.string();
            String filtered = orderBanners ? removeOrderBanners(original)
                : wishlistBanners ? removeWishlistBanners(original)
                : searchTrays ? removeSearchTrays(original, home, flags)
                : transform(original, path, flags);
            if (filtered.equals(original)) return response;
            ResponseBody replacement = ResponseBody.create(type, filtered);
            Response result = response.newBuilder()
                .removeHeader("Content-Length")
                .body(replacement)
                .build();
            body.close();
            return result;
        } catch (IOException | JSONException error) {
            // Never log the exception: org.json embeds the whole response body in its message.
            Log.e(TAG, "Could not filter response: " + path + " (" + error.getClass().getSimpleName() + ")");
            return response;
        }
    }

    private static Object screenName(Response response) {
        Invocation invocation = response.request().tag(Invocation.class);
        if (invocation == null) return null;
        List<?> args = invocation.arguments();
        return args.size() == 1 && args.get(0) instanceof Map
            ? ((Map<?, ?>) args.get(0)).get("screen_name") : null;
    }

    static String removeWishlistBanners(String text) throws JSONException {
        JSONObject root = new JSONObject(text);
        boolean changed = false;
        for (String key : new String[] {"widget_groups", "header_widget_groups"}) {
            JSONArray groups = root.optJSONArray(key);
            if (groups == null) continue;
            for (int i = groups.length() - 1; i >= 0; i--) {
                String content = String.valueOf(groups.opt(i)).toLowerCase(Locale.ROOT);
                if (content.contains("bnpl") || content.contains("pay later") || content.contains("paylater")
                        || content.contains("pay next month") || content.contains("mcc")) {
                    groups.remove(i);
                    changed = true;
                }
            }
        }
        return changed ? root.toString() : text;
    }

    static String removeSearchTrays(String text, boolean home, Filters flags) throws JSONException {
        JSONObject root = new JSONObject(text);
        JSONArray groups = root.optJSONArray("widget_groups");
        if (groups == null) return text;
        boolean changed = false;
        for (int i = groups.length() - 1; i >= 0; i--) {
            JSONObject group = groups.optJSONObject(i);
            JSONObject source = group == null ? null : group.optJSONObject("source");
            if (source == null) continue;
            String system = source.optString("source_system");
            boolean gold = "DYNAMIC_FEED_IN_FEED".equals(system)
                && String.valueOf(source.opt("source_meta")).contains("highASP_enabled");
            if (home ? "RECENTLY_VIEWED_NEW".equals(system) : flags.goldTray && gold || flags.suggestionTray && "SUGGESTION_QUERY_FEED_IN_FEED".equals(system)
                    || flags.relatedTray && "CLP".equals(system)) {
                groups.remove(i);
                changed = true;
            }
        }
        return changed ? root.toString() : text;
    }

    private static String removeOrderBanners(String text) throws JSONException {
        JSONObject root = new JSONObject(text);
        JSONArray groups = root.optJSONArray("header_widget_groups");
        if (groups == null) return text;
        boolean changed = false;
        for (int i = groups.length() - 1; i >= 0; i--) {
            JSONObject group = groups.optJSONObject(i);
            if (group == null) continue;
            long id = group.optLong("id", -1);
            JSONObject component = group.optJSONObject("component");
            JSONArray children = component == null ? null : component.optJSONArray("components");
            JSONObject child = children != null && children.length() == 1 ? children.optJSONObject(0) : null;
            JSONObject action = child == null ? null : child.optJSONObject("ac_data");
            String content = group.toString().toLowerCase(Locale.ROOT);
            // ponytail: only observed campaign IDs; update when Meesho changes its banner identifiers.
            if ((id == 51712 || id == 53269) && action != null
                    && "bnpl_webview".equals(action.optString("screen"))
                    && !content.contains("repay") && !content.contains("overdue")
                    && !content.contains("outstanding") && !content.contains("amount_due")) {
                groups.remove(i);
                changed = true;
            }
        }
        return changed ? root.toString() : text;
    }

    static boolean isTarget(String host, String path) {
        if (!host.matches("prod[1-4]?\\.meeshoapi\\.com")) return false;
        return path.matches("/api/[0-9.]+/(?:anonymous/)?(?:configs?(?:/.*)?|feed(?:/.*)?|"
            + "search/products|clp|plp|dynamic-filters-feed|meri-shop/feed|"
            + "for-you|deals-for-you|catalogs(?:/.*)?|catalog/products|"
            + "collections/[^/]+|reco(?:/.*)?|product(?:/static|/dynamic)?)");
    }

    static String transform(String text, String path, Filters flags) throws JSONException {
        if (!flags.ads && !flags.ratings && !flags.sort && !flags.videos && !flags.hidePrice
                && !flags.orderAds && !flags.confirmationAd && !flags.referEarn) return text;
        JSONObject root = new JSONObject(text);
        boolean feed = path.matches("/api/[0-9.]+/(?:anonymous/)?(?:for-you|feed(?:/.*)?|"
            + "clp|plp|dynamic-filters-feed|meri-shop/feed)");
        boolean listing = feed || path.matches("/api/[0-9.]+/(?:anonymous/)?(?:search/products|"
            + "catalogs(?:/.*)?|catalog/products|collections/[^/]+|reco(?:/.*)?|deals-for-you)");
        clean(root, flags, flags.videos && feed, flags.hidePrice && listing);
        if (flags.sort && (path.endsWith("/search/products") || path.endsWith("/feed/search/data")
                || (path.endsWith("/catalogs") && !root.optString("search_id", "").isEmpty()))) {
            sortProducts(root);
        }
        return root.toString();
    }

    private static void clean(JSONObject object, Filters flags, boolean videos,
            boolean hidePrice) throws JSONException {
        if (hidePrice && "MEESHO_BNPL".equalsIgnoreCase(object.optString("secondary_price_type"))
                && object.has("secondary_price_view")) {
            object.put("secondary_price_view", JSONObject.NULL);
        }
        List<String> keys = new ArrayList<>();
        Iterator<String> iterator = object.keys();
        while (iterator.hasNext()) keys.add(iterator.next());
        for (String key : keys) {
            Object value = object.get(key);
            if (flags.ratings && ("supplier_reviews_summary".equals(key)
                    || ("catalog_reviews_summary".equals(key) && value instanceof JSONObject
                        && "supplier".equalsIgnoreCase(((JSONObject) value).optString("type"))))) {
                object.put(key, JSONObject.NULL);
                continue;
            }
            if (flags.orderAds && "non_endemic_ads_config".equals(key) && value instanceof JSONObject) {
                JSONObject config = (JSONObject) value;
                config.put("enable_widgets_order_confirmation", false);
                config.put("enable_widgets_order_details", false);
                config.put("enable_widgets_orders_listing", false);
            }
            if (flags.referEarn && "refer_and_earn".equals(key) && value instanceof JSONObject) {
                ((JSONObject) value).put("enabled", false).put("enabled_on_hp", false);
            }
            if (flags.confirmationAd && "ocp_pay_later_ad_banner".equals(key) && value instanceof JSONObject) {
                ((JSONObject) value).put("enabled", false);
            }
            if (value instanceof JSONObject) {
                clean((JSONObject) value, flags, videos, hidePrice);
            } else if (value instanceof JSONArray) {
                JSONArray array = (JSONArray) value;
                for (int i = array.length() - 1; i >= 0; i--) {
                    Object item = array.get(i);
                    if (!(item instanceof JSONObject)) continue;
                    JSONObject record = (JSONObject) item;
                    if ((flags.ads && isAd(record)) || (videos && "catalogs".equals(key)
                            && "reel".equalsIgnoreCase(record.optString("format")))) {
                        array.remove(i);
                    } else {
                        clean(record, flags, videos, hidePrice);
                    }
                }
            }
        }
    }

    private static boolean isAd(JSONObject record) {
        JSONObject ad = record.optJSONObject("ad");
        if (ad != null && ad.optBoolean("active")) return true;
        JSONObject product = record.optJSONObject("product");
        JSONObject catalog = record.optJSONObject("catalog");
        if ((product != null && isAd(product)) || (catalog != null && isAd(catalog))) return true;
        JSONObject model = listing(record);
        return model != null && model != record && isAd(model);
    }

    private static void sortProducts(JSONObject object) throws JSONException {
        Iterator<String> keys = object.keys();
        while (keys.hasNext()) {
            String key = keys.next();
            Object value = object.get(key);
            if (value instanceof JSONObject) {
                sortProducts((JSONObject) value);
            } else if (value instanceof JSONArray) {
                JSONArray array = (JSONArray) value;
                List<JSONObject> items = new ArrayList<>();
                boolean canSort = "products".equals(key) || "catalogs".equals(key)
                    || "dynamic_components".equals(key);
                for (int i = 0; i < array.length(); i++) {
                    JSONObject item = array.optJSONObject(i);
                    if (item == null) {
                        canSort = false;
                        continue;
                    }
                    sortProducts(item);
                    items.add(item);
                    if ("dynamic_components".equals(key) && listing(item) == null) canSort = false;
                }
                if (canSort && items.size() > 1) {
                    items.sort((left, right) -> Long.compare(ratingCount(right), ratingCount(left)));
                    object.put(key, new JSONArray(items));
                }
            }
        }
    }

    private static JSONObject listing(JSONObject entry) {
        JSONObject product = entry.optJSONObject("product");
        if (product != null) return product;
        JSONObject catalog = entry.optJSONObject("catalog");
        if (catalog != null) return catalog;
        if (entry.has("catalog_reviews_summary") || (entry.has("id") && entry.has("name"))) return entry;
        JSONObject props = entry.optJSONObject("component_props");
        if (props != null) {
            Iterator<String> keys = props.keys();
            while (keys.hasNext()) {
                JSONObject value = props.optJSONObject(keys.next());
                if (value != null) {
                    JSONObject model = listing(value);
                    if (model != null) return model;
                }
            }
        } else if (entry.length() == 1) {
            JSONObject node = entry.optJSONObject(entry.keys().next());
            if (node != null && node.has("component_props")) return listing(node);
        }
        return null;
    }

    private static long ratingCount(JSONObject entry) {
        JSONObject product = listing(entry);
        if (product == null) product = entry;
        JSONObject summary = product.optJSONObject("catalog_reviews_summary");
        if (summary == null || "supplier".equalsIgnoreCase(summary.optString("type"))) {
            JSONObject catalog = entry.optJSONObject("catalog");
            if (catalog != null) summary = catalog.optJSONObject("catalog_reviews_summary");
        }
        if (summary == null || "supplier".equalsIgnoreCase(summary.optString("type"))) return -1;
        return Math.max(-1, summary.optLong("rating_count", -1));
    }
}
