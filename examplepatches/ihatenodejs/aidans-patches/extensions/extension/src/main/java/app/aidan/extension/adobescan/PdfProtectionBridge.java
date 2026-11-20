package app.aidan.extension.adobescan;

import android.app.Activity;
import android.util.Log;

public final class PdfProtectionBridge {

    private static final String TAG = "PdfProtectionBridge";

    private PdfProtectionBridge() {}

    /**
     * Entry point for local password protection (AES-256 R6) via PdfOperationCoordinator.
     */
    public static void protectFile(final Activity activity, final Object scanFileObj, final String password) {
        if (activity == null || scanFileObj == null || password == null || password.isEmpty()) {
            Log.e(TAG, "protectFile called with invalid arguments");
            return;
        }

        final PdfOperationCoordinator coordinator = PdfOperationCoordinator.getInstance();
        if (coordinator != null) {
            coordinator.startProtection(activity, scanFileObj, password);
        } else {
            Log.e(TAG, "PdfOperationCoordinator not initialized; cannot protect file");
        }
    }

    /**
     * Entry point for local password removal via PdfOperationCoordinator.
     */
    public static void unprotectFile(final Activity activity, final Object scanFileObj, final String password) {
        if (activity == null || scanFileObj == null || password == null || password.isEmpty()) {
            Log.e(TAG, "unprotectFile called with invalid arguments");
            return;
        }

        final PdfOperationCoordinator coordinator = PdfOperationCoordinator.getInstance();
        if (coordinator != null) {
            coordinator.startUnprotection(activity, scanFileObj, password);
        } else {
            Log.e(TAG, "PdfOperationCoordinator not initialized; cannot unprotect file");
        }
    }
}
