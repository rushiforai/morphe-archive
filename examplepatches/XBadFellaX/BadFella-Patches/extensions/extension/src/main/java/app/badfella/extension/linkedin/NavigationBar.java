package app.badfella.extension.linkedin;

import android.view.View;
import android.view.ViewGroup;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.WeakHashMap;

/**
 * Shapes LinkedIn's bottom bar: which tabs it has, whether its tabs show a label and a count badge, and the glass
 * look. {@link #filterTabs} and {@link #onTabsSized} are the only two hooks into the bar, shared by every patch that
 * changes it, so the More tab is one of the hidden tabs here and not a second filter.
 *
 * Two selections are combined here: the in-app toggles of the Navigation bar patch ({@link Settings#tabHidden}) and
 * the tabs picked while patching with the Customize navigation bar patch ({@link #setPresetMask}). Either one works
 * on its own, and both can be used together.
 */
public final class NavigationBar {
    /** HomeTabInfo constants that can be hidden from inside the app. Home always stays: it is the screen the app opens on. */
    private static final String[] HIDEABLE_TABS = {"MORE", "JOBS", "RELATIONSHIPS", "NOTIFICATIONS"};
    /** HomeTabInfo constants picked with the Morphe options, in the same order as their mask bits. */
    private static final String[] PRESET_TABS = {
            "RELATIONSHIPS", "POST", "NOTIFICATIONS", "JOBS", "VIDEO", "NEWS",
    };
    private static final String[] BADGE_VIEWS = {
            "slim_notification_badge_determinate_frame_layout_next",
            "slim_notification_badge_determinate_frame_layout_current",
            "slim_notification_badge_indeterminate_image"};
    private static final String ICON = "slim_notification_badge_icon";
    private static final String LABEL = "slim_notification_badge_label";

    /** The rows of tabs that already have their listener. Only touched on the main thread. */
    private static final WeakHashMap<ViewGroup, Boolean> prepared = new WeakHashMap<>();

    /** The icon's own top and bottom margins, taken before this changed them, by icon. */
    private static final WeakHashMap<View, int[]> iconMargins = new WeakHashMap<>();

    /** The bottom bar that is sizing its tabs. */
    private static WeakReference<View> sizing = new WeakReference<>(null);

    /** Tabs picked in Morphe Manager, as the mask the Customize navigation bar patch writes. */
    private static volatile int presetMask;

    private NavigationBar() {
    }

    /** Injected at the start of HomeNavTabsManager.getHomeNavTabs() by Customize navigation bar. */
    public static void setPresetMask(int mask) {
        presetMask = mask;
    }

    /** Injected at the returns of HomeNavTabsManager.getHomeNavTabs() and at SlimBottomBar.setItems(). */
    public static List<Object> filterTabs(List<Object> tabs) {
        if (tabs == null || tabs.isEmpty()) return tabs;
        try {
            List<Object> result = new ArrayList<>(tabs);
            boolean changed = false;
            for (String name : HIDEABLE_TABS) {
                if (Settings.tabHidden(name)) changed |= removeTab(result, name);
            }
            for (int i = 0; i < PRESET_TABS.length; i++) {
                if ((presetMask & (1 << i)) != 0) changed |= removeTab(result, PRESET_TABS[i]);
            }
            // Home cannot be hidden, so at least one tab is always left; this only guards against a changed build.
            return changed && !result.isEmpty() ? result : tabs;
        } catch (Throwable t) {
            Diagnostics.error("filterTabs failed", t);
            return tabs;
        }
    }

    /** Removes the tab constant from the list, if this build has it. */
    private static boolean removeTab(List<Object> tabs, String name) {
        try {
            Class<?> info = Class.forName("com.linkedin.android.home.HomeTabInfo");
            return tabs.remove(info.getField(name).get(null));
        } catch (Throwable t) {
            return false;
        }
    }

    /**
     * Injected at the start of SlimBottomBar.resizeTabsToCorrectSizes(), where the register of the bar is still its
     * own: the method reuses that register before it returns.
     */
    public static void beforeTabsSized(View bar) {
        sizing = new WeakReference<>(bar);
    }

    /**
     * Injected at the returns of SlimBottomBar.resizeTabsToCorrectSizes(), so the bar is shaped as soon as its tabs
     * are sized and before it is first drawn. The app gives the tabs equal widths again every time it runs, and
     * its layout moves them, so the row also arranges them after each layout.
     */
    public static void onTabsSized() {
        try {
            View bar = sizing.get();
            if (bar == null) return;
            View row = child(bar, "bb_slim_bottom_bar_item_container");
            if (!(row instanceof ViewGroup)) return;
            ViewGroup tabs = (ViewGroup) row;
            if (prepared.put(tabs, true) == null) {
                if (Settings.glassNavigationBar()) GlassNavigationBar.install(bar, tabs);
                if (Settings.isSwipeTabsIncluded()) SwipeTabs.install(bar, tabs);
                // A tab is laid out again on its own when a label is hidden or shown, so the bar is shaped after
                // every layout pass instead of only when the tabs' own bounds change.
                tabs.getViewTreeObserver().addOnGlobalLayoutListener(() -> arrange(bar, tabs));
            }
            arrange(bar, tabs);
        } catch (Throwable t) {
            Diagnostics.error("onTabsSized failed", t);
        }
    }

