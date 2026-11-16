package app.badfella.extension.linkedin;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.os.Build;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayDeque;
import java.util.Arrays;
import java.util.Map;

/** Only fixed event categories, extension stack locations and numeric measurements leave this class. */
final class Diagnostics {
    private static final String[] CATEGORIES = {"feed/filter", "media", "navigation", "tracking", "other"};
    private static final long[] EVENTS = new long[CATEGORIES.length];
    private static final ArrayDeque<String> ERRORS = new ArrayDeque<>();

    private Diagnostics() {}

    /** Never retain the supplied text: callers can pass requests, links, names or post content. */
    static synchronized void debug(String message) {
        if (!Settings.debug()) return;
        int category = 4;
        if (message != null) {
            if (message.startsWith("hide ") || message.startsWith("view ") || message.startsWith("outline ")) category = 0;
            else if (message.startsWith("media") || message.startsWith("document")) category = 1;
            else if (message.startsWith("swipe") || message.startsWith("SduiFragment") || message.startsWith("premium")) category = 2;
            else if (message.startsWith("tracking") || message.startsWith("profile view") || message.startsWith("sdui request")) category = 3;
        }
        EVENTS[category]++;
    }

    /** Exception messages, causes and arbitrary caller text are deliberately excluded. */
    static synchronized void error(String ignoredMessage, Throwable failure) {
        StringBuilder line = new StringBuilder("extension error");
        if (failure != null) {
            int kept = 0;
            for (StackTraceElement frame : failure.getStackTrace()) {
                String type = frame.getClassName(), method = frame.getMethodName();
                if (!type.startsWith("app.badfella.extension.linkedin.")
                        || !type.matches("[A-Za-z0-9_.$]+") || !method.matches("[A-Za-z0-9_$<>]+")) continue;
                line.append("\n  ").append(type.substring(type.lastIndexOf('.') + 1))
                        .append('.').append(method).append(':').append(frame.getLineNumber());
                if (++kept == 4) break;
            }
        }
        if (ERRORS.size() == 40) ERRORS.removeFirst();
        ERRORS.addLast(line.toString());
    }

    static synchronized void clear() {
        Arrays.fill(EVENTS, 0);
        ERRORS.clear();
        PerformanceCapture.clear();
    }

    /** Never import an older version's free-text diagnostic log into a new report. */
    static void discardLegacyLog(Context context) {
        Context app = context.getApplicationContext();
        new Thread(() -> {
            try { new java.io.File(app.getFilesDir(), "michii_log.txt").delete(); }
            catch (RuntimeException ignored) { /* Never read a legacy log, even if removal fails. */ }
        }, "badfella-legacy-log-cleanup").start();
    }

    static String report(Context context) {
        StringBuilder out = new StringBuilder("BadFella Patches diagnostic report (schema 2)\n");
        out.append("No account identity, post/message text, links, cookies, tokens or custom setting text is collected.\n");
        out.append("Events and performance results cover this app process only.\n\n");
        out.append("BadFella Patches ").append(Settings.patchesVersion()).append("; LinkedIn ").append(appVersion(context)).append('\n');
        out.append("Android ").append(Build.VERSION.RELEASE).append(" (API ").append(Build.VERSION.SDK_INT)
                .append("); ").append(Build.MANUFACTURER).append(' ').append(Build.MODEL).append('\n');
        out.append("Device ABIs: ").append(Arrays.toString(Build.SUPPORTED_ABIS)).append('\n');
        out.append("Diagnostic event counting: ").append(Settings.debug()).append('\n');
        out.append("\nIncluded patches:\n");
        for (Object[] patch : SettingsActivity.patches()) {
            out.append("  ").append((Boolean) patch[1] ? "[x] " : "[ ] ").append(patch[0]).append('\n');
        }
        out.append("\nSaved boolean choices (unsaved choices use patch defaults):\n");
        SharedPreferences prefs = Settings.prefs();
        if (prefs != null) out.append(booleanSettings(prefs.getAll()));
        synchronized (Diagnostics.class) {
            out.append("\nEvent counts:\n");
            for (int i = 0; i < EVENTS.length; i++) out.append("  ").append(CATEGORIES[i]).append(": ").append(EVENTS[i]).append('\n');
            out.append("\nRecent extension errors (messages and external stack frames omitted):\n");
            for (String error : ERRORS) out.append(error).append('\n');
        }
        return out.append('\n').append(PerformanceCapture.report()).toString();
    }

    /** Only compile-time preference keys, and only Boolean values. Never copy user-defined keys or strings. */
    static String booleanSettings(Map<String, ?> values) {
        StringBuilder out = new StringBuilder();
        Field[] fields = Settings.class.getDeclaredFields();
        Arrays.sort(fields, (a, b) -> a.getName().compareTo(b.getName()));
        for (Field field : fields) {
            if (field.getType() != String.class || !Modifier.isStatic(field.getModifiers())
                    || !Modifier.isFinal(field.getModifiers())) continue;
            try {
                Object value = values.get(field.get(null));
                if (value instanceof Boolean) out.append("  ").append(field.getName()).append(" = ").append(value).append('\n');
            } catch (IllegalAccessException ignored) {
                // A private implementation field is not a reportable preference.
            }
        }
        return out.toString();
    }

    private static String appVersion(Context context) {
        try {
            PackageInfo info = context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
            return info.versionName + " (" + info.getLongVersionCode() + ")";
        } catch (Exception ignored) { return "unknown"; }
    }
}
