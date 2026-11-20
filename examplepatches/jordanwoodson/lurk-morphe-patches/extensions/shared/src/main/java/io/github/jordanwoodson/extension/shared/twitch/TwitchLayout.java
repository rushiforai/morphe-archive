package io.github.jordanwoodson.extension.shared.twitch;

import android.app.Application;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

import io.github.jordanwoodson.extension.shared.Logger;
import io.github.jordanwoodson.extension.shared.settings.Settings;

/** Layout choices for Twitch's main screen and player backend. Each one keeps Twitch's behaviour while it's off. */
@SuppressWarnings("unused")
public final class TwitchLayout {
    private static final String TOP_LAYOUT = "lurk_viewer_landing_top";
    private static final String TOP_TAG = "lurk_top";
    /** Material's NavigationBarView.LABEL_VISIBILITY_UNLABELED. */
    private static final int UNLABELED = 2;

    private TwitchLayout() {
    }

    // ---------------------------------------------------------------------------------------------
    // Tablet layout

    /**
     * Injection point: each read of Twitch's isTablet and is_tablet resources, true on tablets (smallest
     * width 600 dp). isTablet makes Twitch's device form factor Tablet.
     */
    public static boolean tablet(boolean stock) {
        return stock || Settings.isEnabled("tablet_layout");
    }

    /**
     * Injection point: each read of Twitch's following_drawer_use_sidebar resource, true on screens 1024 dp
     * wide: the navigation rail instead of the bottom bar, with the Following sidebar next to it. Twitch reads
     * it again on every rotation. A phone held upright only gets it when asked for: signed in, Twitch opens
     * its 320 dp sidebar next to the rail, which leaves little of the screen.
     */
    public static boolean navigationRail(boolean stock) {
        if (stock || !Settings.isEnabled("tablet_layout")) return stock;
        if (Settings.isEnabled("tablet_rail_portrait")) return true;
        try {
            return TwitchContext.application().getResources().getConfiguration().orientation == Configuration.ORIENTATION_LANDSCAPE;
        } catch (RuntimeException e) {
            return false;
        }
    }

    // ---------------------------------------------------------------------------------------------
    // Navigation bar

    /** 0 bottom, 1 bottom with icons only, 2 top, 3 top with icons only. */
    private static int navigationBar() {
        return Settings.getInt("navigation_bar");
    }

    /** Injection point: the main screen's layout, replaced by the copy with the bar at the top. */
    public static int landingLayout(int stock) {
        int choice = navigationBar();
        if (choice != 2 && choice != 3) return stock;
        try {
            Resources resources = TwitchContext.application().getResources();
            int top = resources.getIdentifier(TOP_LAYOUT, "layout", resources.getResourcePackageName(stock));
            if (top != 0) return top;
            Logger.d("navigation bar: no " + TOP_LAYOUT);
        } catch (RuntimeException e) {
            Logger.d("navigation bar: " + e);
        }
        return stock;
    }

    /**
     * Injection point: the end of the main screen's insets listener, which has just given the bar's group
     * ({@code group}) a bottom margin for the gesture or navigation bar.
     */
    public static void landingInsets(View group) {
        if (group == null) return;
        ViewParent parent = group.getParent();
        if (TOP_TAG.equals(group.getTag()) && parent instanceof View) {
            // The group is anchored to the top, where that margin does nothing: the screen gets the inset.
            ViewGroup.LayoutParams params = group.getLayoutParams();
            if (params instanceof ViewGroup.MarginLayoutParams) {
                View layout = (View) parent;
                int bottom = ((ViewGroup.MarginLayoutParams) params).bottomMargin;
                if (layout.getPaddingBottom() != bottom) {
                    layout.setPadding(layout.getPaddingLeft(), layout.getPaddingTop(), layout.getPaddingRight(), bottom);
                }
            }
        }
        int choice = navigationBar();
        if (choice == 1 || choice == 3) {
            // The bars in the group (viewer, creator) and the navigation rail next to it.
            hideLabels(group);
            if (parent instanceof ViewGroup) hideLabels((ViewGroup) parent);
        }
        hideButtons(group);
    }

