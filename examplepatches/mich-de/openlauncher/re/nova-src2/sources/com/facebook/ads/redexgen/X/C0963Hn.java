package com.facebook.ads.redexgen.X;

import java.util.ArrayList;
import java.util.concurrent.atomic.AtomicBoolean;

/* renamed from: com.facebook.ads.redexgen.X.Hn, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C0963Hn extends AbstractRunnableC2319oq {
    public final /* synthetic */ InterfaceC2078kr A00;
    public final /* synthetic */ C2079ks A01;
    public final /* synthetic */ C2086kz A02;
    public final /* synthetic */ ArrayList A03;
    public final /* synthetic */ ArrayList A04;

    public C0963Hn(C2086kz c2086kz, ArrayList arrayList, C2079ks c2079ks, InterfaceC2078kr interfaceC2078kr, ArrayList arrayList2) {
        this.A02 = c2086kz;
        this.A03 = arrayList;
        this.A01 = c2079ks;
        this.A00 = interfaceC2078kr;
        this.A04 = arrayList2;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractRunnableC2319oq
    public final void A07() {
        AtomicBoolean atomicBooleanA0D = C2086kz.A0D(this.A03);
        if (this.A02.A04 instanceof C0958Hi) {
            C0958Hi c0958Hi = (C0958Hi) this.A02.A04;
            if (this.A01.A00 == -1) {
                if (atomicBooleanA0D.get()) {
                    c0958Hi.A0F().A5L(C2416qS.A01(this.A02.A00));
                } else {
                    c0958Hi.A0F().A5J(C2416qS.A01(this.A02.A00));
                }
            } else if (atomicBooleanA0D.get()) {
                c0958Hi.A0F().A5M(C2416qS.A01(this.A02.A00), this.A01.A00);
            } else {
                c0958Hi.A0F().A5K(C2416qS.A01(this.A02.A00), this.A01.A00);
            }
        }
        this.A02.A02.post(new C0964Ho(this, atomicBooleanA0D));
        C2086kz.A0D(this.A04);
    }
}
