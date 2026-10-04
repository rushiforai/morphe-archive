package app.onlynazril.extension.tiktok.internal;

import android.content.Context;
import android.util.Log;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * Diagnostic output on three channels.
 *
 * An app's own log can be dropped by the platform or a vendor filter, which makes a device-side
 * check impossible to trust: an empty log then means "not running" and "running but silenced" at
 * the same time. {@code System.out} is captured by logcat under the {@code System.out} tag and
 * survives the filters that drop a tag or a level, so the message is written there as well and
 * carries a fixed prefix to grep for.
 *
 * When both logcat channels come up empty the message is also appended to a file. The first
 * candidate is a plain directory on shared storage ({@code /sdcard/gg}); on Android 10+ scoped
 * storage usually refuses it, so the app-private external dir is the fallback — no permission
 * needed there, and it is pullable with {@code adb pull} from
 * {@code /sdcard/Android/data/<pkg>/files/}.
 */
public final class Debug {
    public static final String PREFIX = "TIKTOK_HANDLE";

    /**
     * Bumped by hand with every change worth telling apart on a device. Printed once at startup, so
     * a log says which build is actually installed: without it, "the change did nothing" and "the
     * APK was never replaced" look exactly the same.
     */
    public static final String BUILD = "b37";
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

    public static void print(String message) {
        System.out.println(PREFIX + " " + message);
        Log.w(TAG, message);
        append(message);
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
                System.out.println(PREFIX + " file sink: " + file);
                Log.w(TAG, "file sink: " + file);
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
     *
     * The reason is reported on the two logcat channels rather than into the file, because the file
     * is what failed: without it a silent sink and a sink that never opened look the same, which is
     * exactly how this one went unnoticed.
     *
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
        if (target.length() <= MAX_BYTES) return;
        File previous = new File(target.getParentFile(), FILE_NAME + ".1");
        previous.delete();
        target.renameTo(previous);
    }

    private static void note(String message) {
        System.out.println(PREFIX + " " + message);
        Log.w(TAG, message);
    }

    /**
     * The app-private external dir first, then the shared one.
     *
     * A plain directory on shared storage is not writable by an app from Android 10 on, so asking for
     * it first only produced a failure note before the real directory was tried. The shared path
     * stays as a fallback for a device where it is still allowed.
     */
    private static File[] candidates() {
        Context context = context();
        return new File[] {
            context == null ? null : context.getExternalFilesDir(null),
            new File("/sdcard/gg"),
        };
    }

    private static Context context() {
        Context context = AppContext.get();
        if (context != null) return context;
        try {
            Class<?> activityThread = Class.forName("android.app.ActivityThread");
            Object application = activityThread.getMethod("currentApplication").invoke(null);
            if (application instanceof Context) return (Context) application;
        } catch (Throwable ignored) {
        }
        return null;
    }
}
