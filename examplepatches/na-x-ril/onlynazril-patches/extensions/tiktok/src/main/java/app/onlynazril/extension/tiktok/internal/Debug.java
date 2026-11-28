package app.onlynazril.extension.tiktok.internal;

import android.annotation.SuppressLint;
import android.content.Context;
import android.os.Build;
import android.os.Environment;
import android.util.Log;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

/**
 * Diagnostic output on three channels.
 * <p>
 * An app's own log can be dropped by the platform or a vendor filter, which makes a device-side
 * check impossible to trust: an empty log then means "not running" and "running but silenced" at
 * the same time. {@code System.out} is captured by logcat under the {@code System.out} tag and
 * survives the filters that drop a tag or a level, so the message is written there as well and
 * carries a fixed prefix to grep for.
 * <p>
 * When both logcat channels come up empty the message is also appended to a file. The first
 * candidate is the app-private external dir, no permission needed there, and it is pullable with
 * {@code adb pull} from {@code /sdcard/Android/data/<pkg>/files/}. A plain directory on shared
 * storage ({@code /sdcard/gg}) stays as a fallback for older Android versions or privileged setups.
 */
public final class Debug {
    public static final String PREFIX = "TIKTOK_HANDLE";

    /**
     * Bumped by hand with every change worth telling apart on a device. Printed once at startup, so
     * a log says which build is actually installed: without it, "the change did nothing" and "the
     * APK was never replaced" look exactly the same.
     */
    public static final String BUILD = "b131";
    private static final String TAG = "tiktokHandle";
    private static final String FILE_NAME = "tiktokhandle.log";
    /** A file past this size is moved aside as `.1` and a fresh one is started. */
    private static final long MAX_BYTES = 512L * 1024L;

    private static final Object LOCK = new Object();
    private static final SimpleDateFormat STAMP =
            new SimpleDateFormat("MM-dd HH:mm:ss.SSS", Locale.ROOT);

    private static Writer writer;
    private static File file;

    private Debug() {}

    /**
     * The app-side frames that led to a hook, in one line. The extension's own frames are skipped,
     * because the question is always "which app path reached this", not "which wrapper called it".
     * `depth` is the number of app frames to keep: three is a summary, six names the producer.
     */
    /** " by=<frames>" when the diagnostics are on, an empty string otherwise. */
    public static String by(int depth) {
        return verbose ? " by=" + caller(depth) : "";
    }

    public static String caller(int depth) {
        // The capture is the cost, so it is skipped entirely unless the diagnostics are wanted.
        if (!verbose) return "";
        StackTraceElement[] frames = new Throwable().getStackTrace();
        StringBuilder out = new StringBuilder();
        int shown = 0;
        for (StackTraceElement frame : frames) {
            String name = frame.getClassName();
            if (name.startsWith("app.onlynazril.extension") || name.startsWith("java.lang.Thread")) {
                continue;
            }
            if (shown++ >= depth) break;
            if (out.length() > 0) out.append(" <- ");
            out.append(name).append('#').append(frame.getMethodName());
        }
        return out.toString();
    }

    /**
     * Lines written to the file before the sink stops for this process. logcat already carries
     * every line, so the file is a convenience for `adb pull`; past the budget the file write is
     * what a long scroll would pay for on the main thread.
     */
    /** Verbose: every line, frames and callers included. Off: the budgets below, no stack capture. */
    private static volatile boolean verbose;

    public static boolean verbose() {
        return verbose;
    }

    public static void setVerbose(boolean value) {
        verbose = value;
    }

    private static final int FILE_LINES = 600;
    private static int fileLines;
    /** logcat carries every line, but a binder call per line is still paid on a scroll. */
    private static final int LOGCAT_LINES = 2000;
    private static int logcatLines;
    private static String lastMessage;

    /** Process clock at class load: every mark is measured from the first use of the extension. */
    private static final long startAt = android.os.SystemClock.elapsedRealtime();

    /**
     * A startup step with the time since the extension loaded. Startup cost is the one thing that
     * cannot be read off the dex: it needs the clock, and only the device has it.
     */
    public static void mark(String name) {
        if (!verbose) return;
        print("startup: " + name + " +" + (android.os.SystemClock.elapsedRealtime() - startAt) + "ms");
    }

