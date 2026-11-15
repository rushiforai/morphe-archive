/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * Adapted from the WebView helpers in https://github.com/crimera/piko
 * (GPL-3.0). See META-INF/PROTEUS-NOTICE.txt for GPLv3 §7(b) terms.
 */

package app.template.extension.extension;

import java.util.regex.Pattern;

/**
 * Pure URL helpers for the in-app browser. Kept free of Android imports so it
 * can be exercised by the repository's javac-based extension tests.
 */
public final class InstagramWebBrowserUrls {
    private static final Pattern USERNAME = Pattern.compile("[A-Za-z0-9._]{1,30}");

    private InstagramWebBrowserUrls() {
    }

    public static String loggedOutExplore() {
        return "https://www.instagram.com/explore/";
    }

    public static String profileReels(String username) {
        String normalized = normalizeUsername(username);
        return normalized == null
                ? null
                : "https://www.instagram.com/" + normalized + "/reels/";
    }

    public static String profile(String username) {
        String normalized = normalizeUsername(username);
        return normalized == null
                ? null
                : "https://www.instagram.com/" + normalized + "/";
    }

    /**
     * Instagram's "Liked" activity page. It only exposes the signed-in
     * account's likes; other accounts' likes are server-private.
     */
    public static String ownLikedPosts() {
        return "https://www.instagram.com/your_activity/likes/";
    }

    public static String normalizeUsername(String username) {
        if (username == null) {
            return null;
        }
        String candidate = username.trim();
        if (candidate.startsWith("@")) {
            candidate = candidate.substring(1);
        }
        return USERNAME.matcher(candidate).matches() ? candidate : null;
    }

    public static boolean isValidUsername(String username) {
        return normalizeUsername(username) != null;
    }
}
