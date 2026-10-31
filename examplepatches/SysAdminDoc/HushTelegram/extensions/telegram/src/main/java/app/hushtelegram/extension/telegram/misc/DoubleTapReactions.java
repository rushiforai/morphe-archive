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

    /**
     * Called first thing by the reaction row's setMessage. Answering null makes Telegram lay the row
     * out as empty, which it already does for a message with no reactions, and the stored reactions
     * are never touched. A tag row (Saved Messages) is a different feature and always passes.
     */
    public static Object rows(Object message, boolean small, boolean tag) {
        HookStatus.invoked(FamilyNames.DISABLE_DOUBLE_TAP_REACTIONS);
        try {
            if (message == null || tag || !Utils.settingsReady() || !Settings.HIDE_REACTION_ROWS.get()) return message;
            HookStatus.counted(FamilyNames.DISABLE_DOUBLE_TAP_REACTIONS, "reaction row hidden");
            return null;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DISABLE_DOUBLE_TAP_REACTIONS, "reaction row switch", failure);
            return message;
        }
    }

    /**
     * Called with a message's stored reactions where its accessibility node builds what TalkBack
     * reads. Answering null skips the reaction text the way a message with no reactions does, so
     * a hidden row isn't read out either. Saved Messages tags still show, so they still read.
     */
    public static Object spoken(Object reactions) {
        HookStatus.invoked(FamilyNames.DISABLE_DOUBLE_TAP_REACTIONS);
        try {
            if (reactions == null || !Utils.settingsReady() || !Settings.HIDE_REACTION_ROWS.get()) return reactions;
            if (reactions.getClass().getField("reactions_as_tags").getBoolean(reactions)) return reactions;
            HookStatus.counted(FamilyNames.DISABLE_DOUBLE_TAP_REACTIONS, "reactions left out of TalkBack");
            return null;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DISABLE_DOUBLE_TAP_REACTIONS, "spoken reactions switch", failure);
            return reactions;
        }
    }

    /** Called with the long-press menu's "reactions are available" answer; false means no strip and no panel. */
    public static boolean picker(boolean available) {
        HookStatus.invoked(FamilyNames.DISABLE_DOUBLE_TAP_REACTIONS);
        try {
            if (!available || !Utils.settingsReady() || !Settings.HIDE_REACTION_PICKER.get()) return available;
            HookStatus.counted(FamilyNames.DISABLE_DOUBLE_TAP_REACTIONS, "reaction picker hidden");
            return false;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DISABLE_DOUBLE_TAP_REACTIONS, "reaction picker switch", failure);
            return available;
        }
    }
}
