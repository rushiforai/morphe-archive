/*
 * Copyright 2026 Nyandex contributors.
 *
 * Nyandex: Yandex Music patches for Morphe Patcher.
 * Licensed under the GNU General Public License v3.0; see LICENSE and NOTICE.
 */

package app.nyandex.extension.yandexmusic.share;

import java.util.Locale;

/**
 * Removes tracking parameters from the links the app shares and copies. Pure Java (no Android
 * classes), so it is unit tested on the JVM.
 *
 * The app's link builder appends {@code utm_medium=copy_link} and {@code ref_id}, a random id
 * per share by which an opened link can be tied to the share it came from. Both are removed,
 * as is any other {@code utm_*} parameter. {@code invite_id} (an invitation the user chose to
 * send) and functional parameters such as {@code openTrailer} stay.
 */
@SuppressWarnings("unused")
public final class ShareLinks {
    private ShareLinks() {
    }

    /** Called from the patched link builder. Returns the link unchanged if anything goes wrong. */
    public static String clean(String url) {
        try {
            return removeTracking(url);
        } catch (Throwable throwable) {
            return url;
        }
    }

    static String removeTracking(String url) {
        if (url == null) return null;
        int query = url.indexOf('?');
        if (query < 0) return url;
        int fragment = url.indexOf('#', query);
        String base = url.substring(0, query);
        String parameters = fragment < 0 ? url.substring(query + 1) : url.substring(query + 1, fragment);
        String suffix = fragment < 0 ? "" : url.substring(fragment);

        StringBuilder kept = new StringBuilder();
        for (String parameter : parameters.split("&")) {
            if (parameter.isEmpty() || isTracking(parameter)) continue;
            if (kept.length() > 0) kept.append('&');
            kept.append(parameter);
        }
        return kept.length() == 0 ? base + suffix : base + '?' + kept + suffix;
    }

    static boolean isTracking(String parameter) {
        int equals = parameter.indexOf('=');
        String name = (equals < 0 ? parameter : parameter.substring(0, equals)).toLowerCase(Locale.ROOT);
        return name.startsWith("utm_") || name.equals("ref_id");
    }
}
