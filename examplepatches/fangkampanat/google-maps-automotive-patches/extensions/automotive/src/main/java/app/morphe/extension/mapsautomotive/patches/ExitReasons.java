package app.morphe.extension.mapsautomotive.patches;

import android.app.ActivityManager;
import android.content.Context;
import android.os.Build;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.util.List;

/**
 * Android 11 and newer keep why this app's processes last ended (a crash, an ANR, a native crash, low
 * memory, the user, an update), with an ANR's thread dump, which an app cannot read on Android 10
 * ({@link MainWatchdog}). For newer cars such as DiLink 5 (Android Automotive 11). The Dolphin runs
 * Android 10, where the API does not exist and the report's exits are null, so this was not run on a
 * car here. Called by reflection, so the extension makes no API 30 call (the API 29 pre-install check).
 */
final class ExitReasons {
    private static final String TAG = "MorpheReport";
    private static final int MAX_EXITS = 5, TRACE_LINES = 60, REASON_ANR = 6;
    // ApplicationExitInfo.REASON_*, 0 to 16 (android-36).
    private static final String[] REASONS = {"unknown", "exit_self", "signaled", "low_memory", "crash", "crash_native",
            "anr", "initialization_failure", "permission_change", "excessive_resource_usage", "user_requested",
            "user_stopped", "dependency_died", "other", "freezer", "package_state_change", "package_updated"};

    private ExitReasons() {
    }

    /** The newest exits of this app's processes, newest first; null below Android 11 or when unreadable. */
    static JSONArray report(Context context) {
        if (Build.VERSION.SDK_INT < 30) return null;
        try {
            ActivityManager activities = (ActivityManager) context.getSystemService(Context.ACTIVITY_SERVICE);
            if (activities == null) return null;
            Method historical = ActivityManager.class.getMethod("getHistoricalProcessExitReasons", String.class, int.class, int.class);
            List<?> exits = (List<?>) historical.invoke(activities, context.getPackageName(), 0, MAX_EXITS);
            JSONArray array = new JSONArray();
            if (exits == null) return array;
            for (Object exit : exits) {
                Class<?> type = exit.getClass();
                int reason = (Integer) type.getMethod("getReason").invoke(exit);
                Object description = type.getMethod("getDescription").invoke(exit);
                JSONObject item = new JSONObject()
                        .put("at", ReportBuilder.formatUtc((Long) type.getMethod("getTimestamp").invoke(exit)))
                        .put("process", type.getMethod("getProcessName").invoke(exit))
                        .put("reason", reason >= 0 && reason < REASONS.length ? REASONS[reason] : Integer.toString(reason))
                        .put("status", type.getMethod("getStatus").invoke(exit))
                        .put("importance", type.getMethod("getImportance").invoke(exit))
                        .put("description", description != null ? description : JSONObject.NULL);
                if (reason == REASON_ANR) {
                    item.put("trace", mainThread((InputStream) type.getMethod("getTraceInputStream").invoke(exit)));
                }
                array.put(item);
            }
            return array;
        } catch (ReflectiveOperationException | JSONException | RuntimeException error) {
            ReportLog.w(TAG, "exit reasons not read", error);
            return null;
        }
    }

    // The main thread's part of an ANR thread dump: from its '"main"' line to the next empty line.
    private static JSONArray mainThread(InputStream trace) {
        JSONArray lines = new JSONArray();
        if (trace == null) return lines;
        try (BufferedReader in = new BufferedReader(new InputStreamReader(trace, StandardCharsets.UTF_8))) {
            boolean inMain = false;
            String line;
            while ((line = in.readLine()) != null && lines.length() < TRACE_LINES) {
                if (!inMain) {
                    inMain = line.startsWith("\"main\"");
                    if (!inMain) continue;
                } else if (line.trim().isEmpty()) {
                    break;
                }
                lines.put(line);
            }
        } catch (IOException | RuntimeException error) {
            ReportLog.w(TAG, "ANR trace not read", error);
        }
        return lines;
    }
}
