package app.amazonamoled.extension;

import android.graphics.Color;

/** Color maths for the native screens. All colors are ARGB ints. */
final class Colors {
    private Colors() {
    }

    /** Relative luminance (sRGB, gamma decoded), 0 = black, 1 = white. */
    static double luminance(int color) {
        return 0.2126 * channel(Color.red(color))
                + 0.7152 * channel(Color.green(color))
                + 0.0722 * channel(Color.blue(color));
    }

    private static double channel(int c) {
        double v = c / 255.0;
        return v <= 0.04045 ? v / 12.92 : Math.pow((v + 0.055) / 1.055, 2.4);
    }

    static boolean isDark(int color) {
        return luminance(color) < 0.18;
    }

    /**
     * Maps a background color to its AMOLED version, or returns it unchanged.
     * <ul>
     *   <li>Light surfaces (white, light grays, pastel tints) become black or near black,
     *       keeping their hue: #FFFFFF to #000000, #EAEDED to #121212, light blue to dark blue.</li>
     *   <li>Neutral dark grays (an app's own dark palette, #121212, #1E1E1E...) become black.</li>
     *   <li>Saturated mid colors (Amazon yellow/orange buttons, badges) are kept.</li>
     * </ul>
     */
    static int darkSurface(int color) {
        int alpha = Color.alpha(color);
        if (alpha < 24) return color;
        float[] hsl = toHsl(color);
        float s = hsl[1];
        float l = hsl[2];
        if (l >= 0.62f) {
            float newL = (1f - l) * 0.9f;
            return withAlpha(fromHsl(hsl[0], s, newL), alpha);
        }
        if (s < 0.15f && l > 0.02f && l < 0.17f) {
            return withAlpha(Color.BLACK, alpha);
        }
        return color;
    }

    /** Maps a text or icon color so it reads on black, or returns it unchanged. */
    static int lightForeground(int color) {
        int alpha = Color.alpha(color);
        if (alpha < 24 || luminance(color) >= 0.18) return color;
        float[] hsl = toHsl(color);
        float newL = Math.max(1f - hsl[2], 0.62f);
        return withAlpha(fromHsl(hsl[0], hsl[1], newL), alpha);
    }

    private static int withAlpha(int color, int alpha) {
        return (color & 0x00FFFFFF) | (alpha << 24);
    }

    static float[] toHsl(int color) {
        float r = Color.red(color) / 255f;
        float g = Color.green(color) / 255f;
        float b = Color.blue(color) / 255f;
        float max = Math.max(r, Math.max(g, b));
        float min = Math.min(r, Math.min(g, b));
        float l = (max + min) / 2f;
        float h = 0f;
        float s = 0f;
        float delta = max - min;
        if (delta > 1e-6f) {
            s = delta / (1f - Math.abs(2f * l - 1f));
            if (max == r) {
                h = ((g - b) / delta) % 6f;
            } else if (max == g) {
                h = (b - r) / delta + 2f;
            } else {
                h = (r - g) / delta + 4f;
            }
            h *= 60f;
            if (h < 0) h += 360f;
        }
        return new float[]{h, Math.min(1f, s), l};
    }

    static int fromHsl(float h, float s, float l) {
        float c = (1f - Math.abs(2f * l - 1f)) * s;
        float x = c * (1f - Math.abs((h / 60f) % 2f - 1f));
        float m = l - c / 2f;
        float r;
        float g;
        float b;
        if (h < 60) {
            r = c; g = x; b = 0;
        } else if (h < 120) {
            r = x; g = c; b = 0;
        } else if (h < 180) {
            r = 0; g = c; b = x;
        } else if (h < 240) {
            r = 0; g = x; b = c;
        } else if (h < 300) {
            r = x; g = 0; b = c;
        } else {
            r = c; g = 0; b = x;
        }
        return Color.rgb(clamp(r + m), clamp(g + m), clamp(b + m));
    }

    private static int clamp(float v) {
        return Math.max(0, Math.min(255, Math.round(v * 255f)));
    }
}
