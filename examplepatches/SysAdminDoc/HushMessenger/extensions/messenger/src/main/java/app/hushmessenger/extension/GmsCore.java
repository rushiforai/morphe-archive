package app.hushmessenger.extension;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;

/**
 * GmsCore support's answers to Play services' availability check and to androidx Credential
 * Manager's framework provider. The patch points every Play services name at microG-RE, so the
 * check passes only while microG-RE is installed. Without it Messenger carries on the way it does on
 * a phone with no Play services at all, instead of going on to ask the package manager for
 * microG-RE's version.
 */
public final class GmsCore {
    /** microG-RE's package. The patch leaves HushMessenger's own classes alone, so this stays as written. */
    static final String PACKAGE = "app.revanced.android.gms";
    /** Play services' ConnectionResult.SUCCESS. */
    static final int SUCCESS = 0;
    /** Play services' ConnectionResult.SERVICE_MISSING. */
    static final int SERVICE_MISSING = 1;
    /** Play services' ConnectionResult.SERVICE_DISABLED. */
    static final int SERVICE_DISABLED = 3;

    private GmsCore() {
    }

    /**
     * Runs in place of Play services' availability check: success with microG-RE, missing without,
     * and disabled while microG-RE is turned off in Android's app settings, as Play services' own
     * check answers for itself.
     */
    public static int availability(Context context) {
        try {
            ApplicationInfo app = context.getPackageManager()
                    .getPackageInfo(PACKAGE, PackageManager.MATCH_DISABLED_COMPONENTS).applicationInfo;
            return app != null && !app.enabled ? SERVICE_DISABLED : SUCCESS;
        } catch (PackageManager.NameNotFoundException missing) {
            return SERVICE_MISSING;
        }
    }

    /**
     * Runs first in androidx Credential Manager's framework provider. True while microG-RE is
     * installed: the provider then answers unavailable, because Android hands Google's requests to
     * Google's own Play services, and androidx falls back to the Play services provider the patch
     * points at microG-RE. False without microG-RE, so the provider answers for itself and a
     * password manager can still offer a saved login. The provider is handed no Context, so this
     * reads the one the settings provider stored at startup, and answers false before it has.
     */
    public static boolean signsInThroughMicroG() {
        Context context = Settings.appContext;
        return context != null && availability(context) == SUCCESS;
    }
}
