package app.drbushytop.extension.relay;

import android.net.Uri;

import java.util.Locale;

/**
 * Recognises images hosted by Reddit itself.
 *
 * <p>Reddit answers a request for one of these that asks for HTML (any browser, including
 * Relay's in-app one) with a redirect to the post, and only serves the picture to a request
 * that asks for an image. Relay's image viewer asks for an image.
 */
@SuppressWarnings("unused")
public final class RedditMedia {
    private static final String[] IMAGE_EXTENSIONS = {".jpg", ".jpeg", ".png", ".webp"};

    private RedditMedia() {
    }

    /**
     * Whether {@code url} is the MP4 Reddit makes of a GIF ({@code ...gif?format=mp4}). Relay only
     * plays links whose path ends in .mp4 or .webm as video, which is the player with controls.
     */
    public static boolean isRedditVideo(String url) {
        if (url == null) return false;
        try {
            Uri uri = Uri.parse(url);
            String host = uri.getHost();
            return host != null && host.toLowerCase(Locale.ROOT).endsWith("redd.it")
                    && "mp4".equals(uri.getQueryParameter("format"));
        } catch (RuntimeException e) {
            return false;
        }
    }

    /** Whether {@code url} is a still image on one of Reddit's image hosts. */
    public static boolean isRedditImage(String url) {
        if (url == null) return false;
        try {
            Uri uri = Uri.parse(url);
            String host = uri.getHost();
            if (host == null) return false;
            host = host.toLowerCase(Locale.ROOT);
            if (!host.equals("i.redd.it") && !host.equals("preview.redd.it")
                    && !host.equals("external-preview.redd.it")) {
                return false;
            }
            String last = uri.getLastPathSegment();
            if (last == null) return false;
            last = last.toLowerCase(Locale.ROOT);
            for (String extension : IMAGE_EXTENSIONS) {
                if (last.endsWith(extension)) return true;
            }
            return false;
        } catch (RuntimeException e) {
            return false;
        }
    }
}
