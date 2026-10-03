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
 * Stops a sideways swipe on a chat row from starting. The hook sits where the chat list's swipe
 * controller has decided to let the row slide, so every case Telegram already refuses stays
 * refused, and dragging a pinned chat to reorder it never reaches here.
 */
public final class ChatSwipe {
    private ChatSwipe() {}

    /** True when the row gets no movement, as Telegram answers for a row it won't swipe. */
    public static boolean keepRowStill() {
        HookStatus.invoked(FamilyNames.DISABLE_CHAT_SWIPE);
        if (!enabled()) return false;
        HookStatus.counted(FamilyNames.DISABLE_CHAT_SWIPE, "chat swipe stopped");
        return true;
    }

    private static boolean enabled() {
        try {
            return Utils.settingsReady() && Settings.DISABLE_CHAT_SWIPE.get();
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.DISABLE_CHAT_SWIPE, "switch read", t);
            return false;
        }
    }
}
