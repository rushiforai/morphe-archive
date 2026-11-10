package app.morphed.extension.twitch.patches;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.provider.MediaStore;
import android.util.Log;
import android.widget.Toast;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.nio.charset.StandardCharsets;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;

import app.morphed.extension.twitch.adblock.RequestStats;

/**
 * Detailed log written to a text file in Downloads while the "Detailed log" setting is on.
 * Nothing is collected while it is off.
 */
public final class DebugLog {
    private static final String TAG = "TwitchMorphed";
    private static final String PREFERENCES = "twitch_morphed";
    private static final String KEY_ENABLED = "detailed_log";
    private static final long HEARTBEAT_SECONDS = 30;
    private static final DateTimeFormatter TIME = DateTimeFormatter.ofPattern("HH:mm:ss.SSS", Locale.US);

    private static final ExecutorService IO = Executors.newSingleThreadExecutor(runnable -> {
        Thread thread = new Thread(runnable, "TwitchMorphed-log");
        thread.setDaemon(true);
        return thread;
    });
    private static final ScheduledExecutorService HEARTBEAT = Executors.newSingleThreadScheduledExecutor(runnable -> {
        Thread thread = new Thread(runnable, "TwitchMorphed-heartbeat");
        thread.setDaemon(true);
        return thread;
    });

    /** The open log file, or null while logging is off. */
    private static volatile Writer writer;
    private static volatile String fileName;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static ScheduledFuture<?> heartbeat;
    /** The file a flush is on its way for, or null; only touched on the IO thread. */
    private static Writer flushTarget;
    private static boolean checkedOnStart;

    private DebugLog() {
    }

    public static boolean isOn() {
        return writer != null;
    }

    /** Resumes logging after an app restart if the setting was left on. */
    public static synchronized void resumeIfEnabled() {
        if (checkedOnStart) return;
        checkedOnStart = true;
        Context context = AdBreakIndicator.currentApplication();
        if (context != null && preferences(context).getBoolean(KEY_ENABLED, false)) start(context);
    }

    static boolean isEnabled(Context context) {
        return preferences(context).getBoolean(KEY_ENABLED, false);
    }

    /** Returns the log file name when turned on, or the name of the finished file when turned off. */
    static synchronized String setEnabled(Context context, boolean enabled) {
        checkedOnStart = true;
        preferences(context).edit().putBoolean(KEY_ENABLED, enabled).apply();
        String name = fileName;
        if (enabled) {
            if (writer == null) start(context);
            return fileName;
        }
        stop();
        return name;
    }

    public static void log(String message) {
        // The line goes to the file open now; tasks run in order, so it lands before that file's close.
        Writer target = writer;
        if (target == null) return;
        String line = timestamp() + " [" + Thread.currentThread().getName() + "] " + message + "\n";
        IO.execute(() -> write(target, line));
    }

    private static void write(Writer target, String line) {
        try {
            // Buffered, and flushed a second after the first unflushed line: a busy log costs one
            // flush a second, a quiet one (app in the background) none at all.
            target.write(line);
            if (flushTarget != target) {
                flushTarget = target;
                HEARTBEAT.schedule(() -> flush(target), 1, TimeUnit.SECONDS);
            }
        } catch (IOException e) {
            failed(target, "Writing the detailed log failed", e);
        }
    }

    /** Writes buffered lines to the file; at most a second of log is lost if the app is killed. */
    private static void flush(Writer target) {
        IO.execute(() -> {
            if (flushTarget == target) flushTarget = null;
            // A file that was closed meanwhile was flushed by its close.
            if (writer != target) return;
            try {
                target.flush();
            } catch (IOException e) {
                failed(target, "Writing the detailed log failed", e);
            }
        });
    }

    /**
     * The log file cannot be written (deleted, storage full): logging stops, the switch goes off,
     * and the user is told why instead of the log silently ending.
     */
    private static void failed(Writer target, String what, Exception e) {
        Log.e(TAG, what, e);
        synchronized (DebugLog.class) {
            if (writer != target) return;
            // The file is already broken: closing it would only fail again with a second message.
            stop(false);
        }
        Context context = AdBreakIndicator.currentApplication();
        if (context != null) preferences(context).edit().putBoolean(KEY_ENABLED, false).apply();
        tell(what + ": " + e.getMessage());
    }

