package app.morphe.extension.mapsautomotive.patches;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.widget.Toast;

import java.lang.ref.WeakReference;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.regex.Pattern;

import app.morphe.extension.shared.Utils;

/**
 * Send to car: opens trips sent from phone Maps.
 * <p>
 * A trip arrives as a maps.app.goo.gl link. Maps expands such links with Firebase Dynamic Links in
 * Play services; MicroG-RE 7.2.2 answers without data (MicroG-RE #329), so the trip was dropped
 * without a message. The short link is a plain HTTPS redirect to a Google Maps URL. Maps' intent
 * processor asks {@link #expand} first: this class follows that one redirect on a worker thread and
 * hands the Maps URL to the processor's own continuation after Dynamic Links ({@link Target}, added
 * by the patch), on the main thread, with the original intent and its extras. No account data is
 * sent; the request is the one the link itself asks for.
 * <p>
 * Maps keeps a sent trip and shows it again at each start until the route preview opened for it is
 * closed, but it watches for that only when it parses the intent itself, not for a link. On a car
 * where every start is a cold start the trip came back each time. Once a sent trip's link is open,
 * Maps' own clear call forgets it; a trip that was not opened (notification not tapped, or a link
 * that could not be expanded) is still shown at the next start.
 * <p>
 * From 0.1.7: a link is retried for up to 30 s (a cold start right after the car wakes may have no network yet);
 * a link whose expansion failed in an unexpected way no longer blocks the same link until the app restarts; and
 * when the Maps screen that asked for the link is gone by the time it is expanded, the trip goes to the new
 * screen, else it is neither opened on the old one nor forgotten.
 */
@SuppressWarnings("unused")
public final class SendToCarLinks {
    private static final String TAG = "MorpheSendToCar";
    private static final String SHORT_LINK_HOST = "maps.app.goo.gl";
    private static final String ORIGINAL_PACKAGE = "com.google.android.apps.maps";
    private static final int TIMEOUT_MS = 6000;
    // A link sent from the phone a moment ago can answer 404 for a few seconds, and a cold start right after the
    // car wakes may have no network yet: retry for up to 30 s, 1, 2, then every 4 s.
    static final long RETRY_UNTIL_MS = 30_000, FIRST_RETRY_MS = 1000, MAX_RETRY_MS = 4000;
    /**
     * A link being expanded blocks the same link for at most this long from when the worker took it up (a try takes
     * up to 12 s, the last starts before 30 s), whatever happened to its expansion.
     */
    static final long EXPANDING_MS = 120_000;
    private static final Pattern GOOGLE_SUFFIX = Pattern.compile("[a-z]{2,3}(\\.[a-z]{2,3})?");
    /** Maps' extra for a sent trip and its values in 120003.E (its enum of how the trip is shown). */
    private static final String SEND_TO_CAR_EXTRA = "SEND_TO_CAR_INTENT";
    private static final Set<String> SEND_TO_CAR_TYPES = new HashSet<>(Arrays.asList("NONE", "NOTIFICATION_TAP",
            "FIRST_SHOW_ON_ACTIVITY_RESUME", "FIRST_SHOW_ACTIVITY_IN_FOREGROUND", "FIRST_SHOW_ACTIVITY_IN_BACKGROUND",
            "FIRST_SHOW_AFTER_RESTART", "RESHOW"));
    /** Ours, on a trip handed to a new Maps screen, so it is handed on only once. */
    private static final String HANDED_ON = "morphe_send_to_car_handed_on";
    /** The links being expanded and their entries. Guarded by itself. */
    private static final Map<String, InFlight> expanding = new HashMap<>();
    private static ExecutorService worker;
    private static Handler main;

    /** Implemented by Maps' intent processor (added by the patch). */
    public interface Target {
        /** Maps' continuation after Dynamic Links, with the expanded Maps URL. */
        void morpheOpenMapsLink(Intent intent, Uri referrer, String mapsUrl);

        /** Maps' clear call for the saved sent trip (the one its route-preview observer makes). */
        void morpheClearSentTrip();
    }

    private SendToCarLinks() {
    }

