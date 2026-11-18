package io.github.sabopura.morphe.extension.twitch.ui;

/** Layout decisions from the window's real size in dp, so rotation and folding only have to re-run them. */
final class Layouts {
    private static final int MIN_SHEET_DP = 300;

    private Layouts() {
    }

    /** Landscape and the Fold's wide inner display use the side panel. */
    static boolean sidePanel(int widthDp, int heightDp) {
        return widthDp > heightDp;
    }

    static int panelWidth(int widthDp, int heightDp) {
        return Math.min(sidePanel(widthDp, heightDp) ? 400 : 640, widthDp);
    }

    /** Portrait sheet height that leaves a 16:9 video at the top of the window uncovered. */
    static int sheetMaxHeight(int widthDp, int heightDp, int topInsetDp) {
        int video = widthDp * 9 / 16;
        return Math.min(heightDp - topInsetDp, Math.max(MIN_SHEET_DP, heightDp - topInsetDp - video));
    }

    /**
     * The sheet's whole height, with what its bottom is padded by (navigation bar, keyboard). It
     * stops at the top of the window: with the keyboard up the content shrinks instead of the
     * sheet's title sliding off screen.
     */
    static int sheetPanelMax(int contentMax, int bottomInset, int windowHeight, int topInset) {
        return Math.min(contentMax + bottomInset, Math.max(0, windowHeight - topInset));
    }

    /** As many columns as the width allows, fewer when that fills every row. */
    static int menuColumns(int contentWidthDp, int tiles) {
        int most = contentWidthDp >= 420 ? 4 : 3;
        if (tiles <= most) return Math.max(1, tiles);
        for (int columns = most; columns >= 2; columns--) if (tiles % columns == 0) return columns;
        return most;
    }

    /** A sample pinned above the list needs a window tall enough to still show several options. */
    static boolean pinSample(int heightDp) {
        return heightDp >= 600;
    }

    static boolean twoPane(int widthDp) {
        return widthDp >= 600;
    }

    static int railWidth(int widthDp) {
        return Math.max(240, Math.min(300, widthDp * 36 / 100));
    }

    /** A side panel has height to spare, and so does a wide portrait sheet. */
    static boolean tapeFits(int widthDp, int heightDp) {
        return sidePanel(widthDp, heightDp) || widthDp >= 480;
    }
}
