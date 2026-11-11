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
 * Makes the app behave as if the current account has Telegram Premium. Only changes client-side
 * checks; the server still knows the real subscription status, so server-enforced limits remain.
 * Unlocks features like doubled character limits, extra reactions, no ads and faster downloads
 * that Telegram gates behind {@code UserConfig.isPremium()}.
 */
public final class PremiumUnlock {
    private PremiumUnlock() {
    }

    /**
     * Called at the top of UserConfig.isPremium(). Returns 1 to force Premium on, 0 to let the
     * stock code decide. The parameter is a constant the patch sends and is ignored.
     */
    public static int isPremium(int unused) {
        try {
            if (!Utils.settingsReady() || !Settings.UNLOCK_PREMIUM.get()) return 0;
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.UNLOCK_PREMIUM, "switch read", t);
            return 0;
        }
        HookStatus.counted(FamilyNames.UNLOCK_PREMIUM, "Premium unlocked");
        return 1;
    }
}
