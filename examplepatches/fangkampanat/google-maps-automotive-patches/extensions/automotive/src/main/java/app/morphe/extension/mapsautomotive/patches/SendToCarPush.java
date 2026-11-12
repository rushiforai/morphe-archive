package app.morphe.extension.mapsautomotive.patches;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;

import java.lang.ref.WeakReference;
import java.util.ArrayDeque;

import app.morphe.extension.shared.Utils;

/**
 * Send to car's push path (0.1.7): when pushes reach Maps, and a nudge to MicroG-RE's push connection.
 * <p>
 * Reports showed trips that stayed away for minutes and then arrived together, often seconds after Maps started.
 * MicroG-RE finds out that its push connection died only through its heartbeat; until then Google holds the pushes.
 * Two log points show where a trip stops, with times only, never a push's content:
 * <ul>
 * <li>each push Google delivers to Maps (Firebase's message intake), with how long after Google's send time it
 * arrived and how long after the last nudge;</li>
 * <li>each trip push Maps' Send to car handler takes, and which way Maps takes it: it starts the trip's screen at once
 * (when it counts itself in front, or may start screens from the background) or only posts a notification (then the
 * trip opens on a tap, or when Maps comes to the front).</li>
 * </ul>
 * The nudge: MicroG-RE's exported TriggerReceiver takes "app.revanced.gms.gcm.RECONNECT". While connected it sends a
 * heartbeat at once; while not connected it connects. MicroG-RE calls a connection dead only when a heartbeat ping has
 * gone unanswered for 90 s, and each new ping restarts that clock, so nudges are at least 100 s apart: a nudge after an
 * unanswered one finds the connection dead and connects again. Sent at the main process's start, when Maps' screen
 * comes into view, every 3 minutes while it stays visible, and when Send to car's status opens, each only when 100 s
 * have passed since the last. Only on a network Android has validated: offline, MicroG-RE lengthens its reconnect
 * delay at each request (up to 10 minutes). Nothing changes a setting, and nothing leaves the car but MicroG-RE's own
 * heartbeat or connection.
 * <p>
 * Some DiLink 5 head units force-stop MicroG-RE (reports from two Sealion 7s: "stop app.revanced.android.gms due to
 * from pid …"), and Android keeps a force-stopped app from every broadcast that does not include stopped packages. So
 * the nudge includes them, else every nudge is dropped until something else starts MicroG-RE. Delivering it starts
 * MicroG-RE's push process and clears Android's stopped state, as Maps' own use of MicroG-RE does; MicroG-RE still
 * ignores the nudge while its push is off. A nudge that finds MicroG-RE stopped (force-stopped, or never opened since
 * its install) says so in the log; Android clears that state once anything starts MicroG-RE, so a nudge without it
 * does not rule out an earlier force-stop.
 */
@SuppressWarnings("unused")
public final class SendToCarPush {
    private static final String TAG = "MorpheSendToCar";
    private static final String RECONNECT = "app.revanced.gms.gcm.RECONNECT";
    /** The push action as MicroG-RE delivers it (the patch routes Maps' check to this name). */
    private static final String RECEIVE = "app.revanced.android.c2dm.intent.RECEIVE";
    /**
     * Maps' main screen (single-task), the one trips open on and the one a hand-off starts. LimitedMapsActivity (a
     * card a launcher can embed) is not watched: as the asking screen it would hide MapsActivity's recreation, and
     * counted as visible it would let a hand-off start MapsActivity the user had just closed.
     */
    private static final String MAPS_ACTIVITY = "com.google.android.maps.MapsActivity";
    /** In Send to car's preferences (SendToCarStatus.PREFERENCES), main process. */
    static final String KEY_PUSH_AT = "push_at", KEY_PUSH_DELAY_S = "push_delay_s",
            KEY_TRIP_PUSH_AT = "trip_push_at", KEY_TRIP_PUSH_SHOWN = "trip_push_shown";
    /** How Maps took the last trip push: started its screen at once, or only a notification. */
    static final String SHOWN_NOW = "now", SHOWN_NOTIFICATION = "notification";
    /** Over MicroG-RE's 90 s for an unanswered ping; every 3 min while Maps is visible. */
    static final long NUDGE_GAP_MS = 100_000, PERIOD_MS = 3 * 60_000;
    /** The nudge reaches MicroG-RE after a force-stop too. */
    static final int NUDGE_FLAGS = Intent.FLAG_INCLUDE_STOPPED_PACKAGES;
    /** A nudge this recent is named in the push line. */
    static final long NUDGE_NAMED_MS = 60_000;
    /** Google's send time more than this ahead of the car's clock: the delay is not known. */
    static final long CLOCK_AHEAD_MS = 5 * 60_000;
    /** Firebase drops a message ID it saw among the last 10; so does the log. */
    private static final int RECENT_IDS = 10;

