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
    /** The cloud messaging permission GmsCore support's manifest edit asks for in place of Google's. */
    static final String MICROG_RECEIVE = "app.revanced.android.c2dm.permission.RECEIVE";
    /** Google Play services' package, which the patch leaves alone in HushMessenger's own classes. */
    static final String PLAY_SERVICES = "com.google.android.gms";

    private GmsCore() {
    }

    /**
     * True in an app GmsCore support was patched into. The patch rewrites this; the extension alone answers false. It
     * holds on a Root Mount install too, which keeps the stock manifest.
     */
    static boolean bundled() {
        return false;
    }

    /**
     * True when GmsCore support was patched in: the patch's own mark in the code, or the cloud messaging permission
     * its manifest edit asks for.
     */
    static boolean patchedIn(Context context) {
        if (bundled()) return true;
        try {
            String[] requested = context.getPackageManager()
                    .getPackageInfo(context.getPackageName(), PackageManager.GET_PERMISSIONS).requestedPermissions;
            if (requested != null) for (String permission : requested) if (MICROG_RECEIVE.equals(permission)) return true;
        } catch (PackageManager.NameNotFoundException | RuntimeException unreadable) {
            // A package manager that can't answer for Messenger itself says nothing about the patch.
        }
        return false;
    }

    /**
     * True when GmsCore support was patched in but microG-RE is missing or turned off. The patch points every Play
     * services name at microG-RE, so Messenger then can't get notifications through Google's push service.
     */
    static boolean withoutPush(Context context) {
        try {
            return patchedIn(context) && availability(context) != SUCCESS;
        } catch (RuntimeException unreadable) {
            // A package manager that stops answering mid-check isn't a reason to warn, or to break the settings header.
            return false;
        }
    }

    /** Which push service Messenger is set up to use, for Copy setup text. It reads what's installed and enabled. */
    static String pushRoute(Context context) {
        try {
            return route(context);
        } catch (RuntimeException unreadable) {
            return "unknown, the package manager didn't answer";
        }
    }

    private static String route(Context context) {
        if (patchedIn(context)) {
            switch (availability(context)) {
                case SUCCESS: return "microG-RE";
                case SERVICE_DISABLED: return "none, GmsCore support is patched in and microG-RE is turned off";
                default: return "none, GmsCore support is patched in and microG-RE isn't installed";
            }
        }
        try {
            ApplicationInfo app = context.getPackageManager().getApplicationInfo(PLAY_SERVICES, 0);
            return app.enabled ? "Google Play services" : "none, Google Play services is turned off";
        } catch (PackageManager.NameNotFoundException missing) {
            return "none, no Google Play services";
        }
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
