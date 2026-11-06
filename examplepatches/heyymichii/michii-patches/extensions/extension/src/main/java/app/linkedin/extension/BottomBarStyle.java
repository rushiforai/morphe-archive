package app.linkedin.extension;

import android.view.View;
import android.view.ViewGroup;

import java.lang.ref.WeakReference;
import java.util.Set;

/** Hooks of the bottom bar (SlimBottomBar) and its tabs (SlimNotificationBadge), for "Bottom bar style". */
@SuppressWarnings("unused")
public final class BottomBarStyle {
    /** Tabs that can be hidden, by the resource name of their view id. Home always stays. */
    static final String[] HIDEABLE_TABS = {
            "tab_relationships", "tab_post", "tab_notifications", "tab_jobs", "tab_video", "tab_games",
    };
    static final String[] HIDEABLE_TAB_NAMES = {"My Network", "Post", "Notifications", "Jobs", "Video", "Games"};

    private static int labelId;
    private static int iconId;
    /** The bar's tab container, to map indicator positions. */
    private static WeakReference<ViewGroup> tabContainer = new WeakReference<>(null);
    /** The bar being resized: resizeTabsToCorrectSizes reuses its register for other values before returning. */
    private static WeakReference<View> resizingBar = new WeakReference<>(null);

    private BottomBarStyle() {
    }

    /**
     * After SlimNotificationBadge.setBadgeLabelText: with "Hide tab labels" on, hides the label under the icon and
     * centers the icon, which LinkedIn moves up to make room for the label.
     */
    public static void onTabLabel(View tab) {
        try {
            if (tab == null || !Settings.hideTabLabels()) return;
            if (labelId == 0) {
                labelId = id(tab, "slim_notification_badge_label");
                iconId = id(tab, "slim_notification_badge_icon");
            }
            View label = labelId == 0 ? null : tab.findViewById(labelId);
            if (label == null) return;
            label.setVisibility(View.GONE);
            View icon = iconId == 0 ? null : tab.findViewById(iconId);
            if (icon != null && icon.getLayoutParams() instanceof ViewGroup.MarginLayoutParams) {
                ViewGroup.MarginLayoutParams params = (ViewGroup.MarginLayoutParams) icon.getLayoutParams();
                params.topMargin = 0;
                params.bottomMargin = 0;
                icon.setLayoutParams(params);
            }
        } catch (Throwable t) {
            Diagnostics.error("onTabLabel failed", t);
        }
    }

    /** At the start of SlimBottomBar.resizeTabsToCorrectSizes: the bar for {@link #onTabsResized}. */
    public static void onTabsResize(View bar) {
        resizingBar = new WeakReference<>(bar);
    }

    /**
     * At the end of SlimBottomBar.resizeTabsToCorrectSizes, which gives every tab an equal width: hides the tabs
     * chosen in "Hidden tabs" and shares their width among the others. The tabs stay in the bar, so LinkedIn's tab
     * positions (such as its adaptive tab at position 3) stay right; only the indicator needs mapping.
     */
    public static void onTabsResized() {
        View bar = resizingBar.get();
        if (bar == null) return;
        try {
            // R8 renamed SlimBottomBar's fields, so its tab container and indicator are found in its views.
            ViewGroup container = find(bar, view -> view instanceof ViewGroup && isTabContainer((ViewGroup) view));
            if (container == null) return;
            tabContainer = new WeakReference<>(container);
            Set<String> hidden = Settings.hiddenTabs();
            int count = container.getChildCount();
            int visible = 0;
            int totalWidth = 0;
            for (int i = 0; i < count; i++) {
                View tab = container.getChildAt(i);
                boolean hide = !hidden.isEmpty() && hidden.contains(entryName(tab));
                tab.setVisibility(hide ? View.GONE : View.VISIBLE);
                if (!hide) visible++;
                ViewGroup.LayoutParams params = tab.getLayoutParams();
                if (params != null && params.width > 0) totalWidth += params.width;
            }
            if (visible == 0 || visible == count) return;
            int width = totalWidth / visible;
            for (int i = 0; i < count; i++) {
                View tab = container.getChildAt(i);
                ViewGroup.LayoutParams params = tab.getLayoutParams();
                if (tab.getVisibility() == View.GONE || params == null || params.width <= 0) continue;
                params.width = width;
                tab.setLayoutParams(params);
            }
            View indicator = find(bar, view -> view.getClass().getName().endsWith("BottomNavigationIndicatorView"));
            if (indicator != null) {
                indicator.getClass().getMethod("setVisibleItemCount", int.class).invoke(indicator, visible);
            }
        } catch (Throwable t) {
            Diagnostics.error("onTabsResized failed", t);
        }
    }

    /** At the start of BottomNavigationIndicatorView.setSelectedIndex: the tab position among the visible tabs. */
    public static int indicatorIndex(int position) {
        ViewGroup container = tabContainer.get();
        if (container == null || Settings.hiddenTabs().isEmpty()) return position;
        int index = 0;
        for (int i = 0; i < position && i < container.getChildCount(); i++) {
            if (container.getChildAt(i).getVisibility() != View.GONE) index++;
        }
        return index;
    }

    /** At the start of SlimNotificationBadge.animateEnter (shows a count or a dot): true skips it. */
    public static boolean hideBadge() {
        return Settings.hideNavBadges();
    }

    private interface ViewTest {
        boolean matches(View view);
    }

    /** The first view in [root] (itself included) that passes [test]. */
    @SuppressWarnings("unchecked")
    private static <T extends View> T find(View root, ViewTest test) {
        if (test.matches(root)) return (T) root;
        if (!(root instanceof ViewGroup)) return null;
        ViewGroup group = (ViewGroup) root;
        for (int i = 0; i < group.getChildCount(); i++) {
            T found = find(group.getChildAt(i), test);
            if (found != null) return found;
        }
        return null;
    }

    /** A view whose children are the tabs (ids tab_feed, tab_post, ...). */
    private static boolean isTabContainer(ViewGroup group) {
        int count = group.getChildCount();
        if (count == 0) return false;
        for (int i = 0; i < count; i++) {
            if (!entryName(group.getChildAt(i)).startsWith("tab_")) return false;
        }
        return true;
    }

    private static String entryName(View tab) {
        int id = tab.getId();
        if (id == View.NO_ID) return "";
        try {
            return tab.getResources().getResourceEntryName(id);
        } catch (Exception e) {
            return "";
        }
    }

    private static int id(View view, String name) {
        return view.getResources().getIdentifier(name, "id", view.getContext().getPackageName());
    }
}
