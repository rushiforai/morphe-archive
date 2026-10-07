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
 * When a volume key goes down in a chat, Telegram first offers it to the chat, which plays the
 * muted video or round video on screen with sound and keeps the key, so the volume doesn't change.
 * The offer comes here instead. Stories and calls handle their keys before that and stay Telegram's.
 */
public final class VolumeKeys {
    private VolumeKeys() {}

    /**
     * Asked in place of the chat when a volume key goes down.
     *
     * @param chat Telegram's chat screen
     * @return whether the chat took the key
     */
    public static boolean chatTakesKey(Object chat) {
        if (keepMuted()) return false;
        return stockChatTakesKey(chat);
    }

    /** Whether the key goes to the volume without the chat seeing it. */
    static boolean keepMuted() {
        HookStatus.invoked(FamilyNames.KEEP_VIDEOS_MUTED);
        try {
            if (!Utils.settingsReady() || !Settings.KEEP_VIDEOS_MUTED.get()) return false;
            HookStatus.counted(FamilyNames.KEEP_VIDEOS_MUTED, "volume key left to the volume");
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_VIDEOS_MUTED, "volume key", failure);
            return false;
        }
    }

    /** The chat's own answer, which plays a video with sound. Replaced with the chat's method when patching. */
    public static boolean stockChatTakesKey(Object chat) { return false; }
}
