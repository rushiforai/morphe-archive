package app.linkedin.extension;

import android.content.Context;
import android.content.res.Resources;
import android.os.Build;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Material You for LinkedIn's Compose themes (Delux and Mercado), which define their colors in code instead of
 * resources. The patches pass the color constants of those themes through {@link #accent(long)} and
 * {@link #background(long)}, and a few tokens through the other hooks here. Each hook checks its setting, which
 * the themes read once, so a change applies after LinkedIn restarts.
 */
@SuppressWarnings("unused")
public final class MaterialYou {
    // Material 3 surface roles (Android 14), with the neutral tones closest to them on Android 12 and 13.
    private static final boolean ROLES = Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE;
    private static final int LIGHT_SURFACE =
            ROLES ? android.R.color.system_surface_light : android.R.color.system_neutral2_50;
    private static final int LIGHT_CANVAS =
            ROLES ? android.R.color.system_surface_container_low_light : android.R.color.system_neutral2_100;
    private static final int LIGHT_SURFACE_HIGH =
            ROLES ? android.R.color.system_surface_container_high_light : android.R.color.system_neutral2_100;
    private static final int LIGHT_SURFACE_HIGHEST =
            ROLES ? android.R.color.system_surface_container_highest_light : android.R.color.system_neutral2_100;
    private static final int LIGHT_BORDER =
            ROLES ? android.R.color.system_surface_container_highest_light : android.R.color.system_neutral2_200;
    private static final int DARK_SURFACE =
            ROLES ? android.R.color.system_surface_container_dark : android.R.color.system_neutral1_900;
    private static final int DARK_SURFACE_HIGH =
            ROLES ? android.R.color.system_surface_container_high_dark : android.R.color.system_neutral2_800;
    private static final int DARK_CANVAS =
            ROLES ? android.R.color.system_surface_dark : android.R.color.system_neutral1_1000;
    private static final int DARK_BORDER =
            ROLES ? android.R.color.system_surface_container_highest_dark : android.R.color.system_neutral2_700;

    /** LinkedIn blue (0xRRGGBB) to the system palette color that replaces it. */
    private static final Map<Integer, Integer> ACCENTS = new HashMap<>();
    /** LinkedIn background color (0xRRGGBB) to the system palette color that replaces it. */
    private static final Map<Integer, Integer> BACKGROUNDS = new HashMap<>();
    /** LinkedIn green of selected states (0xRRGGBB) to the system palette color that replaces it. */
    private static final Map<Integer, Integer> CHECKED = new HashMap<>();

    static {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            // Blue palette: links, buttons, selected states.
            ACCENTS.put(0xF6FBFF, android.R.color.system_accent1_10);
            ACCENTS.put(0xE8F3FF, android.R.color.system_accent1_50);
            ACCENTS.put(0xD0E8FF, android.R.color.system_accent1_100);
            ACCENTS.put(0xD2E9FF, android.R.color.system_accent1_100);
            ACCENTS.put(0xA8D4FF, android.R.color.system_accent1_200);
            ACCENTS.put(0xAAD6FF, android.R.color.system_accent1_200);
            ACCENTS.put(0x70B5F9, android.R.color.system_accent1_200);
            ACCENTS.put(0x71B7FB, android.R.color.system_accent1_200);
            ACCENTS.put(0x378FE9, android.R.color.system_accent1_400);
            ACCENTS.put(0x0A66C2, android.R.color.system_accent1_600);
            ACCENTS.put(0x004182, android.R.color.system_accent1_700);
            ACCENTS.put(0x09223B, android.R.color.system_accent1_800);
            ACCENTS.put(0x0A2037, android.R.color.system_accent1_900);
            // ArtDeco's older blues: links in messages, for one.
            ACCENTS.put(0x0073B1, android.R.color.system_accent1_600);
            ACCENTS.put(0x0084BF, android.R.color.system_accent1_500);
            ACCENTS.put(0x006097, android.R.color.system_accent1_700);
            // Selected states, green in LinkedIn's palette: light theme (checked, hover) and dark theme.
            CHECKED.put(0x01754F, android.R.color.system_accent1_600);
            CHECKED.put(0x004C33, android.R.color.system_accent1_700);
            CHECKED.put(0x37C898, android.R.color.system_accent1_200);
            CHECKED.put(0x74E5C0, android.R.color.system_accent1_100);
            // Teal accent of charts (analytics): light theme (accent, hover) and dark theme.
            CHECKED.put(0x1A707E, android.R.color.system_accent1_600);
            CHECKED.put(0x114951, android.R.color.system_accent1_700);
            CHECKED.put(0x5EC0CF, android.R.color.system_accent1_200);
            CHECKED.put(0x94DDE8, android.R.color.system_accent1_100);
            // Backgrounds: cards in dark mode, and the light canvas.
            BACKGROUNDS.put(0x1B1F23, DARK_SURFACE);
            BACKGROUNDS.put(0x1D2226, DARK_SURFACE);
            BACKGROUNDS.put(0x293037, DARK_SURFACE_HIGH);
            BACKGROUNDS.put(0x293138, DARK_SURFACE_HIGH);
            BACKGROUNDS.put(0xF4F2EE, LIGHT_CANVAS);
            BACKGROUNDS.put(0xF3F2EF, LIGHT_CANVAS);
            // Light table background (the games leaderboard), a step darker than the card like the dark one.
            BACKGROUNDS.put(0xF8FAFD, LIGHT_CANVAS);
            // Pale blue cards (cool gray 20).
            BACKGROUNDS.put(0xEDF3F8, LIGHT_SURFACE_HIGH);
            BACKGROUNDS.put(0xEEF3F8, LIGHT_SURFACE_HIGH);
            // Stronger pale blue cards (cool gray 30): hiring cards on profiles, for one.
            BACKGROUNDS.put(0xDDE7F1, LIGHT_SURFACE_HIGHEST);
        }
    }

    /** Packed Compose black, for "AMOLED black". */
    private static final long BLACK = 0xFF000000L << 32;
    /** LinkedIn's dark backgrounds (0xRRGGBB): cards, containers and tinted rows. */
    private static final int[] DARK_BACKGROUNDS = {0x1B1F23, 0x1D2226, 0x293037, 0x293138};

    private MaterialYou() {
    }

    /** Whether "AMOLED black" turns this packed Compose Color, a dark background, black. */
    private static boolean isAmoledDark(long packed) {
        // sRGB Compose colors keep the ARGB value in the upper 32 bits and color space 0 in the lower ones.
        if ((packed & 0x3F) != 0 || !Settings.amoledBlack()) return false;
        int argb = (int) (packed >>> 32);
        return (argb >>> 24) == 0xFF && luminance(argb) < 128;
    }

    /** Whether "AMOLED black" turns this ARGB color, one of LinkedIn's dark backgrounds, black. */
    private static boolean isAmoledBackground(long argb) {
        if ((argb >>> 24) != 0xFF || !Settings.amoledBlack()) return false;
        int rgb = (int) (argb & 0xFFFFFF);
        for (int dark : DARK_BACKGROUNDS) {
            if (rgb == dark) return true;
        }
        return false;
    }

    /**
     * Injected at the end of the Compose themes' static initializer for the card token. Takes and returns a
     * packed Compose Color: a light card becomes the light neutral, a dark one the dark neutral.
     */
    public static long surface(long packed) {
        if (isAmoledDark(packed)) return BLACK;
        if (!Settings.materialYou()) return packed;
        return tone(packed, LIGHT_SURFACE, DARK_SURFACE);
    }

    /**
     * Injected at the end of the Compose themes' static initializer for the gap between posts, before the card
     * is mapped. A gap equal to the card (made so by "Remove gaps and dividers") gets the card's color, otherwise
     * it is a step darker than the card.
     */
    public static long canvas(long packed, long card) {
        if (packed == card) return surface(card);
        if (isAmoledDark(packed)) return BLACK;
        if (!Settings.materialYou()) return packed;
        return tone(packed, LIGHT_CANVAS, DARK_CANVAS);
    }

    /** Injected for the faint border (outlines around cards) of the light Compose themes. */
    public static long borderLight(long packed) {
        return border(packed, LIGHT_BORDER);
    }

    /** Injected for the faint border (outlines around cards) of the dark Compose themes. */
    public static long borderDark(long packed) {
        return border(packed, DARK_BORDER);
    }

    /** The system color [color] as a packed Compose Color, in place of the translucent gray border. */
    private static long border(long packed, int color) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S || !Settings.materialYou()) return packed;
        return (resources().getColor(color, null) & 0xFFFFFFFFL) << 32;
    }

    /**
     * Injected before ThemeManager sets the status bar or navigation bar color: LinkedIn's white and dark
     * container become the card colors.
     */
    public static int bar(int color) {
        if (color == 0xFF1D2226 && Settings.amoledBlack()) return 0xFF000000;
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S || !Settings.materialYou()) return color;
        if (color == 0xFFFFFFFF) return resources().getColor(LIGHT_SURFACE, null);
        if (color == 0xFF1D2226) return resources().getColor(DARK_SURFACE, null);
        return color;
    }

    /**
     * Injected at the end of the Compose themes' static initializer for the gap between posts, by "Remove gaps
     * and dividers": the gap gets the card's color.
     */
    public static long flatGap(long gap, long card) {
        return Settings.removeGapsAndDividers() ? card : gap;
    }

    /** Injected after the color of the dividers between list items, by "Remove gaps and dividers". */
    public static long flatDivider(long packed) {
        // 0 is Color.Transparent.
        return Settings.removeGapsAndDividers() ? 0 : packed;
    }

    /**
     * Injected at the end of the Compose themes' static initializer for every color token: a translucent LinkedIn
     * blue (search fields, pressed states) gets the accent color with the same alpha.
     */
    public static long translucentAccent(long packed) {
        // sRGB Compose colors keep the ARGB value in the upper 32 bits and color space 0 in the lower ones.
        if ((packed & 0x3F) != 0 || !Settings.materialYou()) return packed;
        long argb = packed >>> 32;
        long alpha = argb >>> 24;
        int rgb = (int) (argb & 0xFFFFFF);
        if (alpha == 0 || alpha == 0xFF || !ACCENTS.containsKey(rgb)) return packed;
        long accent = map(ACCENTS, 0xFF000000L | rgb) & 0xFFFFFF;
        return ((alpha << 24) | accent) << 32;
    }

    /** Injected at the end of the Compose themes' static initializer for the selected state tokens. */
    public static long checked(long packed) {
        // sRGB Compose colors keep the ARGB value in the upper 32 bits and color space 0 in the lower ones.
        if ((packed & 0x3F) != 0 || !Settings.materialYou()) return packed;
        return (map(CHECKED, packed >>> 32) & 0xFFFFFFFFL) << 32;
    }

    /** The system color [light] for a light packed Compose Color, [dark] for a dark one. */
    private static long tone(long packed, int light, int dark) {
        try {
            if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S || (packed & 0x3F) != 0) return packed;
            int argb = (int) (packed >>> 32);
            if ((argb >>> 24) != 0xFF) return packed;
            int luminance = (299 * ((argb >> 16) & 0xFF) + 587 * ((argb >> 8) & 0xFF) + 114 * (argb & 0xFF)) / 1000;
            return (resources().getColor(luminance >= 128 ? light : dark, null) & 0xFFFFFFFFL) << 32;
        } catch (Throwable t) {
            Diagnostics.error("Material You surface failed", t);
            return packed;
        }
    }

    /** Injected after each blue constant of the Compose themes: an ARGB value as used by Color(long). */
    public static long accent(long argb) {
        return Settings.materialYou() ? map(ACCENTS, argb) : argb;
    }

    /** Injected after each background constant of the Compose themes: an ARGB value as used by Color(long). */
    public static long background(long argb) {
        if (isAmoledBackground(argb)) return 0xFF000000L;
        return Settings.materialYou() ? map(BACKGROUNDS, argb) : argb;
    }

    private static long map(Map<Integer, Integer> colors, long argb) {
        try {
            if (colors.isEmpty() || (argb >>> 24) != 0xFF) return argb;
            Integer systemColor = colors.get((int) (argb & 0xFFFFFF));
            if (systemColor == null) return argb;
            return resources().getColor(systemColor, null) & 0xFFFFFFFFL;
        } catch (Throwable t) {
            Diagnostics.error("Material You color failed", t);
            return argb;
        }
    }

    /** System accent tones, light to dark, that blue colors of server drawn screens are matched to. */
    private static final int[] ACCENT_TONES = Build.VERSION.SDK_INT < Build.VERSION_CODES.S ? new int[0] : new int[]{
            android.R.color.system_accent1_10, android.R.color.system_accent1_50, android.R.color.system_accent1_100,
            android.R.color.system_accent1_200, android.R.color.system_accent1_300, android.R.color.system_accent1_400,
            android.R.color.system_accent1_500, android.R.color.system_accent1_600, android.R.color.system_accent1_700,
            android.R.color.system_accent1_800, android.R.color.system_accent1_900,
    };

    /**
     * Injected at the start of DeluxSduiTheme: the colors (token id to Compose Color) a server drawn screen sends
     * to override the theme. LinkedIn's blues, greens and backgrounds get the same system colors as the theme, and
     * other blues the accent tone of the nearest lightness.
     */
    public static Map<Object, Object> sduiColors(Map<Object, Object> overrides) {
        if (overrides == null || overrides.isEmpty()) return overrides;
        if ((Build.VERSION.SDK_INT < Build.VERSION_CODES.S || !Settings.materialYou()) && !Settings.amoledBlack()) {
            return overrides;
        }
        try {
            Map<Object, Object> result = new LinkedHashMap<>(overrides);
            Method box = null;
            int recolored = 0;
            for (Map.Entry<Object, Object> entry : overrides.entrySet()) {
                Object color = entry.getValue();
                if (color == null) continue;
                long packed = (long) Reflect.get(color, "value");
                long mapped = sduiColor(packed);
                if (mapped == packed) continue;
                if (box == null) box = color.getClass().getMethod("box-impl", long.class);
                result.put(entry.getKey(), box.invoke(null, mapped));
                recolored++;
            }
            Diagnostics.debug("SDUI color overrides: " + overrides.size() + ", recolored " + recolored);
            return result;
        } catch (Throwable t) {
            Diagnostics.error("Material You SDUI colors failed", t);
            return overrides;
        }
    }

    /**
     * Injected before each return of the resolver of server drawn colors: theme tokens, and the raw and base
     * palette colors the server sends, which skip the theme.
     */
    public static Object sduiUIColor(Object color) {
        if (color == null || (Build.VERSION.SDK_INT < Build.VERSION_CODES.S && !Settings.amoledBlack())) return color;
        try {
            long packed = (long) Reflect.get(color, "value");
            long mapped = sduiColor(packed);
            if (mapped == packed) return color;
            return color.getClass().getMethod("box-impl", long.class).invoke(null, mapped);
        } catch (Throwable t) {
            Diagnostics.error("Material You SDUI color failed", t);
            return color;
        }
    }

    private static long sduiColor(long packed) {
        // sRGB Compose colors keep the ARGB value in the upper 32 bits and color space 0 in the lower ones.
        if ((packed & 0x3F) != 0) return packed;
        long argb = packed >>> 32;
        int rgb = (int) (argb & 0xFFFFFF);
        if (rgb == WARM_GRAY_30 && (argb >>> 24) == 0xFF) return mvpCanvas(packed);
        if (isAmoledBackground(argb)) return BLACK;
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S || !Settings.materialYou()) return packed;
        if ((argb >>> 24) != 0xFF) return translucentAccent(packed);
        long mapped = argb;
        if (ACCENTS.containsKey(rgb)) mapped = map(ACCENTS, argb);
        else if (CHECKED.containsKey(rgb)) mapped = map(CHECKED, argb);
        else if (BACKGROUNDS.containsKey(rgb)) mapped = map(BACKGROUNDS, argb);
        else if ((argb >>> 24) == 0xFF && isBlue(rgb)) mapped = nearestAccent(rgb);
        return mapped == argb ? packed : (mapped & 0xFFFFFFFFL) << 32;
    }

    /** LinkedIn's light canvas behind server drawn screens, which shows through the gaps between items. */
    private static final int WARM_GRAY_30 = 0xE9E5DF;

    /**
     * Injected for the Mercado MVP canvas (the background of server drawn screens) and for the warm gray the
     * server sends for it: the card color with "Remove gaps and dividers", otherwise the Material You canvas.
     */
    public static long mvpCanvas(long packed) {
        if (Settings.removeGapsAndDividers()) {
            // LinkedIn's card colors: white, and the dark container.
            long card = isLight(packed) ? 0xFFFFFFFFL << 32 : 0xFF1D2226L << 32;
            return surface(card);
        }
        if (isAmoledDark(packed)) return BLACK;
        if (!Settings.materialYou()) return packed;
        return tone(packed, LIGHT_CANVAS, DARK_CANVAS);
    }

    private static boolean isLight(long packed) {
        return luminance((int) (packed >>> 32)) >= 128;
    }

    /**
     * Injected before each call that sets the navigation bar color: AndroidX's light and dark scrims become
     * transparent, LinkedIn's white and dark container the card colors.
     */
    public static int navigationBarColor(int color) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S || !Settings.materialYou()) return color;
        if (color == 0xE6FFFFFF || color == 0x801B1B1B) return 0;
        return bar(color);
    }

    /** Injected before each call that turns the navigation bar contrast (a white scrim) on or off. */
    public static boolean navigationBarContrast(boolean enforced) {
        return Settings.materialYou() ? false : enforced;
    }

    /** Whether [rgb] is a saturated blue (hue 190° to 250°). */
    private static boolean isBlue(int rgb) {
        float[] hsv = new float[3];
        android.graphics.Color.colorToHSV(rgb, hsv);
        return hsv[0] >= 190 && hsv[0] <= 250 && hsv[1] >= 0.25f && hsv[2] >= 0.2f;
    }

    /** The accent tone whose lightness is nearest to [rgb]'s. */
    private static long nearestAccent(int rgb) {
        int best = rgb;
        float distance = Float.MAX_VALUE;
        for (int tone : ACCENT_TONES) {
            int color = resources().getColor(tone, null);
            float d = Math.abs(luminance(color) - luminance(rgb));
            if (d < distance) {
                distance = d;
                best = color;
            }
        }
        return best & 0xFFFFFFFFL;
    }

    private static float luminance(int rgb) {
        return 0.299f * ((rgb >> 16) & 0xFF) + 0.587f * ((rgb >> 8) & 0xFF) + 0.114f * (rgb & 0xFF);
    }

    /**
     * The Michii Patches settings colors when Material You is on, the same roles as LinkedIn's: background, rows,
     * dividers and accent. Null when it is off, so the settings keep their own colors.
     */
    static int[] settingsColors(boolean dark) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S || !Settings.materialYou()) return null;
        Resources r = resources();
        return new int[]{
                r.getColor(dark ? DARK_SURFACE : LIGHT_SURFACE, null),
                r.getColor(dark ? DARK_SURFACE_HIGH : LIGHT_SURFACE_HIGH, null),
                r.getColor(dark ? DARK_BORDER : LIGHT_BORDER, null),
                r.getColor(dark ? android.R.color.system_accent1_200 : android.R.color.system_accent1_600, null),
        };
    }

    /** The accent of the Michii Patches settings and dialogs. */
    static int settingsAccent(boolean dark, int fallback) {
        int[] colors = settingsColors(dark);
        return colors != null ? colors[3] : fallback;
    }

    /**
     * The app's resources, which have the wallpaper colors. The system resources don't (they have Android's default
     * blue palette), so they're only the last resort.
     */
    private static Resources resources() {
        Context context = Settings.context();
        if (context != null) return context.getResources();
        if (!warnedNoContext) {
            warnedNoContext = true;
            Diagnostics.error("Material You colors read before LinkedIn's context exists", new IllegalStateException());
        }
        return Resources.getSystem();
    }

    private static boolean warnedNoContext;
}
