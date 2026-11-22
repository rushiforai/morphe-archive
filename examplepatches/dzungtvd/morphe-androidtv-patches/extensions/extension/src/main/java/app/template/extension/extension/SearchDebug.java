package app.template.extension.extension;

import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.List;

@SuppressWarnings("unused")
public class SearchDebug {

    private static final String TAG = "TikTokTVSearch";

    /** The URL sent by the current thread, so a response can be attributed to its request. */
    private static final ThreadLocal<String> LAST_URL = new ThreadLocal<>();

    public static void logResponse(Object response) {
        if (response == null) {
            Log.i(TAG, "search response: null");
            return;
        }

        StringBuilder message = new StringBuilder("search response: ").append(response);
        try {
            for (Field field : response.getClass().getDeclaredFields()) {
                field.setAccessible(true);
                Object value = field.get(response);
                if (value instanceof List) {
                    message.append(" list.").append(field.getName())
                            .append("=").append(((List<?>) value).size());
                }
            }
        } catch (Throwable ignored) {
        }
        Log.i(TAG, message.toString());
    }

    public static void logThrowable(Throwable throwable) {
        Log.e(TAG, "search failed: " + throwable, throwable);
    }

    public static void logProfileResponse(Object response) {
        Log.i(TAG, "profile response: " + clip(String.valueOf(response)));
    }

    public static void logProfileThrowable(Throwable throwable) {
        Log.e(TAG, "profile failed: " + throwable, throwable);
    }

    public static void logRetry(String detail) {
        Log.i(TAG, "identity retry: " + detail);
    }

    /** Records the URL that is actually put on the wire, so a response can be attributed. */
    public static void logRetagged(String url) {
        LAST_URL.set(url);
        int query = url.indexOf('?');
        Log.i(TAG, "re-tagged " + url.substring(0, query < 0 ? url.length() : query)
                + " " + paramOf(url, "aid=") + " " + paramOf(url, "app_name="));
    }

    private static String paramOf(String url, String key) {
        int at = url.indexOf(key);
        if (at < 0) return key + "?";
        int end = url.indexOf('&', at);
        return url.substring(at, end < 0 ? url.length() : end);
    }

    public static void logRequest(Object request) {
        if (request == null) {
            Log.i(TAG, "http request: null");
            return;
        }
        String url = callString(request, "b");
        LAST_URL.set(url);
        if (!url.contains("search") && !url.contains("suggest") && !url.contains("/feed/")
                && !url.contains("profile") && !url.contains("user") && !url.contains("aweme")
                && !url.contains("favorite") && !url.contains("follow") && !url.contains("collect")) {
            return;
        }
        StringBuilder message = new StringBuilder("http request:");
        try {
            message.append(" method=").append(callString(request, "a"));
            message.append(" url=").append(url);
            Object body = call(request, "d");
            if (body != null) {
                message.append(" body=").append(readBody(body));
            }
            message.append(" requestHeaders=").append(requestHeaderSummary(call(request, "c")));
        } catch (Throwable throwable) {
            message.append(" <").append(throwable).append('>');
        }
        Log.i(TAG, message.toString());
    }

    private static String readBody(Object body) {
        try {
            java.io.ByteArrayOutputStream out = new java.io.ByteArrayOutputStream();
            body.getClass().getMethod("writeTo", java.io.OutputStream.class).invoke(body, out);
            return out.toString("UTF-8");
        } catch (Throwable throwable) {
            return "<" + throwable + ">";
        }
    }

    public static void logHttpResponse(Object body) {
        if (body == null) {
            Log.i(TAG, "http response: null");
            return;
        }
        StringBuilder message = new StringBuilder("http response:");
        String url = LAST_URL.get();
        LAST_URL.remove();
        boolean interesting = url != null && (url.contains("profile") || url.contains("/user/")
                || url.contains("item/list") || url.contains("like-items") || url.contains("post"));
        try {
            message.append(" status=").append(callInt(body, "b"));
            message.append(" message=").append(callString(body, "c"));
            message.append(" headers=").append(headerSummary(call(body, "d")));
            Object input = call(body, "e");
            message.append(" body=").append(input);
            if (input != null) {
                Method length = input.getClass().getMethod("length");
                Object size = length.invoke(input);
                message.append(" length=").append(size);
                if (interesting) {
                    message.append(" url=").append(url, 0, Math.min(url.length(), 120));
                }
                if (size instanceof Number
                        && ((Number) size).longValue() <= (interesting ? 400000L : 4096L)) {
                    message.append(" json=").append(shortJson(input));
                }
                logVideoShape(url, input);
                logAdShape(url, input);
            }
        } catch (Throwable throwable) {
            message.append(" <").append(throwable).append('>');
        }
        Log.i(TAG, clip2(message.toString(), interesting ? 1600 : 600));
    }

