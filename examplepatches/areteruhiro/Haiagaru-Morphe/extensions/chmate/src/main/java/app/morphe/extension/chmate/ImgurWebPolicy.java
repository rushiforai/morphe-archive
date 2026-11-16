package app.morphe.extension.chmate;

import java.net.URI;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Fail closed when Imgur's undocumented web-client contract changes. No credentials here. */
public final class ImgurWebPolicy {
    private ImgurWebPolicy() {}

    interface CookieSink {
        void set(String url, String header);
        void flush();
    }

    /** Preserve the server's exact expiry/domain/path attributes, including deletions. */
    static void receiveCookies(String url, java.util.Map<String, java.util.List<String>> headers,
            CookieSink sink) {
        try {
            URI uri = new URI(url);
            if (!"https".equals(uri.getScheme()) || uri.getHost() == null
                    || uri.getRawUserInfo() != null || (uri.getPort() != -1 && uri.getPort() != 443)) return;
        } catch (Exception ignored) { return; }
        if (headers == null) return;
        boolean changed = false;
        for (java.util.Map.Entry<String, java.util.List<String>> entry : headers.entrySet()) {
            if (!"Set-Cookie".equalsIgnoreCase(entry.getKey()) || entry.getValue() == null) continue;
            for (String header : entry.getValue()) {
                if (header == null || header.isEmpty() || header.indexOf('\r') >= 0 || header.indexOf('\n') >= 0) continue;
                // Do not split on commas: Expires contains a comma. WebView validates attributes.
                sink.set(url, header);
                changed = true;
            }
        }
        if (changed) sink.flush();
    }

    public static boolean loginUrl(String url) {
        try {
            URI uri = new URI(url);
            return "https".equals(uri.getScheme()) && uri.getRawUserInfo() == null
                    && (uri.getPort() == -1 || uri.getPort() == 443)
                    && uri.getHost() != null;
        } catch (Exception ignored) { return false; }
    }

    public static boolean googleLoginUrl(String url) {
        try { return loginUrl(url) && googleAccountHost(new URI(url).getHost()); }
        catch (Exception ignored) { return false; }
    }

    private static boolean googleAccountHost(String host) {
        // Chooses the Google-specific flow; loginUrl accepts any valid HTTPS host.
        return "accounts.google.com".equals(host) || "accounts.google.co.jp".equals(host)
                || "accounts.youtube.com".equals(host);
    }

    public static boolean imgurLoginUrl(String url) {
        return loginUrl(url) && !googleLoginUrl(url);
    }

    public static boolean imgurLoginReturnUrl(String url) {
        try {
            if (!imgurLoginUrl(url)) return false;
            String path = new URI(url).getPath();
            return !"/signin".equals(path) && !"/signin/".equals(path);
        } catch (Exception ignored) { return false; }
    }

    public static String scriptUrl(String html) {
        Matcher matcher = Pattern.compile("https://[^\\s\"'<>/]+/desktop-assets/js/main\\.[a-zA-Z0-9]+\\.js").matcher(html);
        while (matcher.find()) if (loginUrl(matcher.group())) return matcher.group();
        return null;
    }

    public static String webClientId(String script) {
        // Observed on 2026-10-16: exported hH is the public desktop client ID,
        // not an OAuth token/secret. Never substitute a third-party app's ID.
        Matcher export = Pattern.compile("hH:\\(\\)=>([a-zA-Z_$][a-zA-Z0-9_$]*)").matcher(script);
        if (!export.find()) return null;
        String area = script.substring(export.end(), Math.min(script.length(), export.end() + 5000));
        Matcher value = Pattern.compile("(?:[,;]|var )" + Pattern.quote(export.group(1))
                + "=\"([a-fA-F0-9]{15})\"").matcher(area);
        return value.find() ? value.group(1) : null;
    }

    public static boolean ownedBy(long expectedId, String expectedName, long actualId, String actualName) {
        if (expectedId <= 0 || expectedName == null || expectedName.isEmpty()) return false;
        if (actualId > 0) return actualId == expectedId;
        return actualName != null && expectedName.equalsIgnoreCase(actualName);
    }

    public static boolean mediaUrl(String url) {
        try {
            URI uri = new URI(url);
            return "https".equals(uri.getScheme()) && uri.getHost() != null
                    && uri.getRawUserInfo() == null && uri.getPort() == -1
                    && uri.getPath().matches("/[a-zA-Z0-9]+\\.(?:jpe?g|png|gif|webp|mp4|webm)");
        } catch (Exception ignored) { return false; }
    }

    public static boolean processing(Object value) {
        // Video responses use {"status":"pending"/"completed"}, not just a boolean.
        // Unknown/missing states remain pending; a CDN link alone is not completion.
        if (value instanceof org.json.JSONObject) {
            return !"completed".equalsIgnoreCase(((org.json.JSONObject) value).optString("status", ""));
        }
        if (value == null || Boolean.FALSE.equals(value)) return false;
        String text = String.valueOf(value);
        return !("false".equalsIgnoreCase(text) || "0".equals(text) || "null".equals(text));
    }

    public static boolean imageId(String id) { return id != null && id.matches("[A-Za-z0-9]{1,64}"); }

    /** Static CDN preview for images and videos. Never download the original video for a preview. */
    public static String thumbnailUrl(String id, String link, boolean pending) {
        if (pending || !imageId(id) || !mediaUrl(link)) return null;
        try {
            if (!new URI(link).getPath().startsWith("/" + id + ".")) return null;
            return new URI(link).resolve(id + "m.jpg").toString();
        } catch (Exception ignored) { return null; }
    }
}
