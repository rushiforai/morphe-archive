package e.e.a;

import java.net.URI;
import java.util.Locale;
import java.util.regex.Pattern;

/** Strictly parse NicoNico URLs pasted from a browser; never dereference their host. */
public final class PlaylistUrlParser {
    private static final Pattern VIDEO = Pattern.compile("(?:sm|nm|so|ss)?[0-9]+");
    private PlaylistUrlParser() {}

    public static String videoId(String supplied) {
        if (supplied == null) return null;
        String value = supplied.trim();
        if (VIDEO.matcher(value).matches()) return value;
        if (value.isEmpty() || value.length() > 2048) return null;
        if (!value.contains("://")) {
            if (!value.matches("(?i)^(?:[a-z0-9.-]+)/(?:.+)$")) return null;
            value = "https://" + value;
        }
        try {
            URI uri = new URI(value);
            String scheme = uri.getScheme();
            String host = uri.getHost();
            if (scheme == null || host == null || uri.getUserInfo() != null) return null;
            if (!scheme.equalsIgnoreCase("http") && !scheme.equalsIgnoreCase("https")) return null;
            host = host.toLowerCase(Locale.ROOT);
            boolean nicovideo = host.equals("nicovideo.jp") || host.endsWith(".nicovideo.jp");
            boolean shortLink = host.equals("nico.ms") || host.equals("www.nico.ms");
            if (!nicovideo && !shortLink) return null;
            String path = uri.getPath();
            if (path == null) return null;
            if (path.startsWith("/")) path = path.substring(1);
            if (path.endsWith("/")) path = path.substring(0, path.length() - 1);
            if (nicovideo) {
                if (!path.startsWith("watch/") && !path.startsWith("shorts/")) return null;
                path = path.substring(path.indexOf('/') + 1);
            } else if (path.startsWith("watch/")) {
                path = path.substring("watch/".length());
            }
            return VIDEO.matcher(path).matches() ? path : null;
        } catch (Exception badUrl) {
            return null;
        }
    }

    public static String canonicalUrl(String supplied) {
        String id = videoId(supplied);
        return id == null ? null : "https://www.nicovideo.jp/watch/" + id;
    }
}
