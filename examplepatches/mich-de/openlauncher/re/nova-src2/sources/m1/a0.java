package m1;

import android.view.accessibility.AccessibilityManager;
import android.view.accessibility.AccessibilityManager$AccessibilityServicesStateChangeListener;
import p1.e1;
import p1.s2;

/* loaded from: classes2.dex */
public final class a0 implements AccessibilityManager$AccessibilityServicesStateChangeListener {

    /* renamed from: a, reason: collision with root package name */
    public final e1 f75668a = androidx.compose.runtime.d.k(Boolean.FALSE);

    public a0(c0 c0Var) {
    }

    public final void onAccessibilityServicesStateChanged(AccessibilityManager accessibilityManager) {
        ((s2) this.f75668a).setValue(Boolean.valueOf(c0.a(accessibilityManager)));
    }
}
