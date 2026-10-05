/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/** Only chat double taps and Telegram's reaction-settings preview ask this hook. */
public final class DoubleTapReactions {
    private DoubleTapReactions() {}

    public static boolean stopReaction() {
        HookStatus.invoked(FamilyNames.DISABLE_DOUBLE_TAP_REACTIONS);
        try {
            if (!Utils.settingsReady() || !Settings.DISABLE_DOUBLE_TAP_REACTIONS.get()) return false;
            HookStatus.counted(FamilyNames.DISABLE_DOUBLE_TAP_REACTIONS, "double tap stopped");
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DISABLE_DOUBLE_TAP_REACTIONS, "gesture switch", failure);
            return false;
        }
    }
}
