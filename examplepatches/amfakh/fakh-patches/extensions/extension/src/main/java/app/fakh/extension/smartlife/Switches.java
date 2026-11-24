/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.smartlife;

import android.content.Context;
import android.content.Intent;
import android.util.Log;
import android.view.View;
import android.widget.TabHost;
import android.widget.TabWidget;
import android.widget.TextView;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

import app.fakh.extension.shared.Features;
import app.fakh.extension.shared.SwipeTabs;

/**
 * The hooks of the patches that have a switch, and the Fakh Patches row in Settings that opens their page. Which
 * switches exist, their titles and defaults come from {@link Features}, which the patches fill in at patch time.
 */
public final class Switches {
    /** Glass navigation bar and glass cards. */
    static final String LIQUID_GLASS = "fakh_liquid_glass";
    /** Dark device panels. */
    static final String DARK_PANELS = "fakh_dark_panels";
    /** The text under the icons of the navigation bar. */
    static final String HIDE_TAB_LABELS = "fakh_hide_tab_labels";
    /** Swipe between tabs. */
    private static final String SWIPE_TABS = "fakh_swipe_tabs";
    private static final String PLUS = "fakh_hide_plus";
    private static final String EXPLORE = "fakh_hide_explore";
    private static final String MALL_TAB = "fakh_hide_mall_tab";
    private static final String DISCOVERY_TAB = "fakh_hide_discovery_tab";

    /** The About cell that is the Fakh Patches row, for each Settings page. */
    private static final Map<Context, Object> rows = new WeakHashMap<>();

    private Switches() {
    }

    /**
     * Whether the switch {@code key} is on, and off when its patch is not in the app. Asked by the patches' code
     * before it hides or changes anything.
     *
     * @param key the switch's key
     * @return the switch's state
     */
    public static boolean on(String key) {
        return Features.on(key);
    }

    /** Whether the glass navigation bar and glass cards are on. */
    static boolean liquidGlass(Context context) {
        return on(LIQUID_GLASS);
    }

    /** Whether the navigation bar hides the labels under its icons. */
    static boolean hideTabLabels() {
        return on(HIDE_TAB_LABELS);
    }

    /** Whether dark device panels are on. */
    static boolean darkPanels(Context context) {
        return on(DARK_PANELS);
    }

    /**
     * Injected before each return of the navigation bar's tab config loader: drops the tabs whose hide switch is on.
     * The loader caches what it returns, so a change applies after a restart.
     *
     * @param module the loaded TabModule, or null
     */
    @SuppressWarnings("unchecked")
    public static void tabs(Object module) {
        if (module == null) return;
        try {
            List<Object> tabs = (List<Object>) module.getClass().getField("tabList").get(module);
            if (tabs == null) return;
            for (Iterator<Object> it = tabs.iterator(); it.hasNext(); ) {
                Object name = it.next();
                name = name.getClass().getField("name").get(name);
                if ("thing_smart_tab".equals(name) && on(EXPLORE) || "mall".equals(name) && on(MALL_TAB)
                    || "miniappa".equals(name) && on(DISCOVERY_TAB)) it.remove();
            }
        } catch (ReflectiveOperationException | RuntimeException failure) {
            // The tabs stay as the app loaded them.
        }
    }

    /**
     * Injected before each return of the home theme's background transformer.
     *
     * @param themed   the drawable with the theme's picture
     * @param original the plain drawable the theme started from
     * @return the plain drawable while the hide background switch is on, else {@code themed}
     */
    public static Object background(Object themed, Object original) {
        return on("fakh_hide_background") && original != null ? original : themed;
    }

    /**
     * Injected after the tab host adds a tab: a sideways swipe on a screen of the bottom bar opens the next or
     * previous tab while the switch is on. Every call points the swipe at the host's bar.
     *
     * @param host the app's tab host
     */
    public static void swipeTabs(TabHost host) {
        TabWidget widget = host.getTabWidget();
        if (widget == null) return;
        SwipeTabs.install(widget, widget, new SwipeTabs.Host() {
            @Override
            public boolean enabled() {
                return on(SWIPE_TABS);
            }

            @Override
            public View content(View bar) {
                return host.getTabContentView();
            }

            @Override
            public float menuEdgeDp() {
                return 0;
            }

            @Override
            public void log(String message) {
            }

            @Override
            public boolean turnsLockedPagers() {
                // Scene keeps Automation and Tap-to-Run in a ViewPager with its swipe turned off.
                return true;
            }

            @Override
            public void error(String message, Throwable failure) {
                Log.w("FakhSmartLife", message, failure);
            }
        });
    }

    /**
     * Injected at the end of the Plus pill's constructor: hides the pill while its switch is on.
     *
     * @param menu the AIPlusMenuView
     */
    public static void plus(View menu) {
        if (!on(PLUS)) return;
        View pill = menu.findViewById(menu.getResources().getIdentifier("iv_plus", "id", menu.getContext().getPackageName()));
        if (pill != null) pill.setVisibility(View.GONE);
    }

    /**
     * Injected at the end of the About cell's bind: the Fakh Patches row gets its title and opens the switches' page.
     * The row is in Settings only when a patch with a switch is in the app.
     *
     * @param cell   the AboutCell being bound
     * @param holder its view holder, or the holder's item view
     */
    public static void bound(Object cell, Object holder) {
        View row;
        try {
            // R8 reuses the holder's register for its item view by the end of the bind.
            row = holder instanceof View ? (View) holder : (View) holder.getClass().getField("itemView").get(holder);
        } catch (ReflectiveOperationException failure) {
            return;
        }
        Context context = row.getContext();
        // The page binds its rows from the top, and the Fakh Patches row is above About: the first About cell bound
        // on a Settings page is the Fakh Patches row, and stays it on every bind after.
        if (!rows.containsKey(context)) rows.put(context, cell);
        if (rows.get(context) != cell) return;
        TextView title = row.findViewById(context.getResources().getIdentifier("menu_list_title", "id", context.getPackageName()));
        if (title != null) title.setText("Fakh Patches");
        row.setOnClickListener(view -> context.startActivity(new Intent(context, FakhPatchesActivity.class)));
    }
}
