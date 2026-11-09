/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Save to Gallery in a story's three-dot menu. Telegram shows it to Premium accounts on stories it
 * lets you share. Both answers are read only at the spot that decides on this one menu item, so the
 * story's other share options and Telegram's Premium state everywhere else stay as they were.
 */
public final class StorySave {
    private StorySave() {
    }

    /** Called with the story's "can be shared" answer, right where the menu decides on Save to Gallery. */
    public static boolean shareable(int allowed) {
        return allowed != 0 || MessageMenu.on(Settings.STORY_SAVE_BUTTON);
    }

    /** Called with the account's Premium answer, right where the menu decides on Save to Gallery. */
    public static boolean premium(int premium) {
        if (premium != 0) return true;
        if (!MessageMenu.on(Settings.STORY_SAVE_BUTTON)) return false;
        HookStatus.counted(FamilyNames.MESSAGE_MENU_REPEAT, "story save offered");
        return true;
    }
}
