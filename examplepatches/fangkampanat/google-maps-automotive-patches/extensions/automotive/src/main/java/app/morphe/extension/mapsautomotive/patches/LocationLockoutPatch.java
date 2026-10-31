package app.morphe.extension.mapsautomotive.patches;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.location.LocationManager;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;

/**
 * Holds back Maps' location lockout ("Turn on location for a better driving experience") during
 * brief location-off flips.
 * <p>
 * BYD's GPS watchdog (com.byd.gpsinfo, a system app) turns location off and on again within about
 * 70 ms whenever it sees no satellites, every 7–77 s while the car is parked under a roof. Maps'
 * lockout controller recomputes on each PROVIDERS_CHANGED or MODE_CHANGED broadcast, so its lockout
 * screen flashed. Its receiver asks {@link #deferLocationChange} first: while location has
 * been off for less than 3 s the broadcast is held back and delivered again when the 3 s are up, so a
 * real "off" still shows the lockout, 3 s later. Reads the location setting only; changes nothing.
 */
@SuppressWarnings("unused")
public final class LocationLockoutPatch {
    private static final String TAG = "MorpheLocationLockout";
    private static final long GRACE_MS = 3000;
    // Main thread only: Maps registers the receiver without a handler.
    private static long disabledSince = -1;
    private static boolean redeliveryPending;
    private static int flips;
    private static Handler main;

    private LocationLockoutPatch() {
    }

    /**
     * Injection point: start of the lockout controller's receiver. Returns true when Maps should not
     * handle this broadcast now; it is delivered again after the remaining grace time.
     */
    public static boolean deferLocationChange(BroadcastReceiver receiver, Context context, Intent intent) {
        try {
            if (!SafeMode.on(context, SafeMode.LOCATION_LOCKOUT_DELAY)) return false;
            LocationManager locations = (LocationManager) context.getSystemService(Context.LOCATION_SERVICE);
            if (locations == null) return false;
            long now = SystemClock.elapsedRealtime();
            if (locations.isLocationEnabled()) {
                if (disabledSince >= 0) {
                    flips++;
                    ReportLog.i(TAG, "location back after " + (now - disabledSince) + " ms, lockout not shown (flip " + flips + ")");
                    disabledSince = -1;
                }
                return false;
            }
            if (disabledSince < 0) disabledSince = now;
            long off = now - disabledSince;
            if (off >= GRACE_MS) {
                ReportLog.i(TAG, "location off for " + off + " ms, Maps shows its lockout");
                return false;
            }
            if (!redeliveryPending) {
                redeliveryPending = true;
                if (main == null) main = new Handler(Looper.getMainLooper());
                // A little past the grace time, so the next call sees it as elapsed.
                main.postDelayed(() -> {
                    redeliveryPending = false;
                    receiver.onReceive(context, intent);
                }, GRACE_MS - off + 20);
            }
            return true;
        } catch (Throwable error) {
            ReportLog.w(TAG, "location change not held back", error);
            return false;
        }
    }
}
