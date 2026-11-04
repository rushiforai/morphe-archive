package app.wordfeudwordfinder.extension.ui;

/**
 * Position of the floating button (spec section 9). Pure arithmetic so it can be unit-tested; the offsets are
 * measurements on one device and wait for check V7, so they live here as named constants.
 */
public final class FabPlacement {
    private FabPlacement() {}

    /** Diameter of the round button. */
    public static final int FAB_SIZE_DP = 40;
    /** Margin between the button and the right edge of the content. */
    public static final int FAB_MARGIN_RIGHT_DP = 10;
    /**
     * Measured distance from the PHYSICAL screen bottom to the top edge of the rack (V7), including a 3-button
     * navigation bar of about 48 dp: it already contains the system bottom inset.
     */
    public static final int RACK_TOP_FROM_BOTTOM_DP = 165;
    /** Lower bound of the rack top above the Flutter view bottom (165 dp minus a 48 dp navigation bar). */
    public static final int RACK_TOP_MIN_DP = 117;
    /** Gap between the button and the top edge of the rack. */
    public static final int FAB_GAP_ABOVE_RACK_DP = 10;
    /** Extra upward shift while the ad banner is visible (standard 50 dp banner; to be confirmed in V7). */
    public static final int BANNER_SHIFT_DP = 50;

    /** dp to whole pixels, rounded. */
    public static int dp(float density, int dp) {
        return Math.round(dp * density);
    }

    /**
     * Bottom margin of the button inside the content view.
     *
     * @param bottomInsetPx the part of the system bottom inset (navigation bar) that overlaps the content, see
     *                      {@link #effectiveBottomInset}
     */
    public static int bottomMarginPx(float density, int bottomInsetPx, boolean bannerVisible) {
        int inset = Math.max(0, bottomInsetPx);
        int rackTop = Math.max(dp(density, RACK_TOP_FROM_BOTTOM_DP) - inset, dp(density, RACK_TOP_MIN_DP));
        int dp = FAB_GAP_ABOVE_RACK_DP + (bannerVisible ? BANNER_SHIFT_DP : 0);
        return rackTop + inset + dp(density, dp);
    }

    /**
     * How much of the window's bottom inset lies over the content view: all of it when the app draws edge to edge,
     * none when the content already ends above the navigation bar.
     */
    public static int effectiveBottomInset(int insetBottomPx, int windowHeightPx, int contentBottomPx) {
        int below = Math.max(0, windowHeightPx - contentBottomPx);
        return Math.max(0, insetBottomPx - below);
    }

    /** How much of the window's top inset (status bar) lies over the content view, whose top is at contentTopPx. */
    public static int effectiveTopInset(int insetTopPx, int contentTopPx) {
        return Math.max(0, insetTopPx - Math.max(0, contentTopPx));
    }
}