    /**
     * Injection point: each package name GnpSdk puts into its registration and device-info requests.
     * Google accepts them only under the package MicroG-RE signs Maps in as (its SPOOFED_PACKAGE_NAME);
     * with Send to car switched off GnpSdk keeps this app's own package, as before Send to car existed.
     */
    public static String chimePackage(String own) {
        return SafeMode.on(SafeMode.SEND_TO_CAR) ? ORIGINAL_PACKAGE : own;
    }

    /**
     * Injection point: just before Maps asks Dynamic Links about a maps.app.goo.gl link. Returns true
     * when this class handles the link; Maps then skips Dynamic Links.
     */
    public static boolean expand(Object processor, Intent intent, Uri referrer) {
        try {
            if (!(processor instanceof Target) || intent == null || !SafeMode.on(SafeMode.SEND_TO_CAR)) return false;
            String action = intent.getAction();
            if (!Intent.ACTION_VIEW.equals(action) && !"android.nfc.action.NDEF_DISCOVERED".equals(action)) return false;
            String link = intent.getDataString();
            if (!isShortLink(intent.getData())) return false;
            InFlight entry = startExpanding(expanding, link, SystemClock.elapsedRealtime());
            if (entry == null) {
                ReportLog.i(TAG, "short link already being expanded");
                return true;
            }
            try {
                Target target = (Target) processor;
                // The Maps screen asking now, if it is alive; null when Send to car's activity watch is not running.
                Activity screen = SendToCarPush.mapsActivity();
                if (screen != null && (screen.isFinishing() || screen.isDestroyed())) screen = null;
                WeakReference<Activity> asking = screen == null ? null : new WeakReference<>(screen);
                boolean sentTrip = intent.hasExtra(SEND_TO_CAR_EXTRA);
                // A sent trip reached Maps' screen: Send to car's status no longer calls a newer trip push unopened.
                if (sentTrip) SendToCarStatus.recordTripSeen(Utils.getContext());
                ReportLog.i(TAG, "expanding a " + SHORT_LINK_HOST + " link"
                        + sendToCarSuffix(sentTrip, sentTrip ? intent.getStringExtra(SEND_TO_CAR_EXTRA) : null));
                worker().execute(() -> {
                    entry.since = SystemClock.elapsedRealtime();
                    Result result;
                    try {
                        result = resolve(link);
                    } catch (Throwable error) {
                        result = new Result(null, error.getClass().getSimpleName());
                    }
                    Result resolved = result;
                    if (!mainHandler().post(() -> deliver(target, asking, intent, referrer, link, entry, resolved))) {
                        finishExpanding(expanding, link, entry);
                    }
                });
                return true;
            } catch (Throwable error) {
                // Not handed to the worker: the same link must not stay blocked.
                finishExpanding(expanding, link, entry);
                throw error;
            }
        } catch (Throwable error) {
            ReportLog.w(TAG, "short link left to Dynamic Links", error);
            return false;
        }
    }

    /** A link's expansion: when it was queued, then when the worker took it up (SystemClock.elapsedRealtime). */
    static final class InFlight {
        volatile long since;

        InFlight(long since) {
            this.since = since;
        }
    }

    /**
     * A new entry when [link] may be expanded now: not already being expanded, or its entry is older than
     * {@link #EXPANDING_MS} (an expansion that never finished); else null. Plain Java.
     */
    static InFlight startExpanding(Map<String, InFlight> links, String link, long nowMs) {
        synchronized (links) {
            InFlight current = links.get(link);
            if (current != null && nowMs - current.since >= 0 && nowMs - current.since < EXPANDING_MS) return null;
            InFlight entry = new InFlight(nowMs);
            links.put(link, entry);
            return entry;
        }
    }

    /** Removes [link]'s entry if it is still [entry] (a later expansion of the same link keeps its own). Plain Java. */
    static void finishExpanding(Map<String, InFlight> links, String link, InFlight entry) {
        synchronized (links) {
            if (links.get(link) == entry) links.remove(link);
        }
    }

