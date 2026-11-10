/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.extension;

import android.content.Context;
import android.content.res.Resources;
import android.os.Build;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Material You for the two Compose themes, Delux and Mercado, which keep their colors in code instead of in
 * resources. The theme patch routes every color constant of theirs through one of the hooks below, and a
 * handful of other tokens through the remaining ones. Each hook asks its setting when it is called, and the
 * themes read their colors once, so a change shows up after LinkedIn restarts.
 *
 * Hooks that take and return a {@code long} work on a value Compose Color: ARGB in the upper 32 bits and the
 * color space in the lower ones, which is 0 (sRGB) for every color these themes define.
 */
@SuppressWarnings("unused")
public final class MaterialYou {

    /** System accent tones, by lightness. */
    private static final int T10 = android.R.color.system_accent1_10;
    private static final int T50 = android.R.color.system_accent1_50;
    private static final int T100 = android.R.color.system_accent1_100;
    private static final int T200 = android.R.color.system_accent1_200;
    private static final int T300 = android.R.color.system_accent1_300;
    private static final int T400 = android.R.color.system_accent1_400;
    private static final int T500 = android.R.color.system_accent1_500;
    private static final int T600 = android.R.color.system_accent1_600;
    private static final int T700 = android.R.color.system_accent1_700;
    private static final int T800 = android.R.color.system_accent1_800;
    private static final int T900 = android.R.color.system_accent1_900;

    /** LinkedIn blues (0xRRGGBB) and the system tone that replaces each. */
    private static final Map<Integer, Integer> BLUES = new HashMap<>();
    /** LinkedIn backgrounds (0xRRGGBB) and the system color that replaces each. */
    private static final Map<Integer, Integer> BACKDROPS = new HashMap<>();
    /** LinkedIn greens of selected states and teals of charts, recolored the same way. */
    private static final Map<Integer, Integer> SELECTED = new HashMap<>();

    /** The dark backgrounds of LinkedIn: cards, containers and tinted rows. */
    private static final int[] DARK_ROWS = {0x1B1F23, 0x1D2226, 0x293037, 0x293138};

    /** The warm light canvas LinkedIn puts behind server drawn screens, visible between the items. */
    private static final int WARM_GRAY = 0xE9E5DF;

    private static final int DARK_CONTAINER = 0xFF1D2226;
    private static final int WHITE = 0xFFFFFFFF;
    /** Black as a packed Compose color, for the AMOLED mode. */
    private static final long PACKED_BLACK = 0xFF000000L << 32;

    /** Android 14 has the Material 3 surface roles; Android 12 and 13 only have the neutral tones. */
    private static final boolean HAS_ROLES = Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE;

    private static final int CARD_LIGHT = role(android.R.color.system_surface_light, android.R.color.system_neutral2_50);
    private static final int CANVAS_LIGHT =
            role(android.R.color.system_surface_container_low_light, android.R.color.system_neutral2_100);
    private static final int ROW_LIGHT =
            role(android.R.color.system_surface_container_high_light, android.R.color.system_neutral2_100);
    private static final int HIGHEST_LIGHT =
            role(android.R.color.system_surface_container_highest_light, android.R.color.system_neutral2_100);
    private static final int BORDER_LIGHT_ROLE =
            role(android.R.color.system_surface_container_highest_light, android.R.color.system_neutral2_200);
    private static final int CARD_DARK =
            role(android.R.color.system_surface_container_dark, android.R.color.system_neutral1_900);
    private static final int ROW_DARK =
            role(android.R.color.system_surface_container_high_dark, android.R.color.system_neutral2_800);
    private static final int CANVAS_DARK =
            role(android.R.color.system_surface_dark, android.R.color.system_neutral1_1000);
    private static final int BORDER_DARK_ROLE =
            role(android.R.color.system_surface_container_highest_dark, android.R.color.system_neutral2_700);

    /** System accent tones, lightest first, that blues of server drawn screens are matched to. */
    private static final int[] ACCENT_TONES = modern()
            ? new int[]{T10, T50, T100, T200, T300, T400, T500, T600, T700, T800, T900}
            : new int[0];

