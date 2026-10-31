package app.ratbanana.extension.gaminghub;

import android.accounts.AccountManager;
import android.annotation.SuppressLint;
import android.content.Context;
import android.util.Log;

/**
 * Shared access to the app context and the Samsung account state of a re-signed Gaming Hub.
 * <p>
 * Android only exposes the Samsung account to apps signed by Samsung, so for a patched
 * Gaming Hub no account is ever visible and every account-based feature fails.
 */
final class SamsungAccount {

    static final String TAG = "GamingHubPatches";

    private static final String SAMSUNG_ACCOUNT_TYPE = "com.osp.app.signin";

    private SamsungAccount() {
    }

    static boolean isVisible(Context context) {
        try {
            return AccountManager.get(context).getAccountsByType(SAMSUNG_ACCOUNT_TYPE).length > 0;
        } catch (RuntimeException ex) {
            return false;
        }
    }

    /** @return The application context, or null when the app is not initialized yet. */
    @SuppressLint("PrivateApi")
    static Context applicationContext() {
        try {
            return (Context) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication")
                    .invoke(null);
        } catch (ReflectiveOperationException | RuntimeException ex) {
            Log.e(TAG, "Failed to get the application context", ex);
            return null;
        }
    }
}
