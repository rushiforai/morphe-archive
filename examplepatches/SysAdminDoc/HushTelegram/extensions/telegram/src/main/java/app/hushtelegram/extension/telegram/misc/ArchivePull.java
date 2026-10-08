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
 * Telegram keeps a hidden archive as the first row of the chat list, scrolled up out of sight, and
 * pulling the list down past the top brings it back. With the switch on, a hidden archive is left
 * out of the main list instead, so there's nothing above the first chat to pull down, and the
 * chat list's menu gets an Archived chats entry that opens it. A pinned archive stays in the list
 * as Telegram shows it. Telegram builds the list when it sorts the chats, so the switch restarts
 * the app.
 */
public final class ArchivePull {
    private ArchivePull() {}

    /**
     * MessagesController.hasHiddenArchive(): true answers no, so the chat list treats the archive
     * as absent and sets up no pull for it.
     */
    public static boolean keepsOut() {
        if (!on()) return false;
        try {
            return hidden();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DISABLE_ARCHIVE_PULL, "archive state", failure);
            return false;
        }
    }

    /** Asked as Telegram sorts the archive's row into the main chat list. True leaves it out. */
    public static boolean leavesOut() {
        if (!keepsOut()) return false;
        HookStatus.counted(FamilyNames.DISABLE_ARCHIVE_PULL, "hidden archive left out of the chat list");
        return true;
    }

    /**
     * The chat list's menu, after Telegram's own entries.
     *
     * @param options the menu being built
     * @param chats the chat list it belongs to
     */
    public static void menu(Object options, Object chats) {
        if (!keepsOut()) return;
        try {
            if (!archived()) return;
            add(options, () -> {
                try {
                    open(chats);
                } catch (Throwable failure) {
                    HookStatus.threw(FamilyNames.DISABLE_ARCHIVE_PULL, "open archive", failure);
                }
            });
            HookStatus.counted(FamilyNames.DISABLE_ARCHIVE_PULL, "archive added to the menu");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DISABLE_ARCHIVE_PULL, "menu", failure);
        }
    }

    /** Whether the switch is on and HushTelegram isn't paused. */
    static boolean on() {
        HookStatus.invoked(FamilyNames.DISABLE_ARCHIVE_PULL);
        try {
            return Utils.settingsReady() && Settings.DISABLE_ARCHIVE_PULL.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DISABLE_ARCHIVE_PULL, "switch", failure);
            return false;
        }
    }

    /** Whether the archive is hidden rather than pinned. Replaced when patching. */
    public static boolean hidden() { return false; }

    /** Whether the account has an archive folder at all. Replaced when patching. */
    public static boolean archived() { return false; }

    /** Adds an Archived chats entry to the menu that runs [open]. Replaced when patching. */
    public static void add(Object options, Runnable open) {}

    /** Opens the archive over the chat list. Replaced when patching. */
    public static void open(Object chats) {}
}
