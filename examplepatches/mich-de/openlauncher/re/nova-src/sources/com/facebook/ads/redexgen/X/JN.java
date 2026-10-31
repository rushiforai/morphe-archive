package com.facebook.ads.redexgen.X;

import android.os.Bundle;
import android.view.View;
import android.view.accessibility.AccessibilityNodeProvider;

/* loaded from: assets/audience_network/classes.dex */
public class JN extends C1857hE {
    @Override // com.facebook.ads.redexgen.X.C1857hE
    public final View.AccessibilityDelegate A00(AbstractC1858hF abstractC1858hF) {
        return new C1855hC(this, abstractC1858hF);
    }

    @Override // com.facebook.ads.redexgen.X.C1857hE
    public final C1906i2 A01(View.AccessibilityDelegate accessibilityDelegate, View view) {
        AccessibilityNodeProvider accessibilityNodeProvider = accessibilityDelegate.getAccessibilityNodeProvider(view);
        if (accessibilityNodeProvider != null) {
            return new C1906i2(accessibilityNodeProvider);
        }
        return null;
    }

    @Override // com.facebook.ads.redexgen.X.C1857hE
    public final boolean A02(View.AccessibilityDelegate accessibilityDelegate, View view, int i5, Bundle bundle) {
        return accessibilityDelegate.performAccessibilityAction(view, i5, bundle);
    }
}
