/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.view.MotionEvent;
import android.view.View;

import app.hushtelegram.extension.shared.Logger;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import app.hushtelegram.extension.telegram.settings.SettingsEntry;

/**
 * Telegram 13 dropped the menu that slid in from the left of the chat list. With the switch on, a
 * swipe right on the chat list's first folder brings one back, following the finger the way the old
 * one did: your name with Telegram's own account switcher, then My Profile, New Message, Contacts,
 * Calls, Saved Messages and Settings, each opening Telegram's own screen, and HushTelegram settings.
 * Back or a tap beside it closes it.
 *
 * <p>Telegram's pager starts every swipe in one place and turns down a swipe back from its first
 * page before asking anything. The hook sees that swipe and asks the pager's own question about
 * going back, which the chat list answers yes to on its first folder only, so a swipe between
 * folders stays Telegram's.
 */
public final class SideMenu {
    private SideMenu() {}

    /** The Profile page, fourth of the main screen's pages. The patch checks Telegram builds it there. */
    static final int PROFILE = 3;

    static final String SETTINGS_LINK = "tg://settings";
    static final String CALLS_LINK = "tg://calllog";
    static final String SAVED_LINK = "tg://openmessage?user_id=";
    /** The action Telegram's launcher shortcut uses for a new message: its contact list with New Group and New Channel. */
    static final String NEW_MESSAGE = "new_dialog";

    /**
     * The rows under the name, in the order {@link #labels()} gives Telegram's words for the first six.
     * Archived Chats only shows while Hide All Chats has taken the archive's usual way in.
     */
    enum Row { PROFILE, NEW_MESSAGE, CONTACTS, CALLS, SAVED, SETTINGS, ARCHIVE, HUSH }

    /** English for the rows when Telegram's words aren't there, which is only outside a patched app. */
    static final String[] FALLBACK = {"My Profile", "New Message", "Contacts", "Calls", "Saved Messages", "Settings"};

    /** How a row reaches Telegram; a test swaps it to watch what's asked. */
    interface Opener {
        void start(Activity activity, Intent intent);

        default void turnTo(Object screen, int page) { SideMenu.turnTo(screen, page); }

        default void accounts(Object screen, View anchor) { SideMenu.accounts(screen, anchor); }

        default void hushSettings(Activity activity) { SettingsEntry.openFromNative(activity); }
    }

    static volatile Opener opener = Activity::startActivity;

    /** What a swipe has to get past before it opens the menu; a test swaps it to steer each answer. */
    interface Gates {
        default Object screen(Object pager) { return SideMenu.screen(pager); }

        default int page(Object screen) { return MainTabs.page(screen); }

        default boolean mayOpen(Object pager, MotionEvent event) { return SideMenu.mayOpen(pager, event); }

        default void arm(Object screen, View pager, MotionEvent event) { SideMenuPanel.arm(screen, pager, event); }
    }

    static volatile Gates gates = new Gates() {};

    /** The swipe last written to the debug log, by the time its finger went down, so each swipe is logged once. */
    private static long loggedSwipe = Long.MIN_VALUE;

