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
import android.util.AtomicFile;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
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
    static java.util.function.Function<File, AtomicFile> atomicFiles = AtomicFile::new;
    interface StagedInput { FileInputStream open(File file) throws IOException; }
    static StagedInput stagedInput = FileInputStream::new;

    static void onProcessStart(Context context) {
        if (context == null || !STARTED.compareAndSet(false, true)) return;
        startElapsed = SystemClock.elapsedRealtime();
        SharedPreferences prefs = Settings.preferences;
        if (prefs == null) return;
        try {
            safeModeActive = prefs.getBoolean("safe_mode", false);
            filesDir = context.getFilesDir();
            countLastStart(context, prefs);
        } catch (RuntimeException failure) {
            persistenceFailure("reading the last start", failure);
            // Invalid preference types still fail host initialization, without logging their contents.
            if (failure instanceof ClassCastException) throw new IllegalStateException("Invalid crash guard preference");
        }
    }

    static boolean isSafeMode() { return safeModeActive; }

    static boolean clearSafeMode() {
        synchronized (CrashGuard.class) {
            SharedPreferences prefs = Settings.preferences;
            File dir = filesDir;
            if (dir == null) {
                persistenceFailure("clearing safe mode", null);
                return false;
            }
            try {
                if (prefs == null || !prefs.edit().putBoolean("safe_mode", false).commit()) {
                    persistenceFailure("clearing safe mode", null);
                    return false;
                }
            } catch (RuntimeException failure) {
                persistenceFailure("clearing safe mode", failure);
                return false;
            }
            if (!write(new File(dir, CRASH_STREAK), "0")) {
                try {
                    if (!prefs.edit().putBoolean("safe_mode", true).commit()) persistenceFailure("restoring safe mode", null);
                } catch (RuntimeException failure) { persistenceFailure("restoring safe mode", failure); }
                return false;
            }
            safeModeActive = false;
            }
        // Preference listeners ran while the runtime guard was still active. Republish after recovery
        // commits, outside the record lock so startup and theme initialization can't invert their locks.
        if (HostScreens.started && !HostScreens.failed && Settings.installed.contains("material_you")) MaterialYouTheme.bind();
        return true;
    }

    private static synchronized void countLastStart(Context context, SharedPreferences prefs) {
        File dir = filesDir;
        if (dir == null) return;
        File record = new File(dir, START_RECORD);
        File streakFile = new File(dir, CRASH_STREAK);
        boolean hadRecord = hasRecord(record), hadStreak = hasRecord(streakFile);
        String last = read(record);
        String savedStreak = read(streakFile);
        // An unreadable count (empty after an interrupted legacy write, garbage, or an orphaned staging
        // file) starts a fresh streak at 0 and is rewritten, so crash counting never stalls on it.
        boolean freshStreak = savedStreak == null && hadStreak;
        if (savedStreak != null) {
            try {
                if (Integer.parseInt(savedStreak.trim()) < 0) throw new NumberFormatException();
            } catch (NumberFormatException corrupt) {
                savedStreak = null;
                freshStreak = true;
                persistenceFailure("reading the crash count", corrupt);
            }
        }
        boolean validRecord = last != null;
        if (last != null) {
            try {
                String trimmed = last.trim();
                if (!trimmed.matches("[0-9]+ [0-9]+(?: crashed)?")) throw new NumberFormatException();
                String[] parts = trimmed.split(" ");
                Integer.parseInt(parts[0]);
                Long.parseLong(parts[1]);
            } catch (NumberFormatException corrupt) {
                validRecord = false;
                persistenceFailure("reading the start record", corrupt);
            }
        }
        if (validRecord) {
            int streak = diedYoungFromACrash(context, last) ? Math.min(THRESHOLD, parseCount(savedStreak)) + 1 : 0;
            if (streak >= THRESHOLD) {
                safeModeActive = true;
                try {
                    if (prefs.edit().putBoolean("safe_mode", true).commit()) {
                        streak = 0;
                        Log.w("HushMessenger", "CrashGuard: safe mode activated after " + THRESHOLD + " crashes");
                    } else persistenceFailure("saving safe mode", null);
                } catch (RuntimeException failure) { persistenceFailure("saving safe mode", failure); }
            }
            write(streakFile, Integer.toString(streak));
        } else if (freshStreak || (!hadRecord && !hadStreak)) write(streakFile, "0");
        write(record, Process.myPid() + " " + System.currentTimeMillis());
        installCrashMark();
        new Handler(Looper.getMainLooper()).postDelayed(CrashGuard::survivedTheStart, WINDOW_MS);
    }

    static synchronized void survivedTheStart() {
        File dir = filesDir;
        if (dir == null) return;
        if (CRASH_MARKED.get()) return;
        if (!write(new File(dir, CRASH_STREAK), "0")) return;
        File record = new File(dir, START_RECORD);
        try {
            atomicFiles.apply(record).delete();
            if (hasRecord(record)) persistenceFailure("clearing the start record", null);
        } catch (RuntimeException failure) { persistenceFailure("clearing the start record", failure); }
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

    static synchronized void markCrash() {
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

    private static boolean hasRecord(File file) {
        return file.exists() || new File(file.getPath() + ".bak").exists() || new File(file.getPath() + ".new").exists();
    }

    private static void persistenceFailure(String operation, Throwable failure) {
        Log.e("HushMessenger", "CrashGuard: persistence failed while " + operation +
            (failure == null ? "" : " (" + failure.getClass().getName() + ")"));
    }

    static synchronized String read(File file) {
        boolean existed = hasRecord(file);
        try (FileInputStream in = atomicFiles.apply(file).openRead()) {
            byte[] buffer = new byte[65];
            int length = 0;
            while (length < buffer.length) {
                int count = in.read(buffer, length, buffer.length - length);
                if (count < 0) break;
                if (count == 0) throw new IOException("No record data");
                length += count;
            }
            if (length == 0 || length > 64) throw new IOException("Invalid record size");
            for (int index = 0; index < length; index++) {
                int value = buffer[index] & 255;
                if (value >= 127 || (value < 32 && value != 9 && value != 10 && value != 13)) throw new IOException("Invalid record text");
            }
            return new String(buffer, 0, length, StandardCharsets.US_ASCII);
        } catch (FileNotFoundException missing) {
            if (existed) persistenceFailure("reading a record", missing);
        } catch (IOException | RuntimeException unreadable) { persistenceFailure("reading a record", unreadable); }
        return null;
    }

    static synchronized boolean write(File file, String text) {
        AtomicFile atomic = null;
        FileOutputStream out = null;
        boolean completed = false;
        boolean finishing = false;
        File backup = new File(file.getPath() + ".bak");
        File staging = new File(file.getPath() + ".new");
        try {
            if (text == null || text.isEmpty() || text.length() > 64 || text.chars().anyMatch(value ->
                    value >= 127 || (value < 32 && value != 9 && value != 10 && value != 13))) throw new IOException("Invalid record text");
            atomic = atomicFiles.apply(file);
            // Android 9 and 10 can truncate after a failed backup rename. Check it first.
            if (Build.VERSION.SDK_INT <= 29 && file.exists() && !backup.exists() && !file.renameTo(backup))
                throw new IOException("Could not preserve the previous record");
            out = atomic.startWrite();
            byte[] encoded = text.getBytes(StandardCharsets.US_ASCII);
            out.write(encoded);
            // finishWrite syncs again but ignores a failed sync and commits anyway (API 28-36).
            // Syncing here turns that failure into failWrite, which keeps the previous record.
            out.getFD().sync();
            // Verify while AtomicFile can still restore the previous record. openRead on the
            // original would restore its backup on older Android, so read the candidate directly.
            File candidate = staging;
            if (!candidate.exists()) candidate = file;
            try (FileInputStream verify = stagedInput.open(candidate)) {
                for (byte value : encoded) if (verify.read() != (value & 255)) throw new IOException("Invalid staged record");
                if (verify.read() != -1) throw new IOException("Invalid staged record size");
            }
            finishing = true;
            atomic.finishWrite(out);
            // AtomicFile logs some finish failures instead of throwing. Check that no staging file remains.
            if (backup.exists() || staging.exists())
                throw new IOException("Record replacement did not finish");
            completed = true;
            return true;
        } catch (IOException | RuntimeException failure) {
            persistenceFailure("writing a record", failure);
            return false;
        } finally {
            if (!completed && atomic != null && out != null) {
                // finishWrite may have discarded the backup. Never roll back after that point;
                // an unfinished backup/staging file remains recoverable by the next openRead.
                if (finishing) {
                    try { out.close(); }
                    catch (IOException | RuntimeException failure) { persistenceFailure("closing a record", failure); }
                } else {
                    try { atomic.failWrite(out); }
                    catch (RuntimeException failure) { persistenceFailure("restoring a record", failure); }
                }
            }
        }
    }

    static void resetForTests() {
        STARTED.set(false);
        HostScreens.started = false;
        HostScreens.failed = false;
        CRASH_MARKED.set(false);
        safeModeActive = false;
        filesDir = null;
        atomicFiles = AtomicFile::new;
        stagedInput = FileInputStream::new;
    }

    private CrashGuard() { }
}
