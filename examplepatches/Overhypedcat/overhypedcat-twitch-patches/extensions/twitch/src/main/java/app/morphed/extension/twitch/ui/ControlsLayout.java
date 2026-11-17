package app.morphed.extension.twitch.ui;

/**
 * Where the patches' parts go among the video player's own controls (all in screen pixels; no Android classes,
 * so it's tested as plain arithmetic).
 */
public final class ControlsLayout {
    private ControlsLayout() {
    }

    /** A place for the song pill: its left, top and the most width it may take. */
    public static final class Pill {
        public final int left, top, maxWidth;
        /** In the row of the player's own pills (false: on a line of its own above them). */
        public final boolean inRow;

        Pill(int left, int top, int maxWidth, boolean inRow) {
            this.left = left;
            this.top = top;
            this.maxWidth = maxWidth;
            this.inRow = inRow;
        }
    }

    /**
     * The song pill goes right after the player's own pills (uptime, viewers), as one more of them, when it fits
     * before the row's next button; otherwise (a narrow player, a long problem text) on a line of its own just
     * above them, as wide as the controls allow.
     *
     * @param statsLeft,statsTop,statsRight,statsHeight the player's own pills
     * @param gap                                       the space the player leaves between its pills
     * @param nextLeft                                  the left edge of the next control in that row
     * @param controlsRight                             the right edge of the controls
     * @param wanted                                    the pill's width with its whole text
     * @param ownLine                                   put it on its own line whether it fits or not
     */
    public static Pill pill(int statsLeft, int statsTop, int statsRight, int statsHeight, int gap, int nextLeft,
                            int controlsRight, int wanted, boolean ownLine) {
        int left = statsRight + gap;
        int room = Math.min(nextLeft, controlsRight) - gap - left;
        if (!ownLine && wanted <= room) return new Pill(left, statsTop, room, true);
        return new Pill(statsLeft, statsTop - gap - statsHeight, Math.max(0, controlsRight - gap - statsLeft), false);
    }

    /**
     * The left edge of the lock button: one step after the last of the top row's left-hand buttons, a step being
     * what the player leaves between two of them (or, with one button only, its width and a tenth).
     *
     * @param firstLeft the first button's left edge, or -1 when there's only the last one
     */
    public static int lockLeft(int firstLeft, int lastLeft, int lastWidth) {
        int step = firstLeft >= 0 && lastLeft > firstLeft ? lastLeft - firstLeft : lastWidth + Math.round(lastWidth * 0.1f);
        return lastLeft + step;
    }

    /**
     * Whether something shown in the top row comes after its left-hand buttons and before the middle (a label the
     * player adds there, as "Intended for certain audiences"): the lock goes after it.
     *
     * @param buttonsRight where the left-hand buttons end
     * @param rowTop,rowBottom the buttons' row
     * @param middle the controls' middle: what starts past it belongs to the right-hand side
     */
    public static boolean inRowAfterButtons(int left, int top, int right, int bottom, int buttonsRight, int rowTop,
                                            int rowBottom, int middle) {
        return left >= buttonsRight - 1 && left < middle && right > left && top < rowBottom && bottom > rowTop;
    }

    /**
     * Whether a control lies in the pills' row to their right (the pill must end before it).
     *
     * @param top,bottom       the control
     * @param rowTop,rowBottom the pills' row
     */
    public static boolean inRowAfter(int left, int top, int bottom, int rowTop, int rowBottom, int statsRight) {
        return left >= statsRight && top < rowBottom && bottom > rowTop;
    }
}
