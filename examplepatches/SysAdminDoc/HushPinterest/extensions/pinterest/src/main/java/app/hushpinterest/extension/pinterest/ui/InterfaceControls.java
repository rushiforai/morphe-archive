/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ui;

import android.os.SystemClock;
import android.view.InputDevice;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;

import java.util.Map;
import java.util.WeakHashMap;

import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.ResourceType;
import app.hushpinterest.extension.shared.ResourceUtils;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;

/** Keeps host tab models and menu actions intact while folding away selected views. */
public final class InterfaceControls {
    private InterfaceControls() {}

    private static final Map<View, String> navigation = new WeakHashMap<>();
    private static final Map<View, Integer> hidden = new WeakHashMap<>();
    private static final Map<View, Boolean> greetingRows = new WeakHashMap<>();

    private static final String HOME_TABS = "home_feed_view_pager_tab_layout";
    private static final String HOME_TABS_LOADING = "home_feed_tabs_placeholder_loading_layout";
    private static volatile int homeTabsId = View.NO_ID;

    private static final String SEARCH_HEADER = "header_bar";
    private static final String SEARCH_BACK = "slp_back_button_container";
    private static final Map<View, Boolean> searchPages = new WeakHashMap<>();
    private static final Map<View, Boolean> pinSheets = new WeakHashMap<>();
    private static final String SEARCH_LOCATION = "SEARCH_LANDING";
    private static final String SEARCH_BAR = "header_static_search_bar";
    static volatile Object searchLocationForTests;

