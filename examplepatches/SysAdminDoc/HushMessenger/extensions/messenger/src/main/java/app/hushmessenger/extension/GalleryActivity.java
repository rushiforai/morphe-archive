package app.hushmessenger.extension;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.widget.Toast;
import java.lang.ref.WeakReference;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.Executor;
import java.util.concurrent.FutureTask;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * The pick screen the chat's gallery button starts with the switch on. It opens the phone's gallery app and hands what
 * the person picks back to the chat. Not exported, and it draws nothing: the gallery app is the only screen they see.
 */
public final class GalleryActivity extends Activity {
    private static final int PICK = 1;
    static final long RESULT_TIMEOUT_MILLIS = 30_000;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    /** A blocked provider holds its slot until it returns; a timeout never creates another worker. */
    static Executor work = new ThreadPoolExecutor(1, 1, 10, TimeUnit.SECONDS, new ArrayBlockingQueue<>(1), task -> {
        Thread thread = new Thread(task, "HushGalleryResult");
        thread.setDaemon(true);
        return thread;
    });
    private ResultJob job;
    private boolean retained;

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        Object previous = getLastNonConfigurationInstance();
        if (previous instanceof ResultJob) {
            job = (ResultJob) previous;
            job.attach(this);
            return;
        }
        if (state != null && state.getBoolean("reading")) {
            give("gallery_failed", GalleryPicker.Outcome.RESULT_INVALID);
            return;
        }
        // Android stopped Messenger while the gallery app was open. The gallery's answer still comes back here.
        if (state != null) return;
        try {
            Intent pick = GalleryPicker.pickIntent(this);
            if (pick == null) {
                give("gallery_missing", GalleryPicker.Outcome.PICKER_MISSING);
                return;
            }
            startActivityForResult(pick, PICK);
        } catch (ActivityNotFoundException error) {
            give("gallery_missing", GalleryPicker.Outcome.PICKER_MISSING);
        } catch (RuntimeException error) {
            Settings.hookFailedPrivately(GalleryPicker.KEY, "Can't open your gallery app", error);
            give("gallery_failed", GalleryPicker.Outcome.LAUNCH_FAILED);
        }
    }

    @Override protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode != PICK || job != null || isFinishing()) return;
        if (resultCode != RESULT_OK) {
            complete(null, GalleryPicker.Outcome.CANCELED);
            return;
        }
        job = new ResultJob(getApplicationContext(), data);
        job.attach(this);
        job.start();
    }

    @Override protected void onSaveInstanceState(Bundle state) {
        super.onSaveInstanceState(state);
        state.putBoolean("reading", job != null);
    }

    @Override public Object onRetainNonConfigurationInstance() {
        retained = true;
        if (job != null) job.owner.clear();
        return job;
    }

    @Override protected void onDestroy() {
        if (job != null) {
            if (job.owner.get() == this) job.owner.clear();
            if (!retained && !isChangingConfigurations()) job.cancel();
        }
        super.onDestroy();
    }

    private void complete(Intent picked, GalleryPicker.Outcome outcome) {
        if (isDestroyed() || isFinishing()) return;
        GalleryPicker.lastOutcome = outcome;
        if (picked == null && outcome != GalleryPicker.Outcome.CANCELED)
            Toast.makeText(this, new SettingsText(this).get("gallery_failed"), Toast.LENGTH_LONG).show();
        if (picked != null) setResult(RESULT_OK, picked);
        else setResult(RESULT_CANCELED);
        finish();
    }

    /** Ends with nothing picked, so the chat stays as it was. */
    private void give(String message, GalleryPicker.Outcome outcome) {
        GalleryPicker.lastOutcome = outcome;
        Toast.makeText(this, new SettingsText(this).get(message), Toast.LENGTH_LONG).show();
        setResult(RESULT_CANCELED);
        finish();
    }

    /** Holds application context and the current result, and reattaches across configuration changes. */
    private static final class ResultJob {
        private WeakReference<GalleryActivity> owner = new WeakReference<>(null);
        private final Context context;
        private Intent data, result;
        private boolean finished, canceled;
        private GalleryPicker.Outcome outcome;
        private FutureTask<Void> task;
        private final Runnable timeout = () -> {
            finish(null, GalleryPicker.Outcome.RESULT_TIMEOUT);
            if (task != null) task.cancel(true);
        };

        ResultJob(Context context, Intent data) { this.context = context; this.data = data; }

        void attach(GalleryActivity activity) {
            owner = new WeakReference<>(activity);
            if (finished && !canceled) activity.complete(result, outcome);
        }

        void start() {
            MAIN.postDelayed(timeout, RESULT_TIMEOUT_MILLIS);
            task = new FutureTask<>(() -> {
                Intent picked = null;
                GalleryPicker.Outcome status = GalleryPicker.Outcome.RESULT_INVALID;
                try {
                    picked = GalleryPicker.handBack(context, data);
                    if (picked != null) {
                        GalleryPicker.requireReadable(context, picked);
                        status = GalleryPicker.Outcome.SELECTED;
                    }
                } catch (SecurityException revoked) {
                    picked = null;
                    status = GalleryPicker.Outcome.RESULT_REVOKED;
                } catch (java.io.IOException | RuntimeException failed) {
                    picked = null;
                } finally {
                    data = null;
                }
                Intent answer = picked;
                GalleryPicker.Outcome category = status;
                Runnable deliver = () -> finish(answer, category);
                if (Looper.myLooper() == Looper.getMainLooper()) deliver.run();
                else MAIN.post(deliver);
                return null;
            });
            try { work.execute(task); }
            catch (RejectedExecutionException busy) { finish(null, GalleryPicker.Outcome.RESULT_BUSY); }
        }

        void finish(Intent picked, GalleryPicker.Outcome status) {
            if (finished || canceled) return;
            finished = true;
            MAIN.removeCallbacks(timeout);
            data = null;
            result = picked;
            outcome = status;
            GalleryActivity activity = owner.get();
            if (activity != null) activity.complete(result, outcome);
        }

        void cancel() {
            canceled = true;
            MAIN.removeCallbacks(timeout);
            if (task != null) task.cancel(true);
            owner.clear();
            data = null;
            result = null;
        }
    }
}
