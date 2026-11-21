package app.proxma.rox;

import android.app.Activity;
import android.app.job.JobInfo;
import android.app.job.JobParameters;
import android.app.job.JobScheduler;
import android.app.job.JobService;
import android.content.ComponentName;
import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.util.SparseArray;

import java.util.Calendar;
import java.util.Random;
import java.util.TimeZone;

/**
 * Runs the daily check-in without opening ROX. A one-off job is planned for shortly after the ROX
 * day starts (midnight, Pakistan time); when it runs and today's check-in is not done yet, it
 * starts the app's Flutter code off-screen and presses Check-in there (see AutoCheckin). After a
 * miss it tries again two hours later, up to three times a day, then plans tomorrow. Once today is
 * done, from the background or from an app open, the next job is tomorrow, so ROX is woken at
 * most a few times a day instead of every few hours. The job survives reboots; force-stopping ROX
 * cancels it until ROX is opened again.
 */
public final class CheckinJobService extends JobService {

    private static final String TAG = "PROXMA_ROX";
    private static final int JOB_ID = 0x52_4f_58_01;
    // A second id for the run the wake-up alarm asks for, so it never replaces the planned job.
    private static final int NOW_JOB_ID = 0x52_4f_58_02;
    static final String KEY_PLANNED_AT = "bg_planned_at";
    private static final long MINUTE = 60L * 1000L;
    private static final long FIRST_DELAY_MS = 20L * MINUTE;
    private static final long RETRY_DELAY_MS = 120L * MINUTE;
    private static final long UNLOCK_POLL_MS = 30L * MINUTE;
    private static final long DAY_START_OFFSET_MS = 15L * MINUTE;
    private static final int DAY_START_SPREAD_MIN = 45;

    // A run that finds the screen on but the lock screen still up waits this long for the unlock.
    // The unlock listener can't be relied on for this: it dies with the process (the idle close
    // ends it a few minutes after each run) and Android 14+ holds its broadcast back while ROX is
    // in the background. While this job runs ROX is active, so it simply looks every 2 seconds.
    private static final long HOLD_MAX_MS = 90_000L;
    private static final long HOLD_POLL_MS = 2_000L;
    private static final long HOLD_SETTLE_MS = 1_500L;

    private static Boolean sDeclared;

    private final Handler handler = new Handler(Looper.getMainLooper());
    // Runs waiting for the unlock, by job id; the planned job and the alarm's run can overlap.
    private final SparseArray<Runnable> holds = new SparseArray<>();

    public static void onActivityCreate(Activity activity) {
        try {
            if (activity == null) return;
            ensurePlanned(activity.getApplicationContext());
        } catch (Throwable t) {
            Log.w(TAG, "BGJOB_ENTRY_ERR " + t);
        }
    }

    /** True when the background patch added this service to the manifest. */
    static boolean declared(Context context) {
        if (sDeclared != null) return sDeclared;
        try {
            context.getPackageManager().getServiceInfo(
                new ComponentName(context, CheckinJobService.class), 0);
            sDeclared = true;
        } catch (PackageManager.NameNotFoundException e) {
            sDeclared = false;
        } catch (Throwable t) {
            return false;
        }
        return sDeclared;
    }

    /** On app open: keep a planned one-off job, replace the old every-3-hours job or plan one. */
    private static void ensurePlanned(Context context) {
        JobScheduler scheduler = scheduler(context);
        if (scheduler == null) return;
        JobInfo pending = scheduler.getPendingJob(JOB_ID);
        if (pending != null && !pending.isPeriodic()) {
            long at = AutoCheckin.prefs(context).getLong(KEY_PLANNED_AT, 0L);
            Log.i(TAG, "BGJOB already planned for " + AutoCheckin.clock(at));
            // Builds before the wake-up alarm planned only the job; add the alarm for the same time.
            if (at > System.currentTimeMillis()
                && AutoCheckin.prefs(context).getLong(CheckinAlarm.KEY_ALARM_SET_AT, 0L) != at) {
                CheckinAlarm.set(context, at);
            }
            return;
        }
        if (pending != null) Log.i(TAG, "BGJOB replacing the old repeating job");
        planNext(context);
    }

