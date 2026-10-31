package m1;

import android.view.accessibility.AccessibilityManager;
import android.view.accessibility.AccessibilityManager$AccessibilityServicesStateChangeListener;
import kotlin.jvm.JvmStatic;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes2.dex */
public abstract class z {
    @JvmStatic
    public static final void a(@NotNull AccessibilityManager accessibilityManager, @NotNull AccessibilityManager$AccessibilityServicesStateChangeListener accessibilityManager$AccessibilityServicesStateChangeListener) {
        accessibilityManager.addAccessibilityServicesStateChangeListener(accessibilityManager$AccessibilityServicesStateChangeListener);
    }

    @JvmStatic
    public static final void b(@NotNull AccessibilityManager accessibilityManager, @NotNull AccessibilityManager$AccessibilityServicesStateChangeListener accessibilityManager$AccessibilityServicesStateChangeListener) {
        accessibilityManager.removeAccessibilityServicesStateChangeListener(accessibilityManager$AccessibilityServicesStateChangeListener);
    }
}
