package app.proxma.rox;

import android.util.Log;

/**
 * ROX's Flutter code reads the app version through the package_info_plus plugin, sends it with every
 * request and shows a blocking "Update Available" dialog when ROX says a newer version is required.
 * That locks a patched copy out on every ROX release until a new patched build exists. The patch
 * hands the Flutter side a higher version than the installed one (same major number), so the check
 * finds nothing newer. Android itself, and everything outside Flutter, still sees the real version.
 */
public final class UpdatePrompt {

    private static final String TAG = "PROXMA_ROX";
    private static final String SPOOF_MINOR = "99";
    private static final long BUILD_NUMBER_BUMP = 1000L;

    private UpdatePrompt() {}

    /** The real versionName (e.g. "3.0.14") becomes "3.99.0"; anything unexpected is left alone. */
    public static String version(String real) {
        try {
            if (real == null || real.isEmpty()) {
                Log.i(TAG, "UPDATE version left alone: empty");
                return real;
            }
            int dot = real.indexOf('.');
            String major = dot > 0 ? real.substring(0, dot) : real;
            for (int i = 0; i < major.length(); i++) {
                if (!Character.isDigit(major.charAt(i))) {
                    Log.i(TAG, "UPDATE version left alone: " + real);
                    return real;
                }
            }
            String spoofed = major + "." + SPOOF_MINOR + ".0";
            Log.i(TAG, "UPDATE version " + real + " reported as " + spoofed);
            return spoofed;
        } catch (Throwable t) {
            Log.w(TAG, "UPDATE_VERSION_ERR " + t);
            return real;
        }
    }

    /** The real build number (e.g. "61") is raised by 1000; anything not a number is left alone. */
    public static String buildNumber(String real) {
        try {
            long value = Long.parseLong(real);
            String spoofed = String.valueOf(value + BUILD_NUMBER_BUMP);
            Log.i(TAG, "UPDATE build number " + real + " reported as " + spoofed);
            return spoofed;
        } catch (Throwable t) {
            Log.i(TAG, "UPDATE build number left alone: " + real);
            return real;
        }
    }
}
