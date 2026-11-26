/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.linkedin;

import android.graphics.drawable.StateListDrawable;
import android.content.Context;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;

import app.fakh.extension.shared.SwipeTabs;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Shapes LinkedIn's bottom bar: which tabs it has, whether its tabs show a label and a count badge, and the glass
 * look. {@link #filterTabs} and {@link #onTabsSized} are the only two hooks into the bar, shared by every patch that
 * changes it, so the More tab is one of the hidden tabs here and not a second filter.
 */
public final class NavigationBar {
    /** HomeTabInfo constants that can be hidden. Home always stays: it is the screen the app opens on. */
    private static final String[] HIDEABLE_TABS = {"MORE", "JOBS", "RELATIONSHIPS", "NOTIFICATIONS", "POST", "VIDEO",
            "NEWS", "MESSAGING"};
    /** Tabs only some accounts get. Turned on in the settings, they are added when LinkedIn leaves them out. */
    private static final String[] OPTIONAL_TABS = {"POST", "VIDEO", "NEWS", "MESSAGING"};
    private static final String[] BADGE_VIEWS = {
            "slim_notification_badge_determinate_frame_layout_next",
            "slim_notification_badge_determinate_frame_layout_current",
            "slim_notification_badge_indeterminate_image"};

    /** Tab view id name (tab_feed, ...) to LinkedIn's own icon resource for it, for the tabs sheet. */
    private static final Map<String, Integer> STOCK_ICONS = new HashMap<>();

    /** Tab view id name to its (selected, unselected) Material icon. */
    private static final Map<String, String[]> MATERIAL_ICONS = new HashMap<>();

    static {
        MATERIAL_ICONS.put("tab_feed", new String[]{IconDrawable.HOME, IconDrawable.HOME_OUTLINE});
        MATERIAL_ICONS.put("tab_relationships", new String[]{IconDrawable.PEOPLE, IconDrawable.PEOPLE_OUTLINE});
        MATERIAL_ICONS.put("tab_notifications", new String[]{IconDrawable.BELL, IconDrawable.BELL_OUTLINE});
        MATERIAL_ICONS.put("tab_jobs", new String[]{IconDrawable.WORK, IconDrawable.WORK_OUTLINE});
        MATERIAL_ICONS.put("tab_video", new String[]{IconDrawable.PLAY, IconDrawable.PLAY_OUTLINE});
        MATERIAL_ICONS.put("tab_post", new String[]{IconDrawable.POST_TAB, IconDrawable.POST_TAB_OUTLINE});
        MATERIAL_ICONS.put("tab_news", new String[]{IconDrawable.ARTICLE_TAB, IconDrawable.ARTICLE_TAB_OUTLINE});
        MATERIAL_ICONS.put("tab_messaging", new String[]{IconDrawable.CHAT_TAB, IconDrawable.CHAT_TAB_OUTLINE});
        MATERIAL_ICONS.put("tab_newsletters", new String[]{IconDrawable.ARTICLE_TAB, IconDrawable.ARTICLE_TAB_OUTLINE});
        MATERIAL_ICONS.put("tab_more", new String[]{IconDrawable.APPS_TAB, IconDrawable.APPS_TAB});
        MATERIAL_ICONS.put("tab_games", new String[]{IconDrawable.PUZZLE_TAB, IconDrawable.PUZZLE_TAB_OUTLINE});
        MATERIAL_ICONS.put("tab_groups", new String[]{IconDrawable.GROUPS_TAB, IconDrawable.GROUPS_TAB_OUTLINE});
        MATERIAL_ICONS.put("tab_events", new String[]{IconDrawable.EVENT_TAB, IconDrawable.EVENT_TAB_OUTLINE});
        MATERIAL_ICONS.put("tab_grow", new String[]{IconDrawable.TRENDING, IconDrawable.TRENDING_OUTLINE});
    }

    /** The rows of tabs that already have their listener. Only touched on the main thread. */
    private static final WeakHashMap<ViewGroup, Boolean> prepared = new WeakHashMap<>();

    /** The bottom bar that is sizing its tabs. */
    private static WeakReference<View> sizing = new WeakReference<>(null);

    private NavigationBar() {
    }

    /**
     * Injected at the returns of HomeNavTabsManager.getHomeNavTabs(): drops the tabs that are hidden and adds the
     * optional tabs that are turned on but were not given, before More.
     */
    public static List<Object> filterTabs(List<Object> tabs) {
        if (tabs == null) return tabs;
        try {
            Class<?> info = Class.forName("com.linkedin.android.home.HomeTabInfo");
            rememberOptionalTabs(info, tabs);
            List<Object> result = new ArrayList<>(tabs);
            boolean changed = false;
            for (String name : HIDEABLE_TABS) {
                if (!Settings.tabHidden(name)) continue;
                try {
                    changed |= result.remove(info.getField(name).get(null));
                } catch (NoSuchFieldException e) {
                    // A tab this version of LinkedIn does not have.
                }
            }
            if (Settings.isNavigationBarIncluded()) {
                Object more = info.getField("MORE").get(null);
                for (String name : OPTIONAL_TABS) {
                    if (!Settings.optionalTabShown(name)) continue;
                    Object tab;
                    try {
                        tab = info.getField(name).get(null);
                    } catch (NoSuchFieldException e) {
                        continue;
                    }
                    if (result.contains(tab)) continue;
                    int index = result.indexOf(more);
                    result.add(index < 0 ? result.size() : index, tab);
                    changed = true;
                }
            }
            changed |= sort(info, result);
            return changed ? result : tabs;
        } catch (Throwable t) {
            Diagnostics.error("filterTabs failed", t);
            return tabs;
        }
    }

    /**
     * Injected at the start of MediaCachedLix.isVideoTabSduiScreenEnabled(). On an account LinkedIn gives no Video tab,
     * the app's own video viewer stays blank, so a Video tab added here opens the server-driven video screen.
     *
     * @return true to force that screen, false to leave the choice to LinkedIn
     */
    public static boolean useServerVideoScreen() {
        return Settings.optionalTabShown("VIDEO") && !Settings.tabOffered("VIDEO");
    }

    /**
     * Puts the tabs in the order sorted in the settings. Home stays first, and a tab the order does not name keeps
     * its place after the named ones. Returns whether anything moved.
     */
    private static boolean sort(Class<?> info, List<Object> tabs) throws ReflectiveOperationException {
        List<String> order = Settings.tabOrder();
        if (order.isEmpty()) return false;
        Map<Object, Integer> rank = new HashMap<>();
        for (int i = 0; i < order.size(); i++) {
            try {
                rank.put(info.getField(order.get(i)).get(null), i);
            } catch (NoSuchFieldException e) {
                // A tab this version of LinkedIn does not have.
            }
        }
        rank.put(info.getField("FEED").get(null), -1);
        List<Object> sorted = new ArrayList<>(tabs);
        // A stable sort, so tabs without a rank keep their order among themselves.
        sorted.sort((a, b) -> Integer.compare(rank.getOrDefault(a, order.size()), rank.getOrDefault(b, order.size())));
        if (sorted.equals(tabs)) return false;
        tabs.clear();
        tabs.addAll(sorted);
        return true;
    }

    /** Stores which of the optional tabs LinkedIn offers, before any is hidden. */
    private static void rememberOptionalTabs(Class<?> info, List<Object> tabs) throws IllegalAccessException {
        StringBuilder offered = new StringBuilder();
        for (String name : OPTIONAL_TABS) {
            try {
                if (tabs.contains(info.getField(name).get(null))) offered.append(name).append(',');
            } catch (NoSuchFieldException e) {
                // A tab this version of LinkedIn does not have.
            }
        }
        if (!offered.toString().equals(Settings.getString(Settings.OFFERED_TABS, ""))) {
            Settings.setString(Settings.OFFERED_TABS, offered.toString());
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
                if (Settings.isSwipeTabsIncluded()) {
                    SwipeTabs.install(bar, tabs, new SwipeTabs.Host() {
                        @Override
                        public boolean enabled() {
                            return Settings.swipeTabs() && !profileMenuOpen(bar);
                        }

                        @Override
                        public View content(View bar) {
                            return child(bar.getRootView(), "home_nav_item_fragment_container");
                        }

                        @Override
                        public float menuEdgeDp() {
                            return 28;
                        }

                        @Override
                        public void log(String message) {
                            Settings.debugLog(message);
                        }

                        @Override
                        public void error(String message, Throwable failure) {
                            Diagnostics.error(message, failure);
                        }
                    });
                }
                tabs.addOnLayoutChangeListener((v, l, t, r, b, ol, ot, or, ob) -> arrange(bar, tabs));
            }
            arrange(bar, tabs);
        } catch (Throwable t) {
            Diagnostics.error("onTabsSized failed", t);
        }
    }

    /**
     * Whether the profile menu (the drawer opened from the profile photo) is open or opening. The drawer layout keeps
     * its panel off screen while closed, so any panel after the content that is on screen means it is showing.
     */
    private static boolean profileMenuOpen(View bar) {
        View drawer = child(bar.getRootView(), "home_drawer_layout");
        if (!(drawer instanceof ViewGroup)) return false;
        ViewGroup layout = (ViewGroup) drawer;
        for (int i = 1; i < layout.getChildCount(); i++) {
            View panel = layout.getChildAt(i);
            if (panel.getVisibility() == View.VISIBLE && panel.getRight() > 0 && panel.getLeft() < layout.getWidth()) {
                return true;
            }
        }
        return false;
    }

    private static void arrange(View bar, ViewGroup tabs) {
        if (Settings.glassNavigationBar()) GlassNavigationBar.arrangeTabs(tabs, bar.getWidth());
        boolean labels = !Settings.hideTabLabels();
        boolean badges = !Settings.hideTabBadges();
        for (int i = 0; i < tabs.getChildCount(); i++) {
            if (!(tabs.getChildAt(i) instanceof ViewGroup)) continue;
            ViewGroup tab = (ViewGroup) tabs.getChildAt(i);
            fitIcon(tab);
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
     * Drops the side margins (30dp) of the icon and the label when the tab is too narrow for them, as with six or seven
     * tabs: the layout would otherwise shrink both to nothing. Both are centered between the tab's edges either way.
     */
    private static void fitIcon(ViewGroup tab) {
        View icon = child(tab, "slim_notification_badge_icon");
        if (icon == null || tab.getWidth() == 0) return;
        ViewGroup.MarginLayoutParams params = (ViewGroup.MarginLayoutParams) icon.getLayoutParams();
        int needed = params.getMarginStart() + params.getMarginEnd() + Downloads.dp(tab.getContext(), 24);
        if (params.getMarginStart() == 0 || tab.getWidth() >= needed) return;
        for (View view : new View[]{icon, child(tab, "slim_notification_badge_label")}) {
            if (view == null) continue;
            ViewGroup.MarginLayoutParams margins = (ViewGroup.MarginLayoutParams) view.getLayoutParams();
            margins.setMarginStart(0);
            margins.setMarginEnd(0);
            view.setLayoutParams(margins);
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

    /**
     * Injected at the start of SlimNotificationBadge.setIconDrawable(int): draws a Material icon on the tab instead
     * of LinkedIn's. Returns true when it did, and the app's own code is then skipped. The bar tints the icon itself.
     */
    public static boolean setTabIcon(View tab, int resource) {
        try {
            if (tab.getId() == View.NO_ID) return false;
            // By the tab's view id (tab_feed, tab_post, ...), set before its icon.
            String name = tab.getResources().getResourceEntryName(tab.getId());
            View icon = child(tab, "slim_notification_badge_icon");
            // LinkedIn gives the Messaging tab a drawable where the others have a theme attribute, so it resolves
            // to nothing and the tab would have no icon at all.
            boolean unresolved = resource == 0 && name.equals("tab_messaging");
            if (unresolved) {
                // The same icon as the Messaging button of the top bar.
                int attr = tab.getResources().getIdentifier("voyagerIcNavMessagingInactiveLarge32dp", "attr",
                        tab.getContext().getPackageName());
                TypedValue value = new TypedValue();
                if (attr != 0 && tab.getContext().getTheme().resolveAttribute(attr, value, true)) {
                    resource = value.resourceId;
                }
            }
            if (resource == 0) return false;
            STOCK_ICONS.put(name, resource);
            String[] icons = Settings.materialTabIcons() ? MATERIAL_ICONS.get(name) : null;
            if (icons == null || !(icon instanceof ImageView)) {
                if (!unresolved || !(icon instanceof ImageView)) return false;
                ((ImageView) icon).setImageResource(resource);
                return true;
            }
            int size = Downloads.dp(tab.getContext(), 24);
            StateListDrawable drawable = new StateListDrawable();
            drawable.addState(new int[]{android.R.attr.state_selected},
                    new IconDrawable(icons[0], 0xFFFFFFFF).withSize(size));
            drawable.addState(new int[0], new IconDrawable(icons[1], 0xFFFFFFFF).withSize(size));
            ((ImageView) icon).setImageDrawable(drawable);
            return true;
        } catch (Throwable t) {
            Diagnostics.error("setTabIcon failed", t);
            return false;
        }
    }

    /**
     * Injected at the start of SlimBottomBar.onClick(View). The Messaging tab opens the conversations the way the
     * top bar button does and leaves the selection alone; returns true when the tap was handled.
     */
    public static boolean interceptTabClick(View bar, View tab) {
        try {
            if (tab.getId() == View.NO_ID
                    || !tab.getResources().getResourceEntryName(tab.getId()).equals("tab_messaging")) {
                return false;
            }
            View button = child(tab.getRootView(), "home_messaging");
            return button != null && button.performClick();
        } catch (Throwable t) {
            Diagnostics.error("interceptTabClick failed", t);
            return false;
        }
    }

    /** The theme attributes of the icons of the tabs the bar may not have drawn yet, by HomeTabInfo constant. */
    private static final Map<String, String> STOCK_ATTRS = new HashMap<>();

    static {
        STOCK_ATTRS.put("post", "voyagerIcNavPostOutline24dp");
        STOCK_ATTRS.put("messaging", "voyagerIcNavMessagingInactiveLarge32dp");
        STOCK_ATTRS.put("news", "voyagerIcNavNewsSelector24dp");
        STOCK_ATTRS.put("video", "voyagerIcNavVideoSelector24dp");
        STOCK_ATTRS.put("more", "voyagerIcNavMoreSelector24dp");
    }

    /**
     * LinkedIn's icon resource of a tab, by its HomeTabInfo constant: the one the bar drew, or, for a tab the bar has
     * not drawn (it is hidden), the one its theme attribute resolves to. 0 when there is none.
     */
    static int stockIcon(Context context, String tab) {
        String key = tab.toLowerCase(java.util.Locale.ROOT);
        Integer resource = STOCK_ICONS.get("tab_" + key);
        if (resource != null) return resource;
        String name = STOCK_ATTRS.get(key);
        int attr = name == null ? 0 : context.getResources().getIdentifier(name, "attr", context.getPackageName());
        TypedValue value = new TypedValue();
        return attr != 0 && appTheme(context).resolveAttribute(attr, value, true) ? value.resourceId : 0;
    }

    /**
     * The theme of the app's main activity, where the icon attributes have values; the theme of the settings screen
     * has none for them.
     */
    static android.content.res.Resources.Theme appTheme(Context context) {
        try {
            android.content.Intent launch = context.getPackageManager().getLaunchIntentForPackage(context.getPackageName());
            int style = context.getPackageManager().getActivityInfo(launch.getComponent(), 0).theme;
            if (style != 0) {
                android.content.res.Resources.Theme theme = context.getResources().newTheme();
                theme.applyStyle(style, true);
                return theme;
            }
        } catch (Throwable t) {
            Diagnostics.error("app theme failed", t);
        }
        return context.getTheme();
    }

    static View child(View parent, String name) {
        int id = parent.getResources().getIdentifier(name, "id", parent.getContext().getPackageName());
        return id == 0 ? null : parent.findViewById(id);
    }
}
