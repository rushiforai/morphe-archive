package app.template.extension.extension;

import android.app.AlertDialog;
import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.widget.Toast;

/**
 * Runtime half of the {@code GmsCore support} patch.
 *
 * Google Sign-In on a **re-signed** build fails because Google Play Services (GMS)
 * validates the calling app's signing certificate. The patched app is signed with a
 * different key, so GMS answers "signature mismatch" and login never completes.
 *
 * The community fix — the one ReVanced/Morphe use for YouTube, YT Music and Google
 * Photos — is to route the app's Google Play Services dependency to **MicroG (GmsCore)**
 * and let MicroG *spoof* the app's package name and signature back to what Google's
 * servers expect. The patch half does the redirection and declares:
 *
 *   - {@code org.microg.gms.permission.FAKE_PACKAGE_SIGNATURE} permission,
 *   - {@code <vendor>.SPOOFED_PACKAGE_NAME} → the app's original package name,
 *   - {@code <vendor>.SPOOFED_PACKAGE_SIGNATURE} → SHA-256 of the app's Google release cert
 *     (extracted from the APK by the "Provide Original app certificate" patch),
 *   - {@code <vendor>.MICROG_PACKAGE_NAME}.
 *
 * This class supplies the three values the patch rewrites/injects:
 *
 *   - {@link #getGmsCoreVendorGroupId()} — the MicroG vendor group id (rewritten at patch
 *     time to the vendor the user configured, default {@code app.revanced}),
 *   - {@link #getOriginalPackageName()} — the app's pre-patch package name (rewritten),
 *   - {@link #checkGmsCore(Context)} — invoked once from the main activity's onCreate to
 *     tell the user if the MicroG/GmsCore app is missing (without it, sign-in silently
 *     does nothing).
 *
 * Deliberately dependency-free (android.* only) so it can live in this repository's small
 * extension module. It is only compiled into the app when the GmsCore patch is applied.
 */
@SuppressWarnings("unused")
public final class GmsCoreSupportPatch {

    private static final String TAG = "GmsCoreSupport";

    /** Rewritten by the patch to the configured vendor group id (default "app.revanced"). */
    public static String getGmsCoreVendorGroupId() {
        return "app.revanced";
    }

    /** Rewritten by the patch to the app's original (Google-signed) package name. */
    public static String getOriginalPackageName() {
        return "";
    }

    private static boolean gmsCoreChecked = false;
    private static boolean gmsCoreMissingReported = false;

    /**
     * Called once from the patched app's main activity. Verifies that a MicroG/GmsCore
     * build is installed and usable, and warns the user if it is not — otherwise the
     * Google sign-in button appears to do nothing at all.
     *
     * Never throws: any failure here must not break app start-up.
     */
    public static void checkGmsCore(Context context) {
        if (gmsCoreChecked || context == null) {
            return;
        }
        gmsCoreChecked = true;

        try {
            String vendor = getGmsCoreVendorGroupId();
            String gmsCorePackage = vendor + ".android.gms";

            PackageManager pm = context.getPackageManager();
            boolean installed;
            try {
                pm.getPackageInfo(gmsCorePackage, 0);
                installed = true;
            } catch (PackageManager.NameNotFoundException e) {
                installed = false;
            }

            Log.i(TAG, "MicroG check: " + gmsCorePackage + " installed=" + installed);
            if (installed) {
                return;
            }

            reportMissing(context, gmsCorePackage);
        } catch (Throwable t) {
            Log.e(TAG, "checkGmsCore failed", t);
        }
    }

    private static void reportMissing(Context context, String gmsCorePackage) {
        if (gmsCoreMissingReported) {
            return;
        }
        gmsCoreMissingReported = true;

        String message = "MicroG (" + gmsCorePackage + ") is not installed.\n\n"
                + "Google sign-in only works with MicroG instead of Google Play Services. "
                + "Install MicroG, then restart the app.";

        // checkGmsCore() runs from Activity.onCreate, *before* the activity's window exists.
        // Showing a dialog immediately throws WindowManager$BadTokenException, so delay it
        // until the window is attached, and fall back to a Toast if anything still fails.
        new Handler(Looper.getMainLooper()).postDelayed(() -> {
            try {
                new AlertDialog.Builder(context)
                        .setTitle("MicroG required")
                        .setMessage(message)
                        .setPositiveButton("OK", null)
                        .setCancelable(true)
                        .show();
            } catch (Throwable t) {
                Log.w(TAG, "Dialog failed, falling back to toast", t);
                try {
                    Toast.makeText(context.getApplicationContext(),
                            "MicroG (" + gmsCorePackage + ") is not installed",
                            Toast.LENGTH_LONG).show();
                } catch (Throwable ignored) {
                    Log.w(TAG, "Could not show MicroG notice at all", t);
                }
            }
        }, 1200);
    }
}
