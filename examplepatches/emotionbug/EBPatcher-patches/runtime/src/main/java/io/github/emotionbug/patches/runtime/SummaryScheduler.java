package io.github.emotionbug.patches.runtime;

import android.app.job.JobInfo;
import android.app.job.JobScheduler;
import android.app.job.JobWorkItem;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Original call paths only enqueue immutable metadata; all disk/IPC work is asynchronous. */
public final class SummaryScheduler {
    static final int JOB_ID = 0x4542534d;
    private static volatile Context app;
    private static volatile boolean enabled = true; // Unknown until the ordered startup read; never drop an early saved event.
    private static final ExecutorService events = Executors.newSingleThreadExecutor(runnable -> {
        Thread thread = new Thread(runnable, "EBPatcher-summary-events"); thread.setDaemon(true); return thread;
    });
    private SummaryScheduler() { }
    public static boolean enabled() { return enabled; }
    static void configurationChanged(String mode) { enabled = !SummaryStore.OFF.equals(mode); }

    static void initialize(Context context) {
        app = context.getApplicationContext();
        submit(() -> {
            if (!SummaryModel.available(app)) { enabled = false; return; }
            SummaryStore.get(app);
            AdotSummaryHooks.reconcile();
            schedule(app);
        });
    }
    /** The isolated inference process has no original Room repository or phone Application. */
    static void applyNative(long jobId) {
        SummaryStore store = SummaryStore.current();
        Context context = store == null ? app : store.context;
        if (context == null || jobId <= 0) return;
        Runnable request = () -> {
            android.os.Bundle response = context.getContentResolver().call(
                    Uri.parse("content://" + context.getPackageName() + ".ebpatcher.settings"),
                    ExtensionSettingsProvider.APPLY_SUMMARY, Long.toString(jobId), null);
            if (response == null || !response.getBoolean("requested"))
                android.util.Log.w("EBPatcherSummary", "Native summary commit request was not accepted");
        };
        if (android.os.Looper.myLooper() == android.os.Looper.getMainLooper()) {
            submit(request);
        } else {
            // Obtain the main-process acknowledgement before the worker finishes its JobService.
            try { request.run(); }
            catch (RuntimeException | LinkageError error) {
                android.util.Log.w("EBPatcherSummary", "Native summary request failed: " + error.getClass().getSimpleName());
            }
        }
    }
    public static void recording(long recordingId, Uri audio) { event(recordingId, 0, audio, false); }
    public static void quota(long recordingId, long briefingId, Uri audio) { event(recordingId, briefingId, audio, true); }
    private static void event(long recordingId, long briefingId, Uri audio, boolean quota) {
        Context context = app;
        if (context == null) return;
        submit(() -> {
            if (!SummaryModel.available(context)) return;
            SummaryStore.get(context).event(recordingId, briefingId, audio, quota, null, null);
            schedule(context);
        });
    }
    private static void submit(Runnable action) {
        try {
            events.execute(() -> {
                try { action.run(); }
                catch (RuntimeException | LinkageError error) {
                    android.util.Log.w("EBPatcherSummary", "Optional summary event failed: " + error.getClass().getSimpleName());
                }
            });
        } catch (RuntimeException | LinkageError error) {
            android.util.Log.w("EBPatcherSummary", "Unable to queue optional summary event");
        }
    }
    static void schedule(Context context) {
        SummaryStore store = SummaryStore.get(context);
        store.recoverForScheduling(context);
        configurationChanged(store.mode());
        if (SummaryStore.OFF.equals(store.mode()) || !SummaryModel.available(context)) return;
        try {
            if (!SummaryModel.get(context, SummaryModel.Role.GEMMA).ready(context)
                    || !store.pending(SummaryModel.get(context, SummaryModel.Role.WHISPER).ready(context))) return;
        } catch (java.io.IOException unavailable) { return; }
        JobScheduler scheduler = context.getSystemService(JobScheduler.class);
        if (scheduler == null) throw new IllegalStateException("Android job scheduling is unavailable");
        ComponentName service = new ComponentName(context, SummaryJobService.class);
        JobInfo existing = scheduler.getPendingJob(JOB_ID);
        if (existing != null && !service.equals(existing.getService()))
            throw new IllegalStateException("Summary job identifier is already used by the original app");
        JobInfo job = new JobInfo.Builder(JOB_ID, service).setMinimumLatency(1000)
                .setRequiresBatteryNotLow(true).setRequiresStorageNotLow(true).build();
        if (scheduler.enqueue(job, new JobWorkItem(new Intent("process-local-summary"))) != JobScheduler.RESULT_SUCCESS)
            throw new IllegalStateException("Android declined the local summary job");
    }
    static void stop(Context context) {
        JobScheduler scheduler = context.getSystemService(JobScheduler.class);
        if (scheduler != null) {
            JobInfo job = scheduler.getPendingJob(JOB_ID);
            if (job != null && new ComponentName(context, SummaryJobService.class).equals(job.getService())) scheduler.cancel(JOB_ID);
        }
    }
}
