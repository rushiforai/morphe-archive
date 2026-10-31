package com.facebook.ads.redexgen.X;

import com.facebook.ads.NativeAdBase;
import com.facebook.ads.NativeAdListener;

/* renamed from: com.facebook.ads.redexgen.X.79, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class AnonymousClass79 implements GS {
    public NativeAdBase A00;
    public NativeAdListener A01;

    public AnonymousClass79(NativeAdListener nativeAdListener, NativeAdBase nativeAdBase) {
        this.A01 = nativeAdListener;
        this.A00 = nativeAdBase;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2239nV
    public final void ADi() {
        AbstractC2310oh.A00(new GO(this));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2239nV
    public final void ADm() {
        AbstractC2310oh.A00(new GP(this));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2239nV
    public final void AEr(C2262nt c2262nt) {
        AbstractC2310oh.A00(new GR(this, c2262nt));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2239nV
    public final void AFp() {
        AbstractC2310oh.A00(new GN(this));
    }

    @Override // com.facebook.ads.redexgen.X.GS
    public final void AFu() {
        AbstractC2310oh.A00(new GQ(this));
    }
}
