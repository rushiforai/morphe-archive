/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.view.View;

import java.util.Map;
import java.util.WeakHashMap;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Telegram's main screen has a bar at the bottom with Chats, Contacts, Calls or Settings, and your
 * profile, and a swipe moves between their pages. With the switch on the Contacts tab is left out
 * of the bar and a swipe doesn't stop on its page. Telegram sets up the bar when it builds the main
 * screen and again whenever Calls and Settings trade places, and the tab is hidden each time, so
 * that choice keeps working. The chat list's new message button still opens the contact list.
 *
 * <p>The compact switch, independent of that one, trims the bar itself. Telegram makes it 72 dp
 * tall with 12 dp around 48 dp tabs, rounds its glass background to 28 dp and stretches the tabs to
 * at least 320 dp across. Compact makes it 64 dp with 8 dp around the same 48 dp tabs, a 24 dp
 * round to match, and lets the tabs stay as narrow as 192 dp all told, 48 dp each for four.
 */
public final class MainTabs {
    /** The Contacts page, second of the main screen's pages; its tab is the second in the bar too. */
    static final int CONTACTS = 1;

    /** The compact bar's height in dp, so its tabs keep Telegram's 48 dp inside {@link #COMPACT_PADDING}. */
    static final int COMPACT_HEIGHT = 64;
    /** Room in dp around the compact bar's tabs, just outside the glass background's 7.67 dp inset. */
    static final float COMPACT_PADDING = 8f;
    /** The compact glass background's corner in dp, half its height the way Telegram's 28 dp is. */
    static final float COMPACT_CORNER = 24f;
    /** The least the compact bar's tabs stretch to across, in dp: four 48 dp tabs. */
    static final float COMPACT_MIN_WIDTH = 192f;

    /** Only views given the compose icon, with the last visibility Telegram requested. */
    private static final Map<View, Integer> newMessageButtons = new WeakHashMap<>();

    private MainTabs() {}

    /**
     * The room around the bar's tabs, in dp, as the main screen builds the bar.
     *
     * @param stock Telegram's 12 dp
     */
    public static float barPadding(float stock) {
        return compact("padding") ? COMPACT_PADDING : stock;
    }

    /**
     * The corner of the bar's glass background, in dp, as the main screen builds the bar.
     *
     * @param stock Telegram's 28 dp
     */
    public static float barCorner(float stock) {
        return compact("corner") ? COMPACT_CORNER : stock;
    }

    /**
     * The bar's height in dp, as the main screen lays it out.
     *
     * @param stock Telegram's 72 dp
     */
    public static int barHeight(int stock) {
        if (!compact("height")) return stock;
        HookStatus.counted(FamilyNames.HIDE_CONTACTS_TAB, "bar built compact");
        return COMPACT_HEIGHT;
    }

    /**
     * The least the bar's tabs stretch to across, in dp, each time the bar measures itself.
     *
     * @param stock Telegram's 320 dp
     */
    public static float barMinWidth(float stock) {
        return compact("width") ? COMPACT_MIN_WIDTH : stock;
    }

