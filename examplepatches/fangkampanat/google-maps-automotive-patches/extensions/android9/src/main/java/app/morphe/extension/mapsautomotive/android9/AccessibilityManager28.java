package app.morphe.extension.mapsautomotive.android9;

import android.os.Build;
import android.view.accessibility.AccessibilityManager;

/** AccessibilityManager.getRecommendedTimeoutMillis (patch "Android 9 (API 28)"): the app's own timeout on Android 9. */
public final class AccessibilityManager28 {
    public static final String OWNER = "Landroid/view/accessibility/AccessibilityManager;";

    private AccessibilityManager28() {
    }

    public static int getRecommendedTimeoutMillis(AccessibilityManager manager, int originalTimeout, int uiContentFlags) {
        if (Build.VERSION.SDK_INT >= 29) return manager.getRecommendedTimeoutMillis(originalTimeout, uiContentFlags);
        return originalTimeout;
    }
}
