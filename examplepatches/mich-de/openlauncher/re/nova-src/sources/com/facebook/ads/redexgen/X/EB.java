package com.facebook.ads.redexgen.X;

import java.lang.ref.WeakReference;

/* loaded from: assets/audience_network/classes.dex */
public class EB implements InterfaceC2617th {
    public final WeakReference<C6V> A00;

    public EB(C6V c6v) {
        this.A00 = new WeakReference<>(c6v);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2617th
    public final void AFA(C2616tg c2616tg) {
        C6V c6v = this.A00.get();
        if (c6v != null) {
            c6v.A06 = c2616tg.A00() != null;
            c6v.A02();
        }
    }
}
