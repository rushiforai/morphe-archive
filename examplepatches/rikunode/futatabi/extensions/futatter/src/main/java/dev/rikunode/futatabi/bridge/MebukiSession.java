package dev.rikunode.futatabi.bridge;

import android.content.Context;
import android.content.SharedPreferences;
import org.json.JSONObject;
import org.json.JSONArray;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

/** Revalidate saved sessions against the actual Better Auth endpoint. */
final class MebukiSession {
    static final String SITE = "https://mebuki.moe";
    static final String STORE = "futatabi_extension_private";
    static final String KEY = "mebuki_cookie_header";
    enum State { NOT_SAVED, AUTHENTICATED, ANONYMOUS, UNVERIFIED }

    static String saved(Context context) {
        return context.getSharedPreferences(STORE, Context.MODE_PRIVATE).getString(KEY, "");
    }

    static boolean safeCookie(String cookie) {
        return cookie != null && cookie.length() > 0 && cookie.length() <= 8192
                && cookie.indexOf('\r') < 0 && cookie.indexOf('\n') < 0;
    }

    static State verify(String cookie) {
        if (!safeCookie(cookie)) return State.NOT_SAVED;
        try {
            HttpURLConnection c = connect("/api/auth/get-session", cookie);
            try {
                if (c.getResponseCode() != 200) return State.UNVERIFIED;
                try (InputStream in = c.getInputStream()) {
                    String body = new String(AimogeWriteClient.bounded(in, 64_000),
                            StandardCharsets.UTF_8).trim();
                    if ("null".equals(body)) return State.ANONYMOUS;
                    JSONObject result = new JSONObject(body);
                    if (result.optJSONObject("user") != null &&
                            result.optJSONObject("session") != null) return State.AUTHENTICATED;
                    return State.UNVERIFIED;
                }
            } finally { c.disconnect(); }
        } catch (Exception e) {
            return State.UNVERIFIED;
        }
    }

    private static HttpURLConnection connect(String path, String cookie) throws Exception {
        URL url = new URL(SITE + path);
        if (!"https".equals(url.getProtocol()) || !"mebuki.moe".equals(url.getHost()))
            throw new IllegalArgumentException("Unexpected host");
        HttpURLConnection c = (HttpURLConnection) url.openConnection();
        c.setInstanceFollowRedirects(false);
        c.setConnectTimeout(7000);
        c.setReadTimeout(8000);
        c.setRequestProperty("Accept", "application/json");
        c.setRequestProperty("Cookie", cookie);
        return c;
    }

    /**
     * Explicit owner-operated contract observation; never expose response values.
     * Only the known read routes are allowed. No writes or guessed JSON mapping.
     */
    static JSONObject inspectRead(String path, String cookie) throws Exception {
        if (!("/api/auth/get-session".equals(path) || "/api/catalog".equals(path) ||
                path.matches("/api/thread/[A-Za-z0-9_-]{8,24}/messages")))
            throw new IllegalArgumentException("Unexpected read route");
        if (!safeCookie(cookie)) throw new IllegalArgumentException("No saved session");
        HttpURLConnection c = connect(path, cookie);
        try {
            JSONObject metadata = new JSONObject();
            metadata.put("status", c.getResponseCode());
            String mime = c.getContentType();
            metadata.put("mime", mime == null ? "" : mime.split(";")[0]);
            metadata.put("setCookieMetadata", cookieMetadata(c));
            if (c.getResponseCode() == 200) {
                try (InputStream in = c.getInputStream()) {
                    byte[] bytes = AimogeWriteClient.bounded(in, 1_000_000);
                    String s = new String(bytes, StandardCharsets.UTF_8).trim();
                    metadata.put("bytes", bytes.length);
                    try {
                        Object data = new org.json.JSONTokener(s).nextValue();
                        metadata.put("schema", shape(data, 0));
                    } catch (Exception ex) { metadata.put("schema", "non-JSON / unsupported format"); }
                }
            }
            return metadata;
        } finally { c.disconnect(); }
    }

    static JSONArray cookieNames(String cookie) {
        JSONArray names = new JSONArray();
        if (!safeCookie(cookie)) return names;
        for (String part : cookie.split(";")) {
            int eq = part.indexOf('=');
            if (eq < 1) continue;
            String name = part.substring(0, eq).trim();
            if (name.matches("[A-Za-z0-9_.-]{1,100}")) names.put(name);
        }
        return names;
    }

    private static JSONArray cookieMetadata(HttpURLConnection connection) throws Exception {
        JSONArray cookies = new JSONArray();
        for (java.util.Map.Entry<String, java.util.List<String>> entry : connection.getHeaderFields().entrySet()) {
            if (!"Set-Cookie".equalsIgnoreCase(entry.getKey())) continue;
            for (String header : entry.getValue()) {
                String[] parts = header.split(";");
                JSONArray names = cookieNames(parts[0]);
                if (names.length() != 1) continue;
                JSONObject row = new JSONObject();
                row.put("name", names.getString(0));
                JSONObject attrs = new JSONObject();
                for (int i = 1; i < parts.length; i++) {
                    String[] kv = parts[i].trim().split("=", 2);
                    String key = kv[0].toLowerCase(java.util.Locale.ROOT);
                    if ("secure".equals(key) || "httponly".equals(key) || "partitioned".equals(key))
                        attrs.put(key, true);
                    else if (kv.length == 2 && ("expires".equals(key) || "max-age".equals(key) ||
                            "samesite".equals(key) || "path".equals(key) || "domain".equals(key))) {
                        // Only conventional attribute characters; never retain arbitrary values.
                        if (kv[1].matches("[A-Za-z0-9 .,/:_+-]{1,100}")) attrs.put(key, kv[1]);
                    }
                }
                row.put("attributes", attrs);
                cookies.put(row);
            }
        }
        return cookies;
    }

    private static Object shape(Object value, int depth) throws Exception {
        if (value == null || value == JSONObject.NULL) return "null";
        if (depth >= 4) return value instanceof JSONObject ? "object" :
                value instanceof JSONArray ? "array" : scalarType(value);
        if (value instanceof JSONObject) {
            JSONObject fields = new JSONObject();
            JSONObject obj = (JSONObject) value;
            java.util.Iterator<String> keys = obj.keys();
            int count = 0;
            while (keys.hasNext() && count++ < 40) {
                String key = keys.next();
                // Omit dynamic identifier-like keys; no values, tokens, URLs or IDs.
                if (!key.matches("[A-Za-z_][A-Za-z_0-9]{0,39}") ||
                        key.matches("(?i).*(token|secret|password|cookie|email|authorization|credential).*"))
                    continue;
                fields.put(key, shape(obj.opt(key), depth + 1));
            }
            return fields;
        }
        if (value instanceof JSONArray) {
            JSONArray arr = (JSONArray) value;
            JSONObject meta = new JSONObject();
            meta.put("type", "array");
            meta.put("length", arr.length());
            if (arr.length() > 0) meta.put("firstItem", shape(arr.opt(0), depth + 1));
            return meta;
        }
        return scalarType(value);
    }

    private static String scalarType(Object value) {
        if (value instanceof Boolean) return "boolean";
        if (value instanceof Number) return "number";
        return "string";
    }
}
