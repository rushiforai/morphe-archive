package com.facebook.ads.redexgen.X;

import android.view.accessibility.AccessibilityEvent;

/* renamed from: com.facebook.ads.redexgen.X.hu, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1898hu {
    public static final C1897ht A00 = new JH() { // from class: com.facebook.ads.redexgen.X.7V
        @Override // com.facebook.ads.redexgen.X.C1897ht
        public final int A00(AccessibilityEvent accessibilityEvent) {
            return accessibilityEvent.getContentChangeTypes();
        }

        @Override // com.facebook.ads.redexgen.X.C1897ht
        public final void A01(AccessibilityEvent accessibilityEvent, int i5) {
            accessibilityEvent.setContentChangeTypes(i5);
        }
    };

    public static int A00(AccessibilityEvent accessibilityEvent) {
        return A00.A00(accessibilityEvent);
    }

    public static void A01(AccessibilityEvent accessibilityEvent, int i5) {
        A00.A01(accessibilityEvent, i5);
    }
}
