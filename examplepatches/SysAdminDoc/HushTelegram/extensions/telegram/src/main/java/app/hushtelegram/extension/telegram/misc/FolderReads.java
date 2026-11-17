/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;

/**
 * Send read receipts under Mark all as read in the menu a long press on a folder tab opens (#65).
 * Under Ghost mode Mark all as read only clears the badges on this phone, so this sends the reads
 * Ghost mode kept back and the other devices catch up. The item is there while the chat list's
 * button is on, the same as the one in a chat's menu.
 */
public final class FolderReads {
    private FolderReads() {}

    static final String FAMILY = FamilyNames.DISABLE_ANALYTICS;

    /** Asked right after Telegram adds its own Mark all as read to a folder tab's menu. */
    public static void tabMenu(Object options) {
        try {
            if (options == null || !ReadsButton.on()) return;
            addItem(options, ReadsMenu.icon(), L10n.t("Send read receipts"), FolderReads::tap);
            HookStatus.counted(FAMILY, "read receipts item added to a folder tab menu");
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "read receipts folder tab menu", failure);
        }
    }

    /** Sends every read Ghost mode kept back, as the chat list's button does. */
    static void tap() {
        try {
            ReadsButton.say(GhostMode.sendHeld());
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "read receipts folder tab choice", failure);
            ReadsButton.say(-1);
        }
    }

    // Stubs. The patch writes their bodies.

    /** Adds an item to the folder tab's menu with Telegram's own adder. */
    public static void addItem(Object options, int icon, String text, Runnable tap) {}
}
