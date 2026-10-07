/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.chats;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.BooleanSetting;

/**
 * What the Hide typing indicator patch asks before Facebook tells others that you're typing.
 *
 * <p>A chat that opens inside Facebook sends it through Mailbox, Messenger's on-device store, which
 * hands {@link #chatTyping} the typing flag first, and through the older ConversationTypingContext,
 * whose "typing" runnable asks {@link #holdsChatTyping}. A comment box shows the post's other
 * viewers that someone is writing a comment through its own CommentTypingContext, which asks
 * {@link #holdsCommentTyping}. While a switch is on, Mailbox hears "not typing" and those runnables
 * send nothing. What you write sends as usual, and the "stopped typing" updates still go.
 *
 * <p>Off, paused, settings that aren't ready yet, or a failure in here, and Facebook sends what it
 * meant to.
 */
public final class TypingIndicator {
    /** What the diagnostic report counts each time a chat's "typing" is held back. */
    static final String CHAT_HELD = "chat typing held back";

    /** What the diagnostic report counts each time a comment box's "typing" is held back. */
    static final String COMMENT_HELD = "comment typing held back";

    private TypingIndicator() {
    }

    /** Injection point, first in Mailbox's typing setter: the flag to send, false in place of true while held. */
    public static boolean chatTyping(boolean typing) {
        return typing && !holds(Settings.HIDE_CHAT_TYPING, CHAT_HELD);
    }

    /** Injection point, first in ConversationTypingContext's "typing" runnable: true skips it. */
    public static boolean holdsChatTyping() {
        return holds(Settings.HIDE_CHAT_TYPING, CHAT_HELD);
    }

    /** Injection point, first in CommentTypingContext's "typing" runnable: true skips it. */
    public static boolean holdsCommentTyping() {
        return holds(Settings.HIDE_COMMENT_TYPING, COMMENT_HELD);
    }

    /** True when [setting] holds a "typing" update back, counted under [count]. Never throws. */
    private static boolean holds(BooleanSetting setting, String count) {
        try {
            HookStatus.invoked(FamilyNames.TYPING_INDICATOR);
            if (!Utils.settingsReady() || !setting.get()) return false;
            HookStatus.counted(FamilyNames.TYPING_INDICATOR, count);
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.TYPING_INDICATOR, count, failure);
            return false;
        }
    }
}
