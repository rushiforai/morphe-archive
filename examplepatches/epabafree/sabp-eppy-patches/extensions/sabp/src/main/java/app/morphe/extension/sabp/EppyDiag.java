package app.morphe.extension.sabp;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Build;
import android.util.Log;

import app.morphe.extension.sabp.read.DocStore;
import app.morphe.extension.sabp.read.Transcriber;

import java.io.File;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayDeque;
import java.util.Date;
import java.util.Locale;

/**
 * Diagnostics for eppy, without logging book text or audio:
 * <ul>
 *     <li>an operation log (last 300 lines) with what eppy was doing, shown in Settings → Diagnostics;</li>
 *     <li>a crash recorder that saves the stack trace of an uncaught exception and then hands the
 *     crash to the previous handler unchanged;</li>
 *     <li>job markers: a long operation (read-along extraction, decoding, recognition, matching)
 *     writes a marker before it starts and clears it when done. A marker still present at the
 *     next start means that operation died with the process, so read-along turns automatic work
 *     off instead of repeating it — no crash loops.</li>
 * </ul>
 */
@SuppressWarnings("unused")
public final class EppyDiag {
    private static final String TAG = "eppy";
    private static final ArrayDeque<String> lines = new ArrayDeque<>();
    private static Context app;
    private static boolean installed;
    private static final SimpleDateFormat FMT = new SimpleDateFormat("MM-dd HH:mm:ss", Locale.US);

    private EppyDiag() {
    }

