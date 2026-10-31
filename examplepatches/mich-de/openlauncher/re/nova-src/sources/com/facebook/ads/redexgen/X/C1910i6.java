package com.facebook.ads.redexgen.X;

import android.os.Bundle;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityNodeProvider;
import java.util.List;

/* renamed from: com.facebook.ads.redexgen.X.i6, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1910i6 extends AccessibilityNodeProvider {
    public final /* synthetic */ InterfaceC1911i7 A00;

    public C1910i6(InterfaceC1911i7 interfaceC1911i7) {
        this.A00 = interfaceC1911i7;
    }

    @Override // android.view.accessibility.AccessibilityNodeProvider
    public final AccessibilityNodeInfo createAccessibilityNodeInfo(int i5) {
        return (AccessibilityNodeInfo) this.A00.A5p(i5);
    }

    @Override // android.view.accessibility.AccessibilityNodeProvider
    public final List<AccessibilityNodeInfo> findAccessibilityNodeInfosByText(String str, int i5) {
        return this.A00.A77(str, i5);
    }

    @Override // android.view.accessibility.AccessibilityNodeProvider
    public final AccessibilityNodeInfo findFocus(int i5) {
        return (AccessibilityNodeInfo) this.A00.A78(i5);
    }

    @Override // android.view.accessibility.AccessibilityNodeProvider
    public final boolean performAction(int i5, int i11, Bundle bundle) {
        return this.A00.AI8(i5, i11, bundle);
    }
}
