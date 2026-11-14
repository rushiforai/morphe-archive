package semicoloncolonel.mobilestream.extension.retailmenot.privacy;

import android.util.Log;

/**
 * RetailMeNot: answers every location permission check and request with
 * "denied".
 *
 * Expo's PermissionsService asks this class first. A denied check makes
 * expo-location refuse to read a position, and a denied request returns
 * without showing Android's permission dialog. The permissions stay in the
 * manifest, because Expo rejects any call about a permission the manifest
 * does not declare.
 */
@SuppressWarnings("unused")
public final class LocationBlocker {
    private static final String TAG = "MSP-LOCATION";

    private LocationBlocker() {
    }

    /** True for the permissions this patch keeps from the app. */
    public static boolean isBlocked(String permission) {
        return "android.permission.ACCESS_FINE_LOCATION".equals(permission)
                || "android.permission.ACCESS_COARSE_LOCATION".equals(permission)
                || "android.permission.ACCESS_BACKGROUND_LOCATION".equals(permission);
    }

    /**
     * Denied results for a request made only of blocked permissions, or null
     * to let the request through. A mixed request goes through unchanged, and
     * its location part still reads as denied through isBlocked.
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
