package app.fblite.extension.hideads;

import android.content.Context;
import android.os.SystemClock;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * Debug log of this extension. It writes to the same file as the settings extension's MorpheLog
 * (Android/data/com.facebook.lite/files/morphe-debug.log) and is switched by the same setting
 * (Morphe settings, Debug logging). The two extensions do not depend on each other, so the
 * file name and preference names are repeated here.
 */
final class AdLog {
    private static final String PREFERENCES = "morphe_fblite_settings";
    private static final String FILE_NAME = "morphe-debug.log";
    private static final String OLD_FILE_NAME = "morphe-debug.1.log";
    private static final long MAX_BYTES = 4L * 1024 * 1024;
    private static final long CHECK_MS = 1500;
    private static final SimpleDateFormat TIME = new SimpleDateFormat("HH:mm:ss.SSS", Locale.US);
    private static final int MAX_LINES_PER_RUN = 60000;

    private static Context context;
    private static boolean enabled;
    private static long checked = -CHECK_MS;
    private static File file;
    private static int lines;

    private AdLog() {
    }

    static synchronized void init(Context c) {
        if (context == null && c != null) context = c;
    }

    static synchronized boolean enabled() {
        Context c = context;
        if (c == null) return false;
        long now = SystemClock.uptimeMillis();
        if (now - checked >= CHECK_MS) {
            checked = now;
            try {
                enabled = c.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE).getBoolean("debug_log", false);
            } catch (Throwable t) {
                enabled = false;
            }
        }
        return enabled;
    }

    /** A boolean of the Morphe settings, read by name. */
    static boolean setting(String key, boolean fallback) {
        Context c = context;
        if (c == null) return fallback;
        try {
            return c.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE).getBoolean(key, fallback);
        } catch (Throwable t) {
            return fallback;
        }
    }

    static void log(String tag, String message) {
        write(tag, message, null);
    }

    static void log(String tag, String message, Throwable t) {
        write(tag, message, t);
    }

    private static synchronized void write(String tag, String message, Throwable t) {
        if (!enabled() || lines > MAX_LINES_PER_RUN) return;
        try {
            lines++;
            File target = file();
            if (target.length() > MAX_BYTES) {
                File old = new File(target.getParentFile(), OLD_FILE_NAME);
                old.delete();
                target.renameTo(old);
            }
            String line = TIME.format(new Date()) + " " + tag + " " + message
                    + (t != null ? " :: " + android.util.Log.getStackTraceString(t) : "") + "\n";
            try (FileOutputStream out = new FileOutputStream(target, true)) {
                out.write(line.getBytes(StandardCharsets.UTF_8));
            }
        } catch (Throwable ignored) {
            // Logging never breaks the app.
        }
    }

    private static File file() {
        if (file != null) return file;
        File dir = null;
        try {
            dir = context.getExternalFilesDir(null);
        } catch (Throwable ignored) {
        }
        if (dir == null) dir = context.getFilesDir();
        file = new File(dir, FILE_NAME);
        return file;
    }

    static String cut(String s, int max) {
        if (s == null) return "null";
        s = s.replace('\n', ' ');
        return s.length() > max ? s.substring(0, max) + "…(" + s.length() + ")" : s;
    }
}
