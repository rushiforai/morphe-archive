package com.waze.gw;

import android.content.Context;

/**
 * Whether the car is in Vietnam. Features tied to Vietnamese road rules and signs (no-passing and residential-area
 * signs, the average-speed-zone "no passing" sign, the motorcycle speed cap, the minimum-speed sign) are only active
 * there. The answer comes from the GPS position (a coarse outline of Vietnam, good to a few tens of km), is remembered
 * across restarts, and until the first fix of a fresh install it follows the UI language.
 */
final class Region {
    private static final String PREFS = "waze_hud_gw";
    private static final String KEY = "region_in_vietnam";

    /** Coarse outline of Vietnam (lat, lon), clockwise from the north-west; the sea side is padded. */
    private static final double[][] VIETNAM = {
            {22.40, 102.05}, {22.95, 102.75}, {22.90, 103.55}, {22.85, 104.30}, {23.50, 105.30},
            {23.25, 106.00}, {22.95, 106.80}, {22.95, 107.40}, {21.60, 108.15}, {20.60, 108.10},
            {18.80, 106.70}, {16.90, 108.30}, {15.00, 109.50}, {12.50, 109.70}, {10.20, 108.30},
            {8.00, 106.60}, {8.20, 104.70}, {9.70, 103.60}, {10.50, 103.75}, {10.50, 104.45},
            {10.95, 105.15}, {11.35, 105.90}, {11.95, 106.70}, {12.60, 107.40}, {13.40, 107.55},
            {14.45, 107.60}, {14.85, 107.35}, {15.45, 107.55}, {16.05, 107.15}, {16.50, 106.75},
            {17.05, 106.55}, {17.60, 105.70}, {18.30, 105.10}, {19.00, 104.60}, {19.70, 104.10},
            {20.40, 104.30}, {20.95, 103.55}, {21.25, 102.75}, {21.95, 102.15},
    };

    private static volatile int state;   // 1 in Vietnam, -1 elsewhere, 0 not known yet
    private static boolean restored;

    private Region() { }

    /** Pure geometry: is the point inside the outline of Vietnam. */
    static boolean contains(double lat, double lon) {
        boolean inside = false;
        for (int i = 0, j = VIETNAM.length - 1; i < VIETNAM.length; j = i++) {
            double latI = VIETNAM[i][0], lonI = VIETNAM[i][1];
            double latJ = VIETNAM[j][0], lonJ = VIETNAM[j][1];
            if ((lonI > lon) != (lonJ > lon)
                    && lat < (latJ - latI) * (lon - lonI) / (lonJ - lonI) + latI) {
                inside = !inside;
            }
        }
        return inside;
    }

    /** Called with every position fix. */
    static void onPosition(double lat, double lon) {
        if (Double.isNaN(lat) || Double.isNaN(lon) || (lat == 0.0 && lon == 0.0)) return;
        int next = contains(lat, lon) ? 1 : -1;
        if (next == state) return;
        state = next;
        remember(next);
    }

    /** True while the car is in Vietnam (or, with no position yet, while the Mod is shown in Vietnamese). */
    static boolean inVietnam() {
        int known = state;
        if (known != 0) return known == 1;
        restore();
        known = state;
        if (known != 0) return known == 1;
        return "vi".equals(I18n.uiTag());
    }

    private static synchronized void restore() {
        if (restored) return;
        Context app = app();
        if (app == null) return;
        restored = true;
        try {
            int saved = app.getSharedPreferences(PREFS, Context.MODE_PRIVATE).getInt(KEY, 0);
            if (saved == 1 || saved == -1) state = saved;
        } catch (Throwable ignored) { }
    }

    private static void remember(int value) {
        Context app = app();
        if (app == null) return;
        try {
            app.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit().putInt(KEY, value).apply();
        } catch (Throwable ignored) { }
    }

    private static Context app() {
        try {
            return (Context) Class.forName("android.app.ActivityThread").getMethod("currentApplication").invoke(null);
        } catch (Throwable t) {
            return null;
        }
    }
}
