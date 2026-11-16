package app.morphe.extension.chmate;

import java.net.URI;

/** The guest upload UI is the real site, not a bridge exposing local files or cookies. */
public final class MediaUploadWebPolicy {
    private MediaUploadWebPolicy() {}
    public static boolean page(String value) {
        return page("imgpile", value);
    }
    public static String provider(String value) {
        return "sendvid".equals(value) ? "sendvid" : "imgpile";
    }
    public static String home(String provider) {
        return "sendvid".equals(provider) ? "https://sendvid.com/" : "https://imgpile.com/";
    }
    public static boolean page(String provider, String value) {
        try {
            URI u = new URI(value);
            return "https".equals(u.getScheme()) && u.getHost() != null
                    && u.getRawUserInfo() == null && (u.getPort() == -1 || u.getPort() == 443);
        } catch (Exception ignored) { return false; }
    }
    public static boolean media(String value) {
        return MediaUploadPolicy.mediaUrl(MediaUploadPolicy.IMGPILE, value);
    }
    /** Public watch links only. Never copy a deletion link, embed code, secret query or CDN token. */
    public static boolean share(String provider, String value) {
        if (!"sendvid".equals(provider)) return media(value);
        try {
            URI u = new URI(value);
            return page(provider, value) && u.getRawQuery() == null && u.getRawFragment() == null
                    && u.getRawPath().matches("/[a-z0-9]{8}");
        } catch (Exception ignored) { return false; }
    }
}
