/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ui;

import android.view.View;
import android.view.ViewGroup;

import java.util.Map;
import java.util.WeakHashMap;

import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;

/** Keeps host tab models and menu actions intact while folding away selected views. */
public final class InterfaceControls {
    private InterfaceControls() {}

    private static final Map<View, String> navigation = new WeakHashMap<>();
    private static final Map<View, Integer> hidden = new WeakHashMap<>();

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
        return false;
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

    /** Only the trailing icon action containers. Back, leading actions, text and avatars remain. */
    public static void headerButtons(View root) {
        try {
            boolean hide = UiHooks.enabled(FamilyNames.HIDE_HEADER_BUTTONS, Settings.HIDE_HEADER_BUTTONS);
            visit(root, view -> {
                if (headerAction(resourceName(view))) collapse(view, hide);
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
            // Only these four patch-supplied constants can enter the census. Three possible
            // outcomes per key fit within HookStatus's fixed sixteen-counter family limit.
            if (view != null && ("overflow_menu_add_to_collage".equals(resource)
                    || "overflow_menu_remix_collage".equals(resource)
                    || "contextmenu_visual_search_image".equals(resource)
                    || "overflow_menu_pin_boost".equals(resource))) {
                String state = hide ? "hidden by fixed switch"
                        : view.getVisibility() == View.VISIBLE ? "visible" : "not visible in native layout";
                HookStatus.counted(FamilyNames.HIDE_PIN_MENU_ITEMS, resource + " " + state);
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_PIN_MENU_ITEMS, "pin menu item", failure);
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
    private static void collapse(View view, boolean hide) {
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

    private static String resourceName(View view) {
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
