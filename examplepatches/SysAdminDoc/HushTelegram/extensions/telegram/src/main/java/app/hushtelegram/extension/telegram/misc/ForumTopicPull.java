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
 * Only a forum topic's bottom pull eligibility and release reach these hooks, at the same two
 * places as {@link ChannelPull}, on the branch Telegram takes for a topic. A topic pull that
 * isn't stopped goes on exactly as it does in stock Telegram.
 */
public final class ForumTopicPull {
    private ForumTopicPull() {}

    /** The topic pull reached every stock eligibility check, before changing its offset. */
    public static boolean stopTopicPull() {
        HookStatus.invoked(FamilyNames.DISABLE_CHANNEL_PULL);
        if (!enabled()) return false;
        HookStatus.counted(FamilyNames.DISABLE_CHANNEL_PULL, "topic bottom pull stopped");
        return true;
    }

    /** A topic release retracts the existing pull if the switch changed during the drag. */
    public static boolean keepTopicStill() {
        HookStatus.invoked(FamilyNames.DISABLE_CHANNEL_PULL);
        if (!enabled()) return false;
        HookStatus.counted(FamilyNames.DISABLE_CHANNEL_PULL, "topic pull release stopped");
        return true;
    }

    private static boolean enabled() {
        try {
            return Utils.settingsReady() && Settings.DISABLE_TOPIC_PULL.get();
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.DISABLE_CHANNEL_PULL, "topic switch read", t);
            return false;
        }
    }
}
