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
 * The one logger every Nezumi extension uses. Every call goes to logcat; when the "Bug log" patch
 * is applied, lines are also redacted and appended to a rotating file under
 * {@code files/nezumi_logs/} that the user can export and send to the developer. Nothing leaves
 * the device on its own.
 *
 * <p>Errors, crashes and ANR/exit reasons are always recorded. Info and warning lines go to the
 * file only with "Detailed logging" on; otherwise the last {@link RingBuffer#CAPACITY} of them
 * are kept in memory and written out on a crash or an export, so the lead-up to a failure is not
 * lost. "Turn off bug log completely" records nothing. Without the patch, the file side is a no-op.
 */
public final class NezumiLog {
    private NezumiLog() { }

    private static volatile Context appContext;
    private static volatile LogStore store;
    /** Info/warning lines go to the file (otherwise to {@link #RING}). */
    private static volatile boolean detailed;
    /** Nothing is recorded, not even errors and crashes. */
    private static volatile boolean off;
    private static volatile boolean mainProcess;
    private static volatile String processName;

    /** I/W lines while detailed logging is off. */
    private static final RingBuffer RING = new RingBuffer();
    /** Lines logged before {@link #install} (hooks in early class initialisers), replayed once the store exists. */
    private static final RingBuffer EARLY = new RingBuffer(64, RingBuffer.MAX_LINE_CHARS);

    /** Replaced by the Bug log patch with the patch-bundle version the APK was built from. */
    static String bundleVersion() {
        return "unknown";
    }

    /**
     * Replaced by the Bug log patch with the patches applied to this APK, one per line:
     * {@code <patch-id> [hook|no-hook]} followed by the build-time option values, if any.
     */
    static String appliedPatches() {
        return "";
    }

    /**
     * Replaced by the Bug log patch with every Zalo method a patch modified, one
     * {@code Lclass;->method(args)Return=<patch-id>} per line, for crash attribution.
     */
    static String touchedMethods() {
        return "";
    }

    /** False when the Bug log patch is not applied (nothing baked): then nothing is ever buffered for a store. */
    private static final boolean BUG_LOG_APPLIED = !appliedPatches().isEmpty();

    private static volatile Attribution attribution;

    static Attribution attribution() {
        Attribution current = attribution;
        if (current == null) attribution = current = Attribution.parse(touchedMethods());
        return current;
    }

    private static final boolean[] FIRED = new boolean[Patch.values().length];

    /**
     * Hook breadcrumb, called through {@link Hits} from the start of every hooked Zalo method:
     * logs {@code I/<id>/Hook hook fired} the first time per process, then costs one array check.
     * The line always goes to the file (at most one per patch per process), even with detailed
     * logging off, so an export sees hooks that fired in every process, not only the exporting one.
     */
    static void hit(Patch patch) {
        int index = patch.ordinal();
        if (FIRED[index]) return;
        FIRED[index] = true;
        i(patch, LogLine.HOOK_TAG, LogLine.HOOK_FIRED);
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
            detailed = NezumiPrefs.bool(context, NezumiPrefs.BUG_LOG_DETAILED, false);
            off = NezumiPrefs.bool(context, NezumiPrefs.BUG_LOG_OFF, false);
            LogStore created = new LogStore(new File(context.getFilesDir(), LogStore.DIR), "nezumi" + suffix);
            if (!off) created.startSession(NezumiLog::sessionHeader);
            store = created;
            replayEarly(created);
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
            if (!off && mainProcess) ExitReasons.recordAsync(context);
            hit(Patch.BUG_LOG);
        } catch (Throwable failure) {
            // Never let logging setup break app startup.
            Log.e("NezumiLog", "install failed", failure);
        }
    }

    /** True when the Bug log patch is applied, i.e. the Debugging options in Nezumi's Settings do something. */
    public static boolean isAvailable() {
        return store != null;
    }

    /** True when anything is written to the file at all (errors and crashes at least). */
    static boolean isRecording() {
        return !off && store != null;
    }

    public static boolean isDetailed() {
        return detailed;
    }

    public static boolean isOff() {
        return off;
    }

    /** Detailed logging: info and warning lines go to the file too. Persisted; applies to this process now. */
    public static void setDetailed(Context context, boolean value) {
        NezumiPrefs.of(context).edit().putBoolean(NezumiPrefs.BUG_LOG_DETAILED, value).apply();
        if (value == detailed) return;
        if (value) {
            // Keep what led up to this moment.
            flushBuffered();
            detailed = true;
            i(Patch.CORE, "NezumiLog", "detailed logging on");
        } else {
            i(Patch.CORE, "NezumiLog", "detailed logging off");
            detailed = false;
        }
    }

    /** Turns the bug log off completely (nothing recorded) or back on. Persisted; applies to this process now. */
    public static void setOff(Context context, boolean value) {
        NezumiPrefs.of(context).edit().putBoolean(NezumiPrefs.BUG_LOG_OFF, value).apply();
        if (value == off) return;
        LogStore current = store;
        if (value) {
            i(Patch.CORE, "NezumiLog", "bug log turned off");
            off = true;
            RING.drain();
            if (current != null) current.flush();
        } else {
            off = false;
            if (current != null) current.startSession(NezumiLog::sessionHeader);
            i(Patch.CORE, "NezumiLog", "bug log turned on");
            if (mainProcess) ExitReasons.recordAsync(context);
        }
    }

    static Context context() {
        return appContext;
    }

    static LogStore store() {
        return store;
    }

    // ---- logging API -------------------------------------------------------------------------
    // Every call names the patch it runs for, so a shared bug log can be split by patch, and a
    // tag that is the calling class's simple name.

    /** Debug: logcat only, never written to the bug-log file. */
    public static void d(Patch patch, String tag, String message) {
        Log.d(tag, prefixed(patch, message));
    }

    public static void i(Patch patch, String tag, String message) {
        Log.i(tag, prefixed(patch, message));
        file('I', patch, tag, message, null);
    }

    public static void w(Patch patch, String tag, String message) {
        Log.w(tag, prefixed(patch, message));
        file('W', patch, tag, message, null);
    }

    public static void w(Patch patch, String tag, String message, Throwable failure) {
        Log.w(tag, prefixed(patch, message), failure);
        file('W', patch, tag, message, failure);
    }

    public static void e(Patch patch, String tag, String message) {
        Log.e(tag, prefixed(patch, message));
        file('E', patch, tag, message, null);
    }

    public static void e(Patch patch, String tag, String message, Throwable failure) {
        Log.e(tag, prefixed(patch, message), failure);
        file('E', patch, tag, message, failure);
    }

    /** Records a swallowed failure: file only (with stack trace), keeps logcat as quiet as before. */
    public static void swallowed(Patch patch, String tag, String message, Throwable failure) {
        file('W', patch, tag, message, failure);
    }

    /**
     * Like {@link #swallowed} but writes each patch+tag+message at most once per process. For
     * fallbacks on hot paths (per row, per conversation) where a broken reflection target would
     * otherwise repeat the same stack trace thousands of times and rotate the useful lines away.
     */
    public static void swallowedOnce(Patch patch, String tag, String message, Throwable failure) {
        // Hot paths call this: skip building the key when nothing can be recorded.
        if (off || (store == null && !BUG_LOG_APPLIED)) return;
        if (SEEN.size() < 512 && SEEN.add(patch.id + '\u0000' + tag + '\u0000' + message)) {
            file('W', patch, tag, message + " (further occurrences suppressed)", failure);
        }
    }

    private static final java.util.Set<String> SEEN =
        java.util.Collections.newSetFromMap(new java.util.concurrent.ConcurrentHashMap<>());

    private static String prefixed(Patch patch, String message) {
        return "[" + patch.id + "] " + message;
    }

    /**
     * Routes one line: errors to the file, info/warnings to the file in detailed mode and to the
     * in-memory ring otherwise; before {@link #install} everything waits in {@link #EARLY}.
     */
    private static void file(char level, Patch patch, String tag, String message, Throwable failure) {
        if (off || (store == null && !BUG_LOG_APPLIED)) return;
        try {
            long now = System.currentTimeMillis();
            String thread = Thread.currentThread().getName();
            String text = String.valueOf(message);
            String trace = failure == null ? null : stackTrace(failure);
            LogStore current = store;
            if (current == null) {
                EARLY.add(now, level, patch.id, tag, thread, text, trace);
            } else if (LogLine.goesToFile(level, tag, detailed)) {
                current.append(now, render(level, patch.id, tag, thread, text, trace));
            } else {
                RING.add(now, level, patch.id, tag, thread, text, trace);
            }
        } catch (Throwable ignored) {
            // Logging must never throw into the hooked code.
        }
    }

    private static String render(char level, String patchId, String tag, String thread, String message, String trace) {
        return LogLine.body(level, patchId, tag, thread, LogRedactor.redact(message),
            trace == null ? null : LogRedactor.redact(trace));
    }

    private static String render(RingBuffer.Entry entry) {
        return render(entry.level, entry.patchId, entry.tag, entry.thread, entry.message, entry.detail);
    }

    private static void replayEarly(LogStore current) {
        for (RingBuffer.Entry entry : EARLY.drain()) {
            if (off) continue;
            if (LogLine.goesToFile(entry.level, entry.tag, detailed)) current.append(entry.time, render(entry));
            else RING.add(entry.time, entry.level, entry.patchId, entry.tag, entry.thread, entry.message, entry.detail);
        }
    }

    /** The buffered I/W lines as file entries, behind a marker line; empty when nothing is buffered. */
    private static java.util.List<LogStore.Line> bufferedLines() {
        java.util.List<RingBuffer.Entry> entries = RING.drain();
        java.util.List<LogStore.Line> lines = new java.util.ArrayList<>(entries.size() + 1);
        if (entries.isEmpty()) return lines;
        lines.add(new LogStore.Line(entries.get(0).time, LogLine.body('I', Patch.CORE.id, "NezumiLog",
            Thread.currentThread().getName(), "---- " + entries.size()
                + " buffered info/warning lines from this process (detailed logging off) ----", null)));
        for (RingBuffer.Entry entry : entries) lines.add(new LogStore.Line(entry.time, render(entry)));
        return lines;
    }

    /** Writes the buffered I/W lines to the file and waits for the disk. Used by export. */
    static void flushBuffered() {
        LogStore current = store;
        if (current == null) return;
        if (!off) current.appendAll(bufferedLines());
        current.flush();
    }

    /** Waits for lines already queued for the file to reach the disk. Used before a self-restart. */
    public static void flushPending() {
        LogStore current = store;
        if (current != null) current.flush();
    }

    /** Drops the buffered lines, for "Clear log". */
    static void clearBuffered() {
        RING.drain();
        EARLY.drain();
    }

    /**
     * Synchronous write for the crash handler: the buffered lead-up first, then the crash. The
     * process may be gone right after this returns.
     */
    static void fileNow(char level, Patch patch, String tag, String message, Throwable failure) {
        LogStore current = store;
        if (off || current == null) return;
        java.util.List<LogStore.Line> lines = bufferedLines();
        lines.add(new LogStore.Line(System.currentTimeMillis(), render(level, patch.id, tag,
            Thread.currentThread().getName(), String.valueOf(message), failure == null ? null : stackTrace(failure))));
        current.appendNow(lines);
    }

    /** A pre-formatted, multi-line entry (exit reasons); always recorded unless the bug log is off. */
    static void fileRaw(String text) {
        LogStore current = store;
        if (off || current == null) return;
        current.append(System.currentTimeMillis(), LogRedactor.redact(text));
    }

    static String stackTrace(Throwable failure) {
        StringWriter text = new StringWriter();
        try (PrintWriter writer = new PrintWriter(text)) {
            failure.printStackTrace(writer);
        }
        String result = text.toString();
        return result.endsWith("\n") ? result.substring(0, result.length() - 1) : result;
    }

    // ---- session header ----------------------------------------------------------------------

    /** Written at the start of every process (and again after a rotation), so each run is self-describing. */
    private static String sessionHeader() {
        Context context = appContext;
        int pid = android.os.Process.myPid();
        StringBuilder out = new StringBuilder();
        out.append("===== session ").append(pid).append(" start =====\n");
        out.append("time: ").append(LogLine.timestamp(System.currentTimeMillis())).append('\n');
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
                out.append("app: ").append(context.getPackageName()).append(" (version unavailable: ")
                    .append(failure.getClass().getSimpleName()).append(")\n");
            }
        }
        out.append("bundle: Nezumi Patches ").append(bundleVersion()).append('\n');
        out.append("logging: ").append(off ? "off" : detailed ? "detailed"
            : "errors only (last " + RingBuffer.CAPACITY + " info/warning lines kept in memory)").append('\n');
        out.append("exit-info: ").append(Build.VERSION.SDK_INT >= 30 ? "supported" : "unsupported").append('\n');
        out.append("options:");
        if (context != null) {
            SharedPreferences prefs = NezumiPrefs.of(context);
            Map<String, ?> all = new TreeMap<>(prefs.getAll());
            int shownCount = 0;
            for (Map.Entry<String, ?> entry : all.entrySet()) {
                String key = entry.getKey();
                if (key.contains(":") || key.startsWith("bug_log")) continue;
                Object value = entry.getValue();
                // Only flags and numbers; strings may hold file names or uris picked by the user.
                String shown = value instanceof Boolean || value instanceof Number ? String.valueOf(value) : "<set>";
                out.append("\n  ").append(key).append(" = ").append(shown);
                shownCount++;
            }
            if (shownCount == 0) out.append(" (all defaults)");
        }
        out.append("\napplied patches:");
        String applied = appliedPatches();
        if (applied == null || applied.isEmpty()) {
            out.append(" (unknown: built without the patch registry)");
        } else {
            for (String patch : applied.split("\n")) out.append("\n  ").append(patch);
        }
        out.append("\n=====");
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
