package com.facebook.ads.redexgen.X;

import java.lang.ref.WeakReference;

/* renamed from: com.facebook.ads.redexgen.X.Gg, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C0930Gg implements InterfaceC2245nb {
    public WeakReference<GT> A00;

    public C0930Gg(GT gt2) {
        this.A00 = new WeakReference<>(gt2);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2245nb
    public final void AGG(boolean z11) {
        if (this.A00.get() != null) {
            this.A00.get().A1o(z11, false);
        }
    }
}
