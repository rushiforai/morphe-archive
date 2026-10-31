package com.facebook.ads.redexgen.X;

/* loaded from: assets/audience_network/classes.dex */
public class DD implements InterfaceC2369ph {
    public final /* synthetic */ int A00;
    public final /* synthetic */ AbstractRunnableC2319oq A01;
    public final /* synthetic */ D8 A02;
    public final /* synthetic */ C0781Am A03;

    public DD(D8 d82, int i5, C0781Am c0781Am, AbstractRunnableC2319oq abstractRunnableC2319oq) {
        this.A02 = d82;
        this.A00 = i5;
        this.A03 = c0781Am;
        this.A01 = abstractRunnableC2319oq;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2369ph
    public final void AET() throws Throwable {
        this.A01.run();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2369ph
    public final void AGb(float f11) {
        this.A02.A09.setProgress(100.0f * (1.0f - (f11 / this.A00)));
        if (this.A03 != null) {
            C0781Am c0781Am = this.A03;
            float percentage = this.A00;
            c0781Am.A09((int) ((percentage - f11) * 1000.0f));
        }
    }
}
