package app.merak.extension.authenticator;

import android.app.Activity;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.util.Log;

/**
 * Checks that GmsCore (MicroG-RE) is installed, which the patched app needs
 * for Google sign-in and account sync.
 */
@SuppressWarnings("unused")
public final class GmsCoreSupport {

    private static final String TAG = "MorpheGmsCore";
    private static final String GMS_CORE_VENDOR = "app.revanced";
    private static final String GMS_CORE_PACKAGE = GMS_CORE_VENDOR + ".android.gms";
    private static final String GOOGLE_PLAY_SERVICES_PACKAGE = "com.google.android.gms";
    private static final String GMS_CORE_DOWNLOAD_URL = "https://github.com/MorpheApp/MicroG-RE/releases/latest";

    private static boolean dialogShown;

    private GmsCoreSupport() {
    }

    /** Injected at the start of {@code MainActivity.onCreate()}. */
    public static void checkGmsCore(Activity activity) {
        try {
            if (isGmsCoreInstalled(activity) || dialogShown) return;
            dialogShown = true;

            M3Dialog.dialog(activity)
                    .icon(Icons.info(Ui.secondary(activity)))
                    .title("MicroG is not installed")
                    .message("This app uses MicroG instead of Google Play services. Without it, "
                            + "signing in with a Google Account and syncing codes do not work.\n\n"
                            + "You can still use the app without an account.")
                    .button("Not now", null)
                    .button("Download", M3Dialog.closing(() -> {
                        try {
                            activity.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(GMS_CORE_DOWNLOAD_URL)));
                        } catch (Exception ex) {
                            Log.e(TAG, "Could not open download page", ex);
                        }
                    }))
                    .show();
        } catch (Throwable ex) {
            Log.e(TAG, "checkGmsCore failure", ex);
        }
    }

    /**
     * Injected into the Google Play services connection configs.
     *
     * @return The package to bind to for a service action. Actions redirected to GmsCore by the
     * patch use the GmsCore vendor prefix, everything else is left to Google Play services.
     */
    public static String servicePackage(String action) {
        return action != null && action.startsWith(GMS_CORE_VENDOR + ".")
                ? GMS_CORE_PACKAGE
                : GOOGLE_PLAY_SERVICES_PACKAGE;
    }

    /**
     * Injected into the dynamic service lookup of the Google Play services client.
     *
     * @return The "chimera" provider URI of the package that handles the service action.
     */
    public static Uri serviceLookupUri(String action) {
        return new Uri.Builder()
                .scheme("content")
                .authority(servicePackage(action) + ".chimera")
                .build();
    }

    private static boolean isGmsCoreInstalled(Activity activity) {
        try {
            activity.getPackageManager().getPackageInfo(GMS_CORE_PACKAGE, 0);
            return true;
        } catch (PackageManager.NameNotFoundException ex) {
            return false;
        }
    }
}
