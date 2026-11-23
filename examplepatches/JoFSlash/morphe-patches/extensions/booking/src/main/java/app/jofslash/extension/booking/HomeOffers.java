package app.jofslash.extension.booking;

import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

/**
 * Used by the Hide upsells patch, through SabaJsonFilter. The home screen is a server-driven
 * ("Saba") page, /mobile.saba?route_path=homescreen. Its blocks are one list: the app's own blocks
 * are abu.homescreen.LegacyHomeComponent items named by componentId ("recent_searches",
 * "wishlist", "upcoming_bookings", "ai_trip_planner", ...), the rest are drawn from the JSON
 * itself, such as campaign banners and offer carousels. Every block carries the ids Booking's
 * home screen tracking uses: the page area it is in (region_id, such as
 * HOMESCREEN_PROMOTIONAL_HERO for the campaign banner, HOMESCREEN_PROMOTIONAL_SECONDARY for the
 * "Offers" row, HOMESCREEN_AITP for the AI trip planner and HOMESCREEN_NATIVE_ADS for ads) and,
 * for each part, a unique_id that ends with the part's name, such as
 * "homescreen-accommodations-<uuid>-rec_popular_attractions_by_search_carousel".
 *
 * The blocks in a promotional, AI trip planner or ad area are taken out, and inside the other
 * blocks the parts that only offer attractions ("Popular attractions in Prague"). The search box,
 * recent searches, Genius, saved properties, trips and destination ideas stay. On any doubt a
 * block stays.
 */
final class HomeOffers {
    private static final String TAG = "JoFSlash";

    /** Marks the home screen page. */
    static final String HOME_MARKER = "abu.homescreen.";
    private static final String LEGACY_COMPONENT = "abu.homescreen.LegacyHomeComponent";

    /** The keys that hold a block's tracking ids. */
    private static final String[] ID_KEYS = {
            "componentId", "component_id", "regionId", "region_id", "uniqueId", "unique_id",
    };

    /** Page areas (region_id) whose blocks are left out. */
    private static final String[] HIDDEN_REGIONS = {"PROMOTIONAL", "AITP", "NATIVE_AD"};
    private static final String REGION_PREFIX = "HOMESCREEN_";

    /** Parts of a block (the end of their unique_id) that are left out: attraction carousels. */
    private static final String[] HIDDEN_PARTS = {"attraction", "campaign", "offer", "promo"};
    private static final String UNIQUE_ID_PREFIX = "homescreen-";

    /** The app's own blocks that are left out ("Plan your trip with AI"). */
    private static final String[] HIDDEN_NATIVE = {"ai_trip_planner"};

    /** Ids of blocks that always stay: your searches, saved properties, trips, Genius, weekend stays. */
    private static final String[] KEEP = {
            "search", "recent", "wishlist", "saved", "genius", "loyalty", "reservation",
            "trip", "sign_in", "signin", "review", "weekend", "loading",
    };

    /** Ids of offer blocks: campaign banners, "Offers" rows, attraction and other cross-sell carousels. */
    private static final String[] HIDE = {
            "offer", "deal", "campaign", "promo", "black_friday", "blackfriday", "seasonal", "marketing",
            "discount", "coupon", "voucher", "attraction", "cross_sell", "crosssell", "esim",
    };

    /** Links that lead to an offer page, for a block without ids. */
    private static final String[] HIDE_LINKS = {
            "/deals", "dealspage", "campaign", "black-friday", "blackfriday", "/attractions", "attractions/",
    };

    private HomeOffers() {
    }

    /** Takes the offer blocks out of the home screen page [root]. Returns how many were taken out. */
    static int remove(Object root) {
        JSONArray blocks = findBlockList(root);
        if (blocks == null) {
            Log.d(TAG, "Home screen: no block list found");
            return 0;
        }
        int removed = 0;
        for (int i = blocks.length() - 1; i >= 0; i--) {
            Object block = blocks.opt(i);
            List<String> ids = new ArrayList<>();
            collectIds(block, ids, 0);
            boolean hide = shouldHide(block, ids);
            Log.d(TAG, "Home screen block " + i + (hide ? " removed" : " kept") + ": ids=" + ids
                    + " text=" + firstText(block, 0));
            if (hide) {
                blocks.remove(i);
                removed++;
            } else {
                removed += removeParts(block, 0);
            }
        }
        return removed;
    }

