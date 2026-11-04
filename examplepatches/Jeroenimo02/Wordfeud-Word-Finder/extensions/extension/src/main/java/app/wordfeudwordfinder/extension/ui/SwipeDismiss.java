package app.wordfeudwordfinder.extension.ui;

/** Decides whether a downward swipe on the overlay header closes the overlay. Pure; unit-tested. */
public final class SwipeDismiss {
    private SwipeDismiss() {}

    /** Fraction of the panel height that closes the overlay even when released slowly. */
    static final float DISTANCE_FRACTION = 0.25f;

    /**
     * @param dyPx            total downward drag since touch down (negative = upward)
     * @param velocityPxPerS  vertical velocity at release (positive = downward)
     * @param touchSlopPx     system touch slop; smaller movements are taps
     * @param panelHeightPx   height of the panel
     * @param minFlingPxPerS  system minimum fling velocity
     */
    public static boolean shouldDismiss(float dyPx, float velocityPxPerS, int touchSlopPx, int panelHeightPx,
                                        float minFlingPxPerS) {
        if (dyPx <= touchSlopPx) return false;
        if (velocityPxPerS < 0) return false;
        if (velocityPxPerS >= minFlingPxPerS) return true;
        return dyPx >= panelHeightPx * DISTANCE_FRACTION;
    }

    /** Translation of the panel while dragging: follows the finger downward only. */
    public static float dragOffset(float dyPx) {
        return Math.max(0f, dyPx);
    }
}
