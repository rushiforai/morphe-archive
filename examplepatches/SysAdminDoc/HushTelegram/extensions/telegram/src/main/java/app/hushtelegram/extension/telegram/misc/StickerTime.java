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
 * A sticker or a big animated emoji carries its time and read checks in a small bubble over its
 * corner. With the switch on that bubble isn't drawn, so the sticker stands on its own. Every
 * other message keeps its time.
 */
public final class StickerTime {
    private StickerTime() {}

    /**
     * Asked each time a message bubble is about to draw its time.
     *
     * @param message Telegram's message, or null while the bubble is empty
     * @return true to skip the time
     */
    public static boolean hidden(Object message) {
        if (message == null || !on()) return false;
        try {
            if (!isSticker(message)) return false;
            HookStatus.counted(FamilyNames.HIDE_STICKER_TIME, "sticker time hidden");
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_STICKER_TIME, "sticker", failure);
            return false;
        }
    }

    /** Whether the switch is on and HushTelegram isn't paused. */
    static boolean on() {
        HookStatus.invoked(FamilyNames.HIDE_STICKER_TIME);
        try {
            return Utils.settingsReady() && Settings.HIDE_STICKER_TIME.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_STICKER_TIME, "switch", failure);
            return false;
        }
    }

    /** Telegram's own check for any kind of sticker, animated emoji included. Replaced when patching. */
    public static boolean isSticker(Object message) { return false; }
}
