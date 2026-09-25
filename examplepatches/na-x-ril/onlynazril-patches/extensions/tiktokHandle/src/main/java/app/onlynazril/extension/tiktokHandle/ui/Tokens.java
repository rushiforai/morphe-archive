package app.onlynazril.extension.tiktokHandle.ui;

import android.content.Context;
import android.util.TypedValue;

/**
 * One source of truth for the screen's look. Monochrome AMOLED: a pure black canvas, structure
 * only from hairlines and spacing, a single light accent, no cards or gradients.
 *
 * Nothing here is borrowed from the app's theme, so the screen never inherits a colour, a shape
 * or a type scale from TikTok.
 */
public final class Tokens {
    public static final int BACKGROUND = 0xFF000000;
    public static final int SURFACE = 0xFF0B0B0B;
    public static final int SURFACE_PRESSED = 0xFF191919;
    public static final int HAIRLINE = 0xFF1C1C1C;

    /** The prompt's own panel, one step lighter than the rows it sits above. */
    public static final int PANEL = 0xFF101010;

    public static final int TEXT_PRIMARY = 0xFFF5F5F5;
    public static final int TEXT_SECONDARY = 0xFF9A9A9A;
    public static final int TEXT_DISABLED = 0xFF5A5A5A;

    public static final int ACCENT = 0xFFFFFFFF;
    public static final int TRACK_ON = 0xFFFFFFFF;
    public static final int TRACK_OFF = 0xFF2A2A2A;
    public static final int THUMB_ON = 0xFF000000;
    public static final int THUMB_OFF = 0xFF8A8A8A;

    /** A control that is still shown but cannot be changed (master switch off). */
    public static final int TRACK_DISABLED = 0xFF161616;
    public static final int THUMB_DISABLED = 0xFF3F3F3F;

    /** 4dp scale: 1..8 avoid invented sizes that never line up with each other. */
    public static final int SPACE_1 = 4;
    public static final int SPACE_2 = 8;
    public static final int SPACE_3 = 12;
    public static final int SPACE_4 = 16;
    public static final int SPACE_6 = 24;
    public static final int SPACE_8 = 32;
    public static final int SPACE_12 = 48;

    public static final float TITLE_SP = 28f;
    public static final float SUBTITLE_SP = 14f;
    public static final float SECTION_SP = 13f;
    public static final float ROW_TITLE_SP = 18f;
    public static final float ROW_SUMMARY_SP = 13f;
    /** A control's own label: one step up from a row summary, one below a row title. */
    public static final float ACTION_SP = 15f;
    /** The prompt's title: one step above a row title, below the screen's own title. */
    public static final float PANEL_TITLE_SP = 20f;

    private Tokens() {}

    public static int dp(Context context, float value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }

    public static float dpFloat(Context context, float value) {
        return TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP,
                value,
                context.getResources().getDisplayMetrics());
    }
}
