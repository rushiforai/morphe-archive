/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Telegram plays its sound and vibration for a private message from anyone. With the switch on, a
 * message from someone who isn't in your contacts still shows its notification, but silently,
 * the way a message sent without sound arrives. Bots, your own reminders and Telegram's service
 * notifications, login codes among them, keep their sound.
 */
public final class NonContacts {
    private NonContacts() {}

    /** Telegram's service notifications, which carry login codes. */
    static final long SERVICE = 777000L;

    /**
     * Asked before Telegram's own check for a silent message.
     *
     * @param message Telegram's message
     * @return whether the notification goes out silently
     */
    public static boolean silenced(Object message) {
        if (message == null || !on()) return false;
        try {
            if (!privateDialog(dialog(message))) return false;
            Object user = user(message);
            if (user == null || !outsider(contact(user), bot(user), self(user))) return false;
            HookStatus.counted(FamilyNames.SILENCE_NON_CONTACTS, "notification silenced");
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SILENCE_NON_CONTACTS, "sender", failure);
            return false;
        }
    }

    /** A chat with one person; groups, channels, secret chats and Telegram's service chat don't count. */
    static boolean privateDialog(long dialog) {
        return dialog > 0 && dialog != SERVICE;
    }

    /** Someone outside your contacts, not a bot and not you. */
    static boolean outsider(boolean contact, boolean bot, boolean self) {
        return !contact && !bot && !self;
    }

    /** Whether the switch is on and HushTelegram isn't paused. */
    static boolean on() {
        HookStatus.invoked(FamilyNames.SILENCE_NON_CONTACTS);
        try {
            return Utils.settingsReady() && Settings.SILENCE_NON_CONTACTS.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SILENCE_NON_CONTACTS, "switch", failure);
            return false;
        }
    }

    /** The message's chat. Replaced when patching. */
    public static long dialog(Object message) { return 0L; }

    /** The person a private chat is with, or null. Replaced when patching. */
    public static Object user(Object message) { return null; }

    /** Whether the person is in your contacts. Replaced when patching. */
    public static boolean contact(Object user) { return true; }

    /** Whether the person is a bot. Replaced when patching. */
    public static boolean bot(Object user) { return false; }

    /** Whether the person is you. Replaced when patching. */
    public static boolean self(Object user) { return false; }
}