    /** The profile grid renders from the item list but its player is a separate stack. */
    private static void logVideoShape(String url, Object input) {
        if (url == null
                || !(url.contains("public/item/list") || url.contains("/aweme/v1/feed/"))) {
            return;
        }
        try {
            Method getBytes = input.getClass().getMethod("getBytes");
            Object bytes = getBytes.invoke(input);
            if (!(bytes instanceof byte[])) return;
            String json = new String((byte[]) bytes, "UTF-8");
            for (int at = json.indexOf("\"video\":{"); at >= 0; ) {
                int end = json.indexOf("\"music\"", at);
                Log.i(TAG, "video shape " + url.substring(url.indexOf('/', 8))
                        + " " + clip3(json.substring(at, end > at ? end : Math.min(json.length(), at + 2000)), 6000));
                break;
            }
            Log.i(TAG, "video shape keys " + url.substring(url.indexOf('/', 8))
                    + " play_addr=" + count(json, "\"play_addr\"")
                    + " url_list=" + count(json, "\"url_list\"")
                    + " bit_rate=" + count(json, "\"bit_rate\"")
                    + " h265=" + count(json, "\"is_h265\"")
                    + " cover=" + count(json, "\"cover\"")
                    + " duration=" + count(json, "\"duration\""));
        } catch (Throwable ignored) {
        }
    }

    private static int count(String json, String key) {
        int total = 0;
        for (int at = json.indexOf(key); at >= 0; at = json.indexOf(key, at + key.length())) total++;
        return total;
    }

    private static final String[] AD_LIST_KEYS = {"aweme_list", "item_list"};

    /** Candidate ad markers, so a body that carries none still says which of these are absent. */
    private static final String[] AD_KEYS = {
        "is_ads", "raw_ad_data", "ad_flag", "is_ad", "ad_type", "ad_id", "is_3rd_adn",
        "is_spark_plus", "has_promote_entry", "promote_toast", "ad_order_id", "ad_comment_struct",
    };

    /**
     * An in-feed ad plays in the TV player like any other post, and which marker says so is only
     * knowable from the wire.
     */
    private static void logAdShape(String url, Object input) {
        if (url == null) {
            return;
        }
        if (!(url.contains("/aweme/v1/feed/") || url.contains("item/list") || url.contains("search"))) {
            return;
        }
        try {
            Method getBytes = input.getClass().getMethod("getBytes");
            Object bytes = getBytes.invoke(input);
            if (!(bytes instanceof byte[])) return;
            String json = new String((byte[]) bytes, "UTF-8");
            String listKey = null;
            for (String candidate : AD_LIST_KEYS) {
                if (json.contains("\"" + candidate + "\":[{")) {
                    listKey = candidate;
                    break;
                }
            }
            if (listKey == null) return;
            JSONObject root = new JSONObject(json);
            JSONArray items = root.optJSONArray(listKey);
            if (items == null) return;
            String path = pathOf(url);

            StringBuilder tally = new StringBuilder("ad tally ").append(path)
                    .append(" list=").append(listKey).append(" items=").append(items.length());
            for (String key : AD_KEYS) tally.append(' ').append(key).append('=').append(count(json, "\"" + key + "\""));
            Log.i(TAG, clip2(tally.toString(), 1200));

            JSONObject first = items.optJSONObject(0);
            if (first != null) {
                Log.i(TAG, "ad shape " + path + " keys " + clip2(join(first.names()), 1500));
            }

            for (int i = 0; i < items.length(); i++) {
                JSONObject item = items.optJSONObject(i);
                JSONArray names = item == null ? null : item.names();
                if (names == null) continue;
                StringBuilder fields = new StringBuilder();
                for (int n = 0; n < names.length(); n++) {
                    String key = names.optString(n);
                    if (!isAdKey(key)) continue;
                    Object value = item.opt(key);
                    fields.append(' ').append(key).append('=');
                    if (value instanceof JSONObject) {
                        fields.append('<').append(clip2(join(((JSONObject) value).names()), 160)).append('>');
                    } else if (value instanceof JSONArray) {
                        fields.append('[').append(((JSONArray) value).length()).append(']');
                    } else {
                        fields.append(clip2(String.valueOf(value), 90));
                    }
                }
                if (fields.length() == 0) continue;
                JSONObject author = item.optJSONObject("author");
                Log.i(TAG, clip2("ad item " + path + " #" + i
                        + " id=" + item.optString("aweme_id")
                        + " aid=" + item.optString("aid")
                        + " type=" + item.optString("aweme_type")
                        + " by=" + (author == null ? "-" : author.optString("nickname"))
                        + " desc=" + clip2(item.optString("desc"), 60)
                        + " ad=" + fields, 1500));
            }
        } catch (Throwable ignored) {
        }
    }

