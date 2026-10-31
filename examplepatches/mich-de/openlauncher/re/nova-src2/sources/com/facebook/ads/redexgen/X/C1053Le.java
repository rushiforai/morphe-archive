package com.facebook.ads.redexgen.X;

import com.facebook.ads.AdError;

/* renamed from: com.facebook.ads.redexgen.X.Le, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1053Le implements InterfaceC2050kO {
    public final /* synthetic */ C07207m A00;
    public final /* synthetic */ boolean A01;

    public C1053Le(C07207m c07207m, boolean z11) {
        this.A00 = c07207m;
        this.A01 = z11;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2050kO
    public final void ADt() {
        if (!C2203mv.A1t(this.A00.A04) || !this.A01) {
            this.A00.A0C.set(true);
            this.A00.A01.AGt(this.A00);
        } else {
            this.A00.A06 = M1.A01(this.A00.A04, (C07147g) this.A00.A03, 0, new C1054Lf(this));
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2050kO
    public final void ADu() {
        this.A00.A01.AGw(this.A00, AdError.CACHE_ERROR);
    }
}
