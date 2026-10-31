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
 * Premium accounts can put an emoji next to their name, and Telegram draws it wherever a name goes:
 * the chat list, chat headers, message authors, profiles, member lists and group calls. Each of
 * those asks one of two small getters for the status's emoji. The patch keeps both getters whole
 * under private names and asks here first, so with the switch on every name reads as one without a
 * status. Telegram's own Premium star then shows for a Premium account, as it does when no status
 * is set. The channel appearance editor, the check that tells it whether a channel's status changed
 * and the admin log's wording keep asking the kept getters, so saving a channel and reading its
 * history see the real status.
 */
public final class EmojiStatus {
    private EmojiStatus() {}

    /** Whether a name's emoji status is left out. False while paused, before settings load or when the switch can't be read. */
    public static boolean hide() {
        HookStatus.invoked(FamilyNames.HIDE_COMMERCE);
        try {
            if (!Utils.settingsReady() || !Settings.HIDE_EMOJI_STATUS.get()) return false;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_COMMERCE, "emoji status switch", failure);
            return false;
        }
        HookStatus.counted(FamilyNames.HIDE_COMMERCE, "emoji status hidden");
        return true;
    }
}
