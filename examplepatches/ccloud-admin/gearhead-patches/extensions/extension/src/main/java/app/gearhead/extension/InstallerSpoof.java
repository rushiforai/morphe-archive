package app.gearhead.extension;

import android.content.pm.PackageManager;

/**
 * Replaces Android Auto's checks of where an app was installed from.
 * <p>
 * Android Auto only lists car apps whose installer is the Google Play Store, unless developer
 * settings and "Unknown sources" are turned on. The patch redirects every installer lookup in
 * Android Auto to these methods, which always answer "Google Play Store".
 * <p>
 * This is the same approach as the Android Auto XLauncher Unlocked Xposed module
 * (https://github.com/Rikj000/Android-Auto-XLauncher-Unlocked, GPLv3), done as a bytecode
 * patch so it needs no root or Xposed framework at runtime.
 */
@SuppressWarnings("unused")
public final class InstallerSpoof {

    private static final String PLAY_STORE_PACKAGE = "com.android.vending";

    private InstallerSpoof() {
    }

    /**
     * Replaces {@code InstallSourceInfo.getInitiatingPackageName()} (Android 11 and newer).
     * The parameter is typed as Object so this class loads on every Android version.
     */
    public static String getInitiatingPackageName(Object installSourceInfo) {
        return PLAY_STORE_PACKAGE;
    }

    /**
     * Replaces {@code PackageManager.getInstallerPackageName(String)} (Android 10 and older).
     */
    public static String getInstallerPackageName(PackageManager packageManager, String packageName) {
        return PLAY_STORE_PACKAGE;
    }
}
