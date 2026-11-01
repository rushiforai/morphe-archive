package nl.johninnl.wuplay;

import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.Set;

/** Stable provider identities and narrowly scoped ownership rules. */
public final class CatalogPolicy {
    public static final String PREFIX = "santodan-launcher/wuplay/";
    private CatalogPolicy() {}

    public static String channelKey(String profile, int definition) {
        if (profile == null || profile.isEmpty()) throw new IllegalArgumentException("Missing profile");
        return PREFIX + encode(profile) + "/catalog/" + definition;
    }

    public static String tileKey(String type, String id) {
        if (!("movie".equals(type) || "series".equals(type)) || id == null || id.trim().isEmpty()) return null;
        return type + "/" + encode(id);
    }

    private static String encode(String value) {
        return Base64.getUrlEncoder().withoutPadding().encodeToString(value.getBytes(StandardCharsets.UTF_8));
    }

    public static boolean remove(String owner, String providerId, Set<String> desired) {
        return "app.wuplay.androidtv".equals(owner) && providerId != null &&
            providerId.startsWith(PREFIX) && !desired.contains(providerId);
    }

    public static boolean contentSource(String source) {
        // Wuplay's BoardViewModel.NON_CONTENT_SOURCES: these use navigation/live-flow paths.
        return source != null && !source.isEmpty() && !"hub".equals(source) && !"saved_collections".equals(source)
            && !"library".equals(source) && !"watchlist".equals(source);
    }

    public static boolean artwork(String url) {
        if (url == null) return false;
        try {
            java.net.URI uri = new java.net.URI(url);
            return ("https".equalsIgnoreCase(uri.getScheme()) || "http".equalsIgnoreCase(uri.getScheme())) &&
                uri.getHost() != null && uri.getUserInfo() == null;
        } catch (java.net.URISyntaxException invalid) { return false; }
    }
}
