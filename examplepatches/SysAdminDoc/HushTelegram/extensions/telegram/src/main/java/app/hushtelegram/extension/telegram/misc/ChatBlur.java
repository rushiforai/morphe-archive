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
 * Telegram blurs the chat header and panels only on phones it rates as fast enough, and hides its
 * own Blur in chat option under Power saving everywhere else. With the switch on, every phone
 * counts as able to blur, so that option shows and does what it says. It stays the user's choice.
 */
public final class ChatBlur {
    private ChatBlur() {}

    /** Asked before Telegram rates the phone. True means the phone can blur chats. */
    public static boolean allowed() {
        HookStatus.invoked(FamilyNames.ALLOW_CHAT_BLUR);
        try {
            return Utils.settingsReady() && Settings.ALLOW_CHAT_BLUR.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.ALLOW_CHAT_BLUR, "switch", failure);
            return false;
        }
    }
}