    private static void deliver(Target target, WeakReference<Activity> asking, Intent intent, Uri referrer, String link,
                                InFlight entry, Result result) {
        finishExpanding(expanding, link, entry);
        // For Send to car's status; the extras were already read in expand.
        boolean sentTrip;
        String type;
        try {
            sentTrip = intent.hasExtra(SEND_TO_CAR_EXTRA);
            type = sentTrip ? intentType(intent.getStringExtra(SEND_TO_CAR_EXTRA)) : null;
        } catch (RuntimeException error) {
            sentTrip = false;
            type = null;
        }
        if (result.url == null) {
            ReportLog.w(TAG, "short link not expanded: " + result.detail);
            if (sentTrip) SendToCarStatus.recordTrip(Utils.getContext(), type, SendToCarStatus.LINK_FAILED + result.detail);
            toast();
            return;
        }
        // The screen that asked is gone (closed, or recreated by a configuration change Maps does not handle): its
        // processor would open the trip on nothing, and the trip would then be forgotten.
        Activity screen = asking == null ? null : asking.get();
        if (asking != null && (screen == null || screen.isFinishing() || screen.isDestroyed())) {
            if (handToNewScreen(screen, intent)) {
                ReportLog.i(TAG, "Maps' screen changed while the link was expanded; the trip went to the new screen");
            } else {
                ReportLog.w(TAG, "Maps' screen closed before the link was expanded; the trip was not opened and is kept");
                if (sentTrip) SendToCarStatus.recordTrip(Utils.getContext(), type, SendToCarStatus.SCREEN_CLOSED);
            }
            return;
        }
        try {
            ReportLog.i(TAG, "short link expanded (" + result.detail + "), opening it in Maps");
            target.morpheOpenMapsLink(intent, referrer, result.url);
        } catch (Throwable error) {
            ReportLog.w(TAG, "Maps did not open the expanded link", error);
            if (sentTrip) SendToCarStatus.recordTrip(Utils.getContext(), type, SendToCarStatus.MAPS_FAILED);
            toast();
            return;
        }
        if (sentTrip) SendToCarStatus.recordTrip(Utils.getContext(), type, SendToCarStatus.OPENED);
        String sendToCar = intent.getStringExtra(SEND_TO_CAR_EXTRA);
        if (sendToCar == null || "NONE".equals(sendToCar)) return;
        try {
            target.morpheClearSentTrip();
            ReportLog.i(TAG, "sent trip opened; Maps will not show it again at the next start");
        } catch (Throwable error) {
            ReportLog.w(TAG, "sent trip not cleared", error);
        }
    }

    /**
     * The trip to the Maps screen that replaced [gone] (MapsActivity is single-task, so the intent reaches its
     * onNewIntent and is expanded again there), once per trip, and only while a Maps screen is in view: Android 10
     * drops a screen started from the background without an error. False when the trip was not handed on.
     */
    private static boolean handToNewScreen(Activity gone, Intent intent) {
        try {
            Activity now = SendToCarPush.mapsActivity();
            if (now == null || now == gone || now.isFinishing() || now.isDestroyed() || !SendToCarPush.screenVisible()
                    || intent.getBooleanExtra(HANDED_ON, false)) {
                return false;
            }
            Intent again = new Intent(intent).putExtra(HANDED_ON, true);
            if (again.getComponent() == null && again.getPackage() == null) again.setPackage(now.getPackageName());
            now.startActivity(again);
            return true;
        } catch (Throwable error) {
            ReportLog.w(TAG, "trip not handed to the new screen", error);
            return false;
        }
    }

    /**
     * How Maps opened a sent trip, for the log: one of its own values (when the activity was in the
     * foreground, after a notification tap, a show again at a start, ...), else "other". Any app can put
     * this extra into an intent, so nothing else from it is logged (REPORT-API section 26). Plain Java.
     */
    static String intentType(String value) {
        return value != null && SEND_TO_CAR_TYPES.contains(value) ? value : "other";
    }

    /** The "expanding" line's end: " (send to car, TYPE)" for a sent trip, else nothing. Plain Java. */
    static String sendToCarSuffix(boolean sentTrip, String value) {
        return sentTrip ? " (send to car, " + intentType(value) + ")" : "";
    }

    static boolean isShortLink(Uri uri) {
        if (uri == null || !"https".equalsIgnoreCase(uri.getScheme())) return false;
        String path = uri.getPath();
        return SHORT_LINK_HOST.equalsIgnoreCase(uri.getHost()) && path != null && path.length() > 1;
    }

