package app.hushmessenger.extension;

import android.app.ActivityManager;
import android.app.ApplicationExitInfo;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.Process;
import android.os.SystemClock;
import android.util.Log;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Pauses all controls after three consecutive crashes within a minute of startup.
 * Runs once per process in {@link SettingsProvider#onCreate()}, before any hook.
 */
final class CrashGuard {
    static final String START_RECORD = "hushmessenger-start";
    static final String CRASH_STREAK = "hushmessenger-start-crashes";
    static final long WINDOW_MS = 60_000L;
    static final int THRESHOLD = 3;
    private static final String CRASHED = "crashed";

    private static final AtomicBoolean STARTED = new AtomicBoolean();
    private static final AtomicBoolean CRASH_MARKED = new AtomicBoolean();
    private static volatile long startElapsed;
    private static volatile File filesDir;
    private static volatile boolean safeModeActive;

    static void onProcessStart(Context context) {
        if (context == null || !STARTED.compareAndSet(false, true)) return;
        startElapsed = SystemClock.elapsedRealtime();
        SharedPreferences prefs = Settings.preferences;
        if (prefs == null) return;
        try {
            filesDir = context.getFilesDir();
            countLastStart(context, prefs);
        } catch (RuntimeException failure) {
            Log.e("HushMessenger", "CrashGuard: could not read the last start", failure);
        }
        safeModeActive = prefs.getBoolean("safe_mode", false);
    }

    static boolean isSafeMode() { return safeModeActive; }

    static void clearSafeMode() {
        safeModeActive = false;
        SharedPreferences prefs = Settings.preferences;
        if (prefs != null) prefs.edit().putBoolean("safe_mode", false).apply();
        File dir = filesDir;
        if (dir != null) write(new File(dir, CRASH_STREAK), "0");
    }

    private static void countLastStart(Context context, SharedPreferences prefs) {
        File dir = filesDir;
        if (dir == null) return;
        File record = new File(dir, START_RECORD);
        File streakFile = new File(dir, CRASH_STREAK);
        String last = read(record);
        if (last != null) {
            int streak = diedYoungFromACrash(context, last) ? parseCount(read(streakFile)) + 1 : 0;
            if (streak >= THRESHOLD) {
                prefs.edit().putBoolean("safe_mode", true).commit();
                streak = 0;
                Log.w("HushMessenger", "CrashGuard: safe mode activated after " + THRESHOLD + " crashes");
            }
            write(streakFile, Integer.toString(streak));
        }
        write(record, Process.myPid() + " " + System.currentTimeMillis());
        installCrashMark();
        new Handler(Looper.getMainLooper()).postDelayed(CrashGuard::survivedTheStart, WINDOW_MS);
    }

    static void survivedTheStart() {
        File dir = filesDir;
        if (dir == null) return;
        if (CRASH_MARKED.get()) return;
        new File(dir, START_RECORD).delete();
        write(new File(dir, CRASH_STREAK), "0");
    }

    static boolean diedYoungFromACrash(Context context, String record) {
        String[] parts = record.trim().split(" ");
        int pid;
        long started;
        try {
            pid = Integer.parseInt(parts[0]);
            started = parts.length > 1 ? Long.parseLong(parts[1]) : 0L;
        } catch (RuntimeException unreadable) {
            return false;
        }
        boolean markedByHandler = parts.length > 2 && CRASHED.equals(parts[2]);
        if (Build.VERSION.SDK_INT >= 30) {
            ApplicationExitInfo exit = firstExitSince(context, pid, started);
            if (exit != null) {
                int reason = exit.getReason();
                boolean crash = reason == ApplicationExitInfo.REASON_CRASH
                        || reason == ApplicationExitInfo.REASON_CRASH_NATIVE
                        || reason == ApplicationExitInfo.REASON_ANR;
                return crash && exit.getTimestamp() - started <= WINDOW_MS;
            }
        }
        return markedByHandler;
    }

    private static ApplicationExitInfo firstExitSince(Context context, int pid, long started) {
        if (Build.VERSION.SDK_INT < 30) return null;
        ActivityManager manager = (ActivityManager) context.getSystemService(Context.ACTIVITY_SERVICE);
        if (manager == null) return null;
        List<ApplicationExitInfo> exits = manager.getHistoricalProcessExitReasons(null, pid, 16);
        if (exits == null) return null;
        ApplicationExitInfo first = null;
        for (ApplicationExitInfo exit : exits) {
            if (exit.getPid() != pid || exit.getTimestamp() < started) continue;
            if (first == null || exit.getTimestamp() < first.getTimestamp()) first = exit;
        }
        return first;
    }

    private static void installCrashMark() {
        Thread.UncaughtExceptionHandler current = Thread.getDefaultUncaughtExceptionHandler();
        if (current instanceof CrashMark) return;
        Thread.setDefaultUncaughtExceptionHandler(new CrashMark(current));
    }

    static void markCrash() {
        File dir = filesDir;
        if (dir == null || SystemClock.elapsedRealtime() - startElapsed > WINDOW_MS) return;
        if (!CRASH_MARKED.compareAndSet(false, true)) return;
        File record = new File(dir, START_RECORD);
        String current = read(record);
        if (current != null && !current.trim().endsWith(CRASHED)) write(record, current.trim() + " " + CRASHED);
    }

    private static final class CrashMark implements Thread.UncaughtExceptionHandler {
        private final Thread.UncaughtExceptionHandler delegate;
        CrashMark(Thread.UncaughtExceptionHandler delegate) { this.delegate = delegate; }
        @Override public void uncaughtException(Thread thread, Throwable throwable) {
            try { markCrash(); } catch (Throwable ignored) { }
            if (delegate != null) delegate.uncaughtException(thread, throwable);
        }
    }

    static int parseCount(String text) {
        if (text == null) return 0;
        try { return Math.max(0, Integer.parseInt(text.trim())); }
        catch (NumberFormatException unreadable) { return 0; }
    }

    static String read(File file) {
        if (!file.exists()) return null;
        try (FileInputStream in = new FileInputStream(file)) {
            byte[] buffer = new byte[64];
            int length = in.read(buffer);
            return length <= 0 ? "" : new String(buffer, 0, length, StandardCharsets.US_ASCII);
        } catch (IOException | RuntimeException unreadable) { return null; }
    }

    static void write(File file, String text) {
        try (FileOutputStream out = new FileOutputStream(file)) {
            out.write(text.getBytes(StandardCharsets.US_ASCII));
        } catch (IOException | RuntimeException failure) {
            Log.e("HushMessenger", "CrashGuard: could not write " + file.getName(), failure);
        }
    }

    static void resetForTests() {
        STARTED.set(false);
        HostScreens.started = false;
        HostScreens.failed = false;
        CRASH_MARKED.set(false);
        safeModeActive = false;
        filesDir = null;
    }

    private CrashGuard() { }
}
