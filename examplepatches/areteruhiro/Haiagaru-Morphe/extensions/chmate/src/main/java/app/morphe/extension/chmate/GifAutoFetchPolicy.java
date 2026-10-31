package app.morphe.extension.chmate;

import java.net.URI;
import java.util.LinkedHashSet;
import java.util.regex.Pattern;

/** GIF files have an independent policy; MP4-backed animations remain video links. */
final class GifAutoFetchPolicy {
    static final String KEY = "urlGifFetchMode";
    // UI order: image + GIF, image, GIF, neither. Legacy native GIF attachments = GIF only.
    static int mode(int saved, boolean images) { return saved >= 0 && saved <= 3 ? saved : images ? 2 : 3; }
    static boolean image(int mode) { return mode == 0 || mode == 1; }
    static boolean gif(int mode) { return mode == 0 || mode == 2; }
    static boolean supported(String value) {
        value=PreviewUrls.normalize(value);
        if (value == null) return false;
        try {
            URI uri = URI.create(value);
            return ("http".equalsIgnoreCase(uri.getScheme()) || "https".equalsIgnoreCase(uri.getScheme()))
                    && uri.getHost() != null && uri.getUserInfo() == null && uri.getPath() != null
                    && !beIcon(uri)
                    && uri.getPath().toLowerCase(java.util.Locale.ROOT).endsWith(".gif");
        } catch (IllegalArgumentException invalid) { return false; }
    }
    private static boolean beIcon(URI uri) {
        String host=uri.getHost().toLowerCase(java.util.Locale.ROOT),path=uri.getPath().toLowerCase(java.util.Locale.ROOT);
        return (host.equals("img.5ch.io")||host.equals("img.5ch.net")||host.equals("img.2ch.net"))
                && (path.startsWith("/ico/")||path.startsWith("/premium/"));
    }
    static String[] extract(String body) {
        LinkedHashSet<String> result = new LinkedHashSet<>();
        if (body != null) {
            for(String value:PreviewUrls.extract(body,32)){
                if (supported(value)) result.add(value);
                if(result.size()>=8)break;
            }
        }
        return result.toArray(new String[0]);
    }
    private GifAutoFetchPolicy() { }
}