    private static void arrange(View bar, ViewGroup tabs) {
        if (Settings.glassNavigationBar()) GlassNavigationBar.arrangeTabs(tabs, bar.getWidth());
        boolean labels = !Settings.hideTabLabels();
        boolean badges = !Settings.hideTabBadges();
        for (int i = 0; i < tabs.getChildCount(); i++) {
            if (!(tabs.getChildAt(i) instanceof ViewGroup)) continue;
            ViewGroup tab = (ViewGroup) tabs.getChildAt(i);
            showLabel(tab, labels);
            for (String name : BADGE_VIEWS) {
                View badge = child(tab, name);
                // The app changes the visibility of these itself, so the badge is scaled away instead.
                if (badge != null) badge.setScaleX(badges ? 1 : 0);
                if (badge != null) badge.setScaleY(badges ? 1 : 0);
            }
        }
    }

    /**
     * Shows or hides the label of a tab, and puts what is left in the middle of the tab. A hidden label takes no room
     * at all, so the icon's own top and bottom constraints center it; the margins it had are kept for the next time
     * the label shows, when the icon and the label are moved together until the pair is centered.
     */
    private static void showLabel(ViewGroup tab, boolean show) {
        View label = child(tab, LABEL);
        View icon = child(tab, ICON);
        if (label == null || icon == null) return;
        label.setVisibility(show ? View.VISIBLE : View.GONE);
        int[] own = ownMargins(icon);
        setMargins(icon, show ? own[0] : 0, show ? own[1] : 0);
        float offset = 0;
        // The pair as the layout placed it, from the top of the icon to the bottom of the label.
        if (show && tab.getHeight() > 0 && label.getHeight() > 0) {
            int above = icon.getTop();
            int below = Math.max(icon.getBottom(), label.getBottom());
            if (below > above) offset = (tab.getHeight() - (below - above)) / 2f - above;
        }
        for (int i = 0; i < tab.getChildCount(); i++) tab.getChildAt(i).setTranslationY(offset);
    }

    /**
     * How far the bar is slid down to hide it. The stock offset is the height of the tab row, but the glass bar pads
     * itself to float above the system navigation bar, so it is taller than its tabs and that offset leaves the rest
     * of the capsule on screen. Its full height, plus any room under it in the parent, takes it completely off.
     * Injected at the start of SlimBottomNavigationBehavior.animateOffset(bar, offset).
     */
    public static int slideOffset(View bar, int offset) {
        if (bar == null || offset <= 0 || !Settings.glassNavigationBar()) return offset;
        int height = bar.getHeight();
        if (height <= 0) return offset;
        int below = 0;
        if (bar.getParent() instanceof View) {
            View parent = (View) bar.getParent();
            below = Math.max(0, parent.getHeight() - bar.getBottom());
        }
        return Math.max(offset, height + below);
    }

    /** The icon's own top and bottom margins, taken the first time they are changed. */
    private static int[] ownMargins(View icon) {
        int[] own = iconMargins.get(icon);
        if (own != null) return own;
        ViewGroup.LayoutParams params = icon.getLayoutParams();
        own = params instanceof ViewGroup.MarginLayoutParams
                ? new int[]{((ViewGroup.MarginLayoutParams) params).topMargin,
                            ((ViewGroup.MarginLayoutParams) params).bottomMargin}
                : new int[]{0, 0};
        iconMargins.put(icon, own);
        return own;
    }

    /** Sets the icon's top and bottom margins, and asks for no layout pass when they already are what is asked. */
    private static void setMargins(View icon, int top, int bottom) {
        ViewGroup.LayoutParams params = icon.getLayoutParams();
        if (!(params instanceof ViewGroup.MarginLayoutParams)) return;
        ViewGroup.MarginLayoutParams margins = (ViewGroup.MarginLayoutParams) params;
        if (margins.topMargin == top && margins.bottomMargin == bottom) return;
        margins.topMargin = top;
        margins.bottomMargin = bottom;
        icon.setLayoutParams(margins);
    }

    static View child(View parent, String name) {
        int id = parent.getResources().getIdentifier(name, "id", parent.getContext().getPackageName());
        return id == 0 ? null : parent.findViewById(id);
    }
}