    /** Plans the next run from today's state: tomorrow when done, else soon or after a retry gap. */
    static void planNext(Context context) {
        try {
            if (!declared(context)) return;
            long delay;
            String why;
            if (AutoCheckin.doneToday(context)) {
                delay = untilTomorrow();
                why = "done today";
            } else if (AutoCheckin.signedOutToday(context)) {
                delay = untilTomorrow();
                why = "signed out";
            } else {
                int tries = AutoCheckin.backgroundTriesToday(context);
                if (WakeScreen.waitingForUnlock(context) && tries < AutoCheckin.MAX_BG_TRIES_PER_DAY) {
                    // Locked phone: look again soon, so the check-in follows the unlock closely
                    // even when the unlock listener died with the process. These looks use no try.
                    delay = Math.min(UNLOCK_POLL_MS, untilTomorrow());
                    why = "waiting for the phone to be unlocked, earlier tries " + tries;
                } else if (tries >= AutoCheckin.MAX_BG_TRIES_PER_DAY) {
                    delay = untilTomorrow();
                    why = "tries used up";
                } else {
                    delay = tries == 0 ? FIRST_DELAY_MS : RETRY_DELAY_MS;
                    // A retry must not cross into the next day's first run.
                    delay = Math.min(delay, untilTomorrow());
                    why = "not done yet, earlier tries " + tries;
                }
            }
            schedule(context, delay, why);
        } catch (Throwable t) {
            Log.w(TAG, "BGJOB_PLAN_ERR " + t);
        }
    }

    private static long untilTomorrow() {
        Calendar next = Calendar.getInstance(TimeZone.getTimeZone("Asia/Karachi"));
        next.add(Calendar.DAY_OF_YEAR, 1);
        next.set(Calendar.HOUR_OF_DAY, 0);
        next.set(Calendar.MINUTE, 0);
        next.set(Calendar.SECOND, 0);
        next.set(Calendar.MILLISECOND, 0);
        long spread = new Random().nextInt(DAY_START_SPREAD_MIN) * MINUTE;
        return Math.max(MINUTE, next.getTimeInMillis() - System.currentTimeMillis() + DAY_START_OFFSET_MS + spread);
    }

    private static JobScheduler scheduler(Context context) {
        JobScheduler scheduler = (JobScheduler) context.getSystemService(Context.JOB_SCHEDULER_SERVICE);
        if (scheduler == null) Log.w(TAG, "BGJOB no job scheduler");
        return scheduler;
    }

    private static void schedule(Context context, long delayMs, String why) {
        JobScheduler scheduler = scheduler(context);
        if (scheduler == null) return;
        JobInfo info = new JobInfo.Builder(JOB_ID, new ComponentName(context, CheckinJobService.class))
            .setMinimumLatency(delayMs)
            .setRequiredNetworkType(JobInfo.NETWORK_TYPE_ANY)
            .setRequiresBatteryNotLow(true)
            .setPersisted(true)
            .build();
        int result = scheduler.schedule(info);
        long at = System.currentTimeMillis() + delayMs;
        if (result == JobScheduler.RESULT_SUCCESS) {
            AutoCheckin.prefs(context).edit().putLong(KEY_PLANNED_AT, at).apply();
            Log.i(TAG, "BGJOB planned for " + AutoCheckin.clock(at) + " (" + why + ")");
        } else {
            Log.w(TAG, "BGJOB plan failed " + result + " (" + why + ")");
        }
        // Doze holds the job back at night; the alarm fires on time and starts a run itself.
        // Whichever comes first does the check-in, the other then finds nothing to do.
        CheckinAlarm.set(context, at);
    }

    /** From the wake-up alarm: run now as an expedited job, which Doze does not hold back. */
    static void runNow(Context context) {
        JobScheduler scheduler = scheduler(context);
        if (scheduler == null) return;
        ComponentName service = new ComponentName(context, CheckinJobService.class);
        int result = JobScheduler.RESULT_FAILURE;
        try {
            result = scheduler.schedule(new JobInfo.Builder(NOW_JOB_ID, service)
                .setExpedited(true)
                .setRequiredNetworkType(JobInfo.NETWORK_TYPE_ANY)
                .build());
        } catch (Throwable t) {
            Log.w(TAG, "BGJOB expedited not accepted " + t);
        }
        if (result == JobScheduler.RESULT_SUCCESS) {
            Log.i(TAG, "BGJOB expedited run asked for");
            return;
        }
        // Out of expedited quota: a plain job with no delay, which runs at the next chance.
        try {
            result = scheduler.schedule(new JobInfo.Builder(NOW_JOB_ID, service)
                .setRequiredNetworkType(JobInfo.NETWORK_TYPE_ANY)
                .build());
            Log.i(TAG, "BGJOB plain run asked for, result " + result);
        } catch (Throwable t) {
            Log.w(TAG, "BGJOB_NOW_ERR " + t);
        }
    }

    @Override public boolean onStartJob(final JobParameters params) {
        Log.i(TAG, "BGJOB start, " + (params.getJobId() == NOW_JOB_ID ? "from the wake-up alarm" : "planned run")
            + (Build.VERSION.SDK_INT >= 31 && params.isExpeditedJob() ? ", expedited" : ""));
        final Context context = getApplicationContext();
        try {
            if (shouldHold(context)) {
                hold(params, context);
                return true;
            }
        } catch (Throwable t) {
            Log.w(TAG, "BGJOB_HOLD_ERR " + t);
        }
        return begin(params, context, false);
    }

