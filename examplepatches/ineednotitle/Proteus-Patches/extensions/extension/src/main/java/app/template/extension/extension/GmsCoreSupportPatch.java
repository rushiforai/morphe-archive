package app.template.extension.extension;

import android.app.Activity;
import android.content.Context;
import android.content.pm.PackageManager;
import android.widget.Toast;

/**
 * Runtime support for the "GmsCore support (MicroG)" patch.
 *
 * The three members below are rewritten / called from
 * {@code shared/gms/GmsCoreSupportPatch.kt} and
 * {@code googlephotos/GmsCoreSupportPatch.kt}:
 *
 * <ul>
 *   <li>{@link #getGmsCoreVendorGroupId()} — const-string replaced with the
 *       vendor group chosen by the user (default {@code app.revanced}).</li>
 *   <li>{@link #getOriginalPackageName()} — const-string replaced with the
 *       package name the app was published under.</li>
 *   <li>{@link #checkGmsCore(Context)} — injected into the main Activity's
 *       {@code onCreate()} to warn when the vendor GmsCore is missing.</li>
 * </ul>
 */
public final class GmsCoreSupportPatch {

    private GmsCoreSupportPatch() {}

    /** Vendor group id, e.g. {@code app.revanced} for {@code app.revanced.android.gms}. */
    public static String getGmsCoreVendorGroupId() {
        return "app.revanced"; // replaced at patch time
    }

    /** Package name of the app before any patch-time rename. */
    public static String getOriginalPackageName() {
        return ""; // replaced at patch time
    }

    /** Injected into Activity.onCreate() by the Google Photos GmsCore patch. */
    public static void checkGmsCore(Activity activity) {
        checkGmsCore((Context) activity);
    }

    /**
     * Warns once when the GmsCore build this bundle was patched for is not
     * installed, so "Google sign-in does not work" has a visible cause.
     */
    public static void checkGmsCore(Context context) {
        if (context == null) return;
        Context app = context.getApplicationContext();
        if (app == null) return;

        String vendor = getGmsCoreVendorGroupId();
        String gmsPackage = vendor == null || vendor.length() == 0
                ? "app.revanced.android.gms"
                : vendor + ".android.gms";

        boolean installed = false;
        try {
            app.getPackageManager().getPackageInfo(gmsPackage, 0);
            installed = true;
        } catch (PackageManager.NameNotFoundException expected) {
            installed = false;
        } catch (Throwable ignored) {
            // Package visibility restrictions (API 30+) can hide other packages.
            // Stay silent rather than accusing the user of a missing install.
            return;
        }
        if (installed) return;

        try {
            Toast.makeText(
                    app,
                    "Google Play Services compatibility layer (" + gmsPackage
                            + ") is not installed. Google features will not work.",
                    Toast.LENGTH_LONG).show();
        } catch (Throwable ignored) {
            // Called from a non-UI thread or no Surface — nothing user-facing to do.
        }
    }
}
