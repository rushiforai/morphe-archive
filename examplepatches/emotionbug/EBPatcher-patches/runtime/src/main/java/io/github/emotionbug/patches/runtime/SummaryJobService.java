package io.github.emotionbug.patches.runtime;

import android.app.Application;
import android.app.job.JobParameters;
import android.app.job.JobService;
import android.app.job.JobWorkItem;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.Uri;
import android.os.Build;
import android.os.ParcelFileDescriptor;
import android.telephony.TelephonyManager;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.function.Consumer;
import org.json.JSONObject;

/** Heavy native work never shares the phone UI or recorder process. */
public final class SummaryJobService extends JobService {
    public static final String PROCESS_SUFFIX = ":ebpatcher_summary";
    private final ExecutorService worker = Executors.newSingleThreadExecutor(runnable ->
            new Thread(() -> {
                android.os.Process.setThreadPriority(android.os.Process.THREAD_PRIORITY_BACKGROUND);
                runnable.run();
            }, "EBPatcher-summary-worker"));
    private final AtomicBoolean cancelled = new AtomicBoolean();
    private final java.util.concurrent.atomic.AtomicReference<JobParameters> running = new java.util.concurrent.atomic.AtomicReference<>();
    private final Object lifecycle = new Object();
    private boolean stopping;
    private volatile boolean gpuJob;
    private volatile boolean restartOnCpu;
    private volatile boolean active;
    private boolean registered;
    private SummaryProgressNotification notifications;
    private final BroadcastReceiver stop = new BroadcastReceiver() {
        @Override public void onReceive(Context context, Intent intent) {
            if (Intent.ACTION_SCREEN_ON.equals(intent.getAction())) {
                android.os.PowerManager power = getSystemService(android.os.PowerManager.class);
                if (active && gpuJob && (power == null || power.isInteractive())) {
                    restartOnCpu = true;
                    android.util.Log.i("EBPatcherSummary", "event=interactive_restart requested=cpu");
                    stopOwnedProcess();
                }
            } else if (TelephonyManager.ACTION_PHONE_STATE_CHANGED.equals(intent.getAction())
                    && RecorderBootstrap.readCallState(context) != StartupPermissionPolicy.CallState.IDLE) stopOwnedProcess();
        }
    };