    private static boolean shouldHide(Object block, List<String> ids) {
        for (String id : ids) {
            if (id.startsWith(REGION_PREFIX)) return containsAny(id, HIDDEN_REGIONS);
        }
        // No page area: go by the names.
        String legacyId = legacyComponentId(block, 0);
        if (legacyId != null) {
            // The app's own blocks: only the ones named, so nothing native disappears by accident.
            for (String hidden : HIDDEN_NATIVE) {
                if (hidden.equals(legacyId)) return true;
            }
            return false;
        }
        String joined = String.join(" ", ids).toLowerCase(Locale.ROOT);
        if (containsAny(joined, KEEP)) return false;
        if (!joined.isEmpty()) return containsAny(joined, HIDE);
        // No tracking ids: go by where the block's links lead.
        List<String> links = new ArrayList<>();
        collectLinks(block, links, 0);
        String allLinks = String.join(" ", links).toLowerCase(Locale.ROOT);
        return !containsAny(allLinks, KEEP) && containsAny(allLinks, HIDE_LINKS);
    }

    /**
     * Takes out the parts of a block whose names (the end of their unique_id) all are attraction
     * or offer parts. A part that also holds another part stays, and is looked into.
     */
    private static int removeParts(Object node, int depth) {
        if (depth > 40) return 0;
        int removed = 0;
        if (node instanceof JSONArray) {
            JSONArray array = (JSONArray) node;
            for (int i = array.length() - 1; i >= 0; i--) {
                Object item = array.opt(i);
                List<String> names = new ArrayList<>();
                collectPartNames(item, names, 0);
                boolean hide = !names.isEmpty();
                for (String name : names) {
                    if (!containsAny(name, HIDDEN_PARTS)) hide = false;
                }
                if (hide) {
                    Log.d(TAG, "Home screen part removed: " + names + " text=" + firstText(item, 0));
                    array.remove(i);
                    removed++;
                } else {
                    removed += removeParts(item, depth + 1);
                }
            }
        } else if (node instanceof JSONObject) {
            JSONObject object = (JSONObject) node;
            Iterator<String> keys = object.keys();
            while (keys.hasNext()) removed += removeParts(object.opt(keys.next()), depth + 1);
        }
        return removed;
    }

    /** The part names in [node]: the end of each unique_id ("...-<uuid>-<name>"). */
    private static void collectPartNames(Object node, List<String> names, int depth) {
        if (depth > 40) return;
        if (node instanceof JSONObject) {
            JSONObject object = (JSONObject) node;
            Iterator<String> keys = object.keys();
            while (keys.hasNext()) {
                String key = keys.next();
                Object value = object.opt(key);
                if (value instanceof String && ("unique_id".equals(key) || "uniqueId".equals(key))) {
                    String id = (String) value;
                    if (!id.startsWith(UNIQUE_ID_PREFIX)) continue;
                    int dash = id.lastIndexOf('-');
                    String name = (dash >= 0 ? id.substring(dash + 1) : id).toLowerCase(Locale.ROOT);
                    if (!name.isEmpty() && !names.contains(name)) names.add(name);
                } else {
                    collectPartNames(value, names, depth + 1);
                }
            }
        } else if (node instanceof JSONArray) {
            JSONArray array = (JSONArray) node;
            for (int i = 0; i < array.length(); i++) collectPartNames(array.opt(i), names, depth + 1);
        }
    }

    /**
     * The list of home screen blocks: the array with the most items that are (or hold) one of the
     * app's own blocks. Null when no array holds two of them.
     */
    private static JSONArray findBlockList(Object root) {
        JSONArray[] best = {null};
        int[] bestCount = {1};
        findBlockList(root, best, bestCount, 0);
        return best[0];
    }

