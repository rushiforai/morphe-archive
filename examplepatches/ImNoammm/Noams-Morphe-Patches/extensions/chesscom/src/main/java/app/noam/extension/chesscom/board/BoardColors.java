package app.noam.extension.chesscom.board;

import android.content.SharedPreferences;
import android.graphics.Color;

import app.noam.extension.chesscom.Features;
import app.noam.extension.chesscom.Utils;

/**
 * Your square colours on every board. The presets are plain versions of chess.com's board themes,
 * and coordinates take the other squares' colour, as chess.com draws them.
 */
public final class BoardColors {
    /** Name, dark squares, light squares. */
    public static final String[][] PRESETS = {
        {"Green", "#779952", "#EDEED1"},
        {"Brown", "#B58863", "#F0D9B5"},
        {"Blue", "#4D6D92", "#ECECD7"},
        {"Purple", "#8877B7", "#EFEFEF"},
        {"Red", "#BA5546", "#F0D8BF"},
        {"Orange", "#D08B18", "#FCE4B2"},
        {"Icy Sea", "#7A9DB2", "#C5D5DC"},
        {"Sky", "#C2D7E2", "#EFEFEF"},
        {"Grey", "#AAAAAA", "#DCDCDC"},
        {"Pink", "#F9CDD3", "#FFF3F3"},
        {"Sand", "#B8A590", "#E5D3C4"},
        {"Walnut", "#835F42", "#C0A684"},
        {"Dark Wood", "#8D675E", "#E7CDB2"},
        {"Burled Wood", "#895132", "#D9B088"},
        {"Marble", "#706B66", "#C7BDAA"},
        {"Stone", "#666463", "#C8C3BD"},
        {"Metal", "#6E6E6E", "#C9C9C9"},
        {"Tournament", "#316549", "#EBECE8"},
        {"8-Bit", "#6A9B41", "#F3F3F4"},
        {"Glass", "#282F3F", "#667188"},
    };

    private static final String DARK = "board_dark";
    private static final String LIGHT = "board_light";

    private static Object background;
    private static int backgroundDark, backgroundLight;

    private BoardColors() {}

    public static boolean enabled() {
        return Features.boardColorsPatched() && Features.isEnabled(Features.BOARD_COLORS);
    }

    public static int dark() {
        SharedPreferences preferences = Features.preferences();
        return preferences == null ? Color.parseColor(PRESETS[0][1]) : preferences.getInt(DARK, Color.parseColor(PRESETS[0][1]));
    }

    public static int light() {
        SharedPreferences preferences = Features.preferences();
        return preferences == null ? Color.parseColor(PRESETS[0][2]) : preferences.getInt(LIGHT, Color.parseColor(PRESETS[0][2]));
    }

    public static void set(int dark, int light) {
        SharedPreferences preferences = Features.preferences();
        if (preferences != null) preferences.edit().putInt(DARK, dark | 0xFF000000).putInt(LIGHT, light | 0xFF000000).apply();
    }

    /** Name of the app's plain-colour board background class, filled in by the patch. */
    private static String squaresClass() {
        return "";
    }

    /** The theme's board background: the chosen colours instead. */
    public static Object background(Object original) {
        if (!enabled()) return original;
        int dark = dark(), light = light();
        if (background == null || dark != backgroundDark || light != backgroundLight) {
            try {
                background = Class.forName(squaresClass()).getConstructor(int.class, int.class).newInstance(dark, light);
                backgroundDark = dark;
                backgroundLight = light;
            } catch (Throwable throwable) {
                Utils.logError("Board colours failed", throwable);
                return original;
            }
        }
        return background;
    }

    /** Coordinates written on dark squares take the light colour... */
    public static int darkSquareCoordinates(int original) {
        return enabled() ? light() : original;
    }

    /** ...and those on light squares the dark one. */
    public static int lightSquareCoordinates(int original) {
        return enabled() ? dark() : original;
    }
}
