package com.facebook.ads.redexgen.X;

import java.lang.ref.WeakReference;

/* loaded from: assets/audience_network/classes.dex */
public class C7 implements InterfaceC2617th {
    public final WeakReference<AbstractC06635h> A00;

    public C7(AbstractC06635h abstractC06635h) {
        this.A00 = new WeakReference<>(abstractC06635h);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2617th
    public final void AFA(C2616tg c2616tg) {
        AbstractC06635h cardLayout = this.A00.get();
        if (cardLayout != null) {
            cardLayout.A1r();
        }
    }
}
