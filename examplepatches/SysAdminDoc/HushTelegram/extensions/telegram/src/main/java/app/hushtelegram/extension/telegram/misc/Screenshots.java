/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Screenshots in chats that don't allow saving (Discussion #34). Telegram blocks screen capture
 * wherever a chat, channel or bot protects its content: in the chat, on any single protected message
 * it shows, in the profile's shared media, the photo viewer, a story whose owner turned saving off
 * and the translate window. Each hook gets
 * Telegram's own "protected" answer only at the spot that decides on blocking capture, so
 * forwarding, saving and copying stay as Telegram has them. Secret chats, view-once and paid media
 * and the passcode lock keep their own checks, which never reach these hooks. Telegram for Android
 * has no screenshot detection outside secret chats, so nobody is told either way.
 */
public final class Screenshots {
    private Screenshots() {
    }

    /** Called with Telegram's "this content is protected" answer, right where it decides to block capture. */
    public static boolean protectedContent(int answer) {
        if (answer == 0) return false;
        if (!MessageMenu.on(Settings.ALLOW_SCREENSHOTS)) return true;
        HookStatus.counted(FamilyNames.MESSAGE_MENU_REPEAT, "screenshot allowed");
        return false;
    }

    /** Called with the story viewer's "screenshots allowed" answer, right where it decides to block capture. */
    public static boolean storyAllowed(int allowed) {
        if (allowed != 0) return true;
        if (!MessageMenu.on(Settings.ALLOW_SCREENSHOTS)) return false;
        HookStatus.counted(FamilyNames.MESSAGE_MENU_REPEAT, "story screenshot allowed");
        return true;
    }
}
