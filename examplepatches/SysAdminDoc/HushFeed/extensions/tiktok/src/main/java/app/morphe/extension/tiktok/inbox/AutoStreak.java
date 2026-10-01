/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.inbox;

import android.app.Activity;
import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.SystemClock;
import android.text.format.DateFormat;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.atomic.AtomicBoolean;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.preference.LogBufferManager;
import app.morphe.extension.tiktok.SignedInUser;
import app.morphe.extension.tiktok.settings.L10n;
import app.morphe.extension.tiktok.settings.Settings;

/**
 * Keeps a message streak going: one message to one person every day at a set time.
 *
 * <p>An alarm wakes {@link AutoStreakReceiver}, which the patch adds to the manifest switched
 * off and which is only switched on while this is. The receiver starts TikTok's messaging when
 * the process was not running and hands the message to TikTok's notification quick reply, the
 * same path a reply typed into a notification takes (see {@link StreakMessenger}). Opening
 * TikTok sends a message the alarm missed, and puts the alarm back after a reboot, an update or
 * a force stop that cleared it.
 *
 * <p>Nothing goes out because a setting changed. Turning the switch on, or moving the time, after
 * today's time has passed makes tomorrow the first day; Send it now is there for today.
 */
public final class AutoStreak {
    static final String ACTION_SEND = "app.morphe.extension.tiktok.inbox.AUTO_STREAK";
    /** Between one failed try and the next. */
    static final long RETRY_MILLIS = 15 * 60_000L;
    /** Tries an alarm makes in one day. Opening TikTok tries again past it. */
    static final int TRIES_PER_DAY = 4;
    /** An alarm's whole send, inside the minute Android gives a receiver that holds its broadcast. */
    static final long ALARM_BUDGET_MILLIS = 45_000L;
    /** A send from an open app or the settings row, which nothing is timing. */
    static final long OPEN_BUDGET_MILLIS = 60_000L;
    /** How early an alarm may land and still count as on time. */
    static final long EARLY_MILLIS = 60_000L;
    /**
     * How long after TikTok opens a message waits. The launch starts messaging only once its
     * first screen has settled, and the quick reply drops a message handed over before then.
     */
    static final long LAUNCH_SETTLE_MILLIS = 30_000L;
    private static final int REQUEST_CODE = 0x5154;

    enum Result { NONE, SENT, NO_RECIPIENT, SIGNED_OUT, NOT_FOUND, OTHER_ACCOUNT, NOT_READY, FAILED }

    private static final AtomicBoolean sending = new AtomicBoolean();

    /** So a test can fix the clock the day and the alarm are worked out from. */
    static volatile Long nowForTests;

    /**
     * Whether TikTok's main screen has been created in this process, whose launch starts
     * messaging. A process an alarm started has had no launch and starts it here.
     */
    static volatile boolean openedHere;
    /** When that was, in {@link SystemClock#elapsedRealtime}. */
    private static volatile long openedAt;
    /** Whether this process has set messaging up and started it itself. */
    private static boolean startedHere;

    private AutoStreak() {}

    /** What {@link Settings#AUTO_STREAK_STATE} holds, one field per line of a bar-separated row. */
    static final class State {
        /** The day the last message went, yyyy-MM-dd in the phone's time zone. */
        String sentDay = "";
        /** The day {@link #tries} counts. */
        String tryDay = "";
        int tries;
        Result result = Result.NONE;
        long resultAt;
        /** When the switch went on or the time moved. A time before it waits for tomorrow. */
        long activeSince;
        /** The uid of the account the recipient was entered on, or empty until one is seen. */
        String owner = "";
        /**
         * The handles {@link #sentDay}'s messages went to, lowercase, comma separated. Empty on a
         * row written before this was kept, which reads as whoever is entered now.
         */
        String sentTo = "";

        static State parse(String text) {
            State state = new State();
            if (text == null || text.isEmpty()) return state;
            String[] parts = text.split("\\|", -1);
            if (parts.length < 8 || !"1".equals(parts[0])) return state;
            try {
                state.sentDay = parts[1];
                state.tryDay = parts[2];
                state.tries = Integer.parseInt(parts[3]);
                state.result = Result.valueOf(parts[4]);
                state.resultAt = Long.parseLong(parts[5]);
                state.activeSince = Long.parseLong(parts[6]);
                state.owner = parts[7];
                if (parts.length > 8) state.sentTo = parts[8];
            } catch (RuntimeException unreadable) {
                // A row this build cannot read starts over rather than guessing at a field.
                return new State();
            }
            return state;
        }

