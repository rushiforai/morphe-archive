package m1;

import android.view.accessibility.AccessibilityManager;
import p1.e1;
import p1.s2;

/* loaded from: classes2.dex */
public final class b0 implements AccessibilityManager.TouchExplorationStateChangeListener {

    /* renamed from: a, reason: collision with root package name */
    public final e1 f75670a = androidx.compose.runtime.d.k(Boolean.FALSE);

    @Override // android.view.accessibility.AccessibilityManager.TouchExplorationStateChangeListener
    public final void onTouchExplorationStateChanged(boolean z11) {
        ((s2) this.f75670a).setValue(Boolean.valueOf(z11));
    }
}