    // Navigation buttons (issue 78): setting key, menu item ID.
    private static final String[][] BUTTONS = {
        {"nav_hide_create", "viewer_bottom_nav_create_placeholder"},
        {"nav_hide_browse", "viewer_bottom_nav_explore"},
        {"nav_hide_activity", "viewer_bottom_nav_activity"},
    };
    private static final Map<View, Boolean> watched = Collections.synchronizedMap(new WeakHashMap<>());

    /**
     * Hides the navigation buttons switched off in Lurk settings, in the bars of the group and the rail beside it,
     * and the round Create button over its empty slot. Twitch shows the Create button and its slot again when its
     * own state changes, so this runs again after every layout of the group.
     */
    private static void hideButtons(View group) {
        boolean any = false;
        for (String[] button : BUTTONS) any |= Settings.isEnabled(button[0]);
        if (!any) return;
        applyHiddenButtons(group);
        if (watched.put(group, Boolean.TRUE) == null) {
            group.getViewTreeObserver().addOnGlobalLayoutListener(() -> applyHiddenButtons(group));
            Logger.d("navigation bar: hiding buttons");
        }
    }

    private static void applyHiddenButtons(View group) {
        try {
            Resources resources = group.getResources();
            String app = resources.getResourcePackageName(group.getId());
            List<View> bars = new ArrayList<>();
            collectBars(group, bars);
            if (group.getParent() instanceof ViewGroup) collectBars((View) group.getParent(), bars);
            for (String[] button : BUTTONS) {
                if (!Settings.isEnabled(button[0])) continue;
                int id = resources.getIdentifier(button[1], "id", app);
                if (id == 0) continue;
                for (View bar : bars) {
                    Menu menu = (Menu) bar.getClass().getMethod("getMenu").invoke(bar);
                    MenuItem item = menu == null ? null : menu.findItem(id);
                    if (item != null && item.isVisible()) item.setVisible(false);
                }
            }
            if (Settings.isEnabled(BUTTONS[0][0])) {
                View create = group.findViewById(resources.getIdentifier("custom_create_bottom_nav_button", "id", app));
                if (create != null && create.getVisibility() != View.GONE) create.setVisibility(View.GONE);
            }
        } catch (ReflectiveOperationException | RuntimeException e) {
            Logger.d("navigation bar buttons: " + e);
        }
    }

    /** The navigation bars and rails directly in [container]: the views with a menu. */
    private static void collectBars(View container, List<View> bars) {
        if (!(container instanceof ViewGroup)) return;
        ViewGroup parent = (ViewGroup) container;
        for (int i = 0; i < parent.getChildCount(); i++) {
            View child = parent.getChildAt(i);
            try {
                if (Menu.class.isAssignableFrom(child.getClass().getMethod("getMenu").getReturnType())) bars.add(child);
            } catch (NoSuchMethodException notABar) {
                // Not a navigation bar.
            }
        }
    }

    private static void hideLabels(View container) {
        if (!(container instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) container;
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            try {
                Method setter = child.getClass().getMethod("setLabelVisibilityMode", int.class);
                Method getter = child.getClass().getMethod("getLabelVisibilityMode");
                if (!Integer.valueOf(UNLABELED).equals(getter.invoke(child))) setter.invoke(child, UNLABELED);
            } catch (NoSuchMethodException notABar) {
                // Not a navigation bar.
            } catch (ReflectiveOperationException | RuntimeException e) {
                Logger.d("navigation bar labels: " + e);
            }
        }
    }

    // ---------------------------------------------------------------------------------------------
    // Force ExoPlayer

    /**
     * Injection point: the start of the player configuration's constructor. {@code format} is the content
     * format: HLS for live channels and videos, MP4 for clips and feed videos. Twitch's ExoPlayer backend
     * plays HLS manifests but not clip manifests, so only HLS is moved to it.
     */
    public static boolean forceExoPlayer(boolean stock, Enum<?> format) {
        if (stock || format == null || !"HLS".equals(format.name())) return stock;
        if (!Settings.isEnabled("force_exoplayer")) return false;
        Logger.d("player: ExoPlayer for " + format.name());
        return true;
    }

    // ---------------------------------------------------------------------------------------------
}
