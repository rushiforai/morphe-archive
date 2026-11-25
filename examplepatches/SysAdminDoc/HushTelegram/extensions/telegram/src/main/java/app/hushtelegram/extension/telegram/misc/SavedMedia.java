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
 * Open Saved Messages on its media (#103). Telegram opens Saved Messages from the chat list on its
 * shared media page (saved chats, media, files, links, music, voice) when its own View as Chats is
 * on. The chat list reads that setting twice, as it starts and when Saved Messages is tapped, and
 * both reads ask here. View as Messages on the saved chats tab still opens the chat itself.
 */
public final class SavedMedia {
    private SavedMedia() {}

    /**
     * Telegram's View as Chats, as the chat list reads it: [stock] is Telegram's own answer, non-zero
     * for yes. The switch adds a yes and never takes one away.
     */
    public static int viewAsChats(int stock) {
        HookStatus.invoked(FamilyNames.HIDE_FOLDER_COUNTERS);
        if (stock != 0) return stock;
        try {
            return Utils.settingsReady() && Settings.SAVED_MEDIA_FIRST.get() ? 1 : 0;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, "savedMediaFirst", failure);
            return stock;
        }
    }
}