    /** Injected at the start of SABPApplication.onCreate (and called by eppy itself as a fallback). */
    public static void install(Application application) {
        if (installed) return;
        installed = true;
        app = application.getApplicationContext();
        // Resume background transcription (if any book has it on) once the app has settled.
        new android.os.Handler(android.os.Looper.getMainLooper()).postDelayed(() -> {
            try {
                Transcriber.get(app).ensureRunning();
            } catch (Throwable t) {
                error("transcribe", "start failed: " + t);
            }
        }, 30_000);
        final Thread.UncaughtExceptionHandler previous = Thread.getDefaultUncaughtExceptionHandler();
        Thread.setDefaultUncaughtExceptionHandler((thread, error) -> {
            try {
                recordCrash(thread, error);
            } catch (Throwable ignored) {
            }
            if (previous != null) previous.uncaughtException(thread, error);
        });
        application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override public void onActivityCreated(android.app.Activity a, android.os.Bundle b) { }
            @Override public void onActivityStarted(android.app.Activity a) { }
            @Override public void onActivityResumed(android.app.Activity a) { resumed = new java.lang.ref.WeakReference<>(a); }
            @Override public void onActivityPaused(android.app.Activity a) { }
            @Override public void onActivityStopped(android.app.Activity a) { }
            @Override public void onActivitySaveInstanceState(android.app.Activity a, android.os.Bundle b) { }
            @Override public void onActivityDestroyed(android.app.Activity a) {
                if (resumed.get() == a) resumed = new java.lang.ref.WeakReference<>(null);
            }
        });
        // Must run before SABP's PlayerService starts (it does: Application.onCreate comes first).
        try {
            DocStore.rescue(app);
        } catch (Throwable t) {
            log("app", "document permission rescue failed: " + t);
        }
        log("app", "started · Android " + Build.VERSION.RELEASE + " (API " + Build.VERSION.SDK_INT + ") · " + Build.MANUFACTURER + " " + Build.MODEL);
    }

    private static java.lang.ref.WeakReference<android.app.Activity> resumed = new java.lang.ref.WeakReference<>(null);

    /** The activity currently in front (any of SABP's or eppy's), or null. */
    public static android.app.Activity resumedActivity() {
        return resumed.get();
    }

    public static void ensure(Context c) {
        if (app == null && c != null) {
            app = c.getApplicationContext();
            if (app instanceof Application) install((Application) app);
        }
    }

    private static SharedPreferences prefs() {
        return app.getSharedPreferences("eppy_diag", Context.MODE_PRIVATE);
    }

    public static synchronized void log(String area, String message) {
        String line = FMT.format(new Date()) + "  [" + area + "] " + message;
        Log.i(TAG, line);
        lines.addLast(line);
        while (lines.size() > 300) lines.removeFirst();
    }

    /** Logs and also keeps the message in the persistent "last errors" list (20 entries). */
    public static synchronized void error(String area, String message) {
        log(area, "ERROR " + message);
        if (app == null) return;
        try {
            String prev = prefs().getString("errors", "");
            String line = FMT.format(new Date()) + "  [" + area + "] " + message.replace('\n', ' ');
            String[] old = prev.isEmpty() ? new String[0] : prev.split("\n");
            StringBuilder b = new StringBuilder(line);
            for (int i = 0; i < Math.min(19, old.length); i++) b.append('\n').append(old[i]);
            prefs().edit().putString("errors", b.toString()).apply();
        } catch (Throwable ignored) {
        }
    }

    /** Most recent first; empty when none. */
    public static String lastErrors() {
        if (app == null) return "";
        return prefs().getString("errors", "");
    }

    public static void clearErrors() {
        if (app != null) prefs().edit().remove("errors").apply();
    }

    public static synchronized String logText() {
        StringBuilder b = new StringBuilder();
        for (String l : lines) b.append(l).append('\n');
        return b.toString();
    }

    private static void recordCrash(Thread thread, Throwable error) {
        if (app == null) return;
        Transcriber.onJavaCrash(app);
        StringWriter sw = new StringWriter();
        error.printStackTrace(new PrintWriter(sw));
        String job = prefs().getString("job", null);
        String report = "Crash at " + FMT.format(new Date()) + " on thread " + thread.getName()
                + (job != null ? "\nWhile running: " + job : "")
                + "\nApp " + safeVersion() + " · Android " + Build.VERSION.RELEASE + " (API " + Build.VERSION.SDK_INT + ")"
                + " · " + Build.MANUFACTURER + " " + Build.MODEL
                + "\n\n" + sw
                + "\n--- recent eppy log ---\n" + logText();
        try (FileOutputStream out = new FileOutputStream(new File(app.getFilesDir(), "eppy_last_crash.txt"))) {
            out.write(report.getBytes(StandardCharsets.UTF_8));
        } catch (Throwable ignored) {
        }
        // Also save a copy where the user can reach it without opening the app (a crash loop
        // can make the app unusable): Downloads/eppy/eppy-crash-<time>.txt via MediaStore, which
        // needs no permission for files the app creates itself.
        try {
            android.content.ContentValues v = new android.content.ContentValues();
            v.put(android.provider.MediaStore.MediaColumns.DISPLAY_NAME,
                    "eppy-crash-" + new SimpleDateFormat("yyyyMMdd-HHmmss", Locale.US).format(new Date()) + ".txt");
            v.put(android.provider.MediaStore.MediaColumns.MIME_TYPE, "text/plain");
            v.put(android.provider.MediaStore.MediaColumns.RELATIVE_PATH, android.os.Environment.DIRECTORY_DOWNLOADS + "/eppy");
            android.net.Uri uri = app.getContentResolver().insert(android.provider.MediaStore.Downloads.EXTERNAL_CONTENT_URI, v);
            if (uri != null) {
                try (java.io.OutputStream out = app.getContentResolver().openOutputStream(uri)) {
                    if (out != null) out.write(report.getBytes(StandardCharsets.UTF_8));
                }
            }
        } catch (Throwable ignored) {
        }
        boolean ours = sw.toString().contains("app.morphe.extension.sabp");
        prefs().edit().putBoolean("crashPending", true).putBoolean("crashInEppy", ours).commit();
    }

    private static String safeVersion() {
        try {
            return app.getPackageManager().getPackageInfo(app.getPackageName(), 0).versionName;
        } catch (Throwable t) {
            return "?";
        }
    }

    /** The last recorded crash report, or null. */
    public static String lastCrash() {
        if (app == null) return null;
        File f = new File(app.getFilesDir(), "eppy_last_crash.txt");
        if (!f.exists()) return null;
        try {
            byte[] b = java.nio.file.Files.readAllBytes(f.toPath());
            return new String(b, StandardCharsets.UTF_8);
        } catch (Throwable t) {
            return null;
        }
    }

    public static void clearCrash() {
        if (app == null) return;
        new File(app.getFilesDir(), "eppy_last_crash.txt").delete();
        prefs().edit().remove("crashPending").remove("crashInEppy").apply();
    }

    // ---- job markers ------------------------------------------------------------------------

    /** Marks a long operation as running (written synchronously so it survives a crash). */
    public static void jobStart(String job) {
        log("job", "start: " + job);
        if (app != null) prefs().edit().putString("job", job).commit();
    }

    public static void jobEnd(String job, String outcome) {
        log("job", "end: " + job + " → " + outcome);
        if (app != null) prefs().edit().remove("job").apply();
    }

    /**
     * Called once at start-up. Returns the name of a job that was running when the process died
     * last time (and clears the marker), or null.
     */
    public static String takeInterruptedJob() {
        if (app == null) return null;
        String job = prefs().getString("job", null);
        if (job != null) {
            prefs().edit().remove("job").commit();
            log("job", "previous run ended during: " + job);
        }
        return job;
    }
}
