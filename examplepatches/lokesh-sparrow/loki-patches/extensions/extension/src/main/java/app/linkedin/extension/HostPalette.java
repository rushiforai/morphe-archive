/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.extension;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Configuration;

/**
 * Dark or light for the menu, when the app it runs in has its own theme setting instead of following the system.
 * MX Player paints its pages from {@code list.theme} in its preferences - Amoled Black, Dark, Light, or one of the
 * Classic skins it downloads - whatever the phone is set to, so the menu reads the same key.
 *
 * Only the choice is taken. The colours stay Loki's own: pure black in the dark, as in every other app.
 */
final class HostPalette {

    private HostPalette() {
    }

    /** True for a dark page. Apps without a theme setting of their own, and MX on Adaptive, follow the system. */
    static boolean dark(Context context) {
        Boolean host = hostDark(context);
        if (host != null) return host;
        return (context.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                == Configuration.UI_MODE_NIGHT_YES;
    }

    private static Boolean hostDark(Context context) {
        String pkg = context.getPackageName();
        if (!pkg.startsWith("com.mxtech.videoplayer")) return null;
        String theme;
        try {
            SharedPreferences preferences = context.getSharedPreferences(pkg + "_preferences", Context.MODE_PRIVATE);
            theme = preferences.getString("list.theme", null);
        } catch (Throwable error) {
            return null;
        }
        if (theme == null || theme.isEmpty()) return null;
        theme = theme.toLowerCase();
        if (theme.contains("adaptive")) return null;
        if (theme.contains("battery_saving") || theme.contains("amoled") || theme.contains("_dark")) return true;
        if (theme.contains("_light") || theme.contains("light") || theme.equals("white")) return false;
        return true;
    }
}