    /**
     * Registers the chat list's compose instance before its icon is assigned. Its native animator
     * can write visibility again later, so those writes also pass through {@link #newMessageVisibility}.
     * Weak keys let Telegram release the screen normally.
     *
     * @param button the chat list's round button
     */
    public static void newMessageButton(Object button) {
        if (!(button instanceof View)) return;
        View view = (View) button;
        try {
            int stock;
            synchronized (newMessageButtons) {
                Integer previous = newMessageButtons.get(view);
                stock = previous == null ? view.getVisibility() : previous;
                newMessageButtons.put(view, stock);
            }
            newMessageVisibility(view, stock);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_CONTACTS_TAB, "new message button", failure);
        }
    }

    /** The same widget has a Done role in chat selection. That role always follows Telegram. */
    public static void newMessageDone(Object button) {
        if (!(button instanceof View)) return;
        View view = (View) button;
        Integer stock;
        synchronized (newMessageButtons) {
            stock = newMessageButtons.remove(view);
        }
        if (stock != null) view.setVisibility(stock);
    }

    /**
     * Replaces only the floating-button animator's visibility write. Its story, progress and other
     * screen views aren't registered here, so their requested visibility passes through unchanged.
     * Keep the native value even while hidden, including GONE during search or a transition.
     */
    public static void newMessageVisibility(Object button, int visibility) {
        if (!(button instanceof View)) return;
        View view = (View) button;
        boolean compose;
        synchronized (newMessageButtons) {
            compose = newMessageButtons.containsKey(view);
            if (compose) newMessageButtons.put(view, visibility);
        }
        int applied = visibility;
        if (compose) {
            HookStatus.invoked(FamilyNames.HIDE_CONTACTS_TAB);
            try {
                if (Utils.settingsReady() && Settings.HIDE_NEW_MESSAGE.get()) {
                    applied = View.GONE;
                    HookStatus.counted(FamilyNames.HIDE_CONTACTS_TAB, "new message button hidden");
                }
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.HIDE_CONTACTS_TAB, "new message visibility", failure);
            }
        }
        view.setVisibility(applied);
    }

    static void clearNewMessageButtonsForTests() {
        synchronized (newMessageButtons) {
            newMessageButtons.clear();
        }
    }

    /** Whether the compact switch is on and HushTelegram isn't paused, asked for one of the bar's sizes. */
    static boolean compact(String size) {
        HookStatus.invoked(FamilyNames.HIDE_CONTACTS_TAB);
        try {
            return Utils.settingsReady() && Settings.COMPACT_TAB_BAR.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_CONTACTS_TAB, "compact bar " + size, failure);
            return false;
        }
    }

    /**
     * Called each time Telegram has set which tabs the bar shows: when the main screen is built,
     * without animation, and when Calls and Settings trade places, with it.
     *
     * @param screen Telegram's main screen
     * @param animated whether Telegram animates the change
     */
    public static void tabsShown(Object screen, boolean animated) {
        if (!on() || screen == null) return;
        try {
            // The bar is built after the main screen's first call here; nothing to hide before that.
            if (!hideContacts(screen, animated)) return;
            HookStatus.counted(FamilyNames.HIDE_CONTACTS_TAB, "Contacts tab hidden");
            if (leavesContacts(page(screen))) showChats(screen, animated);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_CONTACTS_TAB, "tab bar", failure);
        }
    }

    /**
     * Asked before a swipe on the main screen moves one page on or back.
     *
     * @param position the page showing now
     * @param forward whether the swipe moves to the next page rather than the one before
     * @return true to stop the swipe, which Telegram then treats as one its page turned down
     */
    public static boolean blocksSwipe(int position, boolean forward) {
        if (!on() || !landsOnContacts(position, forward)) return false;
        HookStatus.counted(FamilyNames.HIDE_CONTACTS_TAB, "swipe to Contacts stopped");
        return true;
    }

    /** Whether a swipe from {@code position} that way would land on the Contacts page. */
    static boolean landsOnContacts(int position, boolean forward) {
        return (forward ? position + 1 : position - 1) == CONTACTS;
    }

    /** Whether the main screen has to move off {@code page} now that its tab is gone. */
    static boolean leavesContacts(int page) {
        if (page != CONTACTS) return false;
        HookStatus.counted(FamilyNames.HIDE_CONTACTS_TAB, "moved from Contacts to Chats");
        return true;
    }

    /** Whether the switch is on and HushTelegram isn't paused. */
    static boolean on() {
        HookStatus.invoked(FamilyNames.HIDE_CONTACTS_TAB);
        try {
            return Utils.settingsReady() && Settings.HIDE_CONTACTS_TAB.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_CONTACTS_TAB, "switch", failure);
            return false;
        }
    }

    /**
     * Hides the Contacts tab in the main screen's bar, the way Telegram hides Calls or Settings.
     * False when the bar isn't built yet. Replaced when patching.
     */
    public static boolean hideContacts(Object screen, boolean animated) { return false; }

    /** The page the main screen shows, or -1 before its pages are built. Replaced when patching. */
    public static int page(Object screen) { return -1; }

    /**
     * Turns the main screen to Chats and marks its tab. With {@code animated} it slides there the way
     * Telegram leaves the Calls page when that tab goes; without, it's simply set, as Telegram sets
     * the first page while it builds the screen. Replaced when patching.
     */
    public static void showChats(Object screen, boolean animated) {}
}
