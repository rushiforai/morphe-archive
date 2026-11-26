package app.template.extension.zalo.buglog;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;

import java.io.File;
import java.io.FileInputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Map;
import java.util.TreeMap;

import app.template.extension.zalo.settings.NezumiPrefs;

/**
 * The one logger every Nezumi extension uses. Every call goes to logcat as before; when the
 * "Bug log" patch is applied and the user turned bug logging on in Nezumi's Settings, I/W/E lines
 * are also redacted and appended to a rotating file under {@code files/nezumi_logs/} that the user
 * can export and send to the developer. Without the patch, or with the toggle off, the file side
 * is a no-op.
 */
public final class NezumiLog {
    private NezumiLog() { }

    private static volatile Context appContext;
    private static volatile LogStore store;
    private static volatile boolean enabled;
    private static volatile boolean mainProcess;
    private static volatile String processName;

    /** Replaced by the Bug log patch with the patch-bundle version the APK was built from. */
    static String bundleVersion() {
        return "unknown";
    }

    /** Called by the Bug log patch from {@code MainApplication.attachBaseContext}, in every process. */
    public static void install(Context context) {
        try {
            if (context == null || appContext != null) return;
            appContext = context;
            processName = currentProcessName(context);
            mainProcess = processName == null || processName.equals(context.getPackageName());
            String suffix = mainProcess || processName == null || !processName.contains(":")
                ? "" : "-" + processName.substring(processName.indexOf(':') + 1).replaceAll("[^A-Za-z0-9_]", "_");
            store = new LogStore(new File(context.getFilesDir(), LogStore.DIR), "nezumi" + suffix, NezumiLog::header);
            enabled = NezumiPrefs.bool(context, NezumiPrefs.BUG_LOG, false);
            CrashCapture.ensureInstalled();
            if (context instanceof Application) {
                ((Application) context).registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
                    @Override public void onActivityCreated(Activity activity, Bundle state) { CrashCapture.ensureInstalled(); }
                    @Override public void onActivityStarted(Activity activity) { }
                    @Override public void onActivityResumed(Activity activity) { CrashCapture.ensureInstalled(); }
                    @Override public void onActivityPaused(Activity activity) { }
                    @Override public void onActivityStopped(Activity activity) { }
                    @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) { }
                    @Override public void onActivityDestroyed(Activity activity) { }
                });
            }
            if (enabled) {
                i("BugLog", "process start: " + processName);
                if (mainProcess) ExitReasons.recordAsync(context);
            }
        } catch (Throwable failure) {
            // Never let logging setup break app startup.
            Log.e("BugLog", "install failed", failure);
        }
    }

    /** True when the Bug log patch is applied, i.e. the toggle in Nezumi's Settings does something. */
    public static boolean isAvailable() {
        return store != null;
    }

    public static boolean isEnabled() {
        return enabled && store != null;
    }

    /** Turns file logging on or off for this process and persists the choice. */
    public static void setEnabled(Context context, boolean value) {
        NezumiPrefs.of(context).edit().putBoolean(NezumiPrefs.BUG_LOG, value).apply();
        if (value) {
            enabled = true;
            i("BugLog", "bug log enabled");
            if (mainProcess) ExitReasons.recordAsync(context);
        } else {
            i("BugLog", "bug log disabled");
            enabled = false;
            LogStore current = store;
            if (current != null) current.flush();
        }
    }

    static Context context() {
        return appContext;
    }

    static LogStore store() {
        return store;
    }

    // ---- logging API -------------------------------------------------------------------------

    /** Debug: logcat only, never written to the bug-log file. */
    public static void d(String tag, String message) {
        Log.d(tag, String.valueOf(message));
    }

    public static void i(String tag, String message) {
        Log.i(tag, String.valueOf(message));
        file('I', tag, message, null);
    }

    public static void w(String tag, String message) {
        Log.w(tag, String.valueOf(message));
        file('W', tag, message, null);
    }

    public static void w(String tag, String message, Throwable failure) {
        Log.w(tag, String.valueOf(message), failure);
        file('W', tag, message, failure);
    }

    public static void e(String tag, String message) {
        Log.e(tag, String.valueOf(message));
        file('E', tag, message, null);
    }

    public static void e(String tag, String message, Throwable failure) {
        Log.e(tag, String.valueOf(message), failure);
        file('E', tag, message, failure);
    }

    /** Records a swallowed failure: file only (with stack trace), keeps logcat as quiet as before. */
    public static void swallowed(String tag, String message, Throwable failure) {
        file('W', tag, message, failure);
    }

    /**
     * Like {@link #swallowed} but writes each tag+message at most once per process. For fallbacks
     * on hot paths (per row, per conversation) where a broken reflection target would otherwise
     * repeat the same stack trace thousands of times and rotate the useful lines away.
     */
    public static void swallowedOnce(String tag, String message, Throwable failure) {
        if (!enabled || store == null) return;
        if (SEEN.size() < 512 && SEEN.add(tag + '\u0000' + message)) {
            file('W', tag, message + " (further occurrences suppressed)", failure);
        }
    }

    private static final java.util.Set<String> SEEN =
        java.util.Collections.newSetFromMap(new java.util.concurrent.ConcurrentHashMap<>());

    private static void file(char level, String tag, String message, Throwable failure) {
        LogStore current = store;
        if (!enabled || current == null) return;
        try {
            current.append(System.currentTimeMillis(), line(level, tag, message, failure));
        } catch (Throwable ignored) {
            // Logging must never throw into the hooked code.
        }
    }

    /** Synchronous write for the crash handler: the process may be gone right after this returns. */
    static void fileNow(char level, String tag, String message, Throwable failure) {
        LogStore current = store;
        if (!enabled || current == null) return;
        current.appendNow(System.currentTimeMillis(), line(level, tag, message, failure));
    }

    static void fileRaw(String text) {
        LogStore current = store;
        if (!enabled || current == null) return;
        current.append(System.currentTimeMillis(), LogRedactor.redact(text));
    }

    private static String line(char level, String tag, String message, Throwable failure) {
        StringBuilder out = new StringBuilder();
        out.append(level).append('/').append(tag).append(" [").append(Thread.currentThread().getName()).append("] ")
            .append(LogRedactor.redact(String.valueOf(message)));
        if (failure != null) out.append('\n').append(LogRedactor.redact(stackTrace(failure)));
        return out.toString();
    }

    static String stackTrace(Throwable failure) {
        StringWriter text = new StringWriter();
        try (PrintWriter writer = new PrintWriter(text)) {
            failure.printStackTrace(writer);
        }
        String result = text.toString();
        return result.endsWith("\n") ? result.substring(0, result.length() - 1) : result;
    }

    // ---- header ------------------------------------------------------------------------------

    private static String header() {
        Context context = appContext;
        StringBuilder out = new StringBuilder();
        out.append("process: ").append(processName).append('\n');
        out.append("device: ").append(Build.MANUFACTURER).append(' ').append(Build.MODEL)
            .append(" (").append(Build.DEVICE).append(")\n");
        out.append("android: ").append(Build.VERSION.RELEASE).append(" (API ").append(Build.VERSION.SDK_INT).append(")\n");
        out.append("abi: ").append(Arrays.toString(Build.SUPPORTED_ABIS)).append('\n');
        if (context != null) {
            try {
                PackageInfo info = context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
                long code = Build.VERSION.SDK_INT >= 28 ? info.getLongVersionCode() : info.versionCode;
                out.append("app: ").append(context.getPackageName()).append(' ').append(info.versionName)
                    .append(" (").append(code).append(")\n");
            } catch (Exception failure) {
                out.append("app: ").append(context.getPackageName()).append(" (version unavailable)\n");
            }
        }
        out.append("patches: Nezumi Patches ").append(bundleVersion()).append('\n');
        out.append("exit-info: ").append(Build.VERSION.SDK_INT >= 30 ? "supported" : "unsupported").append('\n');
        out.append("nezumi options:");
        if (context != null) {
            SharedPreferences prefs = NezumiPrefs.of(context);
            Map<String, ?> all = new TreeMap<>(prefs.getAll());
            if (all.isEmpty()) out.append(" (all defaults)");
            for (Map.Entry<String, ?> entry : all.entrySet()) {
                String key = entry.getKey();
                if (key.contains(":") || key.startsWith("bug_log")) continue;
                Object value = entry.getValue();
                // Only flags and numbers; strings may hold file names or uris picked by the user.
                String shown = value instanceof Boolean || value instanceof Number ? String.valueOf(value) : "<set>";
                out.append("\n  ").append(key).append(" = ").append(shown);
            }
        }
        return out.toString();
    }

    private static String currentProcessName(Context context) {
        if (Build.VERSION.SDK_INT >= 28) return Application.getProcessName();
        try (FileInputStream in = new FileInputStream("/proc/self/cmdline")) {
            byte[] buffer = new byte[256];
            int length = in.read(buffer);
            int end = 0;
            while (end < length && buffer[end] != 0) end++;
            return end > 0 ? new String(buffer, 0, end, StandardCharsets.UTF_8) : context.getPackageName();
        } catch (Exception failure) {
            return context.getPackageName();
        }
    }
}
