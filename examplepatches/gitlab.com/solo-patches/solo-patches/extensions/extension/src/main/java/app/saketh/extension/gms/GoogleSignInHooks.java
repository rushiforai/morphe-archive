package app.saketh.extension.gms;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.pm.PackageManager;
import android.widget.Toast;

/** WebNovel hides every Google sign-in failure; these hooks tell the user what went wrong. */
public final class GoogleSignInHooks {
    private static final String PROVIDER = "app.revanced.android.gms";
    // GoogleSignInStatusCodes.SIGN_IN_CANCELLED: the user backed out on purpose.
    private static final int SIGN_IN_CANCELLED = 12501;

    private GoogleSignInHooks() {}

    /** Called before WebNovel starts Google sign-in. False stops it and explains the missing provider. */
    public static boolean providerReady(Activity activity) {
        try {
            if (activity.getPackageManager().getApplicationInfo(PROVIDER, 0).enabled) return true;
        } catch (PackageManager.NameNotFoundException missing) {
            // Fall through to the explanation below.
        }
        new AlertDialog.Builder(activity)
                .setTitle("MicroG RE required")
                .setMessage("Google sign-in in this patched app goes through MicroG RE (" + PROVIDER + "). "
                        + "Install or enable MicroG RE, add your Google account in it, then try again.")
                .setPositiveButton(android.R.string.ok, null)
                .show();
        return false;
    }

    /** Called with the status of a failed Google sign-in result. */
    public static void signInFailed(Activity activity, int status) {
        if (status == SIGN_IN_CANCELLED) return;
        Toast.makeText(activity, "Google sign-in failed (code " + status + "). "
                + "Open MicroG RE, check that your Google account is added, then try again.", Toast.LENGTH_LONG).show();
    }
}
