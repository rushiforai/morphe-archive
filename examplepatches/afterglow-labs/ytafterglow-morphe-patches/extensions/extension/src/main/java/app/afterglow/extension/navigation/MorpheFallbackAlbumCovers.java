/*
 * Copyright 2026 Morphe. Modified for Afterglow.
 * Afterglow for Android. Temporary source adapter for Morphe's "Bypass image
 * region restrictions" patch (Morphe patches v2.2.0, GPLv3):
 * https://github.com/MorpheApp/morphe-patches. See NOTICE.
 * Modified for Afterglow: live default-OFF fixAlbums preference and only the two
 * host replacements specified by iOS newCoverURL. Not an official Morphe file.
 * Portions provided "AS IS" without express or implied warranties, including
 * merchantability and fitness for a particular purpose.
 */
package app.afterglow.extension.navigation;

import java.net.URI;
import java.util.Locale;
import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.settings.LiteMode;

@SuppressWarnings("unused")
public final class MorpheFallbackAlbumCovers {
    private MorpheFallbackAlbumCovers() {}

    /** Called before a new native image request stores its URL and computes its cache key. */
    public static String overrideImageURL(String original) {
        try {
            if (original == null || !InstalledTweaks.has("fix-albums")
                    || !LiteMode.effectiveBool("fixAlbums")) return original;
            return replacement(original);
        } catch (Throwable error) {
            Afterglow.error("MorpheFallbackAlbumCovers.overrideImageURL", error);
            return original;
        }
    }

    /** Changes only the exact iOS hosts; preserves the URL's encoded path/query/fragment. */
    static String replacement(String original) {
        if (original == null) return null;
        try {
            URI uri = new URI(original);
            String host = uri.getHost();
            if (host == null || uri.getScheme() == null || uri.getRawUserInfo() != null) return original;
            String lower = host.toLowerCase(Locale.ROOT);
            if (!lower.equals("yt3.ggpht.com") && !lower.equals("yt3.googleusercontent.com")) return original;
            int start = original.indexOf("://") + 3;
            if (start < 3 || !original.regionMatches(true, start, host, 0, host.length())) return original;
            return original.substring(0, start) + "yt4" + lower.substring(3)
                    + original.substring(start + host.length());
        } catch (IllegalArgumentException | java.net.URISyntaxException ignored) {
            return original;
        }
    }
}
