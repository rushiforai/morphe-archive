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
 * Telegram still shows what someone you've blocked writes in a group you share. With the switch
 * on, an open group or supergroup leaves their messages out of its list, the way Telegram leaves
 * out a message it can't show. Nothing is deleted or reported, and private chats and a channel's
 * own posts stay as they are. Telegram's list of blocked people is what it has loaded so far.
 */
public final class BlockedSenders {
    private BlockedSenders() {}

    /** The type Telegram gives a message it doesn't show. */
    static final int HIDDEN = -1;

    /**
     * Asked where an open chat reads a message's type to decide whether to list it.
     *
     * @param message Telegram's message
     * @param type the message's own type
     * @return the same type, or {@link #HIDDEN} for a blocked person's message in a group
     */
    public static int type(Object message, int type) {
        if (type < 0 || message == null || !on()) return type;
        try {
            long sender = sender(message);
            if (!listedInGroup(chat(message), post(message), sender) || !blocked(message, sender)) return type;
            HookStatus.counted(FamilyNames.HIDE_BLOCKED_IN_GROUPS, "message hidden");
            return HIDDEN;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_BLOCKED_IN_GROUPS, "message", failure);
            return type;
        }
    }

    /**
     * A person's message in a group or supergroup. Private and secret chats have positive IDs, a
     * channel's posts carry Telegram's post flag, and a sender with a negative ID is a chat or
     * channel speaking, never a person.
     */
    static boolean listedInGroup(long chat, boolean post, long sender) {
        return chat < 0 && !post && sender > 0;
    }

    /** Whether the switch is on and HushTelegram isn't paused. */
    static boolean on() {
        HookStatus.invoked(FamilyNames.HIDE_BLOCKED_IN_GROUPS);
        try {
            return Utils.settingsReady() && Settings.HIDE_BLOCKED_IN_GROUPS.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_BLOCKED_IN_GROUPS, "switch", failure);
            return false;
        }
    }

    /** The message's chat. Replaced when patching. */
    public static long chat(Object message) { return 0L; }

    /** Who sent the message. Replaced when patching. */
    public static long sender(Object message) { return 0L; }

    /** Whether the message is a channel post. Replaced when patching. */
    public static boolean post(Object message) { return false; }

    /** Whether the message's account has blocked {@code peer}. Replaced when patching. */
    public static boolean blocked(Object message, long peer) { return false; }
}
