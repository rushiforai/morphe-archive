package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.Ha, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C0950Ha extends AbstractRunnableC2319oq {
    public final /* synthetic */ C0957Hh A00;

    public C0950Ha(C0957Hh c0957Hh) {
        this.A00 = c0957Hh;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractRunnableC2319oq
    public final void A07() throws Throwable {
        for (C2121la c2121la : C2120lZ.A02()) {
            C2120lZ.A0A(this.A00, c2121la.A02(), c2121la.A00(), c2121la.A01(), false);
        }
        C2120lZ.A02().clear();
    }
}
