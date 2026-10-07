package app.twoeno.extension.kleinanzeigen;

import app.twoeno.extension.shared.LinkSanitizer;

/**
 * Removes the {@code utm_*} tracking parameters Kleinanzeigen adds to shared links.
 */
@SuppressWarnings("unused")
public final class SanitizeSharingLinksPatch {
    private static final LinkSanitizer SANITIZER = new LinkSanitizer("utm_*");

    private SanitizeSharingLinksPatch() {
    }

    public static String sanitize(String text) {
        return SANITIZER.sanitizeText(text);
    }

    public static CharSequence sanitize(CharSequence text) {
        return SANITIZER.sanitizeText(text);
    }
}
