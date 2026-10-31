package com.facebook.ads.redexgen.X;

import java.lang.ref.WeakReference;

/* renamed from: com.facebook.ads.redexgen.X.Ex, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C0896Ex extends AbstractRunnableC2319oq {
    public final WeakReference<C1539c2> A00;

    public C0896Ex(C1539c2 c1539c2) {
        this.A00 = new WeakReference<>(c1539c2);
    }

    public C0896Ex(WeakReference<C1539c2> weakReference) {
        this.A00 = weakReference;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractRunnableC2319oq
    public final void A07() {
        C1539c2 viewabilityChecker = this.A00.get();
        if (viewabilityChecker != null) {
            viewabilityChecker.A0U();
        }
    }
}
