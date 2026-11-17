/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.Context;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Shows when a forwarded message was first sent (#79), in its bubble's header. Telegram keeps the
 * original date in the forward header of every forwarded message, so nothing more is asked of it.
 * A bubble writes "Forwarded from" above the sender's name, and the date goes after those words;
 * compact chats draw a one-line header instead, whose text slot Telegram leaves empty for a forward,
 * and the date goes there. A message that isn't a forward, or whose header has no date, keeps
 * Telegram's text.
 */
public final class ForwardDates {
    private ForwardDates() {}

    /** The "Forwarded from" line a bubble is about to show above [message]'s sender, with when it was first sent. */
    public static String header(Object message, String text) {
        if (text == null || text.isEmpty() || message == null) return text;
        try {
            String when = when(message);
            if (when == null) return text;
            // A separator only, the way the profile writes a username next to its ID.
            String shown = text + " · " + when;
            HookStatus.counted(FamilyNames.SHOW_LOCAL_IDS, "forward date shown");
            return shown;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SHOW_LOCAL_IDS, "forward date", failure);
            return text;
        }
    }

    /** The text a compact chat's Forwarded from header shows after the sender, which Telegram leaves empty. */
    public static CharSequence compact(Object message, CharSequence text) {
        if (text != null && text.length() > 0 || message == null) return text;
        try {
            String when = when(message);
            if (when == null) return text;
            HookStatus.counted(FamilyNames.SHOW_LOCAL_IDS, "forward date shown");
            return when;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SHOW_LOCAL_IDS, "forward date", failure);
            return text;
        }
    }

    /** When [message] was first sent as the phone writes a date and time, or null when it shouldn't show. */
    private static String when(Object message) {
        if (!on()) return null;
        int sent = sentAt(message);
        if (sent <= 0) return null;
        Context context = Utils.getContext();
        return context == null ? null : JoinDates.when(context, sent);
    }

    static boolean on() {
        try {
            return Utils.settingsReady() && Settings.FORWARD_DATES.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SHOW_LOCAL_IDS, "forward dates switch", failure);
            return false;
        }
    }

    /** Replaced when patching: when [message], one of Telegram's messages, was first sent; 0 when it isn't a forward. */
    public static int sentAt(Object message) { return 0; }
}