        String format() {
            return "1|" + sentDay + "|" + tryDay + "|" + tries + "|" + result.name() + "|"
                    + resultAt + "|" + activeSince + "|" + owner + "|" + sentTo;
        }

        int triesOn(String day) {
            return day.equals(tryDay) ? tries : 0;
        }

        /** Whether {@code handle} has had a message on {@code day}. */
        boolean sentOn(String day, String handle) {
            if (!day.equals(sentDay)) return false;
            if (sentTo.isEmpty()) return true;
            return Arrays.asList(sentTo.split(",")).contains(handle.toLowerCase(Locale.ROOT));
        }

        /** Records that {@code handle} had a message on {@code day}. */
        void markSent(String day, String handle) {
            if (!day.equals(sentDay)) {
                sentDay = day;
                sentTo = "";
            }
            String key = handle.toLowerCase(Locale.ROOT);
            if (!Arrays.asList(sentTo.split(",")).contains(key)) {
                sentTo = sentTo.isEmpty() ? key : sentTo + "," + key;
            }
        }
    }

    static long now() {
        Long forTests = nowForTests;
        return forTests != null ? forTests : System.currentTimeMillis();
    }

    static synchronized State state() {
        return State.parse(Settings.AUTO_STREAK_STATE.get());
    }

    private static synchronized void save(State state) {
        Settings.AUTO_STREAK_STATE.save(state.format());
    }

