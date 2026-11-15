/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * Adapted from https://github.com/crimera/piko (GPL-3.0).
 * See META-INF/PROTEUS-NOTICE.txt for GPLv3 §7(b) terms.
 */

package app.template.extension.extension;

/**
 * Android-free part of the Ghost Mode URL filter. The Android-aware
 * {@link InstagramGhostMode} keeps the flag in sync with the preferences.
 */
@SuppressWarnings("unused")
public final class InstagramGhostRequestFilter {
    private static volatile boolean blockStorySeen;

    private InstagramGhostRequestFilter() {
    }

    public static void setBlockStorySeen(boolean value) {
        blockStorySeen = value;
    }

    public static boolean shouldBlockUrl(String url) {
        if (url == null || !blockStorySeen) {
            return false;
        }
        return url.contains("media/seen/?reel=")
                || url.contains("/media/seen/");
    }
}
