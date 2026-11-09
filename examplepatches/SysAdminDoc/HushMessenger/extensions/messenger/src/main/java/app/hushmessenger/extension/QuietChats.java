package app.hushmessenger.extension;

import android.content.SharedPreferences;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Log chats that don't notify, under Keep a message log (#143). Messenger's notification check ends a muted chat's push
 * at its mute check and a restricted chat's at its folder check, so the log, which reads messages as their notification
 * is built, never saw either. With this switch on, the check lets both on and marks the chat quiet here, the log keeps
 * the message, and the notification manager drops a quiet chat's notification right before it would go up. Unsends
 * still go through, so the log marks them as it does in any chat.
 *
 * The check and the notification manager run on one push, a moment apart, so a mark only lasts {@link #HOLD_MS}. A chat
 * that notifies again clears its mark on its next message.
 */
final class QuietChats {
    private QuietChats() {}

    static final String KEY = "message_log_quiet_chats";
    /** Far longer than one push takes from the check to the notification manager, and short enough to go stale. */
    static final long HOLD_MS = 2 * 60_000L;
    private static final int MAX_CHATS = 200;

    private static final ConcurrentHashMap<String, Long> QUIET = new ConcurrentHashMap<>();
    /** Set by the folder guard when it let a restricted chat on only for the log; the mute check right after takes it. */
    private static final ThreadLocal<Boolean> RESTRICTED = new ThreadLocal<>();

    /** The message log is in effect and this switch under it is on. */
    static boolean wanted() {
        SharedPreferences prefs = Settings.preferences;
        return prefs != null && prefs.getBoolean(KEY, false) && Settings.wouldUse(MessageLog.KEY);
    }

    static void restrictedForLog(boolean on) {
        if (on) RESTRICTED.set(Boolean.TRUE);
        else RESTRICTED.remove();
    }

    private static boolean takeRestricted() {
        Boolean restricted = RESTRICTED.get();
        RESTRICTED.remove();
        return restricted != null && restricted;
    }

    /** The mute check found the chat muted. True lets the message on to the log. */
    static boolean muted(Object thread) {
        takeRestricted();
        if (thread == null) return false;
        if (!wanted()) {
            QUIET.remove(String.valueOf(thread));
            return false;
        }
        mark(String.valueOf(thread));
        return true;
    }

    /** The mute check found the chat notifies. A restricted chat let on only for the log stays quiet all the same. */
    static void notifies(Object thread) {
        boolean restricted = takeRestricted();
        if (thread == null) return;
        if (restricted && wanted()) mark(String.valueOf(thread));
        else QUIET.remove(String.valueOf(thread));
    }

    static boolean isQuiet(Object thread) {
        if (thread == null) return false;
        Long at = QUIET.get(String.valueOf(thread));
        return at != null && now() - at < HOLD_MS;
    }

    private static void mark(String thread) {
        long now = now();
        QUIET.put(thread, now);
        if (QUIET.size() <= MAX_CHATS) return;
        for (Iterator<Map.Entry<String, Long>> it = QUIET.entrySet().iterator(); it.hasNext(); ) {
            if (now - it.next().getValue() >= HOLD_MS) it.remove();
        }
    }

    /** Monotonic, so a clock change can't keep a mark alive or end it early. */
    private static long now() { return System.nanoTime() / 1_000_000L; }

    /** Tests start each case with no marks. */
    static void forget() {
        QUIET.clear();
        RESTRICTED.remove();
    }
}
