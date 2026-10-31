package app.morphe.extension.mapsautomotive.patches;

import android.content.Context;

import java.nio.charset.StandardCharsets;
import java.util.List;

/**
 * Native crashes (a signal in Maps' libraries or a driver) run no Java crash handler, so they leave
 * no crash file at the time. This check reads them from the crash log buffer afterwards
 * ({@link ReportLogcat}): when the main process starts, and when a report is made. Each one found
 * becomes a private crash copy (*_native.txt, not the public Documents file), counts for safe mode
 * when the main process crashed, and posts the crash notification. The buffer is lost when the head
 * unit restarts, so a native crash before a restart is not found.
 */
final class NativeCrashes {
    private static final String TAG = "MorpheReport";

    private NativeCrashes() {
    }

    /** Off the main thread. [notify]: post the crash notification (not from the report screen). */
    static void check(Context context, boolean notify) {
        synchronized (NativeCrashes.class) {
            try {
                // Read before the lock: logcat may take seconds, and the other process waits for the lock.
                List<ReportLogcat.Entry> entries = ReportLogcat.crashBuffer();
                if (entries.isEmpty()) return;
                boolean found = false, safeModeStarts = false;
                ReportStore.lock(context);
                try {
                    long checked = ReportStore.nativeChecked(context), newest = checked;
                    for (ReportLogcat.Entry entry : entries) newest = Math.max(newest, entry.time);
                    for (ReportLogcat.NativeCrash crash : ReportLogcat.nativeCrashes(entries, checked, context.getPackageName())) {
                        String name = CrashLogPatch.crashFileName(context, crash.time, "_native");
                        String text = CrashLogPatch.buildNativeCrashLog(context, crash);
                        ReportStore.saveCrash(context, name, text.getBytes(StandardCharsets.UTF_8), crash.time);
                        ReportLog.w(TAG, "native crash found in the crash log: " + crash.process + ", " + crash.signal);
                        if (crash.mainProcess) safeModeStarts |= SafeMode.recordCrashAt(context, crash.time);
                        found = true;
                    }
                    if (newest > checked) ReportStore.setNativeChecked(context, newest);
                } finally {
                    ReportStore.unlock();
                }
                if (found && notify) ReportNotice.crash(context, safeModeStarts);
            } catch (RuntimeException error) {
                ReportLog.w(TAG, "crash log not checked", error);
            }
        }
    }
}