    private static void findBlockList(Object node, JSONArray[] best, int[] bestCount, int depth) {
        if (depth > 60) return;
        if (node instanceof JSONArray) {
            JSONArray array = (JSONArray) node;
            int count = 0;
            for (int i = 0; i < array.length(); i++) {
                if (legacyComponentId(array.opt(i), 0) != null) count++;
            }
            if (count > bestCount[0]) {
                bestCount[0] = count;
                best[0] = array;
            }
            for (int i = 0; i < array.length(); i++) findBlockList(array.opt(i), best, bestCount, depth + 1);
        } else if (node instanceof JSONObject) {
            JSONObject object = (JSONObject) node;
            Iterator<String> keys = object.keys();
            while (keys.hasNext()) findBlockList(object.opt(keys.next()), best, bestCount, depth + 1);
        }
    }

    /** The componentId of the app's own block in [node] (at any depth), or null. */
    private static String legacyComponentId(Object node, int depth) {
        if (depth > 40) return null;
        if (node instanceof JSONObject) {
            JSONObject object = (JSONObject) node;
            if (LEGACY_COMPONENT.equals(object.optString("type"))) {
                JSONObject props = object.optJSONObject("props");
                String id = props != null ? props.optString("componentId", null) : null;
                if (id == null) id = object.optString("componentId", null);
                return id != null ? id : "";
            }
            Iterator<String> keys = object.keys();
            while (keys.hasNext()) {
                String found = legacyComponentId(object.opt(keys.next()), depth + 1);
                if (found != null) return found;
            }
        } else if (node instanceof JSONArray) {
            JSONArray array = (JSONArray) node;
            for (int i = 0; i < array.length(); i++) {
                String found = legacyComponentId(array.opt(i), depth + 1);
                if (found != null) return found;
            }
        }
        return null;
    }

    private static void collectIds(Object node, List<String> ids, int depth) {
        if (depth > 40 || ids.size() > 20) return;
        if (node instanceof JSONObject) {
            JSONObject object = (JSONObject) node;
            Iterator<String> keys = object.keys();
            while (keys.hasNext()) {
                String key = keys.next();
                Object value = object.opt(key);
                if (value instanceof String && isIdKey(key) && !((String) value).isEmpty()) {
                    if (!ids.contains(value)) ids.add((String) value);
                } else {
                    collectIds(value, ids, depth + 1);
                }
            }
        } else if (node instanceof JSONArray) {
            JSONArray array = (JSONArray) node;
            for (int i = 0; i < array.length(); i++) collectIds(array.opt(i), ids, depth + 1);
        }
    }

    private static boolean isIdKey(String key) {
        for (String idKey : ID_KEYS) {
            if (idKey.equals(key)) return true;
        }
        return false;
    }

    private static void collectLinks(Object node, List<String> links, int depth) {
        if (depth > 40 || links.size() > 20) return;
        if (node instanceof JSONObject) {
            JSONObject object = (JSONObject) node;
            Iterator<String> keys = object.keys();
            while (keys.hasNext()) collectLinks(object.opt(keys.next()), links, depth + 1);
        } else if (node instanceof JSONArray) {
            JSONArray array = (JSONArray) node;
            for (int i = 0; i < array.length(); i++) collectLinks(array.opt(i), links, depth + 1);
        } else if (node instanceof String) {
            String value = (String) node;
            if (value.startsWith("http") || value.startsWith("booking:") || value.startsWith("/")) links.add(value);
        }
    }

    /** The first text of a block, for the log. */
    private static String firstText(Object node, int depth) {
        if (depth > 40) return null;
        if (node instanceof JSONObject) {
            JSONObject object = (JSONObject) node;
            Object text = object.opt("text");
            if (text instanceof String && !((String) text).isEmpty()) return (String) text;
            Object title = object.opt("title");
            if (title instanceof String && !((String) title).isEmpty()) return (String) title;
            Iterator<String> keys = object.keys();
            while (keys.hasNext()) {
                String found = firstText(object.opt(keys.next()), depth + 1);
                if (found != null) return found;
            }
        } else if (node instanceof JSONArray) {
            JSONArray array = (JSONArray) node;
            for (int i = 0; i < array.length(); i++) {
                String found = firstText(array.opt(i), depth + 1);
                if (found != null) return found;
            }
        }
        return null;
    }

    private static boolean containsAny(String text, String[] parts) {
        for (String part : parts) {
            if (text.contains(part)) return true;
        }
        return false;
    }
}
