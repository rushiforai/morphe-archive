package app.morphe.extension.mapsautomotive.android9;

import android.os.Build;
import android.view.accessibility.AccessibilityNodeInfo.AccessibilityAction;

/**
 * Android 10's page actions (patch "Android 9 (API 28)"): on Android 9 an action with the same id, as AndroidX's
 * AccessibilityActionCompat makes below Android 10.
 */
public final class AccessibilityAction28 {
    public static final String OWNER = "Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;";

    private AccessibilityAction28() {
    }

    public static AccessibilityAction ACTION_PAGE_UP() {
        if (Build.VERSION.SDK_INT >= 29) return AccessibilityAction.ACTION_PAGE_UP;
        return new AccessibilityAction(android.R.id.accessibilityActionPageUp, null);
    }

    public static AccessibilityAction ACTION_PAGE_DOWN() {
        if (Build.VERSION.SDK_INT >= 29) return AccessibilityAction.ACTION_PAGE_DOWN;
        return new AccessibilityAction(android.R.id.accessibilityActionPageDown, null);
    }

    public static AccessibilityAction ACTION_PAGE_LEFT() {
        if (Build.VERSION.SDK_INT >= 29) return AccessibilityAction.ACTION_PAGE_LEFT;
        return new AccessibilityAction(android.R.id.accessibilityActionPageLeft, null);
    }

    public static AccessibilityAction ACTION_PAGE_RIGHT() {
        if (Build.VERSION.SDK_INT >= 29) return AccessibilityAction.ACTION_PAGE_RIGHT;
        return new AccessibilityAction(android.R.id.accessibilityActionPageRight, null);
    }
}
