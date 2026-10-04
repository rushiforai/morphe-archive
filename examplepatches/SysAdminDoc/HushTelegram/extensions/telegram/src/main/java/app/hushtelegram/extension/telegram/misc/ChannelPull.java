/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/** Only the channel list's bottom pull eligibility and release reach these hooks. */
public final class ChannelPull {
    private ChannelPull() {}

    /** The non-topic pull reached every stock eligibility check, before changing its offset. */
    public static boolean stopBottomPull() {
        HookStatus.invoked(FamilyNames.DISABLE_CHANNEL_PULL);
        if (!enabled()) return false;
        HookStatus.counted(FamilyNames.DISABLE_CHANNEL_PULL, "channel bottom pull stopped");
        return true;
    }

    /** A non-topic release retracts the existing pull if the switch changed during the drag. */
    public static boolean keepChannelStill() {
        HookStatus.invoked(FamilyNames.DISABLE_CHANNEL_PULL);
        if (!enabled()) return false;
        HookStatus.counted(FamilyNames.DISABLE_CHANNEL_PULL, "channel pull release stopped");
        return true;
    }

    private static boolean enabled() {
        try {
            return Utils.settingsReady() && Settings.DISABLE_CHANNEL_PULL.get();
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.DISABLE_CHANNEL_PULL, "switch read", t);
            return false;
        }
    }
}
