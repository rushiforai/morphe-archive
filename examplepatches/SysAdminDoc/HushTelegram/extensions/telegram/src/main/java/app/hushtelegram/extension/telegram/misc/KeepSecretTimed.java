/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.util.ArrayList;

/**
 * Keep self-destructing secret chat messages, a switch under Keep deleted messages (#82).
 *
 * <p>A secret chat's self-destruct timer runs on each phone. Once a message's timer is due,
 * MessagesController's deleting task runs on this phone: it deletes the due messages chat by chat,
 * then empties the media of due secret photos and videos, then clears the task from storage. Nothing
 * of it goes to the other person, whose copy goes on their own timer. With the switch on, the patch
 * hands each chat's due messages over first, and a secret chat's come back as an empty list, which
 * Telegram's deleting and emptying both skip. The task's own list is left whole, so storage still
 * clears it and it doesn't run again. Ordinary chats stay stock; their timed media has Keep
 * view-once and timed media.
 */
public final class KeepSecretTimed {
    private KeepSecretTimed() {}

    /** Telegram's side, swapped out by tests. The real one calls the stub the patch writes. */
    interface Telegram {
        /** Whether the chat is a secret chat. */
        boolean secretDialog(long dialogId);
    }

    static Telegram telegram = KeepSecretTimed::secretDialog;

    /**
     * Called with each chat's due messages before the deleting task deletes them or empties their
     * media. What comes back is what the task goes on with: the same list, or an empty one.
     */
    @SuppressWarnings("rawtypes")
    public static ArrayList task(ArrayList messages, long dialogId) {
        HookStatus.invoked(FamilyNames.KEEP_DELETED_MESSAGES);
        try {
            if (messages == null || messages.isEmpty() || !on() || !telegram.secretDialog(dialogId)) return messages;
            HookStatus.counted(FamilyNames.KEEP_DELETED_MESSAGES, "self-destructing secret chat messages kept");
            return new ArrayList();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_DELETED_MESSAGES, "secret chat timer", failure);
            return messages;
        }
    }

    /** Whether the switch is on and HushTelegram isn't paused. */
    static boolean on() {
        return Utils.settingsReady() && Settings.KEEP_SECRET_TIMED.get();
    }

    // Stub. The patch gives it Telegram's code; until then it says no chat is a secret chat.

    /** {@code DialogObject.isEncryptedDialog(dialogId)}. */
    public static boolean secretDialog(long dialogId) { return false; }
}