    private static boolean warnedWithoutContext;

    static {
        if (modern()) {
            // The blue palette of links, buttons and selected states, lightest first.
            BLUES.put(0xF6FBFF, T10);
            BLUES.put(0xE8F3FF, T50);
            BLUES.put(0xD0E8FF, T100);
            BLUES.put(0xD2E9FF, T100);
            BLUES.put(0xA8D4FF, T200);
            BLUES.put(0xAAD6FF, T200);
            BLUES.put(0x70B5F9, T200);
            BLUES.put(0x71B7FB, T200);
            BLUES.put(0x378FE9, T400);
            BLUES.put(0x0A66C2, T600);
            BLUES.put(0x004182, T700);
            BLUES.put(0x09223B, T800);
            BLUES.put(0x0A2037, T900);
            // The older blues of ArtDeco, still used for links in messages.
            BLUES.put(0x0073B1, T600);
            BLUES.put(0x0084BF, T500);
            BLUES.put(0x006097, T700);
            // Selected states, green in LinkedIn: light theme (checked, hover) and dark theme.
            SELECTED.put(0x01754F, T600);
            SELECTED.put(0x004C33, T700);
            SELECTED.put(0x37C898, T200);
            SELECTED.put(0x74E5C0, T100);
            // The teal accent of the analytics charts: light theme (accent, hover) and dark theme.
            SELECTED.put(0x1A707E, T600);
            SELECTED.put(0x114951, T700);
            SELECTED.put(0x5EC0CF, T200);
            SELECTED.put(0x94DDE8, T100);
            // Backgrounds: cards and tinted rows in dark mode, the canvas in light mode.
            BACKDROPS.put(0x1B1F23, CARD_DARK);
            BACKDROPS.put(0x1D2226, CARD_DARK);
            BACKDROPS.put(0x293037, ROW_DARK);
            BACKDROPS.put(0x293138, ROW_DARK);
            BACKDROPS.put(0xF4F2EE, CANVAS_LIGHT);
            BACKDROPS.put(0xF3F2EF, CANVAS_LIGHT);
            // The light table behind the games leaderboard: one step below the card, like the dark one.
            BACKDROPS.put(0xF8FAFD, CANVAS_LIGHT);
            // Pale blue cards (cool gray 20).
            BACKDROPS.put(0xEDF3F8, ROW_LIGHT);
            BACKDROPS.put(0xEEF3F8, ROW_LIGHT);
            // Stronger pale blue cards (cool gray 30), such as the hiring cards on profiles.
            BACKDROPS.put(0xDDE7F1, HIGHEST_LIGHT);
        }
    }

    private MaterialYou() {
    }

    /** The Android 14 role, or the neutral tone that looks closest to it on Android 12 and 13. */
    private static int role(int withRoles, int neutralTones) {
        return HAS_ROLES ? withRoles : neutralTones;
    }

    /** Whether this Android has the system palette at all. */
    private static boolean modern() {
        return Build.VERSION.SDK_INT >= Build.VERSION_CODES.S;
    }

    /** Whether the user asked for the wallpaper colors. */
    private static boolean themed() {
        return Settings.materialYou();
    }

    // region Packed Compose colors

    private static boolean isSrgb(long value) {
        return (value & 0x3FL) == 0;
    }

    private static int argbOf(long value) {
        return (int) (value >>> 32);
    }

    /** The packed color of a 32 bit ARGB value. */
    private static long pack(long bits) {
        return (bits & 0xFFFFFFFFL) << 32;
    }

    private static int alphaOf(int bits) {
        return bits >>> 24;
    }

    private static int alphaOf(long bits) {
        return (int) (bits >>> 24);
    }

    /** Whether "AMOLED black" turns this dark packed color black. */
    private static boolean paintsBlack(long value) {
        if (!isSrgb(value) || !Settings.amoledBlack()) return false;
        int bits = argbOf(value);
        return alphaOf(bits) == 0xFF && luminance(bits) < 128;
    }

