package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.Eu, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C0893Eu extends AbstractRunnableC2319oq {
    public final /* synthetic */ C2615tf A00;

    public C0893Eu(C2615tf c2615tf) {
        this.A00 = c2615tf;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractRunnableC2319oq
    public final void A07() {
        this.A00.A03();
        if (!this.A00.A08) {
            return;
        }
        this.A00.A0D.postDelayed(this.A00.A0F, 250L);
    }
}
