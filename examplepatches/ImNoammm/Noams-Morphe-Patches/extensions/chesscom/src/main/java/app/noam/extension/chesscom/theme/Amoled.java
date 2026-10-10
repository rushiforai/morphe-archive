package app.noam.extension.chesscom.theme;

import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;

import app.noam.extension.chesscom.Features;

/**
 * The newer screens go black through the dark scheme's background colours and the theme
 * background; the older ones get a black window and lose their dark greys as they appear.
 */
public final class Amoled {
    /** Roles of the scheme's background colours (see the patch). */
    public static final int BASE = 0, RAISED = 1, TERTIARY = 2, QUATERNARY = 3, PANEL = 4, BOARD_OVERLAY = 5;

    /** chess.com's dark greys: gray800, windowBackground, dark_grey_4, gray900. */
    private static final int[] DARK_GREYS = {0xFF312E2B, 0xFF302D2B, 0xFF272522, 0xFF262421};

    private Amoled() {}

    public static boolean enabled() {
        return Features.amoledPatched() && Features.isEnabled(Features.AMOLED);
    }

    /** A background colour of the dark scheme, as a Compose colour (ARGB in the upper half). */
    public static long color(long original, int role) {
        if (!enabled()) return original;
        switch (role) {
            case BASE: return compose(0xFF000000);
            // Cards and raised surfaces: a faint white over black instead of a dark overlay.
            case RAISED: return compose(0x10FFFFFF);
            case TERTIARY: return compose(0x0AFFFFFF);
            case QUATERNARY: return compose(0x0DFFFFFF);
            case PANEL: return compose(0xBF000000);
            case BOARD_OVERLAY: return compose(0xA6000000);
            default: return original;
        }
    }

    private static long compose(int argb) {
        return ((long) argb & 0xFFFFFFFFL) << 32;
    }

    /** The theme background (a picture or colour behind the app's screens): black instead. */
    public static Drawable background(Drawable background) {
        return enabled() ? new ColorDrawable(Color.BLACK) : background;
    }

    /** An older screen's colour: chess.com's dark greys become black. */
    static int legacy(int color) {
        for (int grey : DARK_GREYS) if (color == grey) return Color.BLACK;
        return color;
    }
}
