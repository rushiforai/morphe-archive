package app.proxma.mytelenor;

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

public final class DailyWorker extends Worker {

    private static final String TAG = "PROXMA_MT";
    private static final String WORK_IMMEDIATE = "proxma_mt_now";
    private static final String WORK_MIDNIGHT = "proxma_mt_midnight";
    private static final int MAX_RETRIES = 6;

    public DailyWorker(Context context, WorkerParameters parameters) {
        super(context, parameters);
    }

    @Override
    public Result doWork() {
        Context context = getApplicationContext();
        Log.i(TAG, "WORKER_START attempt=" + getRunAttemptCount());

        boolean streakOk = false;
        try {
            streakOk = StreakClaim.tryClaimStreak(context);
        } catch (Throwable t) {
            Log.w(TAG, "STREAK_ERR " + t);
        }

        boolean quizOk = false;
        try {
            quizOk = QuizClaim.tryClaimQuiz(context);
        } catch (Throwable t) {
            Log.w(TAG, "QUIZ_ERR " + t);
        }

        if ((!streakOk || !quizOk) && getRunAttemptCount() < MAX_RETRIES) {
            Log.i(TAG, "WORKER_RETRY attempt=" + getRunAttemptCount()
                + " streak=" + streakOk + " quiz=" + quizOk);
            return Result.retry();
        }

        WorkerNotify.notifyStatus(context,
            StreakClaim.getResult(),
            QuizClaim.getResult(),
            "next ~00:05 PKT");

        scheduleMidnight(context, ExistingWorkPolicy.REPLACE);
        Log.i(TAG, "WORKER_DONE streak=" + StreakClaim.getResult() + " quiz=" + QuizClaim.getResult());
        return Result.success();
    }

    public static void schedule(Context context) {
        if (context == null) return;
        try {
            WorkManager wm = WorkManager.getInstance(context);

            Constraints constraints = new Constraints.Builder()
                .setRequiredNetworkType(NetworkType.CONNECTED)
                .build();

            OneTimeWorkRequest immediate = new OneTimeWorkRequest.Builder(DailyWorker.class)
                .setConstraints(constraints)
                .setInitialDelay(30, TimeUnit.SECONDS)
                .setBackoffCriteria(BackoffPolicy.EXPONENTIAL, 10, TimeUnit.MINUTES)
                .build();
            wm.enqueueUniqueWork(WORK_IMMEDIATE, ExistingWorkPolicy.KEEP, immediate);

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
            OneTimeWorkRequest midnight = new OneTimeWorkRequest.Builder(DailyWorker.class)
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
