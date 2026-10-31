package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.Fa, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C0899Fa extends AbstractC1540c3 {
    public final /* synthetic */ C2481rV A00;

    public C0899Fa(C2481rV c2481rV) {
        this.A00 = c2481rV;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1540c3
    public final void A03() {
        if (this.A00.A08 == null || this.A00.A08.A0H()) {
            this.A00.A0A.A0V();
            if (!this.A00.A06.A07()) {
                this.A00.A06.A05();
            }
            InterfaceC2480rU listener = (InterfaceC2480rU) this.A00.A0C.get();
            if (listener != null) {
                listener.AFD();
            }
            this.A00.A0A.A0V();
            return;
        }
        this.A00.A0A.A0T();
    }
}
