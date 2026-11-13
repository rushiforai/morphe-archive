package app.mightymorphing.extension.joey;

import org.json.JSONArray;
import org.json.JSONObject;

import java.lang.reflect.Field;
import java.net.URL;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.LinkedHashSet;
import java.util.Locale;
import java.util.Set;

/**
 * Reddit refuses some logins on /api/morechildren. Each hidden reply is loaded
 * from the comments page instead, then handed back in the shape Joey already reads.
 */
public final class MoreComments {
    private MoreComments() {}

    public static Object rewrite(Object adapter, Object request) {
        try {
            URL url = (URL) call(request, "g");
            if (url == null || !url.getPath().toLowerCase(Locale.ROOT).endsWith("/api/morechildren")) {
                return null;
            }
            String method = String.valueOf(call(request, "e"));
            if (!"GET".equalsIgnoreCase(method) && !"POST".equalsIgnoreCase(method)) return null;
            Params params = params(url, call(request, "b"));
            if (params.linkId == null || params.children.isEmpty()) return null;
            String postId = strip(params.linkId, "t3_");
            Object client = field(adapter, "a");
            JSONArray things = new JSONArray();
            Set<String> seen = new LinkedHashSet<>();
            Set<String> names = new LinkedHashSet<>();
            Object headers = null;
            String protocol = "HTTP/1.1";
            for (String child : params.children) {
                if (seen.contains(child)) continue;
                String focused = focusedUrl(url, postId, child, params.sort, params.profileImg);
                Object response = fetch(client, request, focused);
                int code = (Integer) call(response, "code");
                Object body = call(response, "body");
                String text = body == null ? "" : String.valueOf(call(body, "string"));
                headers = call(response, "headers");
                Object proto = call(response, "protocol");
                if (proto != null) protocol = proto.toString().toUpperCase(Locale.ROOT);
                String message = String.valueOf(call(response, "message"));
                try {
                    call(response, "close");
                } catch (Throwable ignored) {
                }
                if (code < 200 || code >= 300) {
                    return newResponse(request, text, headers, code, message, protocol);
                }
                JSONObject comment = focusedComment(text, child);
                if (comment != null) flatten(comment, seen, names, things);
            }
            JSONObject data = new JSONObject().put("things", things);
            JSONObject json = new JSONObject().put("errors", new JSONArray()).put("data", data);
            String payload = new JSONObject().put("json", json).toString();
            return newResponse(request, payload, headers, 200, "OK", protocol);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Object fetch(Object client, Object request, String url) throws Exception {
        Class<?> builderClass = Class.forName("okhttp3.Request$Builder");
        Object builder = builderClass.getConstructor().newInstance();
        call(builder, "url", new Class<?>[]{String.class}, url);
        call(builder, "get");
        Object headers = call(request, "d");
        if (headers != null) {
            int size = (Integer) call(headers, "size");
            for (int i = 0; i < size; i++) {
                String name = String.valueOf(call(headers, "name", new Class<?>[]{int.class}, i));
                if (skipHeader(name)) continue;
                String value = String.valueOf(call(headers, "value", new Class<?>[]{int.class}, i));
                call(builder, "addHeader", new Class<?>[]{String.class, String.class}, name, value);
            }
        }
        Object built = call(builder, "build");
        Object call = call(client, "newCall", new Class<?>[]{Class.forName("okhttp3.Request")}, built);
        return call(call, "execute");
    }

    private static boolean skipHeader(String name) {
        String lower = name.toLowerCase(Locale.ROOT);
        return "content-length".equals(lower) || "content-type".equals(lower)
                || "content-encoding".equals(lower) || "host".equals(lower)
                || "accept-encoding".equals(lower);
    }

    private static JSONObject focusedComment(String json, String expectedId) throws Exception {
        JSONArray response = new JSONArray(json);
        JSONArray children = response.getJSONObject(1).getJSONObject("data").getJSONArray("children");
        if (children.length() == 0) return null;
        JSONObject focused = children.getJSONObject(0);
        String id = focused.getJSONObject("data").optString("id");
        if (!expectedId.equals(id)) {
            throw new IllegalStateException("unexpected comment " + id);
        }
        return focused;
    }

    private static void flatten(JSONObject thing, Set<String> seen, Set<String> names, JSONArray output)
            throws Exception {
        String kind = thing.getString("kind");
        JSONObject data = thing.getJSONObject("data");
        if ("t1".equals(kind)) {
            Object replies = data.opt("replies");
            String id = data.getString("id");
            if (seen.add(id)) {
                data.put("replies", "");
                output.put(thing);
                names.add(data.getString("name"));
            }
            if (replies instanceof JSONObject) {
                JSONObject listing = ((JSONObject) replies).optJSONObject("data");
                JSONArray children = listing == null ? null : listing.optJSONArray("children");
                if (children == null) return;
                for (int i = 0; i < children.length(); i++) {
                    flatten(children.getJSONObject(i), seen, names, output);
                }
            }
        } else if ("more".equals(kind) && names.contains(data.optString("parent_id"))) {
            output.put(thing);
        }
    }

    private static Object newResponse(Object request, String text, Object headers, int code,
                                      String message, String protocol) throws Exception {
        Class<?> type = Class.forName("net.dean.jraw.http.m");
        java.lang.reflect.Constructor<?> constructor = type.getDeclaredConstructor(
                Class.forName("net.dean.jraw.http.f"),
                String.class,
                Class.forName("okhttp3.Headers"),
                int.class,
                String.class,
                String.class);
        constructor.setAccessible(true);
        return constructor.newInstance(request, text, headers, code, message, protocol);
    }

    private static String focusedUrl(URL original, String postId, String commentId, String sort, String profileImg) {
        StringBuilder url = new StringBuilder();
        url.append(original.getProtocol()).append("://").append(original.getHost());
        int port = original.getPort();
        if (port > 0) url.append(':').append(port);
        url.append("/comments/").append(postId).append("/comment/").append(commentId)
                .append(".json?context=0&raw_json=1");
        if (sort != null && !sort.isEmpty()) url.append("&sort=").append(sort);
        if (profileImg != null && !profileImg.isEmpty()) url.append("&profile_img=").append(profileImg);
        return url.toString();
    }

    private static Params params(URL url, Object body) {
        Params params = new Params();
        read(params, url.getQuery());
        read(params, bodyText(body));
        return params;
    }

    private static void read(Params params, String encoded) {
        if (encoded == null || encoded.isEmpty()) return;
        for (String pair : encoded.split("&")) {
            int cut = pair.indexOf('=');
            String key = decode(cut < 0 ? pair : pair.substring(0, cut));
            String value = decode(cut < 0 ? "" : pair.substring(cut + 1));
            if ("link_id".equals(key)) params.linkId = value;
            else if ("children".equals(key) && !value.isEmpty()) {
                params.children.clear();
                for (String child : value.split(",")) {
                    if (!child.isEmpty()) params.children.add(strip(child, "t1_"));
                }
            } else if ("sort".equals(key)) params.sort = value;
            else if ("profile_img".equals(key)) params.profileImg = value;
        }
    }

    private static String bodyText(Object body) {
        if (body == null) return null;
        try {
            for (Field field : body.getClass().getDeclaredFields()) {
                if (field.getType() != byte[].class) continue;
                field.setAccessible(true);
                byte[] bytes = (byte[]) field.get(body);
                if (bytes != null) return new String(bytes, StandardCharsets.UTF_8);
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static String strip(String value, String prefix) {
        if (value != null && value.startsWith(prefix) && value.length() > prefix.length()) {
            return value.substring(prefix.length());
        }
        return value;
    }

    private static String decode(String value) {
        try {
            return URLDecoder.decode(value, "UTF-8");
        } catch (Exception ignored) {
            return value;
        }
    }

    private static Object field(Object target, String suffix) throws Exception {
        Class<?> type = target.getClass();
        while (type != null) {
            for (Field field : type.getDeclaredFields()) {
                if (field.getName().endsWith(suffix) && !field.getType().isPrimitive()) {
                    field.setAccessible(true);
                    Object value = field.get(target);
                    if (value != null && value.getClass().getName().contains("OkHttpClient")) return value;
                }
            }
            type = type.getSuperclass();
        }
        throw new IllegalStateException("missing client");
    }

    private static Object call(Object target, String name) throws Exception {
        return call(target, name, new Class<?>[0]);
    }

    private static Object call(Object target, String name, Class<?>[] types, Object... args) throws Exception {
        return target.getClass().getMethod(name, types).invoke(target, args);
    }

    private static final class Params {
        String linkId;
        String sort;
        String profileImg;
        final LinkedHashSet<String> children = new LinkedHashSet<>();
    }
}
