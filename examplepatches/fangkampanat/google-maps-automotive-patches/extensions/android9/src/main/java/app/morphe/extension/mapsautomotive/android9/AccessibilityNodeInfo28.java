package app.morphe.extension.mapsautomotive.android9;

import android.os.Build;
import android.view.accessibility.AccessibilityNodeInfo;

/** AccessibilityNodeInfo.setTextEntryKey (patch "Android 9 (API 28)"): not on Android 9, ignored. */
public final class AccessibilityNodeInfo28 {
    public static final String OWNER = "Landroid/view/accessibility/AccessibilityNodeInfo;";

    private AccessibilityNodeInfo28() {
    }

    public static void setTextEntryKey(AccessibilityNodeInfo info, boolean isTextEntryKey) {
        if (Build.VERSION.SDK_INT >= 29) info.setTextEntryKey(isTextEntryKey);
    }
}
