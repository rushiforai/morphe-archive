package semicoloncolonel.mobilestream.extension.netflix.misc;

import android.app.Activity;
import android.content.pm.ActivityInfo;

import java.util.Map;
import java.util.WeakHashMap;

/**
 * Netflix asks for sensor orientations, which turn the screen with the phone
 * even when auto-rotate is off. Each one is swapped for the matching user
 * orientation, which turns only when auto-rotate is on.
 *
 * Netflix also reads the orientation back and compares it with the sensor
 * value it asked for (the player keeps landscape only while the activity still
 * reports SENSOR_LANDSCAPE). So each activity's last request is remembered,
 * and a read returns it while the swapped value is still in effect.
 */
@SuppressWarnings("unused")
public final class RotationLock {
    private static final Map<Activity, Integer> REQUESTED = new WeakHashMap<>();

    private RotationLock() {
    }

    public static void setRequestedOrientation(Activity activity, int orientation) {
        synchronized (REQUESTED) {
            REQUESTED.put(activity, orientation);
        }
        activity.setRequestedOrientation(userOrientation(orientation));
    }

    public static int getRequestedOrientation(Activity activity) {
        int actual = activity.getRequestedOrientation();
        Integer requested;
        synchronized (REQUESTED) {
            requested = REQUESTED.get(activity);
        }
        if (requested != null && userOrientation(requested) == actual) return requested;
        return actual;
    }

    static int userOrientation(int orientation) {
        switch (orientation) {
            case ActivityInfo.SCREEN_ORIENTATION_SENSOR_LANDSCAPE:
                return ActivityInfo.SCREEN_ORIENTATION_USER_LANDSCAPE;
            case ActivityInfo.SCREEN_ORIENTATION_SENSOR_PORTRAIT:
                return ActivityInfo.SCREEN_ORIENTATION_USER_PORTRAIT;
            case ActivityInfo.SCREEN_ORIENTATION_SENSOR:
                return ActivityInfo.SCREEN_ORIENTATION_USER;
            case ActivityInfo.SCREEN_ORIENTATION_FULL_SENSOR:
                return ActivityInfo.SCREEN_ORIENTATION_FULL_USER;
            default:
                return orientation;
        }
    }
}
