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
 * Telegram puts a round share button beside a channel's posts, and beside a channel post forwarded
 * into a chat. Bots' messages, media from people in public groups and Saved Messages' jump back to
 * the original use the same button. The patch keeps Telegram's own answer to whether a message gets
 * one and asks here only when that answer is yes, handing over whether a person sent the message,
 * whether it's forwarded from a channel and whether it's in Saved Messages. The bubble's layout,
 * width and draw all read that one answer, so a message without the button lays out as Telegram
 * lays out any other. The post's own menu still forwards it.
 */
public final class ChannelShare {
    private ChannelShare() {}

    /**
     * Whether a message Telegram would give a share button keeps it.
     *
     * @param fromUser non-zero when a person or bot sent the message
     * @param channelForward non-zero when it's forwarded from a channel
     * @param savedMessages non-zero when it's in Saved Messages, where the button jumps to the original
     * @return whether the button stays
     */
    public static boolean shown(int fromUser, int channelForward, int savedMessages) {
        if (savedMessages != 0 || (fromUser != 0 && channelForward == 0)) return true;
        HookStatus.counted(FamilyNames.HIDE_CHANNEL_BUTTONS, "channel share button hidden");
        return false;
    }

    /** Whether the switch is on and HushTelegram isn't paused. Asked before the patch gathers what {@link #shown} needs. */
    public static boolean on() {
        HookStatus.invoked(FamilyNames.HIDE_CHANNEL_BUTTONS);
        try {
            return Utils.settingsReady() && Settings.HIDE_CHANNEL_SHARE.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_CHANNEL_BUTTONS, "share switch", failure);
            return false;
        }
    }
}
