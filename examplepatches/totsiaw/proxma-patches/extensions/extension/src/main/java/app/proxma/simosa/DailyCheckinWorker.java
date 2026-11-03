package app.proxma.simosa;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.content.Context;
import android.content.pm.ServiceInfo;
import android.os.Build;
import android.util.Log;

import androidx.work.BackoffPolicy;
import androidx.work.Constraints;
import androidx.work.ExistingWorkPolicy;
import androidx.work.ForegroundInfo;
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
    private static final String TAG_FOLLOWUP = "proxma_simosa_followup";
    private static final long FOLLOWUP_DELAY_MIN = 15;
    private static final int MAX_RETRIES = 6;
    private static final String FGS_CHANNEL_ID = "proxma_fgs";
    private static final int FGS_NOTIF_ID = 1004;
    private static final Object RUN_LOCK = new Object();

    public DailyCheckinWorker(Context context, WorkerParameters parameters) {
        super(context, parameters);
    }

    @Override
    public Result doWork() {
        // A stopped app's retry and its fresh run start together when it is reopened. Claiming at the
        // same time gets one refused by the server, so the second run waits and then finds the latch.
        synchronized (RUN_LOCK) {
            return runClaims();
        }
    }

    private Result runClaims() {
        Context context = getApplicationContext();
        Trace.init(context);
        WorkerNotify.log("WORKER_START attempt=" + getRunAttemptCount());
        goForeground(context);
        AppAuth.primeLogin(context);

        // Both daily claims already done: only milestones can still be due (they have their own
        // per-level state). Notify only when that check did something, never for a bare no-op.
        boolean checkinLatched = AutoClaim.check(context, "checkin") != null;
        boolean ladderLatched = AutoClaim.check(context, "ladder") != null;
        if (checkinLatched && ladderLatched) {
            WorkerNotify.log("WORKER_NOOP both latched");
            try {
                BackgroundCheckin.doCheckIn(context);
            } catch (Throwable t) {
                WorkerNotify.log("WORKER_MILESTONE_ERR " + t);
            }
            scheduleFollowUpIfWanted(context);
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
            WorkerNotify.log("WORKER_ERR " + t);
            settled = false;
        }

        boolean ladderSettled = false;
        try {
            ladderSettled = LadderClaim.tryClaimLadder(context);
        } catch (Throwable t) {
            WorkerNotify.log("LADDER_ERR " + t);
        }

        if ((!settled || !ladderSettled) && getRunAttemptCount() < MAX_RETRIES) {
            WorkerNotify.log("WORKER_RETRY attempt=" + getRunAttemptCount()
                + " checkin=" + settled + " ladder=" + ladderSettled);
            // Always post on retry: ColorOS hides this app's logcat, so the notification is the
            // only place a failed run's reason (Checkin:/Ladder: lines) can be read afterwards.
            WorkerNotify.notifyStatus(context, "Ladder: " + LadderClaim.getResult(),
                "retry " + (getRunAttemptCount() + 1) + "/" + MAX_RETRIES,
                "Simosa daily check-in");
            return Result.retry();
        }

        // Terminal: either settled or gave up retrying
        WorkerNotify.notifyStatus(context,
            "Ladder: " + LadderClaim.getResult(),
            "next ~00:05 PKT",
            "Simosa daily check-in");

        scheduleFollowUpIfWanted(context);

        // Chain tomorrow's midnight run (REPLACE: this run is done, schedule fresh)
        scheduleMidnight(context, ExistingWorkPolicy.REPLACE);
        return Result.success();
    }

    /**
     * Run the claim inside a short dataSync foreground service. ColorOS stops a plain background
     * job a few seconds in, so a multi-request run (check-in, ladder, milestone) is cut mid-flow
     * and only finishes on a later retry. Starting from the background needs an exemption (the
     * app's battery set to "Allow background activity"); a refused start throws here or inside
     * WorkManager's SystemForegroundService, which catches it, and the run continues as before.
     */
    private void goForeground(Context context) {
        try {
            NotificationManager nm = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
            if (nm == null || Build.VERSION.SDK_INT < 29) {
                return;
            }
            int icon = context.getApplicationInfo().icon;
            if (icon == 0) {
                return;
            }
            NotificationChannel channel = new NotificationChannel(FGS_CHANNEL_ID, "Background claims",
                NotificationManager.IMPORTANCE_LOW);
            channel.setDescription("Shown while the daily check-in runs");
            nm.createNotificationChannel(channel);
            Notification notification = new Notification.Builder(context, FGS_CHANNEL_ID)
                .setSmallIcon(icon)
                .setContentTitle("Claiming daily rewards\u2026")
                .setOngoing(true)
                .build();
            setForegroundAsync(new ForegroundInfo(FGS_NOTIF_ID, notification,
                ServiceInfo.FOREGROUND_SERVICE_TYPE_DATA_SYNC)).get(10, TimeUnit.SECONDS);
            WorkerNotify.log("WORKER_FGS started");
        } catch (Throwable t) {
            WorkerNotify.log("WORKER_FGS_REFUSED " + t);
        }
    }

    /** Called from the patched {@code MainActivity.onCreate}; safe to call on every launch. */
    public static void schedule(Context context) {
        Trace.init(context);
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

            WorkerNotify.log("WORKER_SCHEDULED");
        } catch (Throwable t) {
            WorkerNotify.log("WORKER_SCHEDULE_ERR " + t);
        }
    }

    /**
     * One more run in a few minutes when the milestone level-up may not have reached
     * {@code checkin/state} yet. Not unique work: a follow-up schedules the next while it is still
     * running, and MilestoneClaim caps them per day.
     */
    private static void scheduleFollowUpIfWanted(Context context) {
        try {
            if (!MilestoneClaim.wantsFollowUp(context)) {
                return;
            }
            Constraints constraints = new Constraints.Builder()
                .setRequiredNetworkType(NetworkType.CONNECTED)
                .build();
            OneTimeWorkRequest followUp = new OneTimeWorkRequest.Builder(DailyCheckinWorker.class)
                .setConstraints(constraints)
                .setInitialDelay(FOLLOWUP_DELAY_MIN, TimeUnit.MINUTES)
                .setBackoffCriteria(BackoffPolicy.EXPONENTIAL, 10, TimeUnit.MINUTES)
                .addTag(TAG_FOLLOWUP)
                .build();
            WorkManager.getInstance(context).enqueue(followUp);
            WorkerNotify.log("WORKER_FOLLOWUP delay=" + FOLLOWUP_DELAY_MIN + "min");
        } catch (Throwable t) {
            WorkerNotify.log("WORKER_FOLLOWUP_ERR " + t);
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
            WorkerNotify.log("WORKER_MIDNIGHT delay=" + (delayMs / 60000) + "min policy=" + policy);
        } catch (Throwable t) {
            WorkerNotify.log("WORKER_MIDNIGHT_ERR " + t);
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
