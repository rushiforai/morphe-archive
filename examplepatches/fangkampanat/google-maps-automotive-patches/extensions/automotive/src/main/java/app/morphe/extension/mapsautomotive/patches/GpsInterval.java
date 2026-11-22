package app.morphe.extension.mapsautomotive.patches;

import android.os.Build;

import org.json.JSONException;
import org.json.JSONObject;

/**
 * BYD GPS interval (patch "BYD GPS interval", switch "gps_interval").
 * <p>
 * In driving guidance Maps asks the system for a "gps" fix every 100 ms when its inertial stage has no uncalibrated
 * gyroscope, which is the case on BYD DiLink 3. The car's location service delivers a fix every 500 ms whatever is
 * asked, so on a BYD at Android 10 that one request asks every 500 ms. Maps' other requests, and every other car, keep
 * Maps' own interval.
 */
@SuppressWarnings("unused")
public final class GpsInterval {
    private static final String TAG = "MorpheGpsInterval";
    /** Maps' fast request and the fix interval of BYD DiLink 3, in ms. */
    static final long MAPS_FAST_MS = 100, CAR_FIX_MS = 500;
    private static final int ANDROID_10 = 29;

    private static volatile Boolean on;
    private static volatile int requests, changed;
    private static volatile long lastChangedAt;

    private GpsInterval() {
    }

    /** Injection point: the interval of Maps' fast GPS request, in ms. */
    public static long interval(long maps) {
        try {
            requests++;
            long asked = choose(maps, enabled());
            if (asked != maps) {
                changed++;
                lastChangedAt = System.currentTimeMillis();
                ReportLog.i(TAG, "Maps' GPS request every " + maps + " ms asked every " + asked + " ms (" + changed + ")");
            }
            return asked;
        } catch (Throwable error) {
            return maps;
        }
    }

    /** The interval to ask for. Plain Java, so it can be checked off the device. */
    static long choose(long maps, boolean enabled) {
        return enabled && maps == MAPS_FAST_MS ? CAR_FIX_MS : maps;
    }

    /** BYD DiLink 3: a BYD at Android 10. Plain Java. */
    static boolean applies(boolean byd, int sdk) {
        return byd && sdk == ANDROID_10;
    }

    private static boolean enabled() {
        Boolean feature = on;
        return feature != null ? feature : decide();
    }

    private static synchronized boolean decide() {
        Boolean feature = on;
        if (feature == null) {
            boolean car = applies(BydBatteryPatch.isByd(), Build.VERSION.SDK_INT);
            boolean switched = SafeMode.on(SafeMode.GPS_INTERVAL);
            feature = car && switched;
            on = feature;
            ReportLog.i(TAG, feature ? "GPS interval: Maps' 100 ms request asked at 500 ms"
                    : "GPS interval: Maps' own (" + (car ? "switched off" : "not a BYD at Android 10") + ")");
        }
        return feature;
    }

    /** For the problem report (main process). */
    static JSONObject report() throws JSONException {
        Boolean feature = on;
        long last = lastChangedAt;
        return new JSONObject()
                .put("on", feature != null ? feature : JSONObject.NULL)
                .put("byd_android_10", applies(BydBatteryPatch.isByd(), Build.VERSION.SDK_INT))
                .put("requests", requests)
                .put("changed", changed)
                .put("last_changed_at", last != 0 ? ReportBuilder.formatUtc(last) : JSONObject.NULL);
    }
}
