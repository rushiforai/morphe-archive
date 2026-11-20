// Based on SysAdminDoc/HushMessenger (GPL-3.0), extensions/messenger/src/main/java/app/hushmessenger/extension/CrashGuard.java:
// the start record "<pid> <millis>[ crashed]", the crash streak, Android 11+ exit history (crash, native crash, ANR)
// with an uncaught-exception mark below that, three quick crashes -> safe mode, reset after a minute alive;
// modified 2026-10-14: rewritten for minSdk 23 (no java.util.function), safe mode stored through HevalSettings,
// injectable records/exit history/clock for JVM tests, and a simpler AtomicFile record store.

package app.template.extension.hevalcontrols;

import android.annotation.TargetApi;
import android.app.ActivityManager;
import android.app.ApplicationExitInfo;
import android.content.Context;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.Process;
import android.os.SystemClock;
import android.util.AtomicFile;
import android.util.Log;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Turns on safe mode (every runtime feature stock) after {@value #THRESHOLD} crashes in a row,
 * each within {@value #WINDOW_MS} ms of the process start.
 *
 * <p>How a "quick crash" is detected: each main-process start writes {@code "<pid> <wall ms>"}.
 * On the next start, Android 11+ answers from the exit history (Java crash, native crash or ANR
 * within the window). Below Android 11 only Java crashes count: an uncaught-exception handler
 * appends {@code " crashed"} to the record. A process that stays alive for the window resets the
 * streak.
 *
 * <p>Limits: safe mode only turns off runtime-gated hooks. It cannot undo patch-time changes, and
 * a crash before the init provider runs, or a native crash below Android 11, is not counted.
 */
@SuppressWarnings("unused")
public final class CrashGuard {
    private static final String TAG = "HevalControls";
    static final String DIRECTORY = "heval_controls";
    static final String START_RECORD = "start";
    static final String CRASH_STREAK = "streak";
    static final long WINDOW_MS = 60_000L;
    static final int THRESHOLD = 3;
    private static final String CRASHED = "crashed";

    /** Small ASCII records that must survive a crash mid-write. */
    interface Records {
        String read(String name);

        boolean write(String name, String text);

        void delete(String name);
    }

    /** Android 11+ exit history. */
    interface ExitHistory {
        /** TRUE: died from a crash or ANR within the window; FALSE: exited otherwise; null: unknown. */
        Boolean diedFromCrash(int pid, long startedWallMillis, long windowMillis);
    }

    interface Clock {
        long wallMillis();

        long elapsedMillis();
    }

    private static final AtomicBoolean STARTED = new AtomicBoolean();
    private static volatile CrashGuard instance;

    private final Records records;
    private final ExitHistory history;
    private final Clock clock;
    private final int pid;
    private final AtomicBoolean crashMarked = new AtomicBoolean();
    private volatile long startElapsed;
    private volatile int streak;
    private volatile boolean enteredSafeMode;

    CrashGuard(Records records, ExitHistory history, Clock clock, int pid) {
        this.records = records;
        this.history = history;
        this.clock = clock;
        this.pid = pid;
    }

    // ---------------------------------------------------------------------------------------
    // Android entry points
    // ---------------------------------------------------------------------------------------

    /**
     * Main process only, once, after {@link HevalSettings#init(Context)}. Counts the last start,
     * may enter safe mode, writes the new start record and installs the crash mark.
     */
    public static void onProcessStart(Context context) {
        if (context == null || !STARTED.compareAndSet(false, true)) return;
        try {
            File directory = new File(context.getFilesDir(), DIRECTORY);
            CrashGuard guard = new CrashGuard(new FileRecords(directory), new PlatformExitHistory(context),
                    new SystemClockSource(), Process.myPid());
            guard.start();
            instance = guard;
            installCrashMark();
            new Handler(Looper.getMainLooper()).postDelayed(new Runnable() {
                @Override
                public void run() {
                    CrashGuard current = instance;
                    if (current != null) current.survivedStartup();
                }
            }, WINDOW_MS);
        } catch (Throwable failure) {
            Log.e(TAG, "Crash guard unavailable: " + HevalSettings.describe(failure));
        }
    }

    /**
     * Leaves safe mode. With {@code keepPaused} the global pause is switched on first, so the user
     * can turn features back on one at a time without a window where all of them run.
     */
    public static boolean resume(boolean keepPaused) {
        boolean saved = true;
        if (keepPaused) saved = HevalSettings.setPaused(true);
        saved &= HevalSettings.setSafeMode(false);
        CrashGuard current = instance;
        if (current != null) current.records.write(CRASH_STREAK, "0");
        return saved;
    }

    /** Quick crashes counted at this start (0 after a safe-mode entry reset it). */
    public static int crashStreak() {
        CrashGuard current = instance;
        return current == null ? -1 : current.streak;
    }

    /** Whether this process start turned safe mode on. */
    public static boolean enteredSafeModeThisStart() {
        CrashGuard current = instance;
        return current != null && current.enteredSafeMode;
    }

    // ---------------------------------------------------------------------------------------
    // Logic (unit-tested)
    // ---------------------------------------------------------------------------------------

    /** Counts the previous start and records this one. Returns the new streak. */
    synchronized int start() {
        startElapsed = clock.elapsedMillis();
        String last = records.read(START_RECORD);
        int saved = parseCount(records.read(CRASH_STREAK));
        int next = 0;
        if (last != null && isValidRecord(last) && diedYoungFromACrash(last)) {
            next = Math.min(THRESHOLD, saved) + 1;
            if (next >= THRESHOLD && HevalSettings.setSafeMode(true)) {
                enteredSafeMode = true;
                next = 0;
                Log.w(TAG, "Safe mode on after " + THRESHOLD + " crashes at startup: every runtime feature is stock");
            }
        }
        streak = next;
        records.write(CRASH_STREAK, Integer.toString(next));
        records.write(START_RECORD, pid + " " + clock.wallMillis());
        return next;
    }

    /** The process stayed alive for the window: the streak is over. */
    synchronized void survivedStartup() {
        if (crashMarked.get()) return;
        streak = 0;
        records.write(CRASH_STREAK, "0");
        records.delete(START_RECORD);
    }

    /** From the uncaught-exception handler: marks this start as a quick crash. */
    synchronized void markCrash() {
        if (clock.elapsedMillis() - startElapsed > WINDOW_MS) return;
        if (!crashMarked.compareAndSet(false, true)) return;
        String current = records.read(START_RECORD);
        if (current != null && !current.trim().endsWith(CRASHED)) {
            records.write(START_RECORD, current.trim() + " " + CRASHED);
        }
    }

    boolean diedYoungFromACrash(String record) {
        String[] parts = record.trim().split(" ");
        int lastPid;
        long started;
        try {
            lastPid = Integer.parseInt(parts[0]);
            started = Long.parseLong(parts[1]);
        } catch (RuntimeException unreadable) {
            return false;
        }
        boolean marked = parts.length > 2 && CRASHED.equals(parts[2]);
        Boolean verdict = null;
        try {
            if (history != null) verdict = history.diedFromCrash(lastPid, started, WINDOW_MS);
        } catch (Throwable unavailable) {
            verdict = null;
        }
        return verdict != null ? verdict : marked;
    }

    static boolean isValidRecord(String record) {
        return record.trim().matches("[0-9]+ [0-9]+(?: " + CRASHED + ")?");
    }

    static int parseCount(String text) {
        if (text == null) return 0;
        try {
            return Math.max(0, Integer.parseInt(text.trim()));
        } catch (NumberFormatException unreadable) {
            return 0;
        }
    }

    // ---------------------------------------------------------------------------------------
    // Android implementations of the seams
    // ---------------------------------------------------------------------------------------

    private static void installCrashMark() {
        Thread.UncaughtExceptionHandler current = Thread.getDefaultUncaughtExceptionHandler();
        if (current instanceof CrashMark) return;
        Thread.setDefaultUncaughtExceptionHandler(new CrashMark(current));
    }

    /** Marks the start record, then hands the crash to the previous handler unchanged. */
    private static final class CrashMark implements Thread.UncaughtExceptionHandler {
        private final Thread.UncaughtExceptionHandler delegate;

        CrashMark(Thread.UncaughtExceptionHandler delegate) {
            this.delegate = delegate;
        }

        @Override
        public void uncaughtException(Thread thread, Throwable throwable) {
            try {
                CrashGuard current = instance;
                if (current != null) current.markCrash();
            } catch (Throwable ignored) {
                // Never get in the way of the real crash handling.
            }
            if (delegate != null) delegate.uncaughtException(thread, throwable);
        }
    }

    /** AtomicFile records of at most 64 printable ASCII bytes in filesDir/heval_controls/. */
    static final class FileRecords implements Records {
        private final File directory;

        FileRecords(File directory) {
            this.directory = directory;
        }

        @Override
        public String read(String name) {
            try {
                byte[] data = new AtomicFile(new File(directory, name)).readFully();
                if (data.length == 0 || data.length > 64) return null;
                for (byte value : data) if (value < 32 || value > 126) return null;
                return new String(data, StandardCharsets.US_ASCII);
            } catch (FileNotFoundException missing) {
                return null;
            } catch (Throwable unreadable) {
                Log.w(TAG, "Crash guard record unreadable: " + unreadable.getClass().getName());
                return null;
            }
        }

        @Override
        public boolean write(String name, String text) {
            AtomicFile file = new AtomicFile(new File(directory, name));
            FileOutputStream out = null;
            try {
                if (!directory.isDirectory() && !directory.mkdirs()) return false;
                out = file.startWrite();
                out.write(text.getBytes(StandardCharsets.US_ASCII));
                file.finishWrite(out);
                return true;
            } catch (Throwable failure) {
                if (out != null) {
                    try {
                        file.failWrite(out);
                    } catch (Throwable ignored) {
                        // The previous record stays, which is the safe outcome.
                    }
                }
                Log.w(TAG, "Crash guard record not saved: " + failure.getClass().getName());
                return false;
            }
        }

        @Override
        public void delete(String name) {
            try {
                new AtomicFile(new File(directory, name)).delete();
            } catch (Throwable ignored) {
                // A leftover record only means one more comparison at the next start.
            }
        }
    }

    static final class PlatformExitHistory implements ExitHistory {
        private final Context context;

        PlatformExitHistory(Context context) {
            this.context = context;
        }

        @Override
        public Boolean diedFromCrash(int pid, long startedWallMillis, long windowMillis) {
            if (Build.VERSION.SDK_INT < 30) return null;
            return Api30.diedFromCrash(context, pid, startedWallMillis, windowMillis);
        }
    }

    /** Kept apart so API 23-29 never verify a method that references ApplicationExitInfo. */
    @TargetApi(30)
    private static final class Api30 {
        static Boolean diedFromCrash(Context context, int pid, long started, long window) {
            ActivityManager manager = (ActivityManager) context.getSystemService(Context.ACTIVITY_SERVICE);
            if (manager == null) return null;
            List<ApplicationExitInfo> exits = manager.getHistoricalProcessExitReasons(null, pid, 16);
            if (exits == null) return null;
            ApplicationExitInfo first = null;
            for (ApplicationExitInfo exit : exits) {
                if (exit.getPid() != pid || exit.getTimestamp() < started) continue;
                if (first == null || exit.getTimestamp() < first.getTimestamp()) first = exit;
            }
            if (first == null) return null;
            int reason = first.getReason();
            boolean crash = reason == ApplicationExitInfo.REASON_CRASH
                    || reason == ApplicationExitInfo.REASON_CRASH_NATIVE
                    || reason == ApplicationExitInfo.REASON_ANR;
            return crash && first.getTimestamp() - started <= window;
        }
    }

    private static final class SystemClockSource implements Clock {
        @Override
        public long wallMillis() {
            return System.currentTimeMillis();
        }

        @Override
        public long elapsedMillis() {
            return SystemClock.elapsedRealtime();
        }
    }

    // ---------------------------------------------------------------------------------------
    // Tests
    // ---------------------------------------------------------------------------------------

    static void installForTests(CrashGuard guard) {
        instance = guard;
    }

    static void resetForTests() {
        instance = null;
        STARTED.set(false);
    }
}
