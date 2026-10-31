package com.facebook.ads.redexgen.X;

import com.facebook.ads.internal.protocol.AdErrorType;

/* loaded from: assets/audience_network/classes.dex */
public class M9 implements InterfaceC2050kO {
    public final /* synthetic */ int A00;
    public final /* synthetic */ C07257r A01;
    public final /* synthetic */ C07257r A02;
    public final /* synthetic */ C2146lz A03;

    public M9(C07257r c07257r, int i5, C2146lz c2146lz, C07257r c07257r2) {
        this.A01 = c07257r;
        this.A00 = i5;
        this.A03 = c2146lz;
        this.A02 = c07257r2;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2050kO
    public final void ADt() {
        this.A01.A0C(this.A00, this.A03);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2050kO
    public final void ADu() {
        this.A01.A00.AFQ(this.A02, C2262nt.A00(AdErrorType.NO_FILL));
    }
}
