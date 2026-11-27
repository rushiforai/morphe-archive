package dev.srwi.gintype.extension.thicctopbar;

/**
 * Tracks horizontal viewport anchoring for the active/pending word column in {@link ThiccTopBarView}.
 *
 * <p>Anchoring policy:
 * <ul>
 *   <li>When a new or edited pending word appears in the middle of a sentence, it starts
 *       {@link Mode#LEFT_ANCHORED} at a fixed viewport X coordinate so words to its left stay
 *       motionless as the pending word grows or shrinks.</li>
 *   <li>If the pending word's right edge would extend beyond the right edge of the top bar
 *       ({@code barWidth}), the anchor latches to {@link Mode#RIGHT_CLAMPED}, clamping the right
 *       edge to {@code barWidth}.</li>
 *   <li>Once {@link Mode#RIGHT_CLAMPED} (or when typing at the end of the text), the column's
 *       right edge stays fixed to {@code barWidth} for subsequent updates to that word.</li>
 * </ul>
 */
final class ActiveColumnAnchor {

    enum Mode {
        NONE,
        LEFT_ANCHORED,
        RIGHT_CLAMPED
    }

    private Mode mode = Mode.NONE;
    private float anchorViewportLeftX = 0f;

    Mode getMode() {
        return mode;
    }

    float getAnchorViewportLeftX() {
        return anchorViewportLeftX;
    }

    boolean isActive() {
        return mode != Mode.NONE;
    }

    void reset() {
        mode = Mode.NONE;
        anchorViewportLeftX = 0f;
    }

    void anchorLeft(float viewportLeftX) {
        this.mode = Mode.LEFT_ANCHORED;
        this.anchorViewportLeftX = Math.max(0f, viewportLeftX);
    }

    void anchorRight() {
        this.mode = Mode.RIGHT_CLAMPED;
        this.anchorViewportLeftX = 0f;
    }

    /**
     * Resolves the target {@code HorizontalScrollView} {@code scrollX} for the active column
     * laid out at {@code [colLeft, colRight]} inside a content container of width
     * {@code contentWidth} and viewport width {@code barWidth}.
     *
     * <p>Transitions from {@link Mode#LEFT_ANCHORED} to {@link Mode#RIGHT_CLAMPED} if the
     * column's right edge would otherwise extend past {@code barWidth}.
     *
     * @return target {@code scrollX} clamped to {@code [0, maxScrollX]}, or {@code -1} if no
     *         anchor is active or layout dimensions are not yet valid.
     */
    int resolveScrollX(int colLeft, int colRight, int contentWidth, int barWidth) {
        if (mode == Mode.NONE || barWidth <= 0 || contentWidth <= 0) {
            return -1;
        }
        int maxScrollX = Math.max(0, contentWidth - barWidth);
        int desiredScrollX;

        if (mode == Mode.LEFT_ANCHORED) {
            desiredScrollX = Math.max(0, Math.round(colLeft - anchorViewportLeftX));
            if (colRight - desiredScrollX > barWidth) {
                mode = Mode.RIGHT_CLAMPED;
                desiredScrollX = colRight - barWidth;
            }
        } else {
            desiredScrollX = colRight - barWidth;
        }

        return Math.max(0, Math.min(maxScrollX, desiredScrollX));
    }
}
