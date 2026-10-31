package com.facebook.ads.redexgen.X;

import android.os.Handler;

/* renamed from: com.facebook.ads.redexgen.X.Bi, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C0803Bi extends AbstractRunnableC2319oq {
    public final /* synthetic */ C0799Be A00;

    public C0803Bi(C0799Be c0799Be) {
        this.A00 = c0799Be;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractRunnableC2319oq
    public final void A07() {
        if (!this.A00.A04) {
            final int currentPositionInMillis = this.A00.getCurrentPositionInMillis();
            this.A00.A0C.A02(new BN(currentPositionInMillis) { // from class: com.facebook.ads.redexgen.X.5V
            });
            this.A00.A0D.A01(currentPositionInMillis, this.A00.getDuration(), this.A00.A0B.A0F());
            Handler handler = this.A00.A08;
            int currentPositionMs = this.A00.A01;
            handler.postDelayed(this, currentPositionMs);
        }
    }
}