    @Override public void onCreate() {
        super.onCreate();
        if (!(getPackageName() + PROCESS_SUFFIX).equals(Application.getProcessName()))
            throw new IllegalStateException("Inference must run in its dedicated process");
        notifications = new SummaryProgressNotification(this);
        IntentFilter filter = new IntentFilter(TelephonyManager.ACTION_PHONE_STATE_CHANGED);
        filter.addAction(Intent.ACTION_SCREEN_ON);
        if (Build.VERSION.SDK_INT >= 33) registerReceiver(stop, filter, Context.RECEIVER_EXPORTED);
        else registerReceiver(stop, filter);
        registered = true;
    }
    @Override public boolean onStartJob(JobParameters parameters) {
        synchronized (lifecycle) {
            if (active || stopping) return false;
            active = true; cancelled.set(false); restartOnCpu = false;
            running.set(parameters);
            notifications.reset();
            worker.execute(() -> process(parameters));
        }
        return true;
    }
    private void process(JobParameters parameters) {
        boolean reschedule = false, acquired = false;
        try (SummaryLock ignored = SummaryLock.acquire(this)) {
            acquired = true;
            SummaryStore store = SummaryStore.get(this);
            store.interrupted(false);
            SummaryModel gemma = SummaryModel.get(this, SummaryModel.Role.GEMMA);
            SummaryModel whisper = SummaryModel.get(this, SummaryModel.Role.WHISPER);
            JobWorkItem work;
            while (!cancelled.get() && (work = parameters.dequeueWork()) != null) {
                SummaryStore.Job job;
                while ((job = claimNext(store, whisper.ready(this))) != null) {
                    if (!gemma.ready(this)) {
                        store.state(job, "waiting", "Download verified Gemma text summaries weights in settings");
                        store.release(job); break;
                    }
                    if (RecorderBootstrap.readCallState(this) != StartupPermissionPolicy.CallState.IDLE) {
                        store.state(job, "waiting", "Waiting for an idle phone and Phone permission");
                        store.release(job); break;
                    }
                    runJob(store, gemma, whisper, job);
                }
                if (!completeWork(parameters, work)) break;
                if (!gemma.ready(this) || RecorderBootstrap.readCallState(this) != StartupPermissionPolicy.CallState.IDLE) break;
            }
        } catch (IOException | RuntimeException | LinkageError error) {
            android.util.Log.w("EBPatcherSummary", "worker_termination=" + failureCategory(error));
            // A stopping worker may still hold the lock when its replacement starts.
            reschedule = !acquired && error instanceof IOException;
        } finally {
            finishJob(parameters, reschedule || restartOnCpu);
        }
    }
    private void runJob(SummaryStore store, SummaryModel gemma, SummaryModel whisper, SummaryStore.Job job) {
        Object engine = null;
        long started = System.nanoTime();
        String operation = job.localDocument.isEmpty() ? "run" : "refine";
        String diagnostic = "job=" + job.id + " revision=" + job.revision + " operation=" + operation;
        String termination = "failed";
        android.util.Log.i("EBPatcherSummary", diagnostic + " event=start");
        SummaryProgressNotification.Session progress = notifications.begin(job);
        try {
            if (!gemma.ready(this)) throw new IOException("Gemma text summaries model is not verified. Download it in settings.");
            if (job.localDocument.isEmpty() && !whisper.ready(this))
                throw new IOException("Whisper transcription model is not verified. Download it in settings.");
            Class<?> type = SummaryModel.engine(this);
            File workspace = store.work(job);
            boolean useGpu = selectGpu();
            if (cancelled.get()) throw new CancellationException("Processing paused");
            android.util.Log.i("EBPatcherSummary", diagnostic + " requested=" + (useGpu ? "gpu" : "cpu"));
            engine = type.getConstructor(String.class, String.class, String.class, boolean.class).newInstance(
                    gemma.file(this).getPath(), job.localDocument.isEmpty() ? whisper.file(this).getPath() : "",
                    workspace.getPath(), useGpu);
            String json;
            if (!job.localDocument.isEmpty()) {
                json = (String) type.getMethod("refine", String.class, String.class, String.class,
                        AtomicBoolean.class, Consumer.class)
                        .invoke(engine, job.localDocument, job.original, job.apiDocument, cancelled, progress);
            } else {
                try (ParcelFileDescriptor audio = getContentResolver().openFileDescriptor(Uri.parse(job.audio), "r")) {
                    if (audio == null) throw new IOException("The original recording is no longer readable");
                    json = (String) type.getMethod("run", String.class, String.class, String.class,
                            AtomicBoolean.class, Consumer.class)
                            .invoke(engine, "/proc/self/fd/" + audio.getFd(), job.original, job.apiDocument, cancelled, progress);
                }
            }
            if (cancelled.get()) {
                termination = "cancelled";
                store.state(job, "waiting", "Processing paused");
                return;
            }
            JSONObject result = new JSONObject(json);
            store.complete(job, result.getString("transcript"), result.getString("summary"),
                    result.getJSONObject("local"), result.getJSONObject("selection"));
            // Completion storage still owns revision arbitration; this reports inference completion,
            // not a claim that an obsolete revision replaced a newer result.
            termination = "completed";
        } catch (Exception | LinkageError error) {
            Throwable cause = error instanceof InvocationTargetException && error.getCause() != null ? error.getCause() : error;
            boolean paused = cancelled.get() || cause instanceof CancellationException;
            termination = paused ? "cancelled" : failureCategory(cause);
            String message = cause.getMessage();
            store.state(job, paused ? "waiting" : "failed",
                    message == null ? cause.getClass().getSimpleName() : message);
        } finally {
            if ("completed".equals(termination) && !cancelled.get()) {
                try { progress.finish(); }
                catch (RuntimeException | LinkageError ignored) { progress.close(); }
            } else progress.close();
            if (engine != null) {
                try { engine.getClass().getMethod("close").invoke(engine); }
                catch (Exception | LinkageError ignored) { /* Only the isolated worker owns native resources. */ }
            }
            gpuJob = false;
            store.release(job);
            android.util.Log.i("EBPatcherSummary", diagnostic + " event=finish termination=" + termination
                    + " elapsed_ms=" + TimeUnit.NANOSECONDS.toMillis(System.nanoTime() - started));
        }
    }
    /** Publish intent before the second power read so a concurrent screen-on cannot miss GPU startup. */
    private boolean selectGpu() {
        android.os.PowerManager power = getSystemService(android.os.PowerManager.class);
        gpuJob = power != null && !power.isInteractive();
        if (gpuJob && power.isInteractive()) gpuJob = false;
        return gpuJob;
    }
    private SummaryStore.Job claimNext(SummaryStore store, boolean transcriptionReady) {
        synchronized (lifecycle) {
            return cancelled.get() || stopping ? null : store.next(transcriptionReady);
        }
    }
    private boolean completeWork(JobParameters parameters, JobWorkItem work) {
        synchronized (lifecycle) {
            if (cancelled.get() || stopping) return false;
            parameters.completeWork(work);
            return true;
        }
    }
    private void finishJob(JobParameters parameters, boolean reschedule) {
        synchronized (lifecycle) {
            if (parameters != null && running.compareAndSet(parameters, null)) {
                active = false;
                jobFinished(parameters, reschedule);
            }
        }
    }
    /** Fixed labels only: exception messages, causes and stack traces may contain private evidence. */
    private static String failureCategory(Throwable error) {
        if (error instanceof CancellationException || error instanceof InterruptedException) return "cancelled";
        if (error instanceof SecurityException) return "permission_error";
        if (error instanceof IOException) return "io_or_model_error";
        if (error instanceof LinkageError || error instanceof ReflectiveOperationException) return "engine_load_error";
        if (error instanceof org.json.JSONException) return "result_format_error";
        return "worker_error";
    }
    @Override public boolean onStopJob(JobParameters parameters) {
        synchronized (lifecycle) {
            if (!running.compareAndSet(parameters, null)) return false;
            stopOwnedProcess(); // Scheduler already owns completion of this execution.
        }
        return true;
    }
    private void stopOwnedProcess() {
        synchronized (lifecycle) {
            if (stopping) return;
            stopping = true;
            cancelled.set(true);
            if (notifications != null) notifications.shutdown();
            try { SummaryStore.get(this).interrupted(true); }
            catch (RuntimeException ignored) { /* Process isolation still takes priority. */ }
            // Preserve the unfinished work token; the replacement rechecks power state.
            if (restartOnCpu) finishJob(running.get(), true);
        }
        // JobServiceEngine posts completion to the main looper. Let that acknowledgement
        // (or onStopJob's return) reach the scheduler before terminating this process.
        if ((getPackageName() + PROCESS_SUFFIX).equals(Application.getProcessName()))
            new android.os.Handler(getMainLooper()).post(
                    () -> android.os.Process.killProcess(android.os.Process.myPid()));
    }
    @Override public void onDestroy() {
        cancelled.set(true);
        if (notifications != null) notifications.shutdown();
        if (registered) unregisterReceiver(stop);
        worker.shutdownNow();
        super.onDestroy();
    }
}
