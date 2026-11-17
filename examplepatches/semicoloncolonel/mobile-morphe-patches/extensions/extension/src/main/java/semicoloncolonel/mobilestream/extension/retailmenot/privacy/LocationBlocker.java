package semicoloncolonel.mobilestream.extension.retailmenot.privacy;

import android.util.Log;

/**
 * RetailMeNot: answers location permission checks and requests with "denied".
 *
 * Expo's PermissionsService asks this class first. A denied check makes
 * expo-location refuse to read a position, and a denied request returns
 * without showing Android's permission dialog. The permissions stay in the
 * manifest, because Expo rejects any call about a permission the manifest
 * does not declare, and the app's root screen then fails to load.
 *
 * Two patches turn this on. "Remove location access" denies every location
 * permission; "Block background location" denies only background location.
 */
@SuppressWarnings("unused")
public final class LocationBlocker {
    private static final String TAG = "MSP-LOCATION";
    private static final String FINE = "android.permission.ACCESS_FINE_LOCATION";
    private static final String COARSE = "android.permission.ACCESS_COARSE_LOCATION";
    private static final String BACKGROUND = "android.permission.ACCESS_BACKGROUND_LOCATION";

    private LocationBlocker() {
    }

    /** Overwritten to return true by "Remove location access". */
    public static boolean blockForeground() {
        return false;
    }

    /** Overwritten to return true by "Remove location access" and "Block background location". */
    public static boolean blockBackground() {
        return false;
    }

    /** True for the permissions the enabled patches keep from the app. */
    public static boolean isBlocked(String permission) {
        if (BACKGROUND.equals(permission)) {
            return blockBackground();
        }
        if (FINE.equals(permission) || COARSE.equals(permission)) {
            return blockForeground();
        }
        return false;
    }

    /**
     * Denied results for a request made only of blocked permissions, or null
     * to let the request through. A mixed request goes through unchanged, and
     * its blocked part still reads as denied through isBlocked.
     */
    public static int[] deniedResults(String[] permissions) {
        if (permissions == null || permissions.length == 0) {
            return null;
        }
        for (String permission : permissions) {
            if (!isBlocked(permission)) {
                return null;
            }
        }
        Log.i(TAG, "denied a location permission request");
        int[] results = new int[permissions.length];
        java.util.Arrays.fill(results, -1); // PackageManager.PERMISSION_DENIED
        return results;
    }
}
