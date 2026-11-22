package app.jofslash.extension.googlehealth;

import android.content.pm.InstallSourceInfo;
import android.content.pm.PackageManager;

/**
 * Used by the Spoof installer patch. The app's calls that ask who installed an app are sent here
 * and get Google Play as the answer.
 */
@SuppressWarnings("unused")
public final class SpoofInstallerPatch {
    private static final String PLAY_STORE = "com.android.vending";

    private SpoofInstallerPatch() {
    }

    @SuppressWarnings("deprecation")
    public static String getInstallerPackageName(PackageManager packageManager, String packageName) {
        return PLAY_STORE;
    }

    public static String getInstallingPackageName(InstallSourceInfo info) {
        return PLAY_STORE;
    }
}