    /** A short message on screen; the log's own failures cannot go into the log. */
    private static void tell(String message) {
        MAIN.post(() -> {
            Context context = AdBreakIndicator.currentApplication();
            if (context != null) Toast.makeText(context, message, Toast.LENGTH_LONG).show();
        });
    }

    /** Opens a new log file; on failure the switch goes off and the user is told why. */
    private static void start(Context context) {
        String name = "TwitchMorphed-log-" + new SimpleDateFormat("yyyy-MM-dd-HHmmss", Locale.US).format(new Date()) + ".txt";
        try {
            OutputStream out = open(context, name);
            writer = new BufferedWriter(new OutputStreamWriter(out, StandardCharsets.UTF_8), 64 * 1024);
            fileName = name;
        } catch (IOException | RuntimeException e) {
            Log.e(TAG, "Could not create the log file", e);
            preferences(context).edit().putBoolean(KEY_ENABLED, false).apply();
            tell("Detailed log could not be created in Downloads: " + e.getMessage());
            return;
        }
        log("Log started. Android " + Build.VERSION.RELEASE + " (SDK " + Build.VERSION.SDK_INT + "), "
                + Build.MANUFACTURER + " " + Build.MODEL + ", app " + appVersion(context));
        heartbeat = HEARTBEAT.scheduleWithFixedDelay(DebugLog::heartbeat, HEARTBEAT_SECONDS, HEARTBEAT_SECONDS, TimeUnit.SECONDS);
    }

    private static void stop() {
        stop(true);
    }

    /** @param tellFailure whether a failed close is shown; not when the file already failed. */
    private static synchronized void stop(boolean tellFailure) {
        if (heartbeat != null) heartbeat.cancel(false);
        heartbeat = null;
        Writer current = writer;
        if (current == null) return;
        if (tellFailure) log("Log stopped.");
        // Off right away, so switching it on again at once starts a new file instead of being lost.
        writer = null;
        fileName = null;
        IO.execute(() -> {
            try {
                current.close();
            } catch (IOException e) {
                // The last lines may be missing from the file.
                Log.e(TAG, "Closing the log failed", e);
                if (tellFailure) tell("Saving the detailed log failed: " + e.getMessage());
            }
        });
    }

    private static void heartbeat() {
        Runtime runtime = Runtime.getRuntime();
        long usedMb = (runtime.totalMemory() - runtime.freeMemory()) / (1024 * 1024);
        log("Status: threads=" + Thread.activeCount() + ", memory=" + usedMb + "/" + runtime.maxMemory() / (1024 * 1024)
                + "MB, " + RequestStats.summaryAndReset());
    }

    private static OutputStream open(Context context, String name) throws IOException {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            ContentValues values = new ContentValues();
            values.put(MediaStore.MediaColumns.DISPLAY_NAME, name);
            values.put(MediaStore.MediaColumns.MIME_TYPE, "text/plain");
            values.put(MediaStore.MediaColumns.RELATIVE_PATH, Environment.DIRECTORY_DOWNLOADS);
            ContentResolver resolver = context.getContentResolver();
            Uri uri = resolver.insert(MediaStore.Downloads.EXTERNAL_CONTENT_URI, values);
            if (uri == null) throw new IOException("MediaStore refused the file");
            OutputStream out = resolver.openOutputStream(uri, "w");
            if (out == null) throw new IOException("Could not open " + uri);
            return out;
        }
        // Older Android: the app's own folder, Android/data/tv.twitch.android.app/files/Download.
        File directory = context.getExternalFilesDir(Environment.DIRECTORY_DOWNLOADS);
        if (directory == null) throw new IOException("No external storage");
        return new FileOutputStream(new File(directory, name));
    }

    private static SharedPreferences preferences(Context context) {
        return context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
    }

    private static String appVersion(Context context) {
        try {
            return context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionName;
        } catch (Exception e) {
            return "unknown";
        }
    }

    private static String timestamp() {
        return LocalTime.now().format(TIME);
    }
}