    /**
     * Called as Telegram's pager, any of them, starts a swipe.
     *
     * @param pager the pager
     * @param event the event that started it, a move while the finger's down
     * @param forward whether it goes to the next page rather than the one before
     */
    public static void swipeStarts(Object pager, MotionEvent event, boolean forward) {
        // Telegram also asks on a lift or a second finger; only a moving finger can drag the menu in.
        if (forward || pager == null || event == null || event.getActionMasked() != MotionEvent.ACTION_MOVE) return;
        try {
            Gates gate = gates;
            Object screen = gate.screen(pager);
            if (screen == null || !(pager instanceof View) || !on()) return;
            int page = gate.page(screen);
            if (page != 0) {
                turnedDown(event, "the main screen shows page " + page);
                return;
            }
            if (!gate.mayOpen(pager, event)) {
                turnedDown(event, "the chat list keeps this swipe");
                return;
            }
            turnedDown(event, null);
            gate.arm(screen, (View) pager, event);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_CONTACTS_TAB, "side menu swipe", failure);
        }
    }

    /** Writes once per swipe, with debug logging on, why the menu didn't open, or that it's opening when [why] is null. */
    private static void turnedDown(MotionEvent event, String why) {
        long down = event.getDownTime();
        if (down == loggedSwipe) return;
        loggedSwipe = down;
        Logger.printDebug(() -> why == null ? "Side menu: a swipe back on the first page opens it" : "Side menu: not opening, " + why);
    }

    /**
     * Called first when the main screen hears Back, or is asked whether it would take it.
     *
     * @param screen Telegram's main screen
     * @param invoked whether Back happened, rather than being asked about
     * @return true when the menu is open, which takes Back for itself and closes when it happened
     */
    public static boolean back(Object screen, boolean invoked) {
        try {
            return SideMenuPanel.back(screen, invoked);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_CONTACTS_TAB, "side menu back", failure);
            return false;
        }
    }

    /** Whether the switch is on and HushTelegram isn't paused. */
    static boolean on() {
        HookStatus.invoked(FamilyNames.HIDE_CONTACTS_TAB);
        try {
            return Utils.settingsReady() && Settings.SIDE_MENU.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_CONTACTS_TAB, "side menu switch", failure);
            return false;
        }
    }

    /** The words for each row, Telegram's own in its language where it has them. */
    static String[] rowLabels() {
        String[] telegram = null;
        try {
            telegram = labels();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_CONTACTS_TAB, "side menu labels", failure);
        }
        String[] words = new String[Row.values().length];
        for (int i = 0; i < FALLBACK.length; i++) {
            String own = telegram != null && i < telegram.length ? telegram[i] : null;
            words[i] = own == null || own.isEmpty() ? FALLBACK[i] : own;
        }
        words[Row.ARCHIVE.ordinal()] = LaunchFolder.archiveTitle();
        words[Row.HUSH.ordinal()] = SettingsEntry.nativeSettingsTitle();
        return words;
    }

    /** Does what a row says, from the main screen in the given activity. */
    static void open(Row row, Object screen, Activity activity) {
        switch (row) {
            case PROFILE:
                opener.turnTo(screen, PROFILE);
                break;
            case NEW_MESSAGE:
                opener.start(activity, action(activity, NEW_MESSAGE));
                break;
            case CONTACTS:
                // With the Contacts tab gone its page stays out of the way, and the contact list opens on its own.
                if (MainTabs.on()) opener.start(activity, action(activity, NEW_MESSAGE));
                else opener.turnTo(screen, MainTabs.CONTACTS);
                break;
            case CALLS:
                opener.start(activity, link(activity, CALLS_LINK));
                break;
            case SAVED:
                long self = selfId(screen);
                if (self == 0) return;
                opener.start(activity, link(activity, SAVED_LINK + self));
                break;
            case SETTINGS:
                opener.start(activity, link(activity, SETTINGS_LINK));
                break;
            case ARCHIVE:
                if (!LaunchFolder.openArchive()) return;
                break;
            case HUSH:
                opener.hushSettings(activity);
                break;
        }
        HookStatus.counted(FamilyNames.HIDE_CONTACTS_TAB, "side menu opened " + row.name().toLowerCase(java.util.Locale.ROOT).replace('_', ' '));
    }

    /** A Telegram link for the activity Telegram's screens live in, which opens it the way a tapped link does. */
    static Intent link(Activity activity, String uri) {
        return new Intent(Intent.ACTION_VIEW, Uri.parse(uri)).setClassName(activity, activity.getClass().getName());
    }

    static Intent action(Activity activity, String action) {
        return new Intent(action).setClassName(activity, activity.getClass().getName());
    }

    /** The main screen a pager belongs to, or null for any other pager. Replaced when patching. */
    public static Object screen(Object pager) { return null; }

    /** The main screen pager's own answer to whether a swipe may go back from the page showing. Replaced when patching. */
    public static boolean mayOpen(Object pager, MotionEvent event) { return false; }

    /** Slides the main screen to a page and marks its tab. Replaced when patching. */
    public static void turnTo(Object screen, int page) {}

    /** Shows Telegram's account switcher from a view, the one a long press on the Profile tab shows. Replaced when patching. */
    public static void accounts(Object screen, View anchor) {}

    /** Telegram's words for the first six rows, in its language. Replaced when patching. */
    public static String[] labels() { return null; }

    /** The id of the screen's own account, or 0. Replaced when patching. */
    public static long selfId(Object screen) { return 0; }

    /** The name on the screen's own account, or null. Replaced when patching. */
    public static String selfName(Object screen) { return null; }
}
