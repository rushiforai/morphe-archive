package app.proxma.simosa;

import android.content.Context;
import android.util.Log;

import androidx.work.BackoffPolicy;
import androidx.work.Constraints;
import androidx.work.ExistingWorkPolicy;
import androidx.work.NetworkType;
import androidx.work.OneTimeWorkRequest;
import androidx.work.WorkManager;
import androidx.work.Worker;
import androidx.work.WorkerParameters;

import java.util.Calendar;
import java.util.TimeZone;
import java.util.concurrent.TimeUnit;

public final class DailyCheckinWorker extends Worker {

    private static final String TAG = "PROXMA_CLAIM";
    private static final String WORK_IMMEDIATE = "proxma_simosa_now";
    private static final String WORK_MIDNIGHT = "proxma_simosa_midnight";
    private static final int MAX_RETRIES = 6;

    public DailyCheckinWorker(Context context, WorkerParameters parameters) {
        super(context, parameters);
    }

    @Override
    public Result doWork() {
        Context context = getApplicationContext();

        // Both daily claims already done: only milestones can still be due (they have their own
        // per-level state). Notify only when that check did something, never for a bare no-op.
        boolean checkinLatched = AutoClaim.check(context, "checkin") != null;
        boolean ladderLatched = AutoClaim.check(context, "ladder") != null;
        if (checkinLatched && ladderLatched) {
            Log.i(TAG, "WORKER_NOOP both latched");
            try {
                BackgroundCheckin.doCheckIn(context);
            } catch (Throwable t) {
                Log.w(TAG, "WORKER_MILESTONE_ERR " + t);
            }
            if (MilestoneClaim.hasNews()) {
                WorkerNotify.notifyStatus(context, "Ladder: latched", "next ~00:05 PKT",
                    "Simosa daily check-in");
            }
            scheduleMidnight(context, ExistingWorkPolicy.KEEP);
            return Result.success();
        }

        boolean settled;
        try {
            settled = BackgroundCheckin.doCheckIn(context);
        } catch (Throwable t) {
            Log.w(TAG, "WORKER_ERR " + t);
            settled = false;
        }

        boolean ladderSettled = false;
        try {
            ladderSettled = LadderClaim.tryClaimLadder(context);
        } catch (Throwable t) {
            Log.w(TAG, "LADDER_ERR " + t);
        }

        if ((!settled || !ladderSettled) && getRunAttemptCount() < MAX_RETRIES) {
            Log.i(TAG, "WORKER_RETRY attempt=" + getRunAttemptCount()
                + " checkin=" + settled + " ladder=" + ladderSettled);
            if (MilestoneClaim.hasNews()) {
                WorkerNotify.notifyStatus(context, "Ladder: " + LadderClaim.getResult(), "retrying",
                    "Simosa daily check-in");
            }
            return Result.retry();
        }

        // Terminal: either settled or gave up retrying
        WorkerNotify.notifyStatus(context,
            "Ladder: " + LadderClaim.getResult(),
            "next ~00:05 PKT",
            "Simosa daily check-in");

        // Chain tomorrow's midnight run (REPLACE: this run is done, schedule fresh)
        scheduleMidnight(context, ExistingWorkPolicy.REPLACE);
        return Result.success();
    }

    /** Called from the patched {@code MainActivity.onCreate}; safe to call on every launch. */
    public static void schedule(Context context) {
        if (context == null) {
            return;
        }
        try {
            WorkManager wm = WorkManager.getInstance(context);

            // Cancel stale work names from older patch versions
            wm.cancelUniqueWork("proxma_simosa_checkin");
            wm.cancelUniqueWork("proxma_simosa_checkin_now");

            Constraints constraints = new Constraints.Builder()
                .setRequiredNetworkType(NetworkType.CONNECTED)
                .build();

            OneTimeWorkRequest immediate = new OneTimeWorkRequest.Builder(DailyCheckinWorker.class)
                .setConstraints(constraints)
                .setInitialDelay(30, TimeUnit.SECONDS)
                .setBackoffCriteria(BackoffPolicy.EXPONENTIAL, 10, TimeUnit.MINUTES)
                .build();
            wm.enqueueUniqueWork(WORK_IMMEDIATE, ExistingWorkPolicy.KEEP, immediate);

            // KEEP = don't cancel a pending midnight if user opens app at 00:04
            scheduleMidnight(context, ExistingWorkPolicy.KEEP);

            Log.i(TAG, "WORKER_SCHEDULED");
        } catch (Throwable t) {
            Log.w(TAG, "WORKER_SCHEDULE_ERR " + t);
        }
    }

    private static void scheduleMidnight(Context context, ExistingWorkPolicy policy) {
        try {
            long delayMs = msUntilNextMidnight();
            Constraints constraints = new Constraints.Builder()
                .setRequiredNetworkType(NetworkType.CONNECTED)
                .build();
            OneTimeWorkRequest midnight = new OneTimeWorkRequest.Builder(DailyCheckinWorker.class)
                .setConstraints(constraints)
                .setInitialDelay(delayMs, TimeUnit.MILLISECONDS)
                .setBackoffCriteria(BackoffPolicy.EXPONENTIAL, 10, TimeUnit.MINUTES)
                .build();
            WorkManager.getInstance(context).enqueueUniqueWork(WORK_MIDNIGHT, policy, midnight);
            Log.i(TAG, "WORKER_MIDNIGHT delay=" + (delayMs / 60000) + "min policy=" + policy);
        } catch (Throwable t) {
            Log.w(TAG, "WORKER_MIDNIGHT_ERR " + t);
        }
    }

    /** Milliseconds until next 00:05 Asia/Karachi. */
    private static long msUntilNextMidnight() {
        Calendar target = Calendar.getInstance(TimeZone.getTimeZone("Asia/Karachi"));
        target.add(Calendar.DAY_OF_YEAR, 1);
        target.set(Calendar.HOUR_OF_DAY, 0);
        target.set(Calendar.MINUTE, 5);
        target.set(Calendar.SECOND, 0);
        target.set(Calendar.MILLISECOND, 0);
        long delay = target.getTimeInMillis() - System.currentTimeMillis();
        if (delay < 60000) {
            delay += 86400000L;
        }
        return delay;
    }

}
