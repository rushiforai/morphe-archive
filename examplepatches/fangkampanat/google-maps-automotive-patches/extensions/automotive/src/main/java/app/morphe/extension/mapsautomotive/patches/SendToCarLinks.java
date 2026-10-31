package app.morphe.extension.mapsautomotive.patches;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.widget.Toast;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Collections;
import java.util.HashSet;
import java.util.Locale;
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
 */
@SuppressWarnings("unused")
public final class SendToCarLinks {
    private static final String TAG = "MorpheSendToCar";
    private static final String SHORT_LINK_HOST = "maps.app.goo.gl";
    private static final String ORIGINAL_PACKAGE = "com.google.android.apps.maps";
    private static final int TIMEOUT_MS = 6000;
    // A link sent from the phone a moment ago can answer 404 for a few seconds; retry for up to 15 s.
    private static final long RETRY_UNTIL_MS = 15000;
    private static final long FIRST_RETRY_MS = 1000;
    private static final Pattern GOOGLE_SUFFIX = Pattern.compile("[a-z]{2,3}(\\.[a-z]{2,3})?");
    private static final Set<String> expanding = Collections.synchronizedSet(new HashSet<>());
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
            if (!expanding.add(link)) {
                ReportLog.i(TAG, "short link already being expanded");
                return true;
            }
            Target target = (Target) processor;
            ReportLog.i(TAG, "expanding a " + SHORT_LINK_HOST + " link"
                    + (intent.hasExtra("SEND_TO_CAR_INTENT") ? " (send to car)" : ""));
            worker().execute(() -> {
                Result result = resolve(link);
                mainHandler().post(() -> deliver(target, intent, referrer, link, result));
            });
            return true;
        } catch (Throwable error) {
            ReportLog.w(TAG, "short link left to Dynamic Links", error);
            return false;
        }
    }

    private static void deliver(Target target, Intent intent, Uri referrer, String link, Result result) {
        expanding.remove(link);
        if (result.url == null) {
            ReportLog.w(TAG, "short link not expanded: " + result.detail);
            toast();
            return;
        }
        try {
            ReportLog.i(TAG, "short link expanded (" + result.detail + "), opening it in Maps");
            target.morpheOpenMapsLink(intent, referrer, result.url);
        } catch (Throwable error) {
            ReportLog.w(TAG, "Maps did not open the expanded link", error);
            toast();
            return;
        }
        String sendToCar = intent.getStringExtra("SEND_TO_CAR_INTENT");
        if (sendToCar == null || "NONE".equals(sendToCar)) return;
        try {
            target.morpheClearSentTrip();
            ReportLog.i(TAG, "sent trip opened; Maps will not show it again at the next start");
        } catch (Throwable error) {
            ReportLog.w(TAG, "sent trip not cleared", error);
        }
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
        StringBuilder attempts = new StringBuilder();
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
                if (code >= 300 && code < 400 && location != null) {
                    attempts.append("HTTP ").append(code);
                    return isMapsUrl(location)
                            ? new Result(location, attempts.toString())
                            : new Result(null, attempts + " to another site");
                }
                attempts.append("HTTP ").append(code).append(", ");
                retry = code == 404 || code == 408 || code == 429 || code >= 500;
            } catch (Exception error) {
                attempts.append(error.getClass().getSimpleName()).append(", ");
                retry = true;
            } finally {
                if (connection != null) connection.disconnect();
            }
            if (!retry || SystemClock.elapsedRealtime() - start + delay > RETRY_UNTIL_MS) {
                return new Result(null, attempts + "gave up after " + (SystemClock.elapsedRealtime() - start) + " ms");
            }
            SystemClock.sleep(delay);
            delay *= 2;
        }
    }

    private static void toast() {
        try {
            Context context = Utils.getContext();
            if (context == null) return;
            boolean thai = "th".equals(Locale.getDefault().getLanguage());
            Toast.makeText(context, thai
                    ? "Maps Car เปิดลิงก์ maps.app.goo.gl ไม่ได้"
                    : "Maps Car couldn't open the maps.app.goo.gl link", Toast.LENGTH_LONG).show();
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