    /**
     * The phone's screen is on but locked, nothing can open ROX over the lock screen, and today's
     * check-in is still to do: the user is most likely unlocking it right now (a run held back by
     * Doze is let go as soon as the screen turns on, before the unlock).
     */
    private static boolean shouldHold(Context context) {
        return WakeScreen.screenOnButLocked(context)
            && WakeScreen.shouldWaitForUnlock(context)
            && !AutoCheckin.doneToday(context)
            && !AutoCheckin.signedOutToday(context)
            && AutoCheckin.backgroundTriesToday(context) < AutoCheckin.MAX_BG_TRIES_PER_DAY;
    }

    private void hold(final JobParameters params, final Context context) {
        final int id = params.getJobId();
        final long until = SystemClock.elapsedRealtime() + HOLD_MAX_MS;
        Log.i(TAG, "BGJOB screen on but locked, waiting up to " + (HOLD_MAX_MS / 1000L) + "s for the unlock");
        Runnable check = new Runnable() {
            @Override public void run() {
                if (holds.get(id) != this) return;
                try {
                    if (!WakeScreen.lockedOrDark(context)) {
                        Log.i(TAG, "BGJOB phone unlocked during the wait, checking in in " + HOLD_SETTLE_MS + " ms");
                        // Settle first: the launcher is still animating in right after the unlock.
                        final Runnable self = this;
                        handler.postDelayed(new Runnable() {
                            @Override public void run() {
                                if (holds.get(id) != self) return;
                                holds.remove(id);
                                begin(params, context, true);
                            }
                        }, HOLD_SETTLE_MS);
                        return;
                    }
                    if (!WakeScreen.screenOnButLocked(context)) {
                        Log.i(TAG, "BGJOB screen went off while locked, waiting for the next unlock");
                    } else if (SystemClock.elapsedRealtime() >= until) {
                        Log.i(TAG, "BGJOB still locked after " + (HOLD_MAX_MS / 1000L) + "s, waiting for the next unlock");
                    } else {
                        handler.postDelayed(this, HOLD_POLL_MS);
                        return;
                    }
                } catch (Throwable t) {
                    Log.w(TAG, "BGJOB_HOLD_CHECK_ERR " + t);
                }
                holds.remove(id);
                // Still locked: the normal path records the wait and plans the next look.
                begin(params, context, true);
            }
        };
        holds.put(id, check);
        handler.postDelayed(check, HOLD_POLL_MS);
    }

    /**
     * Starts the check-in. [held] is true when onStartJob already returned true for this run, so
     * the job must be finished here when nothing starts.
     */
    private boolean begin(final JobParameters params, final Context context, final boolean held) {
        try {
            boolean started = AutoCheckin.startBackground(this, new Runnable() {
                @Override public void run() {
                    Log.i(TAG, "BGJOB finished");
                    try {
                        jobFinished(params, false);
                    } catch (Throwable t) {
                        Log.w(TAG, "BGJOB_FINISH_ERR " + t);
                    }
                    // Same job id: plan only after this run is finished, or it would be stopped.
                    planNext(context);
                }
            });
            if (!started) {
                Log.i(TAG, "BGJOB nothing to do" + (held ? " after the wait" : ""));
                if (held) finish(params);
                handler.post(new Runnable() {
                    @Override public void run() {
                        planNext(context);
                    }
                });
            }
            return started;
        } catch (Throwable t) {
            Log.w(TAG, "BGJOB_START_ERR " + t);
            if (held) finish(params);
            handler.post(new Runnable() {
                @Override public void run() {
                    planNext(context);
                }
            });
            return false;
        }
    }

    private void finish(JobParameters params) {
        try {
            jobFinished(params, false);
        } catch (Throwable t) {
            Log.w(TAG, "BGJOB_FINISH_ERR " + t);
        }
    }

    @Override public boolean onStopJob(JobParameters params) {
        final int id = params.getJobId();
        if (holds.get(id) != null) {
            holds.remove(id);
            Log.i(TAG, "BGJOB stopped by the system while waiting for the unlock");
            final Context context = getApplicationContext();
            handler.post(new Runnable() {
                @Override public void run() {
                    planNext(context);
                }
            });
            return false;
        }
        Log.i(TAG, "BGJOB stopped by the system");
        handler.post(new Runnable() {
            @Override public void run() {
                AutoCheckin.stopBackground("job stopped by the system");
            }
        });
        // Ending the session plans the next run itself, so the system must not retry this one.
        return false;
    }
}
