package app.jofslash.extension.booking;

import android.app.job.JobInfo;
import android.app.job.JobScheduler;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.os.PersistableBundle;
import android.util.Log;

/**
 * Debug trigger for the Price watch: runs the daily check now, for every watched stay, without
 * waiting for an unmetered network or the once-a-day limit. The manifest entry requires
 * android.permission.DUMP, so only adb (the shell) can send it:
 *
 * <pre>adb shell am broadcast -a app.jofslash.booking.PRICE_WATCH_NOW -n
 *     com.booking/app.jofslash.extension.booking.PriceWatchReceiver [--ez test_drop true]</pre>
 *
 * A forced check always saves its price, even the same one as minutes ago, so it shows in the
 * chart. With test_drop each price is compared with one 10% higher, so a notification shows. The check
 * runs as a one-off job, so it isn't cut short like a long broadcast.
 */
public final class PriceWatchReceiver extends BroadcastReceiver {
    @Override
    public void onReceive(Context context, Intent intent) {
        if (intent == null || !PriceWatch.ACTION_CHECK_NOW.equals(intent.getAction())) return;
        boolean testDrop = intent.getBooleanExtra("test_drop", false);
        PersistableBundle extras = new PersistableBundle();
        extras.putBoolean(PriceWatchJob.EXTRA_FORCE, true);
        extras.putBoolean(PriceWatchJob.EXTRA_TEST_DROP, testDrop);
        JobScheduler scheduler = (JobScheduler) context.getSystemService(Context.JOB_SCHEDULER_SERVICE);
        int result = scheduler.schedule(new JobInfo.Builder(PriceWatch.JOB_ID + 1,
                new ComponentName(context, PriceWatchJob.class))
                .setRequiredNetworkType(JobInfo.NETWORK_TYPE_ANY)
                .setOverrideDeadline(0)
                .setExtras(extras)
                .build());
        Log.i(HotelInfo.TAG, "Price watch: check requested over adb (test_drop " + testDrop + "), result " + result);
    }
}