    public static void print(String message) {
        // The diagnostics switch owns every line: off is silent, on is the full log. Exception
        // traces in the bridges stay separate, because those name a failure rather than a tick.
        if (!verbose) return;
        // A repeated line says nothing new, and the loop that repeats it is exactly what costs.
        if (message.equals(lastMessage)) return;
        lastMessage = message;
        int logcatBudget = verbose ? 20000 : LOGCAT_LINES;
        int fileBudget = verbose ? 8000 : FILE_LINES;
        if (logcatLines++ < logcatBudget) Log.w(TAG, message);
        if (fileLines++ < fileBudget) append(message);
    }

    /** Where the file went, or null while nothing was writable yet. */
    public static File sink() {
        synchronized (LOCK) {
            return file;
        }
    }

    private static void append(String message) {
        synchronized (LOCK) {
            if (writer == null) {
                writer = open();
                if (writer == null) return;
                note("file sink: " + file);
            }
            try {
                writer.write(STAMP.format(new Date()) + " " + PREFIX + " " + message + "\n");
                writer.flush();
            } catch (Throwable ignored) {
            }
        }
    }

    /**
     * Opens the first directory that will take the file, and says why the others would not.
     * <p>
     * The reason is reported on the two logcat channels rather than into the file, because the file
     * is what failed: without it a silent sink and a sink that never opened look the same, which is
     * exactly how this one went unnoticed.
     * <p>
     * A file at its cap is rotated rather than left alone: leaving it stopped the writes for good,
     * so a long session kept a full file and nothing after it.
     */
    private static Writer open() {
        for (File dir : candidates()) {
            if (dir == null) continue;
            try {
                if (!dir.exists() && !dir.mkdirs()) {
                    note("no directory at " + dir);
                    continue;
                }
                File target = new File(dir, FILE_NAME);
                rotate(target);
                Writer opened = new OutputStreamWriter(
                        new FileOutputStream(target, true), StandardCharsets.UTF_8);
                file = target;
                return opened;
            } catch (Throwable t) {
                note("cannot write " + dir + " (" + t + ")");
            }
        }
        return null;
    }

    /** Moves a full file aside so a fresh tail can be written. */
    private static void rotate(File target) {
        if (!target.exists() || target.length() <= MAX_BYTES) {
            return;
        }

        File previous = new File(target.getParentFile(), FILE_NAME + ".1");

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            try {
                Files.move(target.toPath(), previous.toPath(), StandardCopyOption.REPLACE_EXISTING);
            } catch (IOException e) {
                note("rotate failed: " + e.getMessage());
            }
        } else {
            if (previous.exists() && !previous.delete()) {
                note("failed to delete old backup: " + previous);
            }
            if (!target.renameTo(previous)) {
                note("failed to rotate file to: " + previous);
            }
        }
    }

    private static void note(String message) {
        Log.w(TAG, message);
    }

    /**
     * The app-private external dir first, then internal app files, then the shared storage.
     * <p>
     * A plain directory on shared storage is not writable by an app from Android 10 on, so asking for
     * it first only produced a failure note before the real directory was tried. The shared path
     * stays as a fallback for a device where it is still allowed.
     */
    private static File[] candidates() {
        List<File> dirs = new ArrayList<>();
        Context context = context();

        if (context != null) {
            File externalFiles = context.getExternalFilesDir(null);
            if (externalFiles != null) {
                dirs.add(externalFiles);
            }
            File internalFiles = context.getFilesDir();
            if (internalFiles != null) {
                dirs.add(internalFiles);
            }
        }

        dirs.add(new File(Environment.getExternalStorageDirectory(), "gg"));
        return dirs.toArray(new File[0]);
    }

    @SuppressLint("PrivateApi")
    private static Context context() {
        Context context = AppContext.get();
        if (context != null) return context;
        try {
            Class<?> activityThread = Class.forName("android.app.ActivityThread");
            Object application = activityThread.getMethod("currentApplication").invoke(null);
            if (application instanceof Context) {
                return ((Context) application).getApplicationContext();
            }
        } catch (Throwable ignored) {
        }
        return null;
    }
}
