/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.chats;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * What the Hide read receipts patch asks before Facebook tells the sender that you've read a chat.
 *
 * <p>A chat that opens inside Facebook marks a thread read through Mailbox, Messenger's on-device
 * store. Its mark-read makes the future it answers and then posts the call that does the work, and
 * {@link #holdsChatRead} is asked in between. While the switch is on, the future goes back without
 * the call: nothing reaches the sender, and the chat stays unread on this phone too.
 *
 * <p>Off, paused, settings that aren't ready yet, or a failure in here, and Facebook sends the read.
 */
public final class ReadReceipts {
    /** What the diagnostic report counts each time a read is held back. */
    static final String READ_HELD = "chat read held back";

    private ReadReceipts() {
    }

    /** Injection point, in Mailbox's mark-read once its future is made: true hands that back unsent. */
    public static boolean holdsChatRead() {
        try {
            HookStatus.invoked(FamilyNames.READ_RECEIPTS);
            if (!Utils.settingsReady() || !Settings.HIDE_READ_RECEIPTS.get()) return false;
            HookStatus.counted(FamilyNames.READ_RECEIPTS, READ_HELD);
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.READ_RECEIPTS, READ_HELD, failure);
            return false;
        }
    }
}