    /** The last nudge (SystemClock.elapsedRealtime), 0 for none. */
    private static volatile long lastNudge;
    /** The last MapsActivity created, and when (wall clock, 0 for none in this process). */
    private static volatile WeakReference<Activity> mapsActivity;
    private static volatile long mapsCreatedAt;
    private static final ArrayDeque<String> recentIds = new ArrayDeque<>();
    // Main thread.
    private static int visible;
    private static Handler main;
    private static Context app;
    private static final Runnable periodic = new Runnable() {
        @Override
        public void run() {
            if (visible <= 0 || app == null) return;
            nudge(app, "periodic");
            main.postDelayed(this, PERIOD_MS);
        }
    };

    private SendToCarPush() {
    }

    // The activity watch and the nudges.

    /** From the main process's start (ReportPatch.onAppStart), before any activity. */
    static void install(Context context) {
        try {
            if (!SafeMode.on(context, SafeMode.SEND_TO_CAR)) return;
            Context application = context.getApplicationContext();
            if (!(application instanceof Application)) return;
            app = application;
            main = new Handler(Looper.getMainLooper());
            ((Application) application).registerActivityLifecycleCallbacks(new Watch());
            nudge(application, "start");
        } catch (Throwable error) {
            ReportLog.w(TAG, "push nudges not installed", error);
        }
    }

    /** The last MapsActivity created, null when none or Send to car is off. */
    static Activity mapsActivity() {
        WeakReference<Activity> reference = mapsActivity;
        return reference == null ? null : reference.get();
    }

    /** When the last MapsActivity of this process was created (wall clock), 0 for none. */
    static long mapsCreatedAt() {
        return mapsCreatedAt;
    }

    /** Main thread: whether MapsActivity is in view (Android 10 lets the app start a screen then). */
    static boolean screenVisible() {
        return visible > 0;
    }

    /**
     * Asks MicroG-RE to check its push connection, on a validated network and 100 s after the last request at the
     * earliest. Returns whether it asked.
     */
    static boolean nudge(Context context, String reason) {
        try {
            if (context == null || !SafeMode.on(context, SafeMode.SEND_TO_CAR)) return false;
            long now = SystemClock.elapsedRealtime();
            if (!due(lastNudge, now, NUDGE_GAP_MS)) return false;
            ReportDiagnostics.NetworkState network = ReportDiagnostics.readNetwork(context);
            if (network == null || network.absent() || !network.validated) return false;
            lastNudge = now;
            boolean stopped = providerStopped(context);
            context.sendBroadcast(new Intent(RECONNECT).setPackage(SendToCarStatus.MICROG).addFlags(NUDGE_FLAGS));
            String line = nudgeLine(reason, stopped);
            if (line != null) ReportLog.i(TAG, line);
            return true;
        } catch (Throwable error) {
            ReportLog.w(TAG, "MicroG-RE not asked", error);
            return false;
        }
    }

    /**
     * Whether Android holds MicroG-RE stopped (after a force-stop or an install, until something starts it); false when
     * unreadable.
     */
    private static boolean providerStopped(Context context) {
        try {
            ApplicationInfo info = context.getPackageManager().getApplicationInfo(SendToCarStatus.MICROG, 0);
            return (info.flags & ApplicationInfo.FLAG_STOPPED) != 0;
        } catch (PackageManager.NameNotFoundException | RuntimeException error) {
            return false;
        }
    }

    /**
     * The log line for a nudge, null for none: the periodic ones go unlogged (a push that follows names the last
     * nudge anyway) unless MicroG-RE was stopped. Plain Java.
     */
    static String nudgeLine(String reason, boolean stopped) {
        if ("periodic".equals(reason) && !stopped) return null;
        return "asked MicroG-RE to check its push connection (" + reason + (stopped ? ", MicroG-RE was stopped" : "") + ")";
    }

    /** Whether a nudge may go now: none yet, or the gap has passed. Plain Java. */
    static boolean due(long last, long now, long gap) {
        return last == 0 || now - last >= gap || now < last;
    }

    /** MapsActivity's creation, and its coming into and going out of view. */
    private static final class Watch implements Application.ActivityLifecycleCallbacks {
        private static boolean maps(Activity activity) {
            return activity != null && MAPS_ACTIVITY.equals(activity.getClass().getName());
        }

        @Override
        public void onActivityCreated(Activity activity, Bundle state) {
            if (!maps(activity)) return;
            mapsActivity = new WeakReference<>(activity);
            mapsCreatedAt = System.currentTimeMillis();
        }

        @Override
        public void onActivityStarted(Activity activity) {
            if (!maps(activity)) return;
            if (visible++ > 0) return;
            nudge(activity.getApplicationContext(), "front");
            main.removeCallbacks(periodic);
            main.postDelayed(periodic, PERIOD_MS);
        }

        @Override
        public void onActivityStopped(Activity activity) {
            if (!maps(activity) || visible <= 0) return;
            if (--visible == 0) main.removeCallbacks(periodic);
        }

        @Override
        public void onActivityResumed(Activity activity) {
        }

        @Override
        public void onActivityPaused(Activity activity) {
        }

        @Override
        public void onActivitySaveInstanceState(Activity activity, Bundle state) {
        }

        @Override
        public void onActivityDestroyed(Activity activity) {
        }
    }

    // Injection points.

