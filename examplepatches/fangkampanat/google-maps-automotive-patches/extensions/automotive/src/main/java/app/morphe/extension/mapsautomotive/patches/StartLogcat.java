package app.morphe.extension.mapsautomotive.patches;

import android.app.ActivityManager;
import android.content.Context;
import android.os.Process;
import android.os.SystemClock;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.List;

/**
 * The main process's warning and error lines from logcat for every problem report, not only after a
 * crash: a start that never finishes (a grey map with the Maps logo) crashes nothing and need not
 * block the main thread, so neither the crash copies nor {@link MainWatchdog} keep anything of it.
 * A report includes the main process's lines read when the report is made, while it runs; otherwise
 * the lines the main process read itself 20 s and 90 s after it started, kept in a private file, so a
 * report made after Maps was closed still has them. Only the main process's own pid is read, as for
 * crash copies, so no other app's lines can be included. Logcat is lost when the head unit restarts.
 */
final class StartLogcat {
    private static final String TAG = "MorpheReport";
    private static final long[] AFTER_START_MS = {20_000, 90_000};
    private static boolean started;

    private StartLogcat() {
    }

    /** From the main process's start. */
    static synchronized void start(Context context) {
        if (started) return;
        started = true;
        long startedAt = SystemClock.uptimeMillis();
        Thread thread = new Thread(() -> {
            for (long after : AFTER_START_MS) {
                long wait = startedAt + after - SystemClock.uptimeMillis();
                if (wait > 0) {
                    try {
                        Thread.sleep(wait);
                    } catch (InterruptedException interrupted) {
                        return;
                    }
                }
                save(context, after);
            }
        }, "MorpheStartLog");
        thread.setDaemon(true);
        thread.start();
    }

    private static void save(Context context, long after) {
        try {
            ReportStore.saveStartLogcat(context, new JSONObject()
                    .put("at", System.currentTimeMillis())
                    .put("after_s", after / 1000)
                    .put("lines", array(ReportLogcat.processTail(Process.myPid(), ReportLogcat.CHECK_TIMEOUT_MS))));
        } catch (JSONException | RuntimeException error) {
            ReportLog.w(TAG, "start log not saved", error);
        }
    }

    /** The report's logs.main_logcat: the running main process's lines, else its last start's, else null. */
    static JSONObject forReport(Context context) throws JSONException {
        int pid = mainPid(context);
        if (pid > 0) {
            List<String> lines = ReportLogcat.processTail(pid, ReportLogcat.CHECK_TIMEOUT_MS);
            if (!lines.isEmpty()) {
                return new JSONObject()
                        .put("source", "running")
                        .put("at", ReportBuilder.formatUtc(System.currentTimeMillis()))
                        .put("lines", array(lines));
            }
        }
        JSONObject saved = ReportStore.startLogcat(context);
        if (saved == null) return null;
        JSONArray lines = saved.optJSONArray("lines");
        return new JSONObject()
                .put("source", "start")
                .put("at", ReportBuilder.formatUtc(saved.optLong("at")))
                .put("after_start_s", saved.optLong("after_s"))
                .put("lines", lines != null ? lines : new JSONArray());
    }

    // This process when it is the main one, else the main process when it runs, else 0.
    private static int mainPid(Context context) {
        if (!SafeMode.isReportProcess()) return Process.myPid();
        try {
            ActivityManager activities = (ActivityManager) context.getSystemService(Context.ACTIVITY_SERVICE);
            List<ActivityManager.RunningAppProcessInfo> processes = activities == null ? null : activities.getRunningAppProcesses();
            if (processes != null) {
                for (ActivityManager.RunningAppProcessInfo process : processes) {
                    if (context.getPackageName().equals(process.processName)) return process.pid;
                }
            }
        } catch (RuntimeException ignored) {
            // Not found.
        }
        return 0;
    }

    private static JSONArray array(List<String> lines) {
        JSONArray array = new JSONArray();
        for (String line : lines) array.put(line);
        return array;
    }
}
