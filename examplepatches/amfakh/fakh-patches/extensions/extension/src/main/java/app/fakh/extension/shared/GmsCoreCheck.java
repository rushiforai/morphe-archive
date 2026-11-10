package app.fakh.extension.shared;

import android.app.Application;
import android.content.pm.PackageManager;
import android.os.Handler;
import android.os.Looper;
import android.widget.Toast;

/**
 * Tells the user that signing in with Google needs GmsCore (microG RE) when it is not installed. Each app has a small
 * class of its own that calls {@link #require} with the name of its own sign-in button, and the GmsCore patch of the app calls that class
 * where the app starts the Google sign-in.
 */
public final class GmsCoreCheck {
    private static final String GMS_CORE = "app.revanced.android.gms";
    private static boolean warned;

    private GmsCoreCheck() {
    }

    /**
     * Tells the user once per process that signing in needs GmsCore when it is missing; does nothing when it is
     * installed.
     *
     * @param button the name of the app's own Google sign-in button, such as "Sign in with Google"
     */
    public static void require(String button) {
        Application app = AppRuntime.application();
        if (app == null || warned) return;
        try {
            app.getPackageManager().getPackageInfo(GMS_CORE, 0);
        } catch (PackageManager.NameNotFoundException missing) {
            warned = true;
            String message = I18n.f("\"%1$s\" needs microG RE. Install it and sign in to a Google account, then try again.", button);
            new Handler(Looper.getMainLooper()).post(() -> Toast.makeText(app, message, Toast.LENGTH_LONG).show());
        }
    }
}