    /** Whether this ARGB value is one of LinkedIn's dark backgrounds, so "AMOLED black" turns it black. */
    private static boolean isDarkBackdrop(long bits) {
        if (alphaOf(bits) != 0xFF || !Settings.amoledBlack()) return false;
        int rgbValue = (int) (bits & 0xFFFFFF);
        for (int row : DARK_ROWS) {
            if (rgbValue == row) return true;
        }
        return false;
    }

    // endregion

    // region Compose theme hooks

    /** The card token: a light card takes the light neutral, a dark card the dark one. */
    public static long surface(long value) {
        if (paintsBlack(value)) return PACKED_BLACK;
        if (!themed()) return value;
        return reskin(value, CARD_LIGHT, CARD_DARK);
    }

    /**
     * The gap between posts, run before the card is recolored: a gap that "Remove gaps and dividers" made
     * equal to the card takes the card's own color, any other gap is a step darker than the card.
     */
    public static long canvas(long value, long cardColor) {
        if (value == cardColor) return surface(cardColor);
        if (paintsBlack(value)) return PACKED_BLACK;
        if (!themed()) return value;
        return reskin(value, CANVAS_LIGHT, CANVAS_DARK);
    }

    /** The faint outline around cards, in the light and in the dark theme. */
    public static long borderLight(long value) {
        return outline(value, BORDER_LIGHT_ROLE);
    }

    public static long borderDark(long value) {
        return outline(value, BORDER_DARK_ROLE);
    }

    private static long outline(long value, int color) {
        if (!modern() || !themed()) return value;
        return pack(palette().getColor(color, null));
    }

    /**
     * Every color token of the themes: a translucent LinkedIn blue (search fields, pressed states) takes the
     * accent color and keeps its alpha.
     */
    public static long translucentAccent(long value) {
        if (!isSrgb(value) || !themed()) return value;
        long bits = value >>> 32;
        long alpha = alphaOf(bits);
        int rgbValue = (int) (bits & 0xFFFFFF);
        if (alpha == 0 || alpha == 0xFF || !BLUES.containsKey(rgbValue)) return value;
        long accent = lookup(BLUES, 0xFF000000L | rgbValue) & 0xFFFFFF;
        return pack((alpha << 24) | accent);
    }

    /** The selected state tokens of the themes. */
    public static long checked(long value) {
        if (!isSrgb(value) || !themed()) return value;
        return pack(lookup(SELECTED, value >>> 32));
    }

    /** Each blue constant of the themes, as the ARGB value {@code Color(long)} takes. */
    public static long accent(long bits) {
        return themed() ? lookup(BLUES, bits) : bits;
    }

    /** Each background constant of the themes, as the ARGB value {@code Color(long)} takes. */
    public static long background(long bits) {
        if (isDarkBackdrop(bits)) return 0xFF000000L;
        return themed() ? lookup(BACKDROPS, bits) : bits;
    }

    /** The gap between posts, for "Remove gaps and dividers": it takes the card's color. */
    public static long flatGap(long gapValue, long cardColor) {
        return Settings.removeGapsAndDividers() ? cardColor : gapValue;
    }

    /** The dividers between list items, for "Remove gaps and dividers"; 0 is transparent. */
    public static long flatDivider(long value) {
        return Settings.removeGapsAndDividers() ? 0 : value;
    }

    /** The Mercado MVP canvas of server drawn screens, and the warm gray the server sends for it. */
    public static long mvpCanvas(long value) {
        if (Settings.removeGapsAndDividers()) {
            // LinkedIn's card colors: white, and the dark container.
            return surface(isLight(value) ? pack(WHITE) : pack(DARK_CONTAINER));
        }
        if (paintsBlack(value)) return PACKED_BLACK;
        if (!themed()) return value;
        return reskin(value, CANVAS_LIGHT, CANVAS_DARK);
    }

