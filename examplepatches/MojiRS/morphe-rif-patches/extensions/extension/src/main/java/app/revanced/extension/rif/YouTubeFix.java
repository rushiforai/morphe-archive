package app.revanced.extension.rif;

import android.content.Context;

/**
 * Helpers for the "Fix YouTube videos" patch.
 */
public final class YouTubeFix {

    private static final String FALLBACK = "https://www.youtube.com";

    private YouTubeFix() {}

    /**
     * The embed origin for rif's YouTube player (android-youtube-player 12.x), replacing
     * its hard-coded https://www.youtube.com. It is sent as the iframe's origin playerVar
     * and used as the WebView's base URL (so also the Referer). YouTube now rejects embeds
     * unless this is https://{app package}, which the library's 13.0.0 fix also uses.
     */
    public static String origin() {
        try {
            Context ctx = Settings.context();
            if (ctx != null) {
                String pkg = ctx.getPackageName();
                if (pkg != null && !pkg.isEmpty()) return "https://" + pkg;
            }
        } catch (Throwable ignored) {
        }
        return FALLBACK;
    }
}
