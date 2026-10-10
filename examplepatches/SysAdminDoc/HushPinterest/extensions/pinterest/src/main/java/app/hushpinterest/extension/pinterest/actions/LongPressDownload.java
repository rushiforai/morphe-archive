/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.actions;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;

import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.PatchFamily;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;

/**
 * A Download button in the circular menu a long-pressed pin opens.
 *
 * <p>Pinterest gives the menu its buttons first and shows it second, and only the show call says
 * what was long-pressed. So the hook runs at the head of the show call. For anything but a pin, or
 * with a switch off, it returns without touching the menu. For a pin it takes the buttons the menu
 * just laid out, adds Pinterest's own Download button after them and has the menu lay them out
 * again, so the arc, the entry animation and release-to-select all come from Pinterest.
 *
 * <p>The menu's touch handling calls performClick() on the button under the finger before it
 * closes, so a plain click listener is enough. The pin is held weakly, and a click only downloads
 * while the menu still names that pin: Pinterest clears the name when the menu closes.
 */
public final class LongPressDownload {
    private LongPressDownload() {}

    static final String ITEM_TAG = "hushpinterest_long_press_download";

    /** Rewritten to return the long-pressed model the show event carries when it's a pin, else null. */
    private static Object eventPin(Object event) { return null; }

    /** Rewritten to read the id the menu keeps for the model it's showing, cleared when it closes. */
    private static String menuModel(Object menu) { return null; }

    /** Rewritten to read a model's id through the getter Pinterest fills the menu's id from. */
    private static String modelId(Object model) { return null; }

    /** Rewritten to return the menu's laid-out buttons: its own origin marker first, then each button in order. */
    private static ArrayList<Object> menuItems(Object menu) { return null; }

    /** Rewritten to hand the menu a new button list through its own layout method. */
    private static void layoutItems(Object menu, List<Object> buttons) {}

    /**
     * Rewritten to build Pinterest's own menu button with its Download icon and "Download" label,
     * styled the way Pinterest styles the rest.
     */
    private static View downloadItem(Context context) { return null; }

    static boolean active() {
        try {
            return Utils.settingsReady() && PatchFamily.Capability.LONG_PRESS_MENU.installed()
                    && Settings.LONG_PRESS_DOWNLOAD.get() && PinDownloads.active();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.LONG_PRESS_DOWNLOAD, "switch read", failure);
            return false;
        }
    }

    /**
     * The menu is about to show for [event]. A long-pressed pin gets the Download button after
     * Pinterest's own. Anything else keeps the menu exactly as Pinterest laid it out.
     */
    public static void show(Object menu, Object event) {
        HookStatus.invoked(FamilyNames.LONG_PRESS_DOWNLOAD);
        if (!active() || !(menu instanceof ViewGroup)) return;
        try {
            Object pin = eventPin(event);
            if (pin == null) return;
            String id = modelId(pin);
            ArrayList<Object> laidOut = menuItems(menu);
            if (id == null || laidOut == null || laidOut.isEmpty()) return;
            for (Object laid : laidOut) {
                if (!(laid instanceof View) || ITEM_TAG.equals(((View) laid).getTag())) return;
            }
            List<Object> buttons = new ArrayList<>(laidOut.subList(1, laidOut.size()));
            ViewGroup group = (ViewGroup) menu;
            View item = downloadItem(group.getContext());
            if (item == null) return;
            item.setTag(ITEM_TAG);
            WeakReference<Object> heldMenu = new WeakReference<>(menu);
            WeakReference<Object> heldPin = new WeakReference<>(pin);
            item.setOnClickListener(clicked -> download(clicked, heldMenu, heldPin, id));
            buttons.add(item);
            // Everything that can fail has run. The menu's layout puts back an origin marker of its
            // own, so it starts from a menu with no buttons at all, as it did a moment ago.
            for (Object laid : laidOut) group.removeView((View) laid);
            laidOut.clear();
            layoutItems(menu, buttons);
            HookStatus.counted(FamilyNames.LONG_PRESS_DOWNLOAD, "download button added to long-press menu");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.LONG_PRESS_DOWNLOAD, "add long-press download button", failure);
        }
    }

    /** The finger let go on the button: the pin saves the way the pin menu's Download pin saves it. */
    private static void download(View clicked, WeakReference<Object> heldMenu, WeakReference<Object> heldPin, String id) {
        try {
            if (!active()) return;
            Object menu = heldMenu.get();
            Object pin = heldPin.get();
            if (menu == null || pin == null || !id.equals(menuModel(menu))) {
                HookStatus.counted(FamilyNames.LONG_PRESS_DOWNLOAD, "closed menu download refused");
                return;
            }
            if (PinDownloads.start(pin, clicked.getContext())) {
                HookStatus.counted(FamilyNames.LONG_PRESS_DOWNLOAD, "long-press download started");
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.LONG_PRESS_DOWNLOAD, "long-press download", failure);
        }
    }
}
