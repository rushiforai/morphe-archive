/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.Context;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.BooleanSetting;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import app.hushtelegram.extension.telegram.settings.SettingsLock;

/**
 * Do Not Disturb in the chat list's menu (#79). With its switch on, the menu at the top of the
 * chat list ends with one more item, and a tap there turns Do Not Disturb on or off. While it's on,
 * Telegram's NotificationsController stops in showOrUpdateNotification right where it would post or
 * update a message notification, so nothing shows, sounds or vibrates, and the sound for a message
 * arriving in the chat you have open stays off too. It still clears its notifications once nothing
 * is left unread. Messages still arrive, unread counts still rise and calls ring as before. Turning
 * it off, turning the switch off or pausing HushTelegram puts Telegram's own notifications back, and
 * the next message brings up the ones it held. Off by default.
 */
public final class DoNotDisturb {
    private DoNotDisturb() {
    }

    static final String MENU_ITEM = "Do Not Disturb item in the chat list menu";
    static final String HELD = "message notifications held by Do Not Disturb";
    static final String CHAT_SOUND = "in-chat sounds held by Do Not Disturb";
    static final String TOGGLE = "Do Not Disturb toggle";

    static final class Stored {
        /**
         * Whether Do Not Disturb is on now, flipped from the menu. It counts only while
         * {@link Settings#DND_MENU} is on and starts off each time that switch changes. Kept here
         * rather than in Settings, so a settings file never carries it: an import would silence a
         * phone where nobody tapped the menu. Paused, it answers off like every switch.
         */
        static final BooleanSetting ON = new BooleanSetting("hushtelegram_dnd_on", false, false, false);

        private Stored() {
        }
    }

    /** Adds one item to Telegram's menu: the patch gives {@link #addItem} the menu's own add. */
    interface Menu {
        void add(Object options, int icon, CharSequence text, Runnable onTap);
    }

    static Menu menu = DoNotDisturb::addItem;

    /**
     * Called by the patch just before the chat list's menu shows, with Telegram's menu. Adds the
     * item, which says what a tap will do and so whether Do Not Disturb is on now.
     */
    public static void menu(Object options) {
        HookStatus.invoked(FamilyNames.PROXY_MENU);
        try {
            if (options == null || !Utils.settingsReady() || !Settings.DND_MENU.get()) return;
            boolean on = Stored.ON.get();
            Context context = Utils.getContext();
            String name = on ? "msg_unmute" : "msg_mute";
            int icon = context == null ? 0 : context.getResources().getIdentifier(name, "drawable", context.getPackageName());
            menu.add(options, icon, on ? L10n.t("Turn off Do Not Disturb") : L10n.t("Turn on Do Not Disturb"), DoNotDisturb::toggle);
            HookStatus.counted(FamilyNames.PROXY_MENU, MENU_ITEM);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.PROXY_MENU, MENU_ITEM, failure);
        }
    }

    /**
     * Called by the patch in showOrUpdateNotification, on Telegram's notification queue, where it
     * goes on to post or update a message notification. True returns from it there.
     */
    public static boolean quiet() {
        HookStatus.invoked(FamilyNames.PROXY_MENU);
        try {
            if (!on()) return false;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.PROXY_MENU, HELD, failure);
            return false;
        }
        HookStatus.counted(FamilyNames.PROXY_MENU, HELD);
        return true;
    }

    /**
     * Called by the patch where a new message in the chat you have open reads Telegram's in-chat
     * sound switch, with that switch's value. The answer stands in for it.
     */
    public static boolean chatSound(int enabled) {
        HookStatus.invoked(FamilyNames.PROXY_MENU);
        if (enabled == 0) return false;
        try {
            if (!on()) return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.PROXY_MENU, CHAT_SOUND, failure);
            return true;
        }
        HookStatus.counted(FamilyNames.PROXY_MENU, CHAT_SOUND);
        return false;
    }

    /**
     * The switch on the settings page changed: Do Not Disturb starts off each time, so turning the
     * switch back on later never silences anything nobody asked for.
     */
    public static void switched() {
        try {
            Stored.ON.save(false);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.PROXY_MENU, TOGGLE, failure);
        }
    }

    private static boolean on() {
        return Utils.settingsReady() && Settings.DND_MENU.get() && Stored.ON.get();
    }

    /** A tap on the item: Do Not Disturb flips, and a toast says which way. */
    static void toggle() {
        try {
            if (!Utils.settingsReady() || !Settings.DND_MENU.get() || SettingsLock.refuses()) return;
            // Read and written in one queued task, so two quick taps land in order.
            boolean queued = Utils.runInOrderOnBackgroundThread(() -> {
                boolean turningOn = !Stored.ON.get();
                boolean saved = Stored.ON.saveCommitted(turningOn);
                Utils.runOnMainThread(() -> {
                    if (!saved) {
                        Utils.showToastLong(L10n.t("Couldn't save that. Try again."));
                    } else {
                        HookStatus.counted(FamilyNames.PROXY_MENU, TOGGLE);
                        Utils.showToastShort(turningOn ? L10n.t("Do Not Disturb is on.") : L10n.t("Do Not Disturb is off."));
                    }
                });
            });
            if (!queued) Utils.showToastLong(L10n.t("Couldn't save that. Try again."));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.PROXY_MENU, TOGGLE, failure);
        }
    }

    /** A stub the patch fills with the menu's own add, its red-text flag false. */
    public static void addItem(Object options, int icon, CharSequence text, Runnable onTap) {
    }
}
