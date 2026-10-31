package com.facebook.ads.redexgen.X;

/* loaded from: assets/audience_network/classes.dex */
public final class AR implements InterfaceC1389Zb {
    @Override // com.facebook.ads.redexgen.X.InterfaceC1389Zb
    public final long A6L() {
        return System.nanoTime();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1389Zb
    public final void ALM(Object obj, long j11) throws InterruptedException {
        obj.wait(j11);
    }
}
