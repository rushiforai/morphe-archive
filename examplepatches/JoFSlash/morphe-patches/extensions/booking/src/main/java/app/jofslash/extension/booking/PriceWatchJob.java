package app.jofslash.extension.booking;

import android.app.job.JobParameters;
import android.app.job.JobService;
import android.util.Log;

/**
 * The daily price check of the Price watch patch. Android runs it once a day on an unmetered
 * network with the battery not low; it is declared in the manifest by the patch.
 */
public final class PriceWatchJob extends JobService {
    /** Extras of the one-off job the debug broadcast starts. */
    static final String EXTRA_FORCE = "force", EXTRA_TEST_DROP = "test_drop";

    private volatile boolean stopped;

    @Override
    public boolean onStartJob(final JobParameters params) {
        stopped = false;
        final boolean force = params.getExtras().getBoolean(EXTRA_FORCE, false);
        final boolean testDrop = params.getExtras().getBoolean(EXTRA_TEST_DROP, false);
        new Thread(() -> {
            boolean ok = true;
            try {
                ok = PriceWatch.check(getApplicationContext(), force, testDrop, () -> stopped);
            } catch (Throwable t) {
                Log.w(HotelInfo.TAG, "Price watch: check failed", t);
            }
            // A periodic job runs again in a day anyway; only ask for a retry when the app
            // wasn't ready yet.
            jobFinished(params, !ok && !force);
        }, "jofslash-price-watch").start();
        return true;
    }

    @Override
    public boolean onStopJob(JobParameters params) {
        stopped = true;
        return true;
    }
}
