package app.template.extension.zalo.buglog;

import android.app.ActivityManager;
import android.app.ApplicationExitInfo;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Build;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import app.template.extension.zalo.settings.NezumiPrefs;

/**
 * Native crashes and ANRs kill the process without reaching any Java handler. On Android 11+
 * the system remembers why each process died; on the next start this copies every exit recorded
 * since the last read into the bug log, with the ANR trace or the readable part of the native
 * tombstone when the system kept one.
 */
final class ExitReasons {
    private ExitReasons() { }

    private static final String TAG = "ExitInfo";
    private static final int MAX_TRACE_BYTES = 64 * 1024;

    static void recordAsync(Context context) {
        if (Build.VERSION.SDK_INT < 30) return;
        Thread thread = new Thread(() -> {
            try {
                record(context);
            } catch (Throwable failure) {
                NezumiLog.swallowed(TAG, "reading exit reasons failed", failure);
            }
        }, "NezumiExitInfo");
        thread.setDaemon(true);
        thread.start();
    }

    private static synchronized void record(Context context) {
        if (Build.VERSION.SDK_INT < 30 || !NezumiLog.isEnabled()) return;
        ActivityManager manager = (ActivityManager) context.getSystemService(Context.ACTIVITY_SERVICE);
        if (manager == null) return;
        SharedPreferences prefs = NezumiPrefs.of(context);
        long lastSeen = prefs.getLong(NezumiPrefs.BUG_LOG_EXIT_SEEN, 0L);
        List<ApplicationExitInfo> exits = manager.getHistoricalProcessExitReasons(context.getPackageName(), 0, 0);
        long newest = lastSeen;
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS", Locale.US);
        // The system returns newest first; log oldest first so the file reads chronologically.
        for (int index = exits.size() - 1; index >= 0; index--) {
            ApplicationExitInfo exit = exits.get(index);
            if (exit.getTimestamp() <= lastSeen) continue;
            newest = Math.max(newest, exit.getTimestamp());
            int reason = exit.getReason();
            boolean interesting = reason == ApplicationExitInfo.REASON_CRASH
                || reason == ApplicationExitInfo.REASON_CRASH_NATIVE
                || reason == ApplicationExitInfo.REASON_ANR
                || reason == ApplicationExitInfo.REASON_LOW_MEMORY
                || reason == ApplicationExitInfo.REASON_INITIALIZATION_FAILURE
                || reason == ApplicationExitInfo.REASON_EXCESSIVE_RESOURCE_USAGE;
            StringBuilder line = new StringBuilder();
            line.append(interesting ? "E" : "I").append('/').append(TAG).append(" [previous run] ")
                .append(reasonName(reason)).append(" at ").append(format.format(new Date(exit.getTimestamp())))
                .append(", process ").append(exit.getProcessName())
                .append(", status ").append(exit.getStatus())
                .append(", importance ").append(exit.getImportance())
                .append(", pss ").append(exit.getPss()).append(" KB");
            if (exit.getDescription() != null) line.append("\n  description: ").append(exit.getDescription());
            if (reason == ApplicationExitInfo.REASON_ANR || reason == ApplicationExitInfo.REASON_CRASH_NATIVE) {
                String trace = readTrace(exit, reason == ApplicationExitInfo.REASON_CRASH_NATIVE);
                if (trace != null) line.append("\n  trace:\n").append(trace);
            }
            NezumiLog.fileRaw(line.toString());
        }
        if (newest != lastSeen) prefs.edit().putLong(NezumiPrefs.BUG_LOG_EXIT_SEEN, newest).apply();
    }

    /**
     * ANR traces are plain text. Native tombstones (Android 12+) are protobuf, so only their
     * printable runs (signal, abort message, backtrace symbols and library paths) are kept.
     */
    private static String readTrace(ApplicationExitInfo exit, boolean binary) {
        try (InputStream in = exit.getTraceInputStream()) {
            if (in == null) return null;
            ByteArrayOutputStream bytes = new ByteArrayOutputStream();
            byte[] buffer = new byte[8192];
            int read;
            while (bytes.size() < MAX_TRACE_BYTES && (read = in.read(buffer)) != -1) bytes.write(buffer, 0, read);
            byte[] data = bytes.toByteArray();
            String text = binary ? printableRuns(data) : new String(data, StandardCharsets.UTF_8);
            if (data.length >= MAX_TRACE_BYTES) text += "\n  ... (truncated)";
            return text;
        } catch (IOException | RuntimeException failure) {
            return "  (trace unavailable: " + failure + ")";
        }
    }

    private static String printableRuns(byte[] data) {
        StringBuilder out = new StringBuilder();
        int start = -1;
        for (int index = 0; index <= data.length; index++) {
            boolean printable = index < data.length && data[index] >= 0x20 && data[index] < 0x7f;
            if (printable && start < 0) start = index;
            if (!printable && start >= 0) {
                if (index - start >= 6) out.append("  ").append(new String(data, start, index - start, StandardCharsets.US_ASCII)).append('\n');
                start = -1;
            }
        }
        return out.toString();
    }

    private static String reasonName(int reason) {
        switch (reason) {
            case ApplicationExitInfo.REASON_EXIT_SELF: return "EXIT_SELF";
            case ApplicationExitInfo.REASON_SIGNALED: return "SIGNALED";
            case ApplicationExitInfo.REASON_LOW_MEMORY: return "LOW_MEMORY";
            case ApplicationExitInfo.REASON_CRASH: return "CRASH";
            case ApplicationExitInfo.REASON_CRASH_NATIVE: return "CRASH_NATIVE";
            case ApplicationExitInfo.REASON_ANR: return "ANR";
            case ApplicationExitInfo.REASON_INITIALIZATION_FAILURE: return "INITIALIZATION_FAILURE";
            case ApplicationExitInfo.REASON_PERMISSION_CHANGE: return "PERMISSION_CHANGE";
            case ApplicationExitInfo.REASON_EXCESSIVE_RESOURCE_USAGE: return "EXCESSIVE_RESOURCE_USAGE";
            case ApplicationExitInfo.REASON_USER_REQUESTED: return "USER_REQUESTED";
            case ApplicationExitInfo.REASON_USER_STOPPED: return "USER_STOPPED";
            case ApplicationExitInfo.REASON_DEPENDENCY_DIED: return "DEPENDENCY_DIED";
            case ApplicationExitInfo.REASON_OTHER: return "OTHER";
            default: return "REASON_" + reason;
        }
    }
}