    /**
     * Injection point: the start of Firebase's message intake in Maps, for every intent it gets (the action is
     * checked here). Logs when a push arrived against Google's send time; nothing of its content.
     */
    public static void pushReceived(Intent intent) {
        try {
            if (intent == null || !RECEIVE.equals(intent.getAction()) || !SafeMode.on(SafeMode.SEND_TO_CAR)) return;
            String type = intent.getStringExtra("message_type");
            if ("deleted_messages".equals(type)) {
                ReportLog.w(TAG, "Google dropped pushes for this app that waited too long (deleted_messages)");
                return;
            }
            if (type != null && !"gcm".equals(type)) return;
            // A push MicroG-RE delivers again (after a reconnect) is dropped by Firebase; not logged twice either.
            if (!firstSeen(recentIds, intent.getStringExtra("google.message_id"))) return;
            long now = System.currentTimeMillis();
            Bundle extras = intent.getExtras();
            long delay = delaySeconds(extras == null ? null : extras.get("google.sent_time"), now);
            long sinceNudge = lastNudge == 0 ? -1 : SystemClock.elapsedRealtime() - lastNudge;
            ReportLog.i(TAG, pushLine(delay, sinceNudge));
            Context context = context();
            if (context != null) {
                preferences(context).edit().putLong(KEY_PUSH_AT, now).putLong(KEY_PUSH_DELAY_S, delay).apply();
            }
        } catch (Throwable error) {
            ReportLog.w(TAG, "push not logged", error);
        }
    }

    /** Injection point: the start of Maps' Send to car push handler. */
    public static void tripPushReceived() {
        try {
            if (!SafeMode.on(SafeMode.SEND_TO_CAR)) return;
            ReportLog.i(TAG, "a trip push reached Maps' Send to car handler");
            Context context = context();
            if (context != null) {
                preferences(context).edit().putLong(KEY_TRIP_PUSH_AT, System.currentTimeMillis())
                        .remove(KEY_TRIP_PUSH_SHOWN).apply();
            }
        } catch (Throwable error) {
            ReportLog.w(TAG, "trip push not logged", error);
        }
    }

    /**
     * Injection point: in Maps' Send to car push handler, before it either opens the trip at once ([now], its screen
     * in front) or only posts the notification.
     */
    public static void tripShown(boolean now) {
        try {
            if (!SafeMode.on(SafeMode.SEND_TO_CAR)) return;
            ReportLog.i(TAG, now ? "Maps starts the trip's screen now (it counts itself in front)"
                    : "Maps posted the trip as a notification (it counts itself in the background): it opens on a tap,"
                    + " or when Maps comes to the front");
            Context context = context();
            if (context != null) {
                preferences(context).edit().putString(KEY_TRIP_PUSH_SHOWN, now ? SHOWN_NOW : SHOWN_NOTIFICATION).apply();
            }
        } catch (Throwable error) {
            ReportLog.w(TAG, "trip push not logged", error);
        }
    }

    private static SharedPreferences preferences(Context context) {
        return context.getSharedPreferences(SendToCarStatus.PREFERENCES, Context.MODE_PRIVATE);
    }

    private static Context context() {
        return Utils.isContextSet() ? Utils.getContext() : null;
    }

    // Plain Java from here on, so it can be checked off the device.

    /**
     * Whether [id] is not among the last {@link #RECENT_IDS} seen, and remembers it; a push without an ID always
     * counts as new.
     */
    static boolean firstSeen(ArrayDeque<String> recent, String id) {
        if (id == null || id.isEmpty()) return true;
        synchronized (recent) {
            if (recent.contains(id)) return false;
            if (recent.size() >= RECENT_IDS) recent.removeFirst();
            recent.addLast(id);
            return true;
        }
    }

    /**
     * Seconds from Google's send time ([sent]: milliseconds as a Long or a String of digits) to [nowMs], 0 for a
     * send time up to 5 minutes ahead of the car's clock, -1 when unknown or further ahead.
     */
    static long delaySeconds(Object sent, long nowMs) {
        long sentMs;
        if (sent instanceof Number) {
            sentMs = ((Number) sent).longValue();
        } else if (sent instanceof String && ((String) sent).trim().matches("\\d{1,19}")) {
            try {
                sentMs = Long.parseLong(((String) sent).trim());
            } catch (NumberFormatException error) {
                return -1;
            }
        } else {
            return -1;
        }
        if (sentMs <= 0 || sentMs - nowMs > CLOCK_AHEAD_MS) return -1;
        return Math.max(0, nowMs - sentMs) / 1000;
    }

    /** The log line for a push: its delay ([delayS], -1 unknown) and a nudge [sinceNudgeMs] before it (-1 none). */
    static String pushLine(long delayS, long sinceNudgeMs) {
        StringBuilder line = new StringBuilder("push from Google arrived ");
        line.append(delayS < 0 ? "(send time unknown)" : delayS + " s after it was sent");
        if (sinceNudgeMs >= 0 && sinceNudgeMs <= NUDGE_NAMED_MS) {
            line.append("; ").append(sinceNudgeMs / 1000).append(" s after the app asked MicroG-RE to check its connection");
        }
        return line.toString();
    }
}
