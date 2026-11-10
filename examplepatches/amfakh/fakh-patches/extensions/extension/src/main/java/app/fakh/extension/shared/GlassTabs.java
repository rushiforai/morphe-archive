package app.fakh.extension.shared;

/**
 * The rules every glass navigation bar shares about its tabs: how wide they get, so the capsule follows the number of
 * tabs, and how the tab sheet describes them. Home counts as a tab that is always shown.
 */
public final class GlassTabs {
    /** The widest a tab gets, so the capsule stays compact on a wide screen. */
    public static final int MAX_TAB_DP = 96;

    private GlassTabs() {
    }

    /**
     * The width of one tab when the tabs share {@code available} pixels, never wider than {@link #MAX_TAB_DP}.
     *
     * @param available the width the tabs have, in pixels
     * @param count     how many tabs are shown
     * @param density   display density
     * @return the width of a tab in pixels
     */
    public static int tabWidth(int available, int count, float density) {
        return Math.min(available / Math.max(count, 1), Math.round(MAX_TAB_DP * density));
    }

    /**
     * The padding on each side of a bar that centers {@code count} tabs of at most {@link #MAX_TAB_DP}, so fewer tabs
     * give a shorter capsule.
     *
     * @param barWidth the width of the bar, in pixels
     * @param count    how many tabs are shown
     * @param gap      the space between two tabs, in pixels
     * @param minSide  the padding the bar keeps when the tabs fill it, in pixels
     * @param density  display density
     * @return the padding for the left and the right side, in pixels
     */
    public static int sidePadding(int barWidth, int count, int gap, int minSide, float density) {
        float content = count * MAX_TAB_DP * density + (count - 1) * gap;
        return Math.max(minSide, Math.round((barWidth - content) / 2));
    }

    /**
     * What the tab row of the settings shows under its title.
     *
     * @param shown how many tabs the bar shows, Home included
     * @param total how many tabs the bar can show, Home included
     * @return for example {@code "4 of 5 shown"}
     */
    public static String summary(int shown, int total) {
        return I18n.f("%1$s of %2$s shown", shown, total);
    }
}
