package app.morphe.extension.mapsautomotive.patches;

import android.app.Activity;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.SystemClock;
import android.speech.tts.TextToSpeech;

import java.util.Locale;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Maps creates its Google TTS client only when guidance starts and shuts it down when guidance
 * ends. A cold engine can miss the first synthesized prompts, so Maps plays its canned fallback
 * (issue #10). Bind the same engine and load the app-locale voice once when Maps opens, and keep
 * that idle client so the engine stays bound between guidance sessions. It never speaks.
 * <p>
 * Copied from fank-morphe-maps-patches 1.3.2; only the package differs. The AAOS build
 * (120003.E) creates and shuts down the same engine client per guidance session and has the same
 * canned fallback.
 */
@SuppressWarnings("unused")
public final class NavigationTtsWarmup {
    private static final String TAG = "MorpheTtsWarmup";
    // The engine Maps' own synthesizer requests.
    private static final String ENGINE = "com.google.android.tts";
    private static final long INIT_TIMEOUT_SECONDS = 60;
    private static final AtomicBoolean started = new AtomicBoolean();
    private static volatile TextToSpeech warmClient;

    private NavigationTtsWarmup() {
    }

    public static void warmUp(Activity activity) {
        if (!SafeMode.on(activity, SafeMode.TTS_WARMUP)) return;
        if (!started.compareAndSet(false, true)) return;
        try {
            Context context = activity.getApplicationContext();
            Locale locale = activity.getResources().getConfiguration().getLocales().get(0);
            Thread thread = new Thread(() -> bind(context, locale), TAG);
            thread.setPriority(Thread.MIN_PRIORITY);
            thread.start();
        } catch (Throwable error) {
            ReportLog.w(TAG, "not started", error);
        }
    }

    private static void bind(Context context, Locale locale) {
        try {
            ApplicationInfo info = context.getPackageManager().getApplicationInfo(ENGINE, 0);
            if (!info.enabled) {
                ReportLog.i(TAG, "skipped: " + ENGINE + " disabled");
                return;
            }
        } catch (PackageManager.NameNotFoundException missing) {
            ReportLog.i(TAG, "skipped: " + ENGINE + " not installed");
            return;
        }

        TextToSpeech client = null;
        try {
            long begin = SystemClock.elapsedRealtime();
            CountDownLatch initialized = new CountDownLatch(1);
            int[] status = {TextToSpeech.ERROR};
            // onInit may run inside this constructor (bind failure) or later on the main thread.
            client = new TextToSpeech(context, result -> {
                status[0] = result;
                initialized.countDown();
            }, ENGINE);
            if (!initialized.await(INIT_TIMEOUT_SECONDS, TimeUnit.SECONDS)) {
                ReportLog.w(TAG, "engine init timeout after " + INIT_TIMEOUT_SECONDS + " s");
                client.shutdown();
                return;
            }
            long initMs = SystemClock.elapsedRealtime() - begin;
            if (status[0] != TextToSpeech.SUCCESS) {
                ReportLog.w(TAG, "engine init failed: status=" + status[0] + " init_ms=" + initMs);
                client.shutdown();
                return;
            }
            // Loads the voice Maps' "Default (language)" setting uses on the engine side.
            long languageBegin = SystemClock.elapsedRealtime();
            int language = client.setLanguage(locale);
            ReportLog.i(TAG, "ready: init_ms=" + initMs + " locale=" + locale.toLanguageTag()
                    + " language=" + language
                    + " language_ms=" + (SystemClock.elapsedRealtime() - languageBegin));
            warmClient = client;
        } catch (Throwable error) {
            ReportLog.w(TAG, "failed", error);
            if (client != null) {
                try {
                    client.shutdown();
                } catch (Throwable ignored) {
                }
            }
        }
    }
}
