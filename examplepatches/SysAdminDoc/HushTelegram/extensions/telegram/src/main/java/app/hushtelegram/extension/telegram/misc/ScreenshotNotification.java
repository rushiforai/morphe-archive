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
 * Suppress the "took a screenshot" notification Telegram sends to the other person. Telegram sends
 * one for regular chats ({@code messages.sendScreenshotNotification}) and another for secret chats
 * ({@code decryptedMessageActionScreenshotMessages}). The patch hooks both sites and asks this
 * class before each one is built. True means suppress: the notification request never goes out, but
 * the screenshot stays on your phone and the local service message ("you took a screenshot") still
 * appears in the chat. Off by default.
 */
public final class ScreenshotNotification {
    private ScreenshotNotification() {
    }

    /**
     * Asked just before Telegram builds the screenshot notification. True suppresses it.
     *
     * @param unused always 1 from the patch; the hook takes int, not boolean, per the Morphe rule
     */
    public static boolean suppress(int unused) {
        HookStatus.invoked(FamilyNames.SUPPRESS_SCREENSHOT_NOTIFICATION);
        try {
            if (!Utils.settingsReady() || !Settings.SUPPRESS_SCREENSHOT_NOTIFICATION.get()) return false;
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.SUPPRESS_SCREENSHOT_NOTIFICATION, "screenshot notification switch read", t);
            return false;
        }
        HookStatus.counted(FamilyNames.SUPPRESS_SCREENSHOT_NOTIFICATION, "screenshot notification suppressed");
        return true;
    }
}
