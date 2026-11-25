/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.view.WindowManager;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.util.function.Predicate;

/**
 * Screenshots in chats that don't allow saving (Discussion #34). Telegram blocks screen capture
 * wherever a chat, channel or bot protects its content: in the chat, on any single protected message
 * it shows, in the profile's shared media, the photo viewer, a story whose owner turned saving off
 * and the translate window. Each hook gets
 * Telegram's own "protected" answer only at the spot that decides on blocking capture, so
 * forwarding, saving and copying stay as Telegram has them. Paid media and the passcode lock keep
 * their own checks, which never reach these hooks. A secret chat's own check, in the chat, its
 * profile and the photo viewer, is handed over to {@link #secretChat} and lets capture through only
 * with a second switch on as well (#82). View-once and timed media open in a viewer whose window is
 * always secure, and {@link #timedViewer} decides that for each one. Telegram for Android has no screenshot
 * detection outside secret chats, so nobody is told there. In a secret chat Telegram tells the other
 * person, unless Suppress screenshot notification is on.
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

    /**
     * Called with the secret chat Telegram is showing, or null outside one, right where it decides to
     * block capture for it. Null lets the screen be captured, the same chat keeps it blocked.
     */
    public static Object secretChat(Object chat) {
        if (chat == null) return null;
        if (!MessageMenu.on(Settings.ALLOW_SCREENSHOTS) || !MessageMenu.on(Settings.SECRET_CHAT_SCREENSHOTS)) return chat;
        HookStatus.counted(FamilyNames.MESSAGE_MENU_REPEAT, "secret chat screenshot allowed");
        return null;
    }

    /**
     * Called as the view-once and timed media viewer opens a message, before it adds its window.
     * Telegram sets the window secure once and reuses it, so each opening decides again.
     */
    public static void timedViewer(WindowManager.LayoutParams params, Object message) {
        decideTimedViewer(params, message, opened -> MessageMenu.secret(MessageMenu.dialog(opened)));
    }

    /** Secure unless both switches are on, and a third in a secret chat. Anything going wrong leaves it secure. */
    static void decideTimedViewer(WindowManager.LayoutParams params, Object message, Predicate<Object> secret) {
        if (params == null) return;
        boolean allowed = false;
        try {
            allowed = MessageMenu.on(Settings.ALLOW_SCREENSHOTS) && MessageMenu.on(Settings.TIMED_MEDIA_SCREENSHOTS)
                    && (!secret.test(message) || MessageMenu.on(Settings.SECRET_CHAT_SCREENSHOTS));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "timed media screenshot", failure);
        }
        if (allowed) {
            params.flags &= ~WindowManager.LayoutParams.FLAG_SECURE;
            HookStatus.counted(FamilyNames.MESSAGE_MENU_REPEAT, "timed media screenshot allowed");
        } else {
            params.flags |= WindowManager.LayoutParams.FLAG_SECURE;
        }
    }
}
