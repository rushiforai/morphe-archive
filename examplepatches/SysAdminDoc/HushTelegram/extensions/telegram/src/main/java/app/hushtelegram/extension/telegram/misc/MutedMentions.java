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
 * When a message mentions you or replies to you, Telegram reads the sender's notification
 * setting instead of the chat's, so a mention in a group you've muted still notifies. With the
 * switch on, a mention in a muted group or channel follows the chat's mute and stays quiet.
 * Unmuted chats notify as before, and the chat list still shows the unread mention.
 */
public final class MutedMentions {
    private MutedMentions() {}

    /**
     * Asked where Telegram swaps a mention to its sender before reading notification settings.
     *
     * @param message Telegram's message
     * @return whose settings decide: the sender, as Telegram has it, or the chat when it's muted
     */
    public static long notifyDialog(Object message) {
        long sender = sender(message);
        if (!on()) return sender;
        try {
            long chat = chat(message);
            if (!groupOrChannel(chat) || !muted(message)) return sender;
            HookStatus.counted(FamilyNames.IGNORE_MUTED_MENTIONS, "mention kept quiet");
            return chat;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.IGNORE_MUTED_MENTIONS, "mention", failure);
            return sender;
        }
    }

    /** Groups and channels have negative IDs; private and secret chats never carry a mention. */
    static boolean groupOrChannel(long dialog) {
        return dialog < 0;
    }

    /** Whether the switch is on and HushTelegram isn't paused. */
    static boolean on() {
        HookStatus.invoked(FamilyNames.IGNORE_MUTED_MENTIONS);
        try {
            return Utils.settingsReady() && Settings.IGNORE_MUTED_MENTIONS.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.IGNORE_MUTED_MENTIONS, "switch", failure);
            return false;
        }
    }

    /** The message's sender, Telegram's own answer. Replaced when patching. */
    public static long sender(Object message) { return 0L; }

    /** The message's chat. Replaced when patching. */
    public static long chat(Object message) { return 0L; }

    /** Whether the chat, or the forum topic the message is in, is muted. Replaced when patching. */
    public static boolean muted(Object message) { return false; }
}
