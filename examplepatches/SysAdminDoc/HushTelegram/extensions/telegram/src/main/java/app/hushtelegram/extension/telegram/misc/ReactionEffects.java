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
 * Telegram plays a reaction's effect over the screen when you react, and again when someone
 * reacts to your message: the emoji flies to the bubble and bursts. With the switch on that
 * overlay never starts, the same way Telegram skips it when its interface animations are off.
 * The reaction itself still lands on the message.
 */
public final class ReactionEffects {
    private ReactionEffects() {}

    /** Asked before Telegram starts a reaction's overlay. True means skip it. */
    public static boolean skipped() {
        HookStatus.invoked(FamilyNames.REACTION_EFFECTS_OFF);
        try {
            return Utils.settingsReady() && Settings.REACTION_EFFECTS_OFF.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.REACTION_EFFECTS_OFF, "switch", failure);
            return false;
        }
    }
}
