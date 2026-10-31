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
 * Telegram's App Icon list marks Premium, Turbo and Nox as Premium icons: each shows a lock, a tap
 * opens the Premium sheet instead of switching, and where Premium isn't sold the three are left out.
 * Those three places read the icon's Premium flag and the patch asks here right after each read, so
 * with the switch on they see an ordinary icon. Switching still goes through Telegram's own launcher
 * aliases, which ship in every build, so only the home screen icon changes. The Premium feature
 * page's icon preview reads the flag directly and keeps showing the real three.
 */
public final class AppIcons {
    private AppIcons() {}

    /** Whether an icon counts as Premium: Telegram's flag (non-zero for yes), or no while the switch is on. */
    public static boolean premium(int stock) {
        HookStatus.invoked(FamilyNames.HIDE_COMMERCE);
        if (stock == 0) return false;
        try {
            if (!Utils.settingsReady() || !Settings.UNLOCK_PREMIUM_ICONS.get()) return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_COMMERCE, "Premium icons switch", failure);
            return true;
        }
        HookStatus.counted(FamilyNames.HIDE_COMMERCE, "Premium icon unlocked");
        return false;
    }
}