    /**
     * A system color for a light packed color, and the dark one for a dark packed color. Anything that
     * cannot be resolved stays as it is, so a missing palette never blanks a screen.
     */
    private static long reskin(long value, int light, int dark) {
        try {
            if (!modern() || !isSrgb(value)) return value;
            int bits = argbOf(value);
            if (alphaOf(bits) != 0xFF) return value;
            int level = (299 * ((bits >> 16) & 0xFF) + 587 * ((bits >> 8) & 0xFF) + 114 * (bits & 0xFF)) / 1000;
            return pack(palette().getColor(level >= 128 ? light : dark, null));
        } catch (Throwable problem) {
            Diagnostics.error("Material You surface failed", problem);
            return value;
        }
    }

    /** An ARGB value recolored through [colors]; anything unknown, translucent or broken stays as it is. */
    private static long lookup(Map<Integer, Integer> table, long bits) {
        try {
            if (table.isEmpty() || alphaOf(bits) != 0xFF) return bits;
            Integer replacement = table.get((int) (bits & 0xFFFFFF));
            if (replacement == null) return bits;
            return palette().getColor(replacement, null) & 0xFFFFFFFFL;
        } catch (Throwable problem) {
            Diagnostics.error("Material You color failed", problem);
            return bits;
        }
    }

    // endregion

    // region Server drawn screens

    /**
     * DeluxSduiTheme: the colors (token id to Compose Color) a server drawn screen sends to override the
     * theme. LinkedIn's blues, greens and backgrounds take the same system colors as the theme, and blues
     * outside the table the accent tone closest to their lightness.
     */
    public static Map<Object, Object> sduiColors(Map<Object, Object> given) {
        if (given == null || given.isEmpty()) return given;
        if ((!modern() || !themed()) && !Settings.amoledBlack()) return given;
        try {
            Map<Object, Object> out = new LinkedHashMap<>(given);
            Method boxer = null;
            int changed = 0;
            for (Map.Entry<Object, Object> token : given.entrySet()) {
                Object entry = token.getValue();
                if (entry == null) continue;
                long bitsValue = (long) Reflect.get(entry, "value");
                long recolored = sduiColor(bitsValue);
                if (recolored == bitsValue) continue;
                if (boxer == null) boxer = entry.getClass().getMethod("box-impl", long.class);
                out.put(token.getKey(), boxer.invoke(null, recolored));
                changed++;
            }
            Diagnostics.debug("SDUI color overrides: " + given.size() + ", recolored " + changed);
            return out;
        } catch (Throwable problem) {
            Diagnostics.error("Material You SDUI colors failed", problem);
            return given;
        }
    }

    /**
     * The resolver of server drawn colors, before each of its returns: theme tokens as well as the raw and
     * base palette colors the server sends, which bypass the theme.
     */
    public static Object sduiUIColor(Object color) {
        if (color == null || (!modern() && !Settings.amoledBlack())) return color;
        try {
            long bitsValue = (long) Reflect.get(color, "value");
            long recolored = sduiColor(bitsValue);
            if (recolored == bitsValue) return color;
            return color.getClass().getMethod("box-impl", long.class).invoke(null, recolored);
        } catch (Throwable problem) {
            Diagnostics.error("Material You SDUI color failed", problem);
            return color;
        }
    }

    /** One packed color of a server drawn screen, through the tables and rules the themes use. */
    private static long sduiColor(long value) {
        if (!isSrgb(value)) return value;
        long bits = value >>> 32;
        int rgbValue = (int) (bits & 0xFFFFFF);
        if (rgbValue == WARM_GRAY && alphaOf(bits) == 0xFF) return mvpCanvas(value);
        if (isDarkBackdrop(bits)) return PACKED_BLACK;
        if (!modern() || !themed()) return value;
        if (alphaOf(bits) != 0xFF) return translucentAccent(value);
        long recolored = bits;
        if (BLUES.containsKey(rgbValue)) recolored = lookup(BLUES, bits);
        else if (SELECTED.containsKey(rgbValue)) recolored = lookup(SELECTED, bits);
        else if (BACKDROPS.containsKey(rgbValue)) recolored = lookup(BACKDROPS, bits);
        else if (isBlue(rgbValue)) recolored = nearestAccent(rgbValue);
        return recolored == bits ? value : pack(recolored);
    }

