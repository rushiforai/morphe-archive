package app.morphe.extension.mapsautomotive.android9;

import android.os.Build;
import android.view.TouchDelegate;
import android.view.accessibility.AccessibilityNodeInfo$TouchDelegateInfo;

/**
 * TouchDelegate.getTouchDelegateInfo (patch "Android 9 (API 28)"): Android 9's accessibility has no touch delegate
 * info and never asks for it; Maps calls it only inside its own Android 10 override, so null.
 */
public final class TouchDelegate28 {
    public static final String OWNER = "Landroid/view/TouchDelegate;";

    private TouchDelegate28() {
    }

    // Our AccessibilityNodeInfo$TouchDelegateInfo has the nested class's binary name, so javac sees only it.
    public static AccessibilityNodeInfo$TouchDelegateInfo getTouchDelegateInfo(TouchDelegate delegate) {
        if (Build.VERSION.SDK_INT >= 29) return delegate.getTouchDelegateInfo();
        return null;
    }
}
