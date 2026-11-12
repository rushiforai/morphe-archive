package app.badfella.extension.linkedin;

import java.util.HashMap;
import java.util.Map;

/**
 * Tones of a chosen accent color, in place of the system accent palette (system_accent1_*), for "Accent color".
 * Each tone keeps the color's hue and chroma (CIE LCh) at the lightness of the Material tone of that shade, with
 * the chroma lowered until the color fits in sRGB. Close to how Android builds its palette from the wallpaper.
 */
final class AccentPalette {
    /** Shades of the system accent palette (system_accent1_10 to _1000) to their Material tone (L*). */
    private static final int[][] SHADE_TONES = {
            {10, 99}, {50, 95}, {100, 90}, {200, 80}, {300, 70}, {400, 60},
            {500, 50}, {600, 40}, {700, 30}, {800, 20}, {900, 10}, {1000, 0},
    };

    /** Preset accents: name to 0xRRGGBB. */
    static final String[] PRESET_NAMES = {"Blue", "Teal", "Green", "Purple", "Pink", "Red", "Orange", "Amber"};
    static final int[] PRESET_COLORS = {0x1A73E8, 0x00897B, 0x2E7D32, 0x6750A4, 0xD81B60, 0xD32F2F, 0xF57C00, 0xFFA000};

    private static int cachedSeed = -1;
    private static final Map<Integer, Integer> cachedTones = new HashMap<>();

    private AccentPalette() {
    }

    /** The color (0xAARRGGBB) of the system accent shade [shade] (10 to 1000) for the accent [seed] (0xRRGGBB). */
    static synchronized int shade(int seed, int shade) {
        if (seed != cachedSeed) {
            cachedSeed = seed;
            cachedTones.clear();
        }
        Integer cached = cachedTones.get(shade);
        if (cached != null) return cached;
        int tone = 50;
        for (int[] pair : SHADE_TONES) {
            if (pair[0] == shade) tone = pair[1];
        }
        int color = tone(seed, tone);
        cachedTones.put(shade, color);
        return color;
    }

    /** [seed] at the lightness [tone] (L*, 0 to 100), keeping its hue and as much of its chroma as fits. */
    static int tone(int seed, double tone) {
        if (tone <= 0) return 0xFF000000;
        if (tone >= 100) return 0xFFFFFFFF;
        double[] lab = toLab(seed);
        // Like Material's palettes, the lightest tones are pastel: tinted backgrounds, not bright colors.
        double chroma = Math.min(Math.hypot(lab[1], lab[2]), tone >= 99 ? 3 : tone >= 95 ? 10 : tone >= 90 ? 22 : 200);
        double hue = Math.atan2(lab[2], lab[1]);
        for (int i = 0; i <= 40; i++) {
            double c = chroma * (1 - i / 40.0);
            int rgb = fromLab(tone, c * Math.cos(hue), c * Math.sin(hue));
            if (rgb != -1) return 0xFF000000 | rgb;
        }
        return 0xFF000000 | fromLabClamped(tone);
    }

    /** Parses "#RRGGBB" or "RRGGBB", or returns -1. */
    static int parse(String hex) {
        if (hex == null) return -1;
        String value = hex.trim();
        if (value.startsWith("#")) value = value.substring(1);
        if (!value.matches("[0-9a-fA-F]{6}")) return -1;
        return Integer.parseInt(value, 16);
    }

    static String format(int rgb) {
        return String.format("#%06X", rgb & 0xFFFFFF);
    }

    // CIE Lab with the D65 white point, from and to sRGB.

    private static final double XN = 0.95047, YN = 1.0, ZN = 1.08883;

    private static double[] toLab(int rgb) {
        double r = linear((rgb >> 16) & 0xFF), g = linear((rgb >> 8) & 0xFF), b = linear(rgb & 0xFF);
        double x = 0.4124564 * r + 0.3575761 * g + 0.1804375 * b;
        double y = 0.2126729 * r + 0.7151522 * g + 0.0721750 * b;
        double z = 0.0193339 * r + 0.1191920 * g + 0.9503041 * b;
        double fx = f(x / XN), fy = f(y / YN), fz = f(z / ZN);
        return new double[]{116 * fy - 16, 500 * (fx - fy), 200 * (fy - fz)};
    }

    /** The sRGB color (0xRRGGBB) of a Lab color, or -1 when it is outside sRGB. */
    private static int fromLab(double l, double a, double b) {
        double fy = (l + 16) / 116, fx = fy + a / 500, fz = fy - b / 200;
        double x = XN * fInverse(fx), y = YN * fInverse(fy), z = ZN * fInverse(fz);
        double r = 3.2404542 * x - 1.5371385 * y - 0.4985314 * z;
        double g = -0.9692660 * x + 1.8760108 * y + 0.0415560 * z;
        double bl = 0.0556434 * x - 0.2040259 * y + 1.0572252 * z;
        final double e = 0.0005;
        if (r < -e || r > 1 + e || g < -e || g > 1 + e || bl < -e || bl > 1 + e) return -1;
        return (channel(r) << 16) | (channel(g) << 8) | channel(bl);
    }

    /** A gray of lightness [l]. */
    private static int fromLabClamped(double l) {
        int gray = channel(YN * fInverse((l + 16) / 116));
        return (gray << 16) | (gray << 8) | gray;
    }

    private static double f(double t) {
        return t > 216.0 / 24389 ? Math.cbrt(t) : (24389.0 / 27 * t + 16) / 116;
    }

    private static double fInverse(double t) {
        double cube = t * t * t;
        return cube > 216.0 / 24389 ? cube : (116 * t - 16) / (24389.0 / 27);
    }

    private static double linear(int channel) {
        double c = channel / 255.0;
        return c <= 0.04045 ? c / 12.92 : Math.pow((c + 0.055) / 1.055, 2.4);
    }

    private static int channel(double linear) {
        double c = Math.max(0, Math.min(1, linear));
        double s = c <= 0.0031308 ? 12.92 * c : 1.055 * Math.pow(c, 1 / 2.4) - 0.055;
        return (int) Math.round(Math.max(0, Math.min(1, s)) * 255);
    }
}
