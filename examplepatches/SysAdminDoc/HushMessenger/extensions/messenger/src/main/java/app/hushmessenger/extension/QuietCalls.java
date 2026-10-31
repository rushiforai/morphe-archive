package app.hushmessenger.extension;

import android.app.Notification;
import android.app.Person;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.SystemClock;
import java.util.ArrayList;
import java.util.List;

/**
 * Quiet incoming calls, the notification half. Messenger's call service hands each call notification here just before
 * it posts it and moves to the foreground with it. With the switch on, an incoming call's notification goes back as
 * the only child of a group that alerts through its summary, and there is no summary. Android then neither sounds it
 * nor shows it on top of the screen, and SystemUI doesn't open its full-screen call screen over the lock screen. It
 * waits in the shade with Answer and Decline. The full-screen intent itself stays on the notification, since Android
 * refuses a call notification that has neither one nor a foreground service behind it.
 *
 * With Only chosen chats on, just the calls from chats turned on in the settings come in quietly. The ring decision
 * names the call's chat before it asks, and the notification brings the name the settings list it under.
 */
public final class QuietCalls {
    static final String GROUP = "hush_quiet_call";
    /** Notification.EXTRA_CALL_TYPE and CallStyle.CALL_TYPE_INCOMING, both Android 12. */
    static final String CALL_TYPE = "android.callType";
    static final int INCOMING = 1;
    /** Notification.EXTRA_CALL_PERSON, Android 12: the caller a CallStyle notification names. */
    static final String CALL_PERSON = "android.callPerson";
    static final String KEY = "quiet_calls";
    static final String CHOSEN_ONLY = "quiet_calls_chosen";
    /** One switch per chat, this prefix and the chat's key, so each binds like any other switch. */
    static final String CHAT_PREFIX = "quiet_call_chat_";
    /** The chats that called lately while the switch was on, newest first, one "key TAB name" line each. */
    static final String RECENT = "quiet_call_recent";
    static final int RECENT_LIMIT = 12;
    /** How long a call's chat and its notification's name stay paired, in either order. A call rings for about a minute. */
    static final long PAIR_MILLIS = 90_000;

    /** The chat the last ring decision named and when, on the elapsed clock. */
    private static volatile String ringingChat;
    private static volatile long ringingAt;
    /** A call notification's name that came before its decision, and when. */
    private static volatile String waitingName;
    private static volatile long waitingAt;

    private QuietCalls() {}

    /**
     * Called by the ring decision right before Messenger looks up the call's chat, with that lookup's thread id and the
     * caller id it parsed from the call (0 when it couldn't). Comes before the decision asks whether to ring.
     */
    public static void incoming(String thread, long caller) {
        try {
            String chat = chatKey(thread, caller);
            long now = SystemClock.elapsedRealtime();
            ringingChat = chat;
            ringingAt = now;
            String name = waitingName;
            if (chat != null && name != null && now - waitingAt <= PAIR_MILLIS) {
                waitingName = null;
                remember(chat, name);
            }
        } catch (RuntimeException error) {
            Settings.hookFailed(KEY, "Couldn't note the incoming call's chat", error);
        }
    }

    /** The thread for a group or a chat Messenger names, otherwise the person calling. Null with neither. */
    static String chatKey(String thread, long caller) {
        if (thread != null && !thread.trim().isEmpty()) return thread.trim();
        return caller > 0 ? Long.toString(caller) : null;
    }

    /** The notification to post: [notification] itself, made silent when it's an incoming call and the switch is on. */
    public static Notification incomingNotification(Notification notification, Context context) {
        if (notification == null || context == null) return notification;
        try {
            if (!isIncomingCall(notification)) return notification;
            noteName(callerName(notification));
            if (!Settings.quietIncomingCalls()) return notification;
            // The builder adopts the notification and writes into it, so the result is the same object Messenger posts.
            return Notification.Builder.recoverBuilder(context, notification)
                .setGroup(GROUP)
                .setGroupAlertBehavior(Notification.GROUP_ALERT_SUMMARY)
                .build();
        } catch (RuntimeException error) {
            Settings.hookFailed(KEY, "Couldn't quiet the incoming call notification", error);
            return notification;
        }
    }

