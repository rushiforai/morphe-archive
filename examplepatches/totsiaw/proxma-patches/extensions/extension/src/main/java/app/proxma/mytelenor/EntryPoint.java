package app.proxma.mytelenor;

import android.app.Activity;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

public final class EntryPoint {

    private static final String TAG = "PROXMA_MT";
    private static volatile boolean sScheduled = false;

    private EntryPoint() {}

    public static void onActivityCreate(Activity activity) {
        try {
            if (activity == null) return;
            Log.i(TAG, "ENTRY_POINT onActivityCreate");
            Context context = activity.getApplicationContext();
            if (!sScheduled) {
                sScheduled = true;
                ClaimJobService.schedule(context);
                // Same 30 s head start the job gets, so the app has loaded the session first. A
                // foreground service keeps ColorOS from cutting the run off; if the app has left the
                // foreground by then the start is refused and the queued job does the work.
                new Handler(Looper.getMainLooper()).postDelayed(() -> {
                    if (AutoClaim.check(context, "streak") == null || AutoClaim.check(context, "quiz") == null) {
                        ClaimService.start(context, "open");
                    }
                }, 30_000L);
            }
        } catch (Throwable t) {
            Log.w(TAG, "ENTRY_POINT_ERR " + t);
        }
    }
}
