package app.noam.extension.chesscom.theme;

import android.content.SharedPreferences;
import android.graphics.Color;

import app.noam.extension.chesscom.Features;

/**
 * The newer screens build every green from one palette of twelve shades (green300 is the brand
 * green), so the accent gets the same ladder. The older screens' greens are swapped as they appear.
 */
public final class Accent {
    public static final int CHESS_GREEN = 0xFF81B64C;
    /** The older screens' accent (@color/green). */
    private static final int LEGACY_GREEN = 0xFF85A94B;

    /** Name, colour. */
    public static final String[][] PRESETS = {
        {"Chess.com green", "#81B64C"},
        {"Ocean", "#3D9BE9"},
        {"Royal purple", "#9B6BDF"},
        {"Sunset", "#F2994A"},
        {"Ruby", "#E25858"},
        {"Rose", "#E86BA8"},
        {"Teal", "#2BB6A3"},
        {"Gold", "#E5B53B"},
        {"Ice", "#8FD3F4"},
        {"Slate", "#8E9AAF"},
    };

    /** How far each palette shade sits from the brand green: + toward white, - toward black. */
    private static final float[] SHADES = {0.88f, 0.82f, 0.74f, 0.55f, 0.32f, 0f, -0.22f, -0.42f, -0.6f, -0.72f, -0.76f, -0.8f};
    /** The palette's own greens, lightest to darkest, for the older screens. */
    private static final int[] GREENS = {
        0xFFF6FFE3, 0xFFF3FFCF, 0xFFEBFFBD, 0xFFD8FA9D, 0xFFB2E068, 0xFF81B64C,
        0xFF5D9948, 0xFF45753C, 0xFF305730, 0xFF204227, 0xFF1C3724, 0xFF162921,
    };

    private static final String COLOR = "accent_color";

    private Accent() {}

    public static boolean enabled() {
        return Features.accentPatched() && Features.isEnabled(Features.ACCENT) && color() != CHESS_GREEN;
    }

    public static int color() {
        SharedPreferences preferences = Features.preferences();
        return preferences == null ? CHESS_GREEN : preferences.getInt(COLOR, CHESS_GREEN);
    }

    public static void setColor(int color) {
        SharedPreferences preferences = Features.preferences();
        if (preferences != null) preferences.edit().putInt(COLOR, color | 0xFF000000).apply();
    }

    /** The accent, or chess.com's green when it is off (for our own screens). */
    public static int current() {
        return enabled() ? color() : CHESS_GREEN;
    }

    /** A shade of the green palette (0 = green25, 5 = green300, 11 = green900), as a Compose colour. */
    public static long palette(long original, int shade) {
        if (!enabled() || shade < 0 || shade >= SHADES.length) return original;
        return ((long) shade(shade) & 0xFFFFFFFFL) << 32;
    }

    static int shade(int shade) {
        return shade(color(), shade);
    }

    /** The twelve shades for an accent colour, lightest to darkest (for previews). */
    public static int[] ladder(int accent) {
        int[] ladder = new int[SHADES.length];
        for (int i = 0; i < ladder.length; i++) ladder[i] = shade(accent, i);
        return ladder;
    }

    private static int shade(int accent, int shade) {
        float amount = SHADES[shade];
        int target = amount >= 0 ? Color.WHITE : Color.BLACK;
        float mix = Math.abs(amount);
        int r = Math.round(Color.red(accent) + (Color.red(target) - Color.red(accent)) * mix);
        int g = Math.round(Color.green(accent) + (Color.green(target) - Color.green(accent)) * mix);
        int b = Math.round(Color.blue(accent) + (Color.blue(target) - Color.blue(accent)) * mix);
        return Color.rgb(r, g, b);
    }

    /** An older screen's colour: its green becomes the accent shade; alpha is kept. */
    static int legacy(int color) {
        if (!enabled()) return color;
        int opaque = color | 0xFF000000;
        int shade = -1;
        if (opaque == LEGACY_GREEN) shade = 5;
        for (int i = 0; i < GREENS.length && shade < 0; i++) if (opaque == GREENS[i]) shade = i;
        if (shade < 0) return color;
        return (color & 0xFF000000) | (shade(shade) & 0x00FFFFFF);
    }
}
