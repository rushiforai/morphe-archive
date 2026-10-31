package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.Gx, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C0947Gx extends AbstractRunnableC2319oq {
    public final /* synthetic */ C0946Gw A00;

    public C0947Gx(C0946Gw c0946Gw) {
        this.A00 = c0946Gw;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractRunnableC2319oq
    public final void A07() {
        this.A00.A0C = false;
        if (this.A00.A0B.getQueue().isEmpty()) {
            this.A00.A0B.execute(this.A00.A0A);
        }
    }
}