    /** https://maps.google.<suffix>/..., https://(www.)google.<suffix>/maps... */
    static boolean isMapsUrl(String value) {
        try {
            Uri uri = Uri.parse(value);
            String host = uri.getHost();
            if (!"https".equalsIgnoreCase(uri.getScheme()) || host == null) return false;
            host = host.toLowerCase(Locale.ROOT);
            if (host.startsWith("maps.google.")) return GOOGLE_SUFFIX.matcher(host.substring(12)).matches();
            if (host.startsWith("www.")) host = host.substring(4);
            String path = uri.getPath() == null ? "" : uri.getPath();
            return host.startsWith("google.") && GOOGLE_SUFFIX.matcher(host.substring(7)).matches()
                    && (path.equals("/maps") || path.startsWith("/maps/"));
        } catch (RuntimeException error) {
            return false;
        }
    }

    private static final class Result {
        final String url;
        final String detail;

        Result(String url, String detail) {
            this.url = url;
            this.detail = detail;
        }
    }

    /** One redirect, not followed further; retried while the link is not yet known or the network fails. */
    private static Result resolve(String link) {
        long start = SystemClock.elapsedRealtime();
        long delay = FIRST_RETRY_MS;
        List<String> attempts = new ArrayList<>();
        while (true) {
            HttpURLConnection connection = null;
            boolean retry;
            try {
                connection = (HttpURLConnection) new URL(link).openConnection();
                connection.setInstanceFollowRedirects(false);
                connection.setUseCaches(false);
                connection.setConnectTimeout(TIMEOUT_MS);
                connection.setReadTimeout(TIMEOUT_MS);
                int code = connection.getResponseCode();
                String location = connection.getHeaderField("Location");
                attempts.add("HTTP " + code);
                if (code >= 300 && code < 400 && location != null) {
                    return isMapsUrl(location)
                            ? new Result(location, attemptsText(attempts))
                            : new Result(null, attemptsText(attempts) + " to another site");
                }
                retry = code == 404 || code == 408 || code == 429 || code >= 500;
            } catch (Exception error) {
                attempts.add(error.getClass().getSimpleName());
                retry = true;
            } finally {
                if (connection != null) connection.disconnect();
            }
            long elapsed = SystemClock.elapsedRealtime() - start;
            if (!retry || elapsed + delay > RETRY_UNTIL_MS) {
                return new Result(null, attemptsText(attempts) + ", gave up after " + elapsed + " ms");
            }
            SystemClock.sleep(delay);
            delay = nextDelay(delay);
        }
    }

    /** The wait before the next try: doubled, at most {@link #MAX_RETRY_MS}. Plain Java. */
    static long nextDelay(long delay) {
        return Math.min(delay * 2, MAX_RETRY_MS);
    }

    /** The tries joined by ", ", a run of the same answer as one with "x3": "HTTP 404 x2, HTTP 302". Plain Java. */
    static String attemptsText(List<String> attempts) {
        StringBuilder text = new StringBuilder();
        for (int i = 0; i < attempts.size(); ) {
            String attempt = attempts.get(i);
            int run = 1;
            while (i + run < attempts.size() && attempts.get(i + run).equals(attempt)) run++;
            if (text.length() > 0) text.append(", ");
            text.append(attempt);
            if (run > 1) text.append(" x").append(run);
            i += run;
        }
        return text.toString();
    }

    private static void toast() {
        try {
            Context context = Utils.getContext();
            if (context == null) return;
            boolean thai = "th".equals(Locale.getDefault().getLanguage());
            Toast.makeText(context, thai
                    ? "เปิดลิงก์ maps.app.goo.gl ไม่ได้"
                    : "Couldn't open the maps.app.goo.gl link", Toast.LENGTH_LONG).show();
        } catch (Throwable ignored) {
        }
    }

    private static synchronized ExecutorService worker() {
        if (worker == null) {
            worker = Executors.newSingleThreadExecutor(runnable -> {
                Thread thread = new Thread(runnable, "MorpheSendToCar");
                thread.setDaemon(true);
                return thread;
            });
        }
        return worker;
    }

    private static synchronized Handler mainHandler() {
        if (main == null) main = new Handler(Looper.getMainLooper());
        return main;
    }
}
