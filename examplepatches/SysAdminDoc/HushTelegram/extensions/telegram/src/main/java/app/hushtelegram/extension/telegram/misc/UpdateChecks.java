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
 * Stops telegram.org's build from offering its own updates.
 *
 * <p>The APK from telegram.org checks for updates itself and offers to download and install the
 * next one. That APK is signed with Telegram's key, so Android refuses to install it over a
 * patched, re-signed build, and the offer can only fail. The launcher activity's update check asks
 * this class first, and while the switch is on it returns before asking the server. Patch the new
 * version with Morphe Manager instead.
 */
public final class UpdateChecks {
    private UpdateChecks() {}

    /** Injected at the start of the launcher activity's update check. True means return at once. Never throws. */
    public static boolean skipUpdateCheck() {
        return switchOn("update check skipped");
    }

    /**
     * Injected at the start of SharedConfig.isAppUpdateAvailable(). True means answer no. Telegram
     * keeps the update a check found until a later check finds none, so one found while the switch
     * was off or HushTelegram was paused kept the Update Telegram bar up after the switch came back
     * (#60). Telegram still keeps it, and it shows again if the switch goes off. Never throws.
     */
    public static boolean hideWaitingUpdate() {
        return switchOn("waiting update hidden");
    }

    private static boolean switchOn(String counted) {
        HookStatus.invoked(FamilyNames.DISABLE_UPDATE_CHECKS);
        try {
            if (!Utils.settingsReady() || !Settings.DISABLE_UPDATE_CHECKS.get()) return false;
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.DISABLE_UPDATE_CHECKS, "switch read", t);
            return false;
        }
        HookStatus.counted(FamilyNames.DISABLE_UPDATE_CHECKS, counted);
        return true;
    }
}
