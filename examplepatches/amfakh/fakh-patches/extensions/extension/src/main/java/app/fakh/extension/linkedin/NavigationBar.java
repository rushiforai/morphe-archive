package app.fakh.extension.linkedin;

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
 */
public final class NavigationBar {
    /** HomeTabInfo constants that can be hidden. Home always stays: it is the screen the app opens on. */
    private static final String[] HIDEABLE_TABS = {"MORE", "JOBS", "RELATIONSHIPS", "NOTIFICATIONS"};
    private static final String[] BADGE_VIEWS = {
            "slim_notification_badge_determinate_frame_layout_next",
            "slim_notification_badge_determinate_frame_layout_current",
            "slim_notification_badge_indeterminate_image"};

    /** The rows of tabs that already have their listener. Only touched on the main thread. */
    private static final WeakHashMap<ViewGroup, Boolean> prepared = new WeakHashMap<>();

    /** The bottom bar that is sizing its tabs. */
    private static WeakReference<View> sizing = new WeakReference<>(null);

    private NavigationBar() {
    }

    /** Injected at the returns of HomeNavTabsManager.getHomeNavTabs(): drops the tabs that are hidden. */
    public static List<Object> filterTabs(List<Object> tabs) {
        if (tabs == null) return tabs;
        try {
            Class<?> info = Class.forName("com.linkedin.android.home.HomeTabInfo");
            List<Object> result = new ArrayList<>(tabs);
            boolean changed = false;
            for (String name : HIDEABLE_TABS) {
                if (Settings.tabHidden(name)) changed |= result.remove(info.getField(name).get(null));
            }
            return changed ? result : tabs;
        } catch (Throwable t) {
            Diagnostics.error("filterTabs failed", t);
            return tabs;
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
                tabs.addOnLayoutChangeListener((v, l, t, r, b, ol, ot, or, ob) -> arrange(bar, tabs));
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

    /** Hides the label of a tab and moves the rest of the tab down, so the icon sits in the middle of the tab. */
    private static void showLabel(ViewGroup tab, boolean show) {
        View label = child(tab, "slim_notification_badge_label");
        View icon = child(tab, "slim_notification_badge_icon");
        if (label == null || icon == null) return;
        label.setVisibility(show ? View.VISIBLE : View.INVISIBLE);
        float offset = show ? 0 : (tab.getHeight() - icon.getHeight()) / 2f - icon.getTop();
        for (int i = 0; i < tab.getChildCount(); i++) tab.getChildAt(i).setTranslationY(offset);
    }

    static View child(View parent, String name) {
        int id = parent.getResources().getIdentifier(name, "id", parent.getContext().getPackageName());
        return id == 0 ? null : parent.findViewById(id);
    }
}
