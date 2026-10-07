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
 * The folder tabs above the chat list each show how many unread chats they hold. Telegram asks
 * the chat list for every tab's number, and with the switch on the answer is zero, so the tabs
 * show just their names. Unread chats stay unread, and the app icon's badge doesn't change.
 */
public final class FolderTabs {
    private FolderTabs() {}

    /** Asked before Telegram counts a folder tab's unread chats. True means show none. */
    public static boolean countersHidden() {
        HookStatus.invoked(FamilyNames.HIDE_FOLDER_COUNTERS);
        try {
            return Utils.settingsReady() && Settings.HIDE_FOLDER_COUNTERS.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, "switch", failure);
            return false;
        }
    }
}