    /** The day {@code millis} falls on, in the phone's time zone. */
    static String day(long millis) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTimeInMillis(millis);
        return String.format(Locale.US, "%04d-%02d-%02d", calendar.get(Calendar.YEAR),
                calendar.get(Calendar.MONTH) + 1, calendar.get(Calendar.DAY_OF_MONTH));
    }

    /** {@code minute} after midnight on the day {@code now} falls on, {@code days} later. */
    static long at(long now, int minute, int days) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTimeInMillis(now);
        calendar.add(Calendar.DAY_OF_YEAR, days);
        calendar.set(Calendar.HOUR_OF_DAY, minute / 60);
        calendar.set(Calendar.MINUTE, minute % 60);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
        return calendar.getTimeInMillis();
    }

    /** Whether today's message still has to go and its time has come. */
    static boolean isDue(State state, long now, int minute) {
        long today = at(now, minute, 0);
        return now >= today - EARLY_MILLIS && counts(state, now, today);
    }

    /**
     * Whether today's time is one this setup covers and the person entered now hasn't had
     * today's message.
     */
    private static boolean counts(State state, long now, long today) {
        return today >= state.activeSince && !state.sentOn(day(now), recipient());
    }

    /** The handle entered now, or empty. */
    private static String recipient() {
        return StreakMessenger.handleOf(Settings.AUTO_STREAK_RECIPIENT.get());
    }

    /**
     * When the alarm should next go off: today's time while it is ahead, a retry while today's
     * message is late and tries are left, and otherwise tomorrow's time.
     */
    static long nextAlarm(State state, long now, int minute) {
        long today = at(now, minute, 0);
        if (counts(state, now, today)) {
            if (now < today - EARLY_MILLIS) return today;
            if (state.triesOn(day(now)) < TRIES_PER_DAY) return now + RETRY_MILLIS;
        }
        return at(now, minute, 1);
    }

    // ---------------------------------------------------------------------------------------
    // Entry points.

    /** From TikTok's main activity: puts the alarm back, and sends a message the alarm missed. */
    public static void onAppOpened(Activity activity) {
        if (!openedHere) {
            openedHere = true;
            openedAt = SystemClock.elapsedRealtime();
        }
        final Context context = activity.getApplicationContext();
        LogBufferManager.registerReportSection(Report.INSTANCE);
        onSendThread(() -> {
            try {
                reconcile(context);
                if (Settings.AUTO_STREAK.get()
                        && isDue(state(), now(), Settings.AUTO_STREAK_MINUTE.get())) {
                    run(context, OPEN_BUDGET_MILLIS, false);
                }
            } catch (Exception ex) {
                Logger.printException(() -> "Auto streak: app open failed", ex);
            }
        });
    }

    /** From {@link AutoStreakReceiver}: an alarm, a reboot, an update or a clock change. */
    static void onReceive(Context context, Intent intent, BroadcastReceiver.PendingResult pending) {
        final Context app = context.getApplicationContext();
        onSendThread(() -> {
            try {
                Logger.printInfo(() -> "Auto streak: woken by " + intent.getAction());
                if (!Settings.AUTO_STREAK.get()) {
                    reconcile(app);
                    return;
                }
                if (isDue(state(), now(), Settings.AUTO_STREAK_MINUTE.get())) {
                    run(app, ALARM_BUDGET_MILLIS, true);
                } else {
                    reconcile(app);
                }
            } catch (Exception ex) {
                Logger.printException(() -> "Auto streak: alarm failed", ex);
            } finally {
                if (pending != null) pending.finish();
            }
        });
    }

    /**
     * From the settings rows, once a change has been saved. {@code fresh} is true when the
     * switch went on or the time moved, which makes a time already past today wait for tomorrow.
     */
    public static void settingsChanged(Context context, boolean fresh) {
        final Context app = context.getApplicationContext();
        LogBufferManager.registerReportSection(Report.INSTANCE);
        if (fresh) {
            State state = state();
            state.activeSince = now();
            save(state);
        }
        Utils.runOnBackgroundThread(() -> reconcile(app));
    }

    /**
     * From the recipient row, once saved, with what it held before: the account signed in now
     * is the one that sends.
     */
    public static void recipientChanged(Context context, String before) {
        State state = state();
        String self = SignedInUser.id();
        state.owner = self == null ? "" : self;
        // A different person starts like a switch turned on: today if the time is still ahead,
        // tomorrow if it has passed. Whoever already had today's message stays on the day's
        // list, so typing them again, or going back to them, doesn't send a second one.
        String handle = recipient();
        String previous = StreakMessenger.handleOf(before);
        boolean different = !handle.equalsIgnoreCase(previous);
        if (state.sentTo.isEmpty() && !state.sentDay.isEmpty() && !previous.isEmpty()) {
            // A row from before the list was kept: its message went to the person entered then.
            state.sentTo = previous.toLowerCase(Locale.ROOT);
        }
        save(state);
        settingsChanged(context, different);
    }

    /** Callback for {@link #sendNow}, on the main thread. */
    public interface Done {
        void sent(String toast);
    }

    /** From the Send it now row: today's message, straight away. */
    public static void sendNow(Context context, Done done) {
        final Context app = context.getApplicationContext();
        if (!sending.compareAndSet(false, true)) {
            done.sent(L10n.t(app, "A message is already on its way"));
            return;
        }
        onSendThread(() -> {
            Result result;
            try {
                result = attempt(app, OPEN_BUDGET_MILLIS, false, true);
                if (result != Result.NONE) finish(result);
                reconcile(app);
            } finally {
                sending.set(false);
            }
            final String toast = result == Result.SENT
                    ? L10n.f(app, "Sent to @%1$s", StreakMessenger.handleOf(Settings.AUTO_STREAK_RECIPIENT.get()))
                    : problem(app, result);
            Utils.runOnMainThread(() -> done.sent(toast));
        });
    }

    // ---------------------------------------------------------------------------------------

    /**
     * Runs a send on a thread of its own. A send can wait most of a minute for messaging, and the
     * shared background pool's three threads carry every other task Hushfeed has.
     */
    private static void onSendThread(Runnable task) {
        Thread thread = new Thread(task, "hushfeed-auto-streak");
        thread.setDaemon(true);
        thread.start();
    }

    /** Arms or clears the alarm and the receiver to match the switch. */
    static void reconcile(Context context) {
        boolean on = Settings.AUTO_STREAK.get();
        setReceiverEnabled(context, on);
        AlarmManager alarms = (AlarmManager) context.getSystemService(Context.ALARM_SERVICE);
        if (alarms == null) return;
        if (!on) {
            alarms.cancel(alarmIntent(context));
            return;
        }
        State state = state();
        if (state.activeSince == 0) {
            // Turned on by a restore rather than by the switch: the same as turning it on now.
            state.activeSince = now();
            save(state);
        }
        long next = nextAlarm(state, now(), Settings.AUTO_STREAK_MINUTE.get());
        schedule(alarms, context, next);
        Logger.printInfo(() -> "Auto streak: next alarm " + new Date(next));
    }

    private static void run(Context context, long budget, boolean fromAlarm) {
        if (!sending.compareAndSet(false, true)) return;
        try {
            // An alarm counts its tries; opening the app or tapping the row is a try of its own.
            Result result = attempt(context, budget, fromAlarm, false);
            // NONE is a try called off on the way, which neither went nor counts.
            if (result == Result.SENT || (fromAlarm && result != Result.NONE)) finish(result);
            else if (result != Result.NONE) note(result);
            reconcile(context);
        } finally {
            sending.set(false);
        }
    }

    /** Records how a try ended and counts it towards today's. */
    private static void finish(Result result) {
        long now = now();
        String today = day(now);
        State state = state();
        if (!today.equals(state.tryDay)) {
            state.tryDay = today;
            state.tries = 0;
        }
        state.tries++;
        state.result = result;
        state.resultAt = now;
        save(state);
    }

    /** Adds {@code handle} to today's list the moment its message is handed over. */
    private static void markSent(String handle) {
        State state = state();
        state.markSent(day(now()), handle);
        save(state);
    }

    private static void note(Result result) {
        State state = state();
        state.result = result;
        state.resultAt = now();
        save(state);
    }

    /**
     * One try at today's message. {@code manual} is Send it now, which goes whether or not the
     * switch is on.
     */
    private static Result attempt(Context context, long budget, boolean fromAlarm, boolean manual) {
        String handle = recipient();
        if (handle.isEmpty()) return Result.NO_RECIPIENT;
        long deadline = SystemClock.elapsedRealtime() + budget;
        try {
            Object service = StreakMessenger.startMessaging();
            boolean cold = !openedHere;
            if (cold && !startedHere) {
                startedHere = true;
                StreakMessenger.initializeMessaging(service);
                StreakMessenger.kickMessaging(context);
            }
            String self = StreakMessenger.awaitSignedIn(deadline);
            if (self == null) return Result.SIGNED_OUT;
            State state = state();
            if (state.owner.isEmpty()) {
                state.owner = self;
                save(state);
            } else if (!state.owner.equals(self)) {
                return Result.OTHER_ACCOUNT;
            }
            StreakMessenger.Contact peer = StreakMessenger.findContact(context, self, handle);
            if (peer == null) return Result.NOT_FOUND;
            if (!StreakMessenger.awaitReady(context, deadline)) return Result.NOT_READY;
            // The sender answers as soon as messaging is set up, before it has signed in and
            // connected, and a message handed over then was dropped without a trace.
            long wait = cold ? StreakMessenger.warmUpMillis
                    : openedAt + LAUNCH_SETTLE_MILLIS - SystemClock.elapsedRealtime();
            long left = deadline - SystemClock.elapsedRealtime() - StreakMessenger.settleMillis;
            SystemClock.sleep(Math.max(0, Math.min(wait, left)));
            // The wait can be most of a minute: a switch turned off or a person changed in it
            // calls this one off.
            if ((!manual && !Settings.AUTO_STREAK.get()) || !handle.equals(recipient())) {
                return Result.NONE;
            }
            StreakMessenger.deliver(context, StreakMessenger.conversationId(self, peer.uid), message());
            // Saved before the wait below, so a process that dies in it doesn't leave a message
            // that went out unrecorded, to go again on the next open.
            markSent(handle);
            // The quick reply hands the message to TikTok's own sender and returns. The wait
            // keeps a process the alarm started alive until that has put it on the network. An
            // open app stays alive by itself, and Send it now answered eight seconds late.
            if (fromAlarm || cold) SystemClock.sleep(StreakMessenger.settleMillis);
            Logger.printInfo(() -> "Auto streak: sent to @" + handle);
            return Result.SENT;
        } catch (Exception ex) {
            Logger.printException(() -> "Auto streak: send failed", ex);
            return Result.FAILED;
        }
    }

    static String message() {
        String text = Settings.AUTO_STREAK_MESSAGE.get();
        return text == null || text.trim().isEmpty()
                ? Settings.AUTO_STREAK_MESSAGE.defaultValue : text.trim();
    }

    private static PendingIntent alarmIntent(Context context) {
        Intent intent = new Intent(ACTION_SEND).setClass(context, AutoStreakReceiver.class);
        return PendingIntent.getBroadcast(context, REQUEST_CODE, intent,
                PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE);
    }

    private static void schedule(AlarmManager alarms, Context context, long at) {
        PendingIntent pending = alarmIntent(context);
        // The patch asks for exact alarms. Where Android still refuses them the alarm comes a
        // little late rather than not at all.
        if (exactAllowed(alarms)) {
            alarms.setExactAndAllowWhileIdle(AlarmManager.RTC_WAKEUP, at, pending);
        } else {
            alarms.setAndAllowWhileIdle(AlarmManager.RTC_WAKEUP, at, pending);
        }
    }

    private static boolean exactAllowed(AlarmManager alarms) {
        return Build.VERSION.SDK_INT < 31 || alarms.canScheduleExactAlarms();
    }

    private static void setReceiverEnabled(Context context, boolean on) {
        try {
            PackageManager packages = context.getPackageManager();
            ComponentName receiver = new ComponentName(context, AutoStreakReceiver.class);
            int wanted = on ? PackageManager.COMPONENT_ENABLED_STATE_ENABLED
                    : PackageManager.COMPONENT_ENABLED_STATE_DEFAULT;
            if (packages.getComponentEnabledSetting(receiver) != wanted) {
                packages.setComponentEnabledSetting(receiver, wanted, PackageManager.DONT_KILL_APP);
            }
        } catch (IllegalArgumentException | SecurityException missing) {
            // A bundle without the patch has no receiver to switch.
            Logger.printInfo(() -> "Auto streak: no receiver in the manifest");
        }
    }

    /**
     * The streak in the diagnostic export: how the last try went and when the next is, which a
     * report of a missed day needs and the settings row only shows on the phone. It never names
     * the recipient.
     */
    static final class Report implements LogBufferManager.ReportSection {
        static final Report INSTANCE = new Report();

        private Report() {}

        @Override
        public String title() {
            return "AUTO STREAK";
        }

        @Override
        public List<String> lines() {
            List<String> lines = new ArrayList<>();
            boolean on = Settings.AUTO_STREAK.get();
            if (!on && Settings.AUTO_STREAK_STATE.get().isEmpty()) return lines;
            State state = state();
            long now = now();
            int minute = Settings.AUTO_STREAK_MINUTE.get();
            lines.add("On: " + (on ? "yes" : "no"));
            lines.add("Recipient entered: "
                    + (StreakMessenger.handleOf(Settings.AUTO_STREAK_RECIPIENT.get()).isEmpty() ? "no" : "yes"));
            String self = SignedInUser.id();
            lines.add("Account: " + (state.owner.isEmpty() ? "not seen yet"
                    : self == null ? "signed out" : state.owner.equals(self) ? "the one it was set up on"
                    : "a different one"));
            lines.add(String.format(Locale.US, "Time: %02d:%02d", minute / 60, minute % 60));
            lines.add("Last sent: " + (state.sentDay.isEmpty() ? "never" : state.sentDay));
            lines.add("Last try: " + state.result.name()
                    + (state.resultAt == 0 ? "" : " at " + stamp(state.resultAt)));
            lines.add("Alarm tries today: " + state.triesOn(day(now)));
            if (on) lines.add("Next alarm: " + stamp(nextAlarm(state, now, minute)));
            AlarmManager alarms = (AlarmManager) Utils.getContext().getSystemService(Context.ALARM_SERVICE);
            if (alarms != null) {
                lines.add("Exact alarms: " + (exactAllowed(alarms) ? "allowed" : "refused, so an alarm can come late"));
            }
            return lines;
        }

        private static String stamp(long millis) {
            return String.format(Locale.US, "%1$tF %1$tR", millis);
        }
    }

    // ---------------------------------------------------------------------------------------
    // What the rows say.

    static String time(Context context, long millis) {
        return DateFormat.getTimeFormat(context).format(new Date(millis));
    }

    /** The line under the switch: what happened last and what happens next. */
    public static String statusLine(Context context) {
        if (!Settings.AUTO_STREAK.get()) return null;
        if (StreakMessenger.handleOf(Settings.AUTO_STREAK_RECIPIENT.get()).isEmpty()) {
            return L10n.t(context, "Enter who to message below to start.");
        }
        State state = state();
        long now = now();
        int minute = Settings.AUTO_STREAK_MINUTE.get();
        long next = nextAlarm(state, now, minute);
        String today = day(now);
        boolean triedToday = today.equals(day(state.resultAt)) && state.resultAt > 0;
        if (state.sentOn(today, recipient())) {
            return L10n.f(context, "Sent today at %1$s. The next one goes tomorrow at %2$s.",
                    time(context, state.resultAt), time(context, next));
        }
        if (triedToday && state.result != Result.SENT && state.result != Result.NONE) {
            return problem(context, state.result, next);
        }
        return day(next).equals(today)
                ? L10n.f(context, "Next message: today at %1$s.", time(context, next))
                : L10n.f(context, "Next message: tomorrow at %1$s.", time(context, next));
    }

    private static String problem(Context context, Result result) {
        return problem(context, result, nextAlarm(state(), now(), Settings.AUTO_STREAK_MINUTE.get()));
    }

    static String problem(Context context, Result result, long next) {
        String handle = StreakMessenger.handleOf(Settings.AUTO_STREAK_RECIPIENT.get());
        switch (result) {
            case NO_RECIPIENT:
                return L10n.t(context, "Enter who to message below to start.");
            case NOT_FOUND:
                return L10n.f(context, "No chat with @%1$s turned up on this account. "
                        + "Open your chat with them once, then try again.", handle);
            case SIGNED_OUT:
                return L10n.f(context, "Nobody was signed in to TikTok. Sign in, and it tries again at %1$s.",
                        time(context, next));
            case OTHER_ACCOUNT:
                return L10n.t(context, "A different account is signed in. Switch back to the one "
                        + "you set this up on, or enter who to message again.");
            case NOT_READY:
                return L10n.f(context, "TikTok's messages didn't start in time. It tries again at %1$s.",
                        time(context, next));
            default:
                return L10n.f(context, "The message didn't go through. It tries again at %1$s.",
                        time(context, next));
        }
    }

    /**
     * The last contact lookup for the recipient row, as {@code self TAB handle}, and what it
     * found. The row is drawn again on every scroll, and the lookup opens a database.
     */
    private static String noteKey;
    private static StreakMessenger.Contact notePeer;
    private static long noteAt;
    /** How long a lookup that found nobody is kept, so a chat opened since turns up. */
    private static final long NOTE_MISS_MILLIS = 5_000L;

    /** The line under the recipient row: who the handle turned out to be, or that nobody did. */
    public static String recipientNote(Context context, String typed) {
        String handle = StreakMessenger.handleOf(typed);
        if (handle.isEmpty()) return null;
        String self = SignedInUser.id();
        if (self == null) return null;
        StreakMessenger.Contact peer = lookUp(context, self, handle);
        if (peer == null) {
            return L10n.f(context, "No chat with @%1$s turned up on this account. "
                    + "Open your chat with them once, then try again.", handle);
        }
        String name = peer.name == null || peer.name.isEmpty() ? "@" + handle : peer.name;
        return L10n.f(context, "Found %1$s in your chats.", name);
    }

    private static synchronized StreakMessenger.Contact lookUp(Context context, String self, String handle) {
        String key = self + '\t' + handle.toLowerCase(Locale.ROOT);
        long now = SystemClock.elapsedRealtime();
        if (key.equals(noteKey) && (notePeer != null || now - noteAt < NOTE_MISS_MILLIS)) return notePeer;
        notePeer = StreakMessenger.findContact(context, self, handle);
        noteKey = key;
        noteAt = now;
        return notePeer;
    }
}
