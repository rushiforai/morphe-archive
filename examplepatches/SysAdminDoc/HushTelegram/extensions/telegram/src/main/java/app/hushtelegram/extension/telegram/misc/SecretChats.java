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
 * Incoming secret chat requests.
 *
 * <p>SecretChatHelper.processUpdateEncryption gets an {@code updateEncryption} carrying an
 * {@code encryptedChatRequested} when someone starts a secret chat with the account. Stock Telegram
 * saves the chat, shows it in the chat list and calls {@code acceptSecretChat} at once, which sends
 * the key exchange back, so the other person learns this device is online and set up for secret
 * chats before anyone here has seen the request.
 *
 * <p>With the switch on the patch returns before any of that, so the request is ignored here:
 * nothing is saved, nothing is shown and nothing goes back. Declining would send
 * {@code messages.discardEncryption}, which tells the other person and ends the request on every
 * device signed in to the account. Ignoring is local to this phone: the person who asked sees the
 * chat stay on "waiting", and another device of the account can still accept it. Secret chats that
 * already exist keep working.
 */
public final class SecretChats {
    private SecretChats() {}

    /**
     * Asked only for an {@code encryptedChatRequested} update.
     *
     * @return whether to ignore the request
     */
    public static boolean refuse() {
        HookStatus.invoked(FamilyNames.HIDE_POPULAR_APPS);
        try {
            if (!Utils.settingsReady() || !Settings.DISABLE_SECRET_CHATS.get()) return false;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_POPULAR_APPS, "secret chat switch", failure);
            return false;
        }
        HookStatus.counted(FamilyNames.HIDE_POPULAR_APPS, "secret chat request ignored");
        return true;
    }
}
