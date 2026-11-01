package nl.johninnl.medium.privacy;

import java.net.URI;
import java.net.URLDecoder;
import java.util.Locale;

/** Narrow collector/widget rules; ordinary content, image and account hosts remain available. */
public final class WebPrivacyRules {
    private WebPrivacyRules() {}
    public static boolean blocked(String value) {
        URI uri = safe(value);
        if (uri == null) return false;
        String host = uri.getHost().toLowerCase(Locale.ROOT);
        while (host.endsWith(".")) host = host.substring(0, host.length() - 1);
        String path = uri.getPath() == null ? "" : uri.getPath();
        if (path.equals("/cdn-cgi/rum") || path.startsWith("/cdn-cgi/rum/")) return true;
        for (String domain : new String[] {
                "cloudflareinsights.com", "google-analytics.com", "app-measurement.com",
                "googlesyndication.com", "doubleclick.net", "cdn.embedly.com",
                "platform.twitter.com", "syndication.twitter.com", "syndication.x.com", "cdn.syndication.twimg.com"}) {
            if (host.equals(domain) || host.endsWith("." + domain)) return true;
        }
        return (host.equals("www.facebook.com") || host.equals("facebook.com")) && path.equals("/tr");
    }
    public static URI safe(String value) {
        if (value == null || value.isEmpty()) return null;
        try {
            URI uri = URI.create(value);
            return uri.getHost() != null && uri.getUserInfo() == null &&
                ("https".equalsIgnoreCase(uri.getScheme()) || "http".equalsIgnoreCase(uri.getScheme())) ? uri : null;
        } catch (IllegalArgumentException invalid) { return null; }
    }
    public static URI embedTarget(String value) {
        URI uri = safe(value);
        if (uri == null) return null;
        if ("cdn.embedly.com".equalsIgnoreCase(uri.getHost())) {
            URI target = query(uri, "url");
            if (target == null) target = query(uri, "src");
            if (target != null) uri = target;
        }
        return blocked(uri.toString()) ? null : uri;
    }
    private static URI query(URI uri, String name) {
        if (uri.getRawQuery() == null) return null;
        for (String pair : uri.getRawQuery().split("&")) {
            String[] item = pair.split("=", 2);
            if (item.length == 2 && item[0].equals(name)) try { return safe(URLDecoder.decode(item[1], "UTF-8")); }
            catch (IllegalArgumentException | java.io.UnsupportedEncodingException invalid) { return null; }
        }
        return null;
    }
}
