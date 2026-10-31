package app.morphed.extension.twitch.hls;

/**
 * Identifies a playlist URL independent of its query string, which the IVS player may rebuild.
 */
public final class UrlKey {
    private UrlKey() {
    }

    public static String of(String url) {
        if (url == null) return "";
        String trimmed = url.trim();
        int query = trimmed.indexOf('?');
        return query >= 0 ? trimmed.substring(0, query) : trimmed;
    }
}