    /** A call notification that rings: it has a full-screen intent, or its call style says incoming. */
    static boolean isIncomingCall(Notification notification) {
        if (!Notification.CATEGORY_CALL.equals(notification.category)) return false;
        if (notification.fullScreenIntent != null) return true;
        return notification.extras != null && notification.extras.getInt(CALL_TYPE, 0) == INCOMING;
    }

    /** The caller a call notification names: its call style's person, else its title. Null with neither. */
    @SuppressWarnings("deprecation")
    static String callerName(Notification notification) {
        if (notification.extras == null) return null;
        Object person = notification.extras.getParcelable(CALL_PERSON);
        CharSequence name = person instanceof Person ? ((Person) person).getName() : null;
        if (name == null || name.toString().trim().isEmpty()) name = notification.extras.getCharSequence(Notification.EXTRA_TITLE);
        return name == null || name.toString().trim().isEmpty() ? null : name.toString().trim();
    }

    /** Pairs a notification's name with the chat its decision named, or keeps it for a decision still to come. */
    private static void noteName(String name) {
        if (name == null) return;
        long now = SystemClock.elapsedRealtime();
        String chat = ringingChat;
        if (chat != null && now - ringingAt <= PAIR_MILLIS) remember(chat, name);
        else {
            waitingName = name;
            waitingAt = now;
        }
    }

    /** Puts a chat at the top of the recent list while the switch is on. Nothing is kept with it off. */
    static synchronized void remember(String chat, String name) {
        SharedPreferences prefs = Settings.preferences;
        if (prefs == null || !Settings.wouldUse(KEY)) return;
        String clean = name.replace('\t', ' ').replace('\n', ' ').replace('\r', ' ');
        List<String[]> chats = recent();
        if (!chats.isEmpty() && chats.get(0)[0].equals(chat) && chats.get(0)[1].equals(clean)) return;
        StringBuilder list = new StringBuilder(chat).append('\t').append(clean);
        int kept = 1;
        for (String[] entry : chats) {
            if (entry[0].equals(chat) || kept >= RECENT_LIMIT) continue;
            list.append('\n').append(entry[0]).append('\t').append(entry[1]);
            kept++;
        }
        prefs.edit().putString(RECENT, list.toString()).apply();
    }

    /** The recent list as {key, name} pairs, newest first. */
    static List<String[]> recent() {
        List<String[]> chats = new ArrayList<>();
        SharedPreferences prefs = Settings.preferences;
        String saved = prefs == null ? null : prefs.getString(RECENT, null);
        if (saved == null) return chats;
        for (String line : saved.split("\n")) {
            String[] entry = line.split("\t", 2);
            if (entry.length == 2 && !entry[0].isEmpty()) chats.add(entry);
        }
        return chats;
    }

    /**
     * Whether the call ringing now may come in quietly: every call, or with Only chosen chats on, a call whose chat the
     * decision named in the last [PAIR_MILLIS] and whose switch is on. A call it can't place rings.
     */
    static boolean chosen() {
        SharedPreferences prefs = Settings.preferences;
        if (prefs == null || !prefs.getBoolean(CHOSEN_ONLY, false)) return true;
        String chat = ringingChat;
        return chat != null && SystemClock.elapsedRealtime() - ringingAt <= PAIR_MILLIS && prefs.getBoolean(CHAT_PREFIX + chat, false);
    }

    /** Forgets the call in progress, for tests. */
    static void resetForTests() {
        ringingChat = null;
        ringingAt = 0;
        waitingName = null;
        waitingAt = 0;
    }
}
