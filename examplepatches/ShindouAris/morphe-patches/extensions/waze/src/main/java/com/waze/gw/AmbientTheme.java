package com.waze.gw;

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Color;

/**
 * Single source of truth for the user-selectable MOD accent.
 *
 * Warning red, speed-sign rings and the native route colour are deliberately not sourced from
 * this class: those colours carry meaning and must remain stable regardless of the visual theme.
 */
public final class AmbientTheme {
    public static final String PREF_MODE = "ambient_color_mode";
    public static final String PREF_CUSTOM = "ambient_custom_color";
    private static final String PREF_V12_DEFAULT_MIGRATED = "ambient_v12_waze_default";

    public static final int MODE_WAZE = 0;
    public static final int MODE_CHISADIN = 1;
    public static final int MODE_AMBER = 2;
    public static final int MODE_MINT = 3;
    public static final int MODE_CUSTOM = 4;

    // The original light Waze blue is intentionally the default: it has excellent daylight
    // contrast against the black navigation banner.
    public static final int WAZE_BLUE = 0xFF33CCFF;
    public static final int CHISADIN_PINK = 0xFFFF2D8E;
    public static final int SUNLIGHT_AMBER = 0xFFFFC53D;
    public static final int MINT = 0xFF5CE1C6;

    private AmbientTheme() { }

    public static int color(Context context) {
        if (context == null) return WAZE_BLUE;
        try {
            SharedPreferences prefs = context.getSharedPreferences(
                    "waze_hud_gw", Context.MODE_PRIVATE);
            // V12 returns the first-run/upgrade appearance to Waze blue once. After this
            // migration the user's next explicit ambient choice is preserved normally.
            if (!prefs.getBoolean(PREF_V12_DEFAULT_MIGRATED, false)) {
                prefs.edit()
                        .putInt(PREF_MODE, MODE_WAZE)
                        .putBoolean(PREF_V12_DEFAULT_MIGRATED, true)
                        .apply();
            }
            return color(prefs);
        } catch (Throwable ignored) {
            return WAZE_BLUE;
        }
    }

    public static int color(SharedPreferences prefs) {
        if (prefs == null) return WAZE_BLUE;
        int mode = prefs.getInt(PREF_MODE, MODE_WAZE);
        switch (mode) {
            case MODE_CHISADIN:
                return CHISADIN_PINK;
            case MODE_AMBER:
                return SUNLIGHT_AMBER;
            case MODE_MINT:
                return MINT;
            case MODE_CUSTOM:
                return opaque(prefs.getInt(PREF_CUSTOM, WAZE_BLUE));
            case MODE_WAZE:
            default:
                return WAZE_BLUE;
        }
    }

    public static int presetColor(int mode, int customColor) {
        switch (mode) {
            case MODE_CHISADIN: return CHISADIN_PINK;
            case MODE_AMBER: return SUNLIGHT_AMBER;
            case MODE_MINT: return MINT;
            case MODE_CUSTOM: return opaque(customColor);
            case MODE_WAZE:
            default: return WAZE_BLUE;
        }
    }

    public static int opaque(int color) {
        return color | 0xFF000000;
    }

    public static int withAlpha(int color, int alpha) {
        return Color.argb(Math.max(0, Math.min(255, alpha)),
                Color.red(color), Color.green(color), Color.blue(color));
    }
}
