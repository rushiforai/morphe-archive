package app.southstar21.extension.youtubemusic.liquidglass;

/**
 * The docked player: while something plays, the mini player shrinks to its round album art,
 * standing alone in the tab bar's row right of the tabs, and the tab bar narrows to make room.
 * A glass bar above them shows the title and artist with previous, play/pause and next.
 * <p>
 * The tab bar ({@link LiquidGlassController}) and the mini player ({@link MiniPlayerGlass})
 * share the layout through these fields. Both run on the main thread.
 */
final class Dock {
    /** The docked player's width: the album art standing alone, 56dp with 4dp around it. */
    static final int WIDTH_DP = 64;
    /** Between the tab bar and the capsule. */
    static final int GAP_DP = 8;
    /** Space between the glass and the top of YouTube Music's mini player (68dp tall). */
    static final int TOP_INSET_DP = 4;

    /**
     * The player rests in the tab bar's row: set when WatchWhileLayout last measured the player
     * with the docked height (see {@link LiquidGlassNavBarPatch#miniPlayerHeight}).
     */
    static boolean resting;
    /** A mini player is on screen (the player isn't hidden), so the tab bar makes room for it. */
    static boolean playerShown;
    /** The tab bar's top padding: the pill starts this far below the bar's top. */
    static int barPadTop;
    /** From the screen's right edge to the right end of the capsule, in px (-1 before the bar is laid out). */
    static int rightInset = -1;
    /** From the screen's left edge to the tab bar's pill, in px. */
    static int leftInset;
    /** The capsule's glass on screen, while {@link #capsuleShown}. */
    static final android.graphics.RectF capsule = new android.graphics.RectF();
    static boolean capsuleShown;

    private Dock() {
    }
}
