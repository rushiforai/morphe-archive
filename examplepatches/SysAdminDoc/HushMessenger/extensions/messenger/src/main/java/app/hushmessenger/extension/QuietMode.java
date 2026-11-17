package app.hushmessenger.extension;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.Person;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Parcelable;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.Set;
import java.util.function.LongSupplier;

/**
 * Quiet mode (#190). A break from Messenger. While it's on, messages and calls still arrive and still wait in the
 * notification shade, but the phone neither rings nor vibrates for them. A message notification goes up on a channel of
 * HushMessenger's own, made at Android's low importance, which is what takes the sound and the vibration off it. A call
 * takes the path Quiet incoming calls already uses, so it waits in the shade with Answer and Decline.
 *
 * A break runs until a time picked from the sheet, or until it's turned off, and the daily window starts and ends one on
 * its own between two times. People tracked under Special contacts come through either way.
 */
public final class QuietMode {
    static final String KEY = "quiet_mode";
    /** When the break running now ends, on the wall clock. 0 is a break with no end of its own. */
    static final String UNTIL = "quiet_mode_until";
    /** The daily window's switch, and the window itself in minutes past midnight. */
    static final String DAILY = "quiet_mode_daily";
    static final String FROM = "quiet_mode_from", TO = "quiet_mode_to";
    static final int DEFAULT_FROM = 22 * 60, DEFAULT_TO = 7 * 60;
    static final int DAY = 24 * 60;
    /** The channel a quieted message goes up on. Low importance, so Android neither sounds it nor vibrates. */
    static final String CHANNEL = "hush_quiet_mode";
    /** What the sheet offers, in minutes, with the break that has no end last. */
    static final int[] BREAKS = {15, 60, 120, 480, 0};
    /** The keys one message bundle in EXTRA_MESSAGES carries its writer under, Android 28 and the one before it. */
    static final String SENDER_PERSON = "sender_person", SENDER = "sender";

    static LongSupplier clock = System::currentTimeMillis;
    private static volatile boolean channelMade;

    private QuietMode() {}

    static void resetForTests() {
        clock = System::currentTimeMillis;
        channelMade = false;
    }

    /** When the break running now ends, or 0 for one with no end. */
    static long until() {
        SharedPreferences prefs = Settings.preferences;
        return prefs == null ? 0 : prefs.getLong(UNTIL, 0);
    }

    static boolean daily() {
        SharedPreferences prefs = Settings.preferences;
        return prefs != null && prefs.getBoolean(DAILY, false);
    }

    static int from() { return minute(FROM, DEFAULT_FROM); }

    static int to() { return minute(TO, DEFAULT_TO); }

    private static int minute(String key, int fallback) {
        SharedPreferences prefs = Settings.preferences;
        int saved = prefs == null ? fallback : prefs.getInt(key, fallback);
        return saved >= 0 && saved < DAY ? saved : fallback;
    }

    /**
     * A break is running: one with no end, which is what the switch on its own means, or one whose time hasn't come yet.
     * With the daily window on, a break with no end has already ended, since the window is what drives quiet mode then.
     */
    static boolean onBreak() {
        long until = until();
        if (until <= 0) return !daily();
        return clock.getAsLong() < until;
    }

    /** Inside the daily window, which may run past midnight. Two times the same are no window at all. */
    static boolean inWindow(int minute) {
        int from = from(), to = to();
        if (from == to) return false;
        return from < to ? minute >= from && minute < to : minute >= from || minute < to;
    }

    /** Minutes past midnight, now. */
    static int nowMinutes() {
        Calendar now = Calendar.getInstance();
        now.setTimeInMillis(clock.getAsLong());
        return now.get(Calendar.HOUR_OF_DAY) * 60 + now.get(Calendar.MINUTE);
    }

    /** Quiet right now: the switch is on, and a break or the daily window is running. */
    static boolean quietNow() {
        if (!Settings.wouldUse(KEY)) return false;
        return onBreak() || (daily() && inWindow(nowMinutes()));
    }

    /**
     * A message notification on its way up. While quiet mode is on it comes back on HushMessenger's own low channel, so
     * it waits in the shade without a sound. A message from a special contact, and every message with quiet mode off,
     * comes back as it was.
     */
    public static Notification message(Notification notification) {
        if (notification == null) return notification;
        try {
            if (!quietNow()) return notification;
            SpecialContacts.checkSoon();
            if (isSpecial(senderName(notification))) return notification;
            Context context = Settings.appContext;
            if (context == null || CHANNEL.equals(notification.getChannelId())) return notification;
            channel(context);
            // A recovered builder adopts the notification it was handed and build() gives that same object back, so a
            // copy goes on the quiet channel instead. Messenger keeps the notification it built, and one it posts again
            // after the break has run out still arrives with its own channel and its own sound.
            Notification quiet = Notification.Builder.recoverBuilder(context, notification.clone())
                .setChannelId(CHANNEL).build();
            Settings.enabled(KEY);
            return quiet;
        } catch (RuntimeException error) {
            Settings.hookFailed(KEY, "Couldn't quiet the notification", error);
            return notification;
        }
    }

