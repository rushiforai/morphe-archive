/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.muslimpro;

import android.app.Application;
import android.content.Context;
import android.os.Build;
import java.util.HashMap;
import java.util.Map;

/** Wallpaper colors for Muslim Pro, which only has a dark theme. */
public final class MaterialYou {
    /** Brand color (0xRRGGBB) to the Material role that replaces it, as `android:color` names (Android 14+ role, then the Android 12 tone). */
    private static final Map<Integer, String[]> ROLES = new HashMap<>();

    private static final Map<Integer, Integer> RESOLVED = new HashMap<>();

    static {
        String[] accent = {"system_accent1_200", "system_accent1_200"};
        String[] page = {"system_surface_dark", "system_neutral1_1000"};
        String[] card = {"system_surface_container_dark", "system_neutral1_900"};
        String[] lowest = {"system_surface_container_lowest_dark", "system_neutral1_1000"};
        for (int rgb : new int[] {0x00A360, 0x00DB81, 0x0B9A44}) ROLES.put(rgb, accent);
        ROLES.put(0x003232, page);
        for (int rgb : new int[] {0x194746, 0x1A4747}) ROLES.put(rgb, card);
        String[] high = {"system_surface_container_high_dark", "system_neutral2_800"};
        for (int rgb : new int[] {0x315959, 0x335B5B}) ROLES.put(rgb, high);
        for (int rgb : new int[] {0x062424, 0x041E1E, 0x0F1613}) ROLES.put(rgb, lowest);
    }

    private MaterialYou() {
    }

    /** The app's accent: the wallpaper's accent on Android 12+, otherwise the app's own green. */
    public static int accent(Context context, int fallback) {
        return Build.VERSION.SDK_INT >= 31 ? context.getColor(android.R.color.system_accent1_200) : fallback;
    }

    /** Replaces a brand color (ARGB) with its wallpaper role, keeping the alpha; other colors pass through. */
    public static int map(int argb) {
        String[] role = ROLES.get(argb & 0xFFFFFF);
        if (role == null || Build.VERSION.SDK_INT < 31) return argb;
        Integer rgb = resolve(argb & 0xFFFFFF, role);
        return rgb == null ? argb : (argb & 0xFF000000) | rgb;
    }

    /** Same as {@link #map(int)} for the `Color(long)` overload, whose ARGB sits in the low 32 bits. */
    public static long map(long argb) {
        return map((int) argb) & 0xFFFFFFFFL;
    }

    /**
     * Same as {@link #map(int)} for a packed sRGB Compose `Color` (ARGB in the high 32 bits). Colors built from floats
     * (gradients, lerp, copy) land one step off the brand value, so a neighbor within 1 per channel counts too.
     */
    public static long mapPacked(long packed) {
        if ((packed & 0xFFFFFFFFL) != 0 || Build.VERSION.SDK_INT < 31) return packed;
        int argb = (int) (packed >>> 32);
        for (int dr = -1; dr <= 1; dr++) {
            for (int dg = -1; dg <= 1; dg++) {
                for (int db = -1; db <= 1; db++) {
                    int rgb = (((argb >> 16) & 0xFF) + dr << 16) | (((argb >> 8) & 0xFF) + dg << 8) | ((argb & 0xFF) + db);
                    if ((rgb & 0xFF000000) != 0 || !ROLES.containsKey(rgb)) continue;
                    int mapped = map((argb & 0xFF000000) | rgb);
                    if (mapped != ((argb & 0xFF000000) | rgb)) return (mapped & 0xFFFFFFFFL) << 32;
                }
            }
        }
        return packed;
    }

    /** The system color of a role, or null before the app exists. */
    private static synchronized Integer resolve(int key, String[] role) {
        Integer cached = RESOLVED.get(key);
        if (cached != null) return cached;
        try {
            Application app = (Application) Class.forName("android.app.ActivityThread").getMethod("currentApplication").invoke(null);
            if (app == null) return null;
            String name = Build.VERSION.SDK_INT >= 34 ? role[0] : role[1];
            int id = app.getResources().getIdentifier(name, "color", "android");
            if (id == 0) return null;
            int rgb = app.getResources().getColor(id, null) & 0xFFFFFF;
            RESOLVED.put(key, rgb);
            return rgb;
        } catch (ReflectiveOperationException | RuntimeException e) {
            return null;
        }
    }
}
