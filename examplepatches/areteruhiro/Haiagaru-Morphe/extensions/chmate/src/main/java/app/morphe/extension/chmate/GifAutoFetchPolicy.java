package app.morphe.extension.chmate;

import java.net.URI;
import java.util.LinkedHashSet;
import java.util.regex.Pattern;

/** GIF files have an independent policy; MP4-backed animations remain video links. */
final class GifAutoFetchPolicy {
    private static final Pattern URL = Pattern.compile("https?://[^\\s<>\"'()（）]+", Pattern.CASE_INSENSITIVE);
    static final String KEY = "urlGifFetchMode";
    // UI order: image + GIF, image, GIF, neither. Legacy native GIF attachments = GIF only.
    static int mode(int saved, boolean images) { return saved >= 0 && saved <= 3 ? saved : images ? 2 : 3; }
    static boolean image(int mode) { return mode == 0 || mode == 1; }
    static boolean gif(int mode) { return mode == 0 || mode == 2; }
    static boolean supported(String value) {
        if (value == null) return false;
        try {
            URI uri = URI.create(value);
            return ("http".equalsIgnoreCase(uri.getScheme()) || "https".equalsIgnoreCase(uri.getScheme()))
                    && uri.getHost() != null && uri.getUserInfo() == null && uri.getPath() != null
                    && uri.getPath().toLowerCase(java.util.Locale.ROOT).endsWith(".gif");
        } catch (IllegalArgumentException invalid) { return false; }
    }
    static String[] extract(String body) {
        LinkedHashSet<String> result = new LinkedHashSet<>();
        if (body != null) {
            java.util.regex.Matcher urls = URL.matcher(body);
            while (urls.find() && result.size() < 8) {
                String value = urls.group().replace("&amp;", "&");
                if (supported(value)) result.add(value);
            }
        }
        return result.toArray(new String[0]);
    }
    private GifAutoFetchPolicy() { }
}
