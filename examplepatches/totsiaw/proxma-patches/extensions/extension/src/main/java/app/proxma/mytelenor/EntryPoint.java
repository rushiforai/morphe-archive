package app.proxma.mytelenor;

import android.app.Activity;
import android.content.Context;
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
            }
        } catch (Throwable t) {
            Log.w(TAG, "ENTRY_POINT_ERR " + t);
        }
    }
}