    // endregion

    // region System bars and settings

    /**
     * Before ThemeManager sets the status or navigation bar: LinkedIn's white and dark container become the
     * card colors.
     */
    public static int bar(int color) {
        if (color == DARK_CONTAINER && Settings.amoledBlack()) return 0xFF000000;
        if (!modern() || !themed()) return color;
        if (color == WHITE) return palette().getColor(CARD_LIGHT, null);
        if (color == DARK_CONTAINER) return palette().getColor(CARD_DARK, null);
        return color;
    }

    /** Before each call that sets the navigation bar color: the AndroidX scrims become transparent. */
    public static int navigationBarColor(int color) {
        if (!modern() || !themed()) return color;
        if (color == 0xE6FFFFFF || color == 0x801B1B1B) return 0;
        return bar(color);
    }

    /** Before each call that turns the navigation bar contrast (a white scrim) on or off. */
    public static boolean navigationBarContrast(boolean enforced) {
        return !themed() && enforced;
    }

    /**
     * The settings screen's colors when Material You is on, in LinkedIn's roles: background, rows, dividers
     * and accent. Null when it is off, so the settings keep their own colors.
     */
    static int[] settingsColors(boolean dark) {
        if (!modern() || !themed()) return null;
        Resources res = palette();
        int surfaceRole = dark ? CARD_DARK : CARD_LIGHT;
        int rowRole = dark ? ROW_DARK : ROW_LIGHT;
        int borderRole = dark ? BORDER_DARK_ROLE : BORDER_LIGHT_ROLE;
        int accentRole = dark ? T200 : T600;
        return new int[]{
                res.getColor(surfaceRole, null),
                res.getColor(rowRole, null),
                res.getColor(borderRole, null),
                res.getColor(accentRole, null),
        };
    }

    /** The accent of the settings screen and its dialogs. */
    static int settingsAccent(boolean dark, int fallback) {
        int[] colors = settingsColors(dark);
        return colors != null ? colors[3] : fallback;
    }

    // endregion

    // region Palette

    /**
     * LinkedIn's resources, which carry the wallpaper colors. The system resources do not (they always hold
     * Android's default blue palette), so they are only the last resort.
     */
    private static Resources palette() {
        Context context = Settings.context();
        if (context != null) return context.getResources();
        if (!warnedWithoutContext) {
            warnedWithoutContext = true;
            Diagnostics.error("Material You colors read before LinkedIn's context exists", new IllegalStateException());
        }
        return Resources.getSystem();
    }

    private static boolean isLight(long value) {
        return luminance(argbOf(value)) >= 128;
    }

    /** Whether [rgbValue] is a saturated blue, hue 190° to 250°. */
    private static boolean isBlue(int rgbValue) {
        float[] hsv = new float[3];
        android.graphics.Color.colorToHSV(rgbValue, hsv);
        return hsv[0] >= 190 && hsv[0] <= 250 && hsv[1] >= 0.25f && hsv[2] >= 0.2f;
    }

    /** The accent tone whose lightness is nearest to [rgbValue]'s; the lightest wins a tie. */
    private static long nearestAccent(int rgbValue) {
        int best = rgbValue;
        float distance = Float.MAX_VALUE;
        float target = luminance(rgbValue);
        for (int tone : ACCENT_TONES) {
            int candidate = palette().getColor(tone, null);
            float nearness = Math.abs(luminance(candidate) - target);
            if (nearness < distance) {
                distance = nearness;
                best = candidate;
            }
        }
        return best & 0xFFFFFFFFL;
    }

    /** Perceived lightness of an ARGB color, 0 to 255. */
    private static float luminance(int rgbValue) {
        return 0.299f * ((rgbValue >> 16) & 0xFF) + 0.587f * ((rgbValue >> 8) & 0xFF) + 0.114f * (rgbValue & 0xFF);
    }

    // endregion
}
