package b5;

import android.os.Bundle;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityNodeProvider;
import java.util.List;

/* loaded from: classes.dex */
public final class h extends AccessibilityNodeProvider {

    /* renamed from: a, reason: collision with root package name */
    public final vm.c f17554a;

    public h(vm.c cVar) {
        this.f17554a = cVar;
    }

    @Override // android.view.accessibility.AccessibilityNodeProvider
    public final void addExtraDataToAccessibilityNodeInfo(int i5, AccessibilityNodeInfo accessibilityNodeInfo, String str, Bundle bundle) {
        this.f17554a.a(i5, g.l0(accessibilityNodeInfo), str, bundle);
    }

    @Override // android.view.accessibility.AccessibilityNodeProvider
    public final AccessibilityNodeInfo createAccessibilityNodeInfo(int i5) {
        g gVarE = this.f17554a.e(i5);
        if (gVarE == null) {
            return null;
        }
        return gVarE.k0();
    }

    @Override // android.view.accessibility.AccessibilityNodeProvider
    public final List findAccessibilityNodeInfosByText(String str, int i5) {
        this.f17554a.getClass();
        return null;
    }

    @Override // android.view.accessibility.AccessibilityNodeProvider
    public final AccessibilityNodeInfo findFocus(int i5) {
        g gVarG = this.f17554a.g(i5);
        if (gVarG == null) {
            return null;
        }
        return gVarG.k0();
    }

    @Override // android.view.accessibility.AccessibilityNodeProvider
    public final boolean performAction(int i5, int i11, Bundle bundle) {
        return this.f17554a.r(i5, i11, bundle);
    }
}