    private static boolean isAdKey(String key) {
        for (String token : key.toLowerCase().split("_")) {
            if (token.equals("ad") || token.equals("ads")) return true;
        }
        return false;
    }

    private static String join(JSONArray names) {
        StringBuilder joined = new StringBuilder();
        if (names == null) return "";
        for (int i = 0; i < names.length(); i++) {
            if (joined.length() > 0) joined.append(',');
            joined.append(names.optString(i));
        }
        return joined.toString();
    }

    private static String pathOf(String url) {
        int start = url.indexOf('/', 8);
        if (start < 0) return url;
        int query = url.indexOf('?', start);
        return url.substring(start, query < 0 ? url.length() : query);
    }

    private static String clip3(String value, int max) {
        return value.length() <= max ? value : value.substring(0, max) + "…";
    }

    private static String clip2(String value, int max) {
        return value.length() <= max ? value : value.substring(0, max) + "…";
    }

    private static String shortJson(Object body) {
        try {
            Method getBytes = body.getClass().getMethod("getBytes");
            Object bytes = getBytes.invoke(body);
            if (!(bytes instanceof byte[])) return "<no-bytes>";
            return clip(new String((byte[]) bytes, "UTF-8"));
        } catch (Throwable throwable) {
            return "<" + throwable.getClass().getSimpleName() + ">";
        }
    }

    private static final String[] REQUEST_HEADER_VALUES = {
        "user-agent", "content-type", "x-tt-appid", "sdk-version", "x-tt-store-region",
        "x-tt-store-idc", "x-khronos", "x-ss-stub", "x-request-id", "x-tt-trace-id",
    };

    private static final String[] REDACTED_HEADERS = {
        "cookie", "authorization", "x-tt-token", "sessionid", "x-argus", "x-gorgon",
    };

    private static String requestHeaderSummary(Object headers) {
        if (!(headers instanceof List)) return String.valueOf(headers);
        StringBuilder summary = new StringBuilder("[");
        for (Object header : (List<?>) headers) {
            if (summary.length() > 1) summary.append(',');
            String name = callString(header, "a");
            String value = callString(header, "b");
            summary.append(name);
            if (containsIgnoreCase(REDACTED_HEADERS, name)) {
                summary.append("=<redacted:").append(value.length()).append('>');
            } else if (containsIgnoreCase(REQUEST_HEADER_VALUES, name)) {
                summary.append('=').append(clip(value));
            }
        }
        return summary.append(']').toString();
    }

    private static boolean containsIgnoreCase(String[] names, String name) {
        for (String candidate : names) {
            if (candidate.equalsIgnoreCase(name)) return true;
        }
        return false;
    }

    private static String clip(String value) {
        return value.length() <= 160 ? value : value.substring(0, 160) + "…";
    }

    private static final String[] INTERESTING_HEADERS = {
        "content-length", "content-type", "x-tt-logid", "tt_orcas_res", "bd-tt-error-code",
        "x-envoy-response-flags", "x-cache", "server",
    };

    private static String headerSummary(Object headers) {
        if (!(headers instanceof List)) return String.valueOf(headers);
        StringBuilder summary = new StringBuilder("[");
        for (Object header : (List<?>) headers) {
            String name = callString(header, "a");
            if (summary.length() > 1) summary.append(',');
            summary.append(name);
            for (String interesting : INTERESTING_HEADERS) {
                if (interesting.equalsIgnoreCase(name)) {
                    summary.append('=').append(callString(header, "b"));
                    break;
                }
            }
        }
        return summary.append(']').toString();
    }

    private static Object call(Object target, String name) {
        try {
            Method method = target.getClass().getMethod(name);
            method.setAccessible(true);
            return method.invoke(target);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static String callString(Object target, String name) {
        Object value = call(target, name);
        return value == null ? "null" : String.valueOf(value);
    }

    private static int callInt(Object target, String name) {
        Object value = call(target, name);
        return value instanceof Integer ? (Integer) value : -1;
    }
}
