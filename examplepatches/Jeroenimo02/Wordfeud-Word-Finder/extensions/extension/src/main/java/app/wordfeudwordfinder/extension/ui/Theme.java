package app.wordfeudwordfinder.extension.ui;

/**
 * Every colour the overlay uses (spec section 9), as ARGB ints. No android.* imports so it stays JVM-testable.
 *
 * The values are measured on a screenshot of Wordfeud 5.7.1's dark game screen (screen #343B45, empty square
 * #2A2D32, grid gaps #171A1F, TL #1F6191, DL #6A8E50 (green), DW #C8720F, TW #93282E, board tile #F2EFEA with
 * #191816 letters, rack area #2E3138, header card #404751, accent #2F7DE1). New tiles keep the spec's white with a
 * blue border. Wordfeud's yellow last-played highlight (#EFE495) is deliberately not used.
 *
 * The light colours (V8) are measured on a screenshot of the light game screen: page #D0D5DB, app bar #DEE3E7,
 * card #EDF1F4, text #1B1B1B, empty square #C6D1D7, grid gaps #ACC0C7, TL #1B7FB3, DL #4DA118, DW #E3800B,
 * TW #B51823. Wordfeud lets the board stay dark in light mode, so the overlay chrome (app theme) and the board
 * colours are chosen separately: see {@link #of(boolean, boolean)}.
 */
public final class Theme {
    // Overlay chrome
    public final int background;
    public final int surface;
    public final int surfaceSelected;
    public final int divider;
    public final int textPrimary;
    public final int textSecondary;
    public final int accent;
    public final int onAccent;

    // Board
    public final int boardBackground;
    public final int squareEmpty;
    public final int squareDL;
    public final int squareTL;
    public final int squareDW;
    public final int squareTW;
    public final int squareLabel;

    // Tiles
    public final int tileFill;
    public final int tileText;
    public final int tileNewFill;
    public final int tileNewBorder;
    public final int tileNewText;
    /** Alpha (0..255) for a dimmed rack tile (a letter the selected word uses). */
    public final int tileDimmedAlpha;
    public final int badgeFill;
    public final int badgeText;

    private Theme(int[] c) {
        int i = 0;
        background = c[i++];
        surface = c[i++];
        surfaceSelected = c[i++];
        divider = c[i++];
        textPrimary = c[i++];
        textSecondary = c[i++];
        accent = c[i++];
        onAccent = c[i++];
        boardBackground = c[i++];
        squareEmpty = c[i++];
        squareDL = c[i++];
        squareTL = c[i++];
        squareDW = c[i++];
        squareTW = c[i++];
        squareLabel = c[i++];
        tileFill = c[i++];
        tileText = c[i++];
        tileNewFill = c[i++];
        tileNewBorder = c[i++];
        tileNewText = c[i++];
        tileDimmedAlpha = c[i++];
        badgeFill = c[i++];
        badgeText = c[i++];
        if (i != c.length) throw new IllegalStateException("theme size");
    }

    /** Index of the first board colour in a theme array; chrome is [0, BOARD_FROM) plus the badge pair. */
    private static final int BOARD_FROM = 8;
    private static final int BOARD_TO = 21;

    private static final int[] DARK_COLOURS = {
        0xFF343B45, // background: Wordfeud 5.7.1 dark screen
        0xFF404751, // surface: list rows, panels (header card)
        0xFF2E3138, // surfaceSelected: selected list row (rack area)
        0xFF343A48, // divider
        0xFFFFFFFF, // textPrimary
        0xFFAEB4C2, // textSecondary
        0xFF2F7DE1, // accent: Play button
        0xFFFFFFFF, // onAccent
        0xFF171A1F, // boardBackground (grid gaps)
        0xFF2A2D32, // squareEmpty
        0xFF6A8E50, // squareDL: green
        0xFF1F6191, // squareTL: blue
        0xFFC8720F, // squareDW: orange
        0xFF93282E, // squareTW: dark red
        0xFFFFFFFF, // squareLabel
        0xFFF2EFEA, // tileFill (board tile)
        0xFF191816, // tileText: dark letters and points
        0xFFFFFFFF, // tileNewFill: white
        0xFF2F7DE1, // tileNewBorder: blue
        0xFF262626, // tileNewText
        90,         // tileDimmedAlpha
        0xFF2F7DE1, // badgeFill: blue score bubble
        0xFFFFFFFF, // badgeText
    };

    private static final int[] LIGHT_COLOURS = {
        0xFFDEE3E7, // background: light app bar
        0xFFEDF1F4, // surface: header card
        0xFFC6D1D7, // surfaceSelected
        0xFFC6D1D7, // divider
        0xFF1B1B1B, // textPrimary
        0xFF5B6570, // textSecondary
        0xFF2F7DE1, // accent: Play button
        0xFFFFFFFF, // onAccent
        0xFFACC0C7, // boardBackground (grid gaps)
        0xFFC6D1D7, // squareEmpty
        0xFF4DA118, // squareDL: green
        0xFF1B7FB3, // squareTL: blue
        0xFFE3800B, // squareDW: orange
        0xFFB51823, // squareTW: red
        0xFFFFFFFF, // squareLabel
        0xFFF2EFEA, // tileFill (board tile)
        0xFF191816, // tileText
        0xFFFFFFFF, // tileNewFill: white
        0xFF2F7DE1, // tileNewBorder: blue
        0xFF262626, // tileNewText
        90,         // tileDimmedAlpha
        0xFF2F7DE1, // badgeFill
        0xFFFFFFFF, // badgeText
    };

    public static final Theme DARK = new Theme(DARK_COLOURS);
    public static final Theme LIGHT = new Theme(LIGHT_COLOURS);
    /** Light app with Wordfeud's dark board option. */
    public static final Theme LIGHT_DARK_BOARD = new Theme(mix(LIGHT_COLOURS, DARK_COLOURS));
    /** Dark app with a light board (not offered by Wordfeud, but a detection result may say so). */
    public static final Theme DARK_LIGHT_BOARD = new Theme(mix(DARK_COLOURS, LIGHT_COLOURS));

    private static int[] mix(int[] chrome, int[] board) {
        int[] c = chrome.clone();
        System.arraycopy(board, BOARD_FROM, c, BOARD_FROM, BOARD_TO - BOARD_FROM);
        return c;
    }

    /** Theme for the app's current mode (spec section 9: derived from statusBarIconBrightness). */
    public static Theme forDarkMode(boolean dark) {
        return dark ? DARK : LIGHT;
    }

    /** Overlay chrome follows the app theme, the board preview follows the colours of Wordfeud's own board. */
    public static Theme of(boolean appDark, boolean boardDark) {
        if (appDark) return boardDark ? DARK : DARK_LIGHT_BOARD;
        return boardDark ? LIGHT_DARK_BOARD : LIGHT;
    }

    /** Fill colour for a {@code BoardLayout} square code (0 none, 1 DL, 2 TL, 3 DW, 4 TW). */
    public int bonusColor(int code) {
        switch (code) {
            case 1: return squareDL;
            case 2: return squareTL;
            case 3: return squareDW;
            case 4: return squareTW;
            default: return squareEmpty;
        }
    }
}