    /** Whether the call coming in now may come in quietly because quiet mode is on. */
    static boolean call() {
        try {
            if (!quietNow()) return false;
            SpecialContacts.checkSoon();
            if (isSpecial(QuietCalls.lastCallerName()) || isTracked(QuietCalls.ringingChat())) return false;
            Settings.enabled(KEY);
            return true;
        } catch (RuntimeException error) {
            Settings.hookFailed(KEY, "Couldn't tell whether the call is a quiet one", error);
            return false;
        }
    }

    /**
     * The name a messaging notification is from: whoever wrote the newest message in it, else what it's titled. The
     * messages ride in {@link Notification#EXTRA_MESSAGES} as one bundle each, under the keys the platform's own
     * MessagingStyle reads them back from. Android keeps the static that unpacks them to itself, so this reads the
     * bundles, and anything unexpected in them falls through to the title.
     */
    @SuppressWarnings("deprecation")
    static String senderName(Notification notification) {
        if (notification.extras == null) return null;
        Parcelable[] messages = null;
        try {
            messages = notification.extras.getParcelableArray(Notification.EXTRA_MESSAGES);
        } catch (RuntimeException unreadable) {
            messages = null;
        }
        for (int at = messages == null ? -1 : messages.length - 1; at >= 0; at--) {
            if (!(messages[at] instanceof Bundle)) continue;
            Bundle message = (Bundle) messages[at];
            String name;
            try {
                Object who = message.get(SENDER_PERSON);
                name = clean(who instanceof Person ? ((Person) who).getName() : null);
                if (name == null) name = clean(message.getCharSequence(SENDER));
            } catch (RuntimeException unreadable) {
                name = null;
            }
            if (name != null) return name;
        }
        return clean(notification.extras.getCharSequence(Notification.EXTRA_TITLE));
    }

    private static String clean(CharSequence value) {
        if (value == null) return null;
        String name = value.toString().trim();
        return name.isEmpty() ? null : name;
    }

    /** Whether a name belongs to someone tracked under Special contacts. */
    static boolean isSpecial(String name) {
        if (name == null) return false;
        Set<String> names = SpecialContacts.names();
        return !names.isEmpty() && names.contains(name.toLowerCase(Locale.ROOT));
    }

    private static boolean isTracked(String chat) {
        return chat != null && SpecialContacts.tracked.contains(chat);
    }

    /** Made once, and only when there's something to quiet, so a phone that never takes a break gains no channel. */
    private static void channel(Context context) {
        if (channelMade) return;
        NotificationManager manager = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
        if (manager == null) return;
        NotificationChannel channel = new NotificationChannel(CHANNEL, new SettingsText(context).get("quiet_mode_channel"),
            NotificationManager.IMPORTANCE_LOW);
        channel.setSound(null, null);
        channel.enableVibration(false);
        manager.createNotificationChannel(channel);
        channelMade = true;
    }

    /** Starts a break of [minutes], or one with no end when it's 0. */
    static void startBreak(int minutes) {
        SharedPreferences prefs = Settings.preferences;
        if (prefs == null) return;
        prefs.edit().putLong(UNTIL, minutes <= 0 ? 0 : clock.getAsLong() + minutes * 60_000L).apply();
    }

    /** Ends the break running now. The daily window, when it's on, still has its say. */
    static void endBreak() {
        SharedPreferences prefs = Settings.preferences;
        if (prefs == null) return;
        prefs.edit().putLong(UNTIL, clock.getAsLong()).apply();
    }

    static void setWindow(int from, int to) {
        SharedPreferences prefs = Settings.preferences;
        if (prefs == null || from < 0 || from >= DAY || to < 0 || to >= DAY) return;
        prefs.edit().putInt(FROM, from).putInt(TO, to).apply();
    }

    /**
     * A break the settings can show: quiet mode itself has to be on for one to be running, since the switch off is what
     * the whole feature off means, break or no break.
     */
    static boolean breakRunning() {
        return Settings.wouldUse(KEY) && onBreak();
    }

    /** What the break button says: the break running now, or the offer to take one. */
    static String breakLabel(Context context, SettingsText text) {
        if (!breakRunning()) return text.get("quiet_mode_break");
        long until = until();
        return until <= 0 ? text.get("quiet_mode_open") : text.get("quiet_mode_until", time(context, until));
    }

    /** One of the sheet's choices, by how long it lasts. */
    static String breakChoice(SettingsText text, int minutes) {
        if (minutes <= 0) return text.get("quiet_mode_no_end");
        if (minutes < 60) return text.get("quiet_mode_minutes", Integer.toString(minutes));
        return minutes == 60 ? text.get("quiet_mode_hour") : text.get("quiet_mode_hours", Integer.toString(minutes / 60));
    }

    /** A time of day written the way the phone writes one. */
    static String time(Context context, long at) {
        return android.text.format.DateFormat.getTimeFormat(context).format(new Date(at));
    }

    /** A minute of the day written the same way. */
    static String minuteLabel(Context context, int minute) {
        Calendar when = Calendar.getInstance();
        when.setTimeInMillis(clock.getAsLong());
        when.set(Calendar.HOUR_OF_DAY, minute / 60);
        when.set(Calendar.MINUTE, minute % 60);
        when.set(Calendar.SECOND, 0);
        when.set(Calendar.MILLISECOND, 0);
        return time(context, when.getTimeInMillis());
    }
}
