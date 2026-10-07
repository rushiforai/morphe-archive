package app.twoeno.extension.spotify;

import app.twoeno.extension.shared.LinkSanitizer;

/**
 * Removes the {@code si} and {@code utm_source} tracking parameters from shared and copied links.
 */
@SuppressWarnings("unused")
public final class SanitizeSharingLinksPatch {
    private static final LinkSanitizer SANITIZER = new LinkSanitizer("si", "utm_source");

    private SanitizeSharingLinksPatch() {
    }

    /**
     * Injection point: url parameter of the share sheet url formatter.
     */
    public static String sanitizeUrl(String url) {
        return SANITIZER.sanitizeUrl(url);
    }

    /**
     * Injection point: text of the clip copied by "Copy link".
     */
    public static String sanitizeText(String text) {
        return SANITIZER.sanitizeText(text);
    }

    public static CharSequence sanitizeText(CharSequence text) {
        return SANITIZER.sanitizeText(text);
    }
}
