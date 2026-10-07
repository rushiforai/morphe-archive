package app.twoeno.extension.untappd;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Removes sponsored items from Untappd API responses.
 * Any JSON object inside an array is dropped if one of the sponsored flags is truthy.
 */
public final class SponsoredFilter {
    private static final String[] FLAGS = {"sponsored_tag", "is_sponsored", "sponsored"};

    private SponsoredFilter() {
    }

    public static final class Result {
        public final String json;
        public final int removed;

        Result(String json, int removed) {
            this.json = json;
            this.removed = removed;
        }
    }

    public static Result filter(String json) {
        if (!mayContainSponsored(json)) return new Result(json, 0);

        try {
            int[] removed = {0};
            Object cleaned = clean(new JSONTokener(json).nextValue(), removed);
            if (removed[0] == 0) return new Result(json, 0);
            return new Result(String.valueOf(cleaned), removed[0]);
        } catch (JSONException ex) {
            return new Result(json, 0);
        }
    }

    private static boolean mayContainSponsored(String json) {
        for (String flag : FLAGS) {
            if (json.contains('"' + flag + '"')) return true;
        }
        return false;
    }

    private static Object clean(Object value, int[] removed) throws JSONException {
        if (value instanceof JSONObject) {
            JSONObject object = (JSONObject) value;
            List<String> keys = new ArrayList<>();
            for (Iterator<String> it = object.keys(); it.hasNext(); ) keys.add(it.next());
            for (String key : keys) {
                object.put(key, clean(object.get(key), removed));
            }
            return object;
        }

        if (value instanceof JSONArray) {
            JSONArray array = (JSONArray) value;
            JSONArray filtered = new JSONArray();
            for (int i = 0; i < array.length(); i++) {
                Object item = array.get(i);
                if (item instanceof JSONObject && isSponsored((JSONObject) item)) {
                    removed[0]++;
                } else {
                    filtered.put(clean(item, removed));
                }
            }
            return filtered;
        }

        return value;
    }

    private static boolean isSponsored(JSONObject item) {
        for (String flag : FLAGS) {
            if (item.has(flag) && isTruthy(item.opt(flag))) return true;
        }
        return false;
    }

    private static boolean isTruthy(Object value) {
        if (value == null || value == JSONObject.NULL) return false;
        if (value instanceof Boolean) return (Boolean) value;
        if (value instanceof Number) return ((Number) value).doubleValue() != 0.0;
        if (value instanceof String) {
            String string = (String) value;
            return !string.isEmpty() && !string.equals("0") && !string.equalsIgnoreCase("false");
        }
        return true;
    }
}