    /** Called after the host assigns a navigation view its ID. Home and Profile always remain. */
    public static void bindNavigation(View view, Object tab) {
        try {
            if (view == null || !(tab instanceof Enum<?>)) return;
            String name = ((Enum<?>) tab).name();
            synchronized (navigation) { navigation.put(view, name); }
            collapse(view, hideNavigation(name));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_NAVIGATION_BUTTONS, "navigation view", failure);
        }
    }

    static boolean hideNavigation(String name) {
        if ("CREATE".equals(name)) {
            return UiHooks.enabled(FamilyNames.HIDE_NAVIGATION_BUTTONS, Settings.HIDE_NAV_CREATE);
        }
        if ("NOTIFICATIONS".equals(name)) {
            return UiHooks.enabled(FamilyNames.HIDE_NAVIGATION_BUTTONS, Settings.HIDE_NAV_NOTIFICATIONS);
        }
        if ("SEARCH".equals(name)) {
            return UiHooks.enabled(FamilyNames.HIDE_NAVIGATION_BUTTONS, Settings.HIDE_NAV_SEARCH);
        }
        return false;
    }

    /**
     * Called once Home's greeting header has put its buttons in their row: an optional tuner, then
     * Create, then the Notifications or Inbox button in a frame of its own. On accounts with this
     * header the bottom bar has no Create or Notifications, so the same two switches fold these. A
     * return to Home from another screen, Hush settings included, brings back window focus, which
     * reapplies them, since nothing else rebuilds the header then.
     */
    public static void greetingHeader(View row) {
        try {
            if (!(row instanceof ViewGroup)) return;
            boolean first;
            synchronized (greetingRows) { first = greetingRows.put(row, Boolean.TRUE) == null; }
            refreshGreetingHeader(row);
            if (first) {
                GreetingFocus watch = new GreetingFocus(row);
                row.addOnAttachStateChangeListener(watch);
                if (row.isAttachedToWindow()) watch.onViewAttachedToWindow(row);
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_NAVIGATION_BUTTONS, "greeting header", failure);
        }
    }

    static void refreshGreetingHeader(View row) {
        ViewGroup group = (ViewGroup) row;
        for (int index = 0; index < group.getChildCount(); index++) {
            View child = group.getChildAt(index);
            String tab = greetingTab(resourceName(child));
            if (tab == null) continue;
            boolean hide = hideNavigation(tab);
            collapse(child, hide);
            if (hide) HookStatus.counted(FamilyNames.HIDE_NAVIGATION_BUTTONS, "CREATE".equals(tab)
                    ? "header Create hidden" : "header Notifications hidden");
        }
    }

    static String greetingTab(String name) {
        if ("home_feed_greeting_header_create_icon".equals(name)) return "CREATE";
        if ("home_feed_greeting_header_newshub_icon".equals(name)) return "NOTIFICATIONS";
        return null;
    }

    /** Listens to the window the header row is in, and only while it's in one. */
    private static final class GreetingFocus
            implements View.OnAttachStateChangeListener, ViewTreeObserver.OnWindowFocusChangeListener {
        private final View row;
        private ViewTreeObserver observer;

        GreetingFocus(View row) { this.row = row; }

        @Override public void onViewAttachedToWindow(View view) {
            if (observer != null) return;
            observer = view.getViewTreeObserver();
            observer.addOnWindowFocusChangeListener(this);
        }

        @Override public void onViewDetachedFromWindow(View view) {
            if (observer != null && observer.isAlive()) observer.removeOnWindowFocusChangeListener(this);
            observer = null;
        }

        @Override public void onWindowFocusChanged(boolean hasFocus) {
            if (!hasFocus) return;
            try {
                refreshGreetingHeader(row);
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.HIDE_NAVIGATION_BUTTONS, "greeting header", failure);
            }
        }
    }

    /** A layout pass reapplies the selection, including restoring a view when its switch is off. */
    public static void refreshNavigation(View root) {
        try {
            visit(root, view -> {
                String name;
                synchronized (navigation) { name = navigation.get(view); }
                if (name != null) collapse(view, hideNavigation(name));
            });
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_NAVIGATION_BUTTONS, "navigation layout", failure);
        }
    }

    /**
     * Called first in every TabLayout's onMeasure with the height it was offered. While Hide Home
     * tabs is on, Home's row measures at no height, and the pager hanging off its bottom edge moves
     * up. The row stays attached, so Pinterest's pager and tab code run as they always do. Anything
     * beside the row, such as the tuner button, folds with it, and so does the shimmer Pinterest
     * shows in its place while the tabs load. Pinterest hides that shimmer itself once they're in,
     * so it's never put back.
     */
    public static int homeTabsHeight(View tabs, int widthSpec, int heightSpec) {
        try {
            if (tabs == null || !isHomeTabs(tabs)) return heightSpec;
            boolean hide = UiHooks.enabled(FamilyNames.HIDE_NAVIGATION_BUTTONS, Settings.HIDE_HOME_TABS);
            if (tabs.getParent() instanceof ViewGroup) {
                ViewGroup row = (ViewGroup) tabs.getParent();
                for (int index = 0; index < row.getChildCount(); index++) {
                    View child = row.getChildAt(index);
                    if (child != tabs) collapse(child, hide);
                }
                if (hide && row.getParent() instanceof ViewGroup) foldTabsLoading((ViewGroup) row.getParent());
            }
            return hide ? View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.EXACTLY) : heightSpec;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_NAVIGATION_BUTTONS, "home tabs", failure);
            return heightSpec;
        }
    }

    private static boolean isHomeTabs(View tabs) {
        int id = tabs.getId();
        if (id == View.NO_ID) return false;
        if (id == homeTabsId) return true;
        if (!HOME_TABS.equals(resourceName(tabs))) return false;
        homeTabsId = id;
        return true;
    }

    private static void foldTabsLoading(ViewGroup page) {
        for (int index = 0; index < page.getChildCount(); index++) {
            View child = page.getChildAt(index);
            if (child.getVisibility() != View.GONE && HOME_TABS_LOADING.equals(resourceName(child))) {
                child.setVisibility(View.GONE);
            }
        }
    }

    /**
     * Called with the Search page's root as Pinterest finishes creating it. Blank Search page folds
     * every child of the root but the search bar's header and its back button, the list and the
     * loading spinner included. Pinterest shows those again as the page loads, and each time that
     * lays the root out, which folds them again. Coming back from another screen, Hush settings
     * included, brings back window focus, which picks up a changed switch.
     */
    public static void searchLanding(View page) {
        try {
            if (page == null) return;
            boolean first;
            synchronized (searchPages) { first = searchPages.put(page, Boolean.TRUE) == null; }
            if (first) {
                SearchPageWatch watch = new SearchPageWatch(page);
                page.addOnLayoutChangeListener(watch);
                page.addOnAttachStateChangeListener(watch);
                if (page.isAttachedToWindow()) watch.onViewAttachedToWindow(page);
            }
            refreshSearchLanding(page);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_SEARCH_HISTORY, "search page", failure);
        }
    }

    private static void refreshSearchLanding(View page) {
        if (!(page instanceof ViewGroup)) return;
        boolean blank = UiHooks.enabled(FamilyNames.HIDE_SEARCH_HISTORY, Settings.BLANK_SEARCH_PAGE);
        ViewGroup root = (ViewGroup) page;
        for (int index = 0; index < root.getChildCount(); index++) {
            View child = root.getChildAt(index);
            String name = resourceName(child);
            collapse(child, blank && !SEARCH_HEADER.equals(name) && !SEARCH_BACK.equals(name));
        }
    }

    /** The overflow sheet builds its rows after its view exists, and more can arrive as data loads. */
    private static final class PinSheetWatch implements View.OnAttachStateChangeListener,
            ViewTreeObserver.OnGlobalLayoutListener {
        private final View sheet;
        private ViewTreeObserver observer;

        PinSheetWatch(View sheet) { this.sheet = sheet; }

        @Override public void onViewAttachedToWindow(View view) {
            if (observer != null) return;
            observer = view.getViewTreeObserver();
            observer.addOnGlobalLayoutListener(this);
            pinMenuRows(sheet);
        }

        @Override public void onViewDetachedFromWindow(View view) {
            if (observer != null && observer.isAlive()) observer.removeOnGlobalLayoutListener(this);
            observer = null;
        }

        @Override public void onGlobalLayout() {
            pinMenuRows(sheet);
        }
    }

    private static final class SearchPageWatch implements View.OnLayoutChangeListener,
            View.OnAttachStateChangeListener, ViewTreeObserver.OnWindowFocusChangeListener {
        private final View page;
        private ViewTreeObserver observer;

        SearchPageWatch(View page) { this.page = page; }

        @Override public void onLayoutChange(View view, int left, int top, int right, int bottom,
                                             int oldLeft, int oldTop, int oldRight, int oldBottom) {
            refresh();
        }

        @Override public void onViewAttachedToWindow(View view) {
            if (observer != null) return;
            observer = view.getViewTreeObserver();
            observer.addOnWindowFocusChangeListener(this);
        }

        @Override public void onViewDetachedFromWindow(View view) {
            if (observer != null && observer.isAlive()) observer.removeOnWindowFocusChangeListener(this);
            observer = null;
        }

        @Override public void onWindowFocusChanged(boolean hasFocus) {
            if (hasFocus) refresh();
        }

        private void refresh() {
            try {
                refreshSearchLanding(page);
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.HIDE_SEARCH_HISTORY, "search page", failure);
            }
        }
    }

    /**
     * Called first in the bottom bar's click handler. Answers 1 when it has taken the press: Search
     * pressed again while the Search page is showing, with the page's search bar on screen. The bar
     * opens Pinterest's typing screen through its header's touch handling rather than a listener of
     * its own, so it gets a real tap at its center, and Pinterest puts the cursor in the field and
     * brings up the keyboard the way it does for a finger. Any other press carries on as usual, and
     * so does this one if nothing takes the tap.
     */
    public static int searchTabPress(View bar, View tab) {
        try {
            if (bar == null || tab == null) return 0;
            String name;
            synchronized (navigation) { name = navigation.get(tab); }
            if (!"SEARCH".equals(name)) return 0;
            if (!UiHooks.enabled(FamilyNames.HIDE_NAVIGATION_BUTTONS, Settings.SEARCH_TAB_KEYBOARD)) return 0;
            Object forced = searchLocationForTests;
            Object location = forced != null ? forced : currentLocation(bar);
            if (!(location instanceof Enum<?>) || !SEARCH_LOCATION.equals(((Enum<?>) location).name())) return 0;
            View[] field = new View[1];
            visit(bar.getRootView(), view -> {
                if (field[0] == null && SEARCH_BAR.equals(resourceName(view)) && searchHeader(view) != null
                        && onScreen(view)) field[0] = view;
            });
            return field[0] != null && tap(searchHeader(field[0]), field[0]) ? 1 : 0;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_NAVIGATION_BUTTONS, "search tab", failure);
            return 0;
        }
    }

    /** Answers null here. Patching writes the read of the screen the bottom bar's navigation is on. */
    public static Object currentLocation(Object bar) {
        return null;
    }

    private static ViewGroup searchHeader(View field) {
        for (ViewParent parent = field.getParent(); parent instanceof ViewGroup; parent = parent.getParent()) {
            if (SEARCH_HEADER.equals(resourceName((View) parent))) return (ViewGroup) parent;
        }
        return null;
    }

    private static boolean onScreen(View view) {
        if (view.getWidth() <= 0 || view.getHeight() <= 0) return false;
        View current = view;
        while (true) {
            if (current.getVisibility() != View.VISIBLE) return false;
            ViewParent parent = current.getParent();
            if (!(parent instanceof View)) return true;
            current = (View) parent;
        }
    }

    private static boolean tap(ViewGroup header, View field) {
        float x = field.getWidth() / 2f;
        float y = field.getHeight() / 2f;
        for (View view = field; view != header; view = (View) view.getParent()) {
            View parent = (View) view.getParent();
            x += view.getLeft() + view.getTranslationX() - parent.getScrollX();
            y += view.getTop() + view.getTranslationY() - parent.getScrollY();
        }
        long now = SystemClock.uptimeMillis();
        MotionEvent down = MotionEvent.obtain(now, now, MotionEvent.ACTION_DOWN, x, y, 0);
        MotionEvent up = MotionEvent.obtain(now, now, MotionEvent.ACTION_UP, x, y, 0);
        down.setSource(InputDevice.SOURCE_TOUCHSCREEN);
        up.setSource(InputDevice.SOURCE_TOUCHSCREEN);
        try {
            if (!header.dispatchTouchEvent(down)) return false;
            header.dispatchTouchEvent(up);
            return true;
        } finally {
            down.recycle();
            up.recycle();
        }
    }

    /** Only the trailing icon action containers. Back, leading actions, text and avatars remain. */
    public static void headerButtons(View root) {
        try {
            if (root == null) return;
            boolean hide = UiHooks.enabled(FamilyNames.HIDE_HEADER_BUTTONS, Settings.HIDE_HEADER_BUTTONS);
            // The native Saved header builds its COG action with R.string.settings (14.39.0,
            // profile/n0.y3). Read through the host view, never Hush's language context.
            int titleId = ResourceUtils.getIdentifier(root.getContext(), ResourceType.STRING, "settings");
            String settingsTitle = titleId == 0 ? null : root.getResources().getText(titleId).toString();
            visit(root, view -> {
                if (!headerAction(resourceName(view))) return;
                boolean[] containsSettings = {false};
                if (hide && settingsTitle != null) visit(view, child -> {
                    CharSequence label = child.getContentDescription();
                    if (label != null && settingsTitle.contentEquals(label)) containsSettings[0] = true;
                });
                // Keep the ancestor group as well. Optional siblings still get their own visit.
                collapse(view, hide && !containsSettings[0]);
            });
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_HEADER_BUTTONS, "header layout", failure);
        }
    }

    static boolean headerAction(String name) {
        return "end_container_icon_bt".equals(name) || "end_container_icon_buttons".equals(name);
    }

    /** The key comes from a matched native title resource, independently of the display language. */
    public static void pinMenuItem(View view, String resource) {
        try {
            boolean hide = hidePinMenuItem(resource);
            collapse(view, hide);
            // This is construction-time visibility after collapse, before attachment and native
            // menu gating. Only these four patch-supplied constants can enter the census; three
            // outcomes per key fit within HookStatus's fixed sixteen-counter family limit.
            if (view != null && ("overflow_menu_add_to_collage".equals(resource)
                    || "overflow_menu_remix_collage".equals(resource)
                    || "contextmenu_visual_search_image".equals(resource)
                    || "overflow_menu_pin_boost".equals(resource))) {
                String state = hide ? "hidden by fixed switch at construction"
                        : view.getVisibility() == View.VISIBLE ? "visible at construction" : "not visible at construction";
                HookStatus.counted(FamilyNames.HIDE_PIN_MENU_ITEMS, resource + " " + state);
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_PIN_MENU_ITEMS, "pin menu item", failure);
        }
    }

    /** First in the pin menu's onMeasure, so a picked row is gone before the menu takes its height. */
    public static void pinMenuRows(View menu) {
        try {
            PinMenuRows.apply(menu, UiHooks.enabled(FamilyNames.HIDE_PIN_MENU_ITEMS, Settings.HIDE_PIN_MENU_ROWS));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_PIN_MENU_ITEMS, "pin menu rows", failure);
        }
    }

    /** First in the overflow sheet's onViewCreated, with the sheet's view. Its rows come later. */
    public static void pinMenuSheet(View sheet) {
        try {
            if (sheet == null || !UiHooks.enabled(FamilyNames.HIDE_PIN_MENU_ITEMS, Settings.HIDE_PIN_MENU_ROWS)) return;
            synchronized (pinSheets) {
                if (pinSheets.put(sheet, Boolean.TRUE) != null) return;
            }
            PinSheetWatch watch = new PinSheetWatch(sheet);
            sheet.addOnAttachStateChangeListener(watch);
            if (sheet.isAttachedToWindow()) watch.onViewAttachedToWindow(sheet);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_PIN_MENU_ITEMS, "pin menu sheet", failure);
        }
    }

    static boolean hidePinMenuItem(String resource) {
        if ("overflow_menu_add_to_collage".equals(resource) || "overflow_menu_remix_collage".equals(resource)) {
            return UiHooks.enabled(FamilyNames.HIDE_PIN_MENU_ITEMS, Settings.HIDE_PIN_MENU_COLLAGE);
        }
        if ("contextmenu_visual_search_image".equals(resource)) {
            return UiHooks.enabled(FamilyNames.HIDE_PIN_MENU_ITEMS, Settings.HIDE_PIN_MENU_VISUAL_SEARCH);
        }
        if ("overflow_menu_pin_boost".equals(resource)) {
            return UiHooks.enabled(FamilyNames.HIDE_PIN_MENU_ITEMS, Settings.HIDE_PIN_MENU_PIN_BOOST);
        }
        return false;
    }

    /** GONE removes a child from its layout without deleting its model or click handler. */
    static void collapse(View view, boolean hide) {
        if (view == null) return;
        synchronized (hidden) {
            if (hide) {
                if (!hidden.containsKey(view) || view.getVisibility() != View.GONE) {
                    hidden.put(view, view.getVisibility());
                }
                if (view.getVisibility() != View.GONE) view.setVisibility(View.GONE);
            } else {
                Integer original = hidden.remove(view);
                if (original != null && view.getVisibility() == View.GONE) view.setVisibility(original);
            }
        }
    }

    static String resourceName(View view) {
        if (view.getId() == View.NO_ID) return "";
        try { return view.getResources().getResourceEntryName(view.getId()); }
        catch (android.content.res.Resources.NotFoundException ignored) { return ""; }
    }

    private interface Action { void apply(View view); }

    private static void visit(View view, Action action) {
        if (view == null) return;
        action.apply(view);
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int index = 0; index < group.getChildCount(); index++) visit(group.getChildAt(index), action);
        }
    }
}
