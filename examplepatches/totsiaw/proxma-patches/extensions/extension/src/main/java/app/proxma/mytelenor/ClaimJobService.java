package app.proxma.mytelenor;

import android.app.job.JobInfo;
import android.app.job.JobParameters;
import android.app.job.JobScheduler;
import android.app.job.JobService;
import android.content.ComponentName;
import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import java.util.Calendar;
import java.util.TimeZone;

/**
 * Platform JobScheduler instead of WorkManager: MyTelenor's R8 build renames the
 * androidx.work API (WorkManager, OneTimeWorkRequest, Constraints, ...), so any
 * extension class naming it fails with NoClassDefFoundError.
 *
 * <p>Retries are our own one-shot job with a capped backoff for the rest of the PKT day, not the
 * system backoff: a quiz that is already marked played must keep trying until the claim lands.
 */
public final class ClaimJobService extends JobService {

    private static final String TAG = "PROXMA_MT";
    private static final String PREFS = "proxma_mt_job";
    private static final String KEY_RETRY_DAY = "retry_day";
    private static final String KEY_RETRY_N = "retry_n";
    private static final String KEY_LAST_STATUS = "last_status";

    private static final int JOB_NOW = 0x50524F01;
    private static final int JOB_MIDNIGHT = 0x50524F02;
    private static final int JOB_PERIODIC = 0x50524F03;
    private static final int JOB_RETRY = 0x50524F04;

    private static final long MINUTE = 60_000L;
    private static final long HOUR = 60 * MINUTE;
    private static final long[] RETRY_DELAYS_MIN = {5, 10, 20, 40, 60};
    private static final int MAX_RETRIES_PER_DAY = 16;

    public static void schedule(Context context) {
        JobScheduler js = (JobScheduler) context.getSystemService(Context.JOB_SCHEDULER_SERVICE);
        if (js == null) return;
        if (js.getPendingJob(JOB_NOW) == null) {
            submit(js, builder(context, JOB_NOW).setMinimumLatency(30_000L));
        }
        if (js.getPendingJob(JOB_MIDNIGHT) == null) {
            scheduleMidnight(context, js);
        }
        if (js.getPendingJob(JOB_PERIODIC) == null) {
            submit(js, builder(context, JOB_PERIODIC).setPeriodic(6 * HOUR, HOUR));
        }
        Log.i(TAG, "JOBS_SCHEDULED");
    }

    private static void scheduleMidnight(Context context, JobScheduler js) {
        long delay = msUntilNextMidnight();
        submit(js, builder(context, JOB_MIDNIGHT).setMinimumLatency(delay));
        Log.i(TAG, "JOB_MIDNIGHT delay=" + (delay / MINUTE) + "min");
    }

    private static JobInfo.Builder builder(Context context, int id) {
        return new JobInfo.Builder(id, new ComponentName(context, ClaimJobService.class))
            .setRequiredNetworkType(JobInfo.NETWORK_TYPE_ANY);
    }

    private static void submit(JobScheduler js, JobInfo.Builder b) {
        try {
            js.schedule(b.setPersisted(true).build());
        } catch (Throwable persistedRejected) {
            try {
                js.schedule(b.setPersisted(false).build());
            } catch (Throwable t) {
                Log.w(TAG, "JOB_SCHEDULE_ERR " + t);
            }
        }
    }

    @Override
    public boolean onStartJob(final JobParameters params) {
        final Context context = getApplicationContext();
        new Thread(() -> {
            try {
                runClaims(context, params.getJobId());
            } catch (Throwable t) {
                Log.w(TAG, "JOB_ERR " + t);
            } finally {
                if (params.getJobId() == JOB_MIDNIGHT) {
                    JobScheduler js = (JobScheduler) context.getSystemService(Context.JOB_SCHEDULER_SERVICE);
                    if (js != null) scheduleMidnight(context, js);
                }
                jobFinished(params, false);
            }
        }, "proxma-mt-claim").start();
        return true;
    }

    @Override
    public boolean onStopJob(JobParameters params) {
        // Progress is persisted per step; the next run resumes it.
        return true;
    }

    private static synchronized void runClaims(Context context, int jobId) {
        SharedPreferences prefs = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        String day = AutoClaim.today();
        int retries = day.equals(prefs.getString(KEY_RETRY_DAY, "")) ? prefs.getInt(KEY_RETRY_N, 0) : 0;
        Log.i(TAG, "JOB_START id=" + Integer.toHexString(jobId) + " retries=" + retries);

        boolean streakDone = false;
        try {
            streakDone = StreakClaim.tryClaimStreak(context);
        } catch (Throwable t) {
            Log.w(TAG, "STREAK_ERR " + t);
        }
        boolean quizDone = false;
        try {
            quizDone = QuizClaim.tryClaimQuiz(context);
        } catch (Throwable t) {
            Log.w(TAG, "QUIZ_ERR " + t);
        }

        String streak = StreakClaim.getResult();
        String quiz = QuizClaim.getResult();
        String next = "next ~00:05 PKT";
        if (!streakDone || !quizDone) {
            long delay = retryDelay(retries);
            if (delay > 0) {
                prefs.edit().putString(KEY_RETRY_DAY, day).putInt(KEY_RETRY_N, retries + 1).apply();
                scheduleRetry(context, delay);
                Log.i(TAG, "JOB_RETRY n=" + retries + " in=" + (delay / MINUTE) + "min streak="
                    + streak + " quiz=" + quiz);
                return;
            }
            next = "gave up for today, next ~00:05 PKT";
        }

        String status = streak + "|" + quiz;
        boolean allLatched = streak.startsWith("latched") && quiz.startsWith("latched");
        if (!allLatched && !status.equals(prefs.getString(KEY_LAST_STATUS, null))) {
            WorkerNotify.notifyStatus(context, streak, quiz, next);
            prefs.edit().putString(KEY_LAST_STATUS, status).apply();
        }
        Log.i(TAG, "JOB_DONE streak=" + streak + " quiz=" + quiz);
    }

    /** Backoff for the n-th retry today, or 0 once the cap or the end of the PKT day is reached. */
    private static long retryDelay(int n) {
        if (n >= MAX_RETRIES_PER_DAY) return 0;
        long delay = RETRY_DELAYS_MIN[Math.min(n, RETRY_DELAYS_MIN.length - 1)] * MINUTE;
        Calendar now = Calendar.getInstance(TimeZone.getTimeZone("Asia/Karachi"));
        int minuteOfDay = now.get(Calendar.HOUR_OF_DAY) * 60 + now.get(Calendar.MINUTE);
        return minuteOfDay + delay / MINUTE > 23 * 60 + 45 ? 0 : delay;
    }

    private static void scheduleRetry(Context context, long delay) {
        JobScheduler js = (JobScheduler) context.getSystemService(Context.JOB_SCHEDULER_SERVICE);
        if (js == null) return;
        submit(js, builder(context, JOB_RETRY).setMinimumLatency(delay));
    }

    private static long msUntilNextMidnight() {
        Calendar now = Calendar.getInstance(TimeZone.getTimeZone("Asia/Karachi"));
        Calendar target = (Calendar) now.clone();
        target.add(Calendar.DAY_OF_YEAR, 1);
        target.set(Calendar.HOUR_OF_DAY, 0);
        target.set(Calendar.MINUTE, 5);
        target.set(Calendar.SECOND, 0);
        target.set(Calendar.MILLISECOND, 0);
        return Math.max(MINUTE, target.getTimeInMillis() - now.getTimeInMillis());
    }
}
