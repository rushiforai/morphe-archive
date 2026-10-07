/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import java.util.ArrayList;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * The chat list's "Your contacts on Telegram" block. Telegram keeps its own copy of the contacts it
 * shows there and asks whether that copy exists before it adds the heading and rows, picks the
 * empty-chat-list picture or sizes the space under the list. These hooks answer those questions;
 * the copy itself, ContactsController and contact sync are never changed.
 */
public final class ContactsBlock {
    private ContactsBlock() {}

    /** The list Telegram checks before showing the block, or null to show none. */
    public static ArrayList<?> rows(ArrayList<?> contacts) {
        if (contacts == null) return null;
        HookStatus.invoked(FamilyNames.HIDE_CONTACTS_BLOCK);
        try {
            if (!Utils.settingsReady() || !Settings.HIDE_CONTACTS_BLOCK.get()) return contacts;
            HookStatus.counted(FamilyNames.HIDE_CONTACTS_BLOCK, "contact rows hidden");
            return null;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_CONTACTS_BLOCK, "contact rows", failure);
            return contacts;
        }
    }

    /** Whether Telegram shows its "Connecting your contacts" loading rows while contacts sync. */
    public static boolean placeholder(boolean updating) {
        if (!updating) return false;
        HookStatus.invoked(FamilyNames.HIDE_CONTACTS_BLOCK);
        try {
            if (!Utils.settingsReady() || !Settings.HIDE_CONTACTS_BLOCK.get()) return true;
            HookStatus.counted(FamilyNames.HIDE_CONTACTS_BLOCK, "loading rows hidden");
            return false;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_CONTACTS_BLOCK, "loading rows", failure);
            return true;
        }
    }
}
