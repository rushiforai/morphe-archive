package com.facebook.ads.redexgen.X;

/* loaded from: assets/audience_network/classes.dex */
public class Q4 implements ZK {
    public final long A00;
    public final ZJ A01;

    public Q4(long j11) {
        this(j11, 0L);
    }

    public Q4(long j11, long j12) {
        this.A00 = j11;
        this.A01 = new ZJ(j12 == 0 ? ZL.A03 : new ZL(0L, j12));
    }

    @Override // com.facebook.ads.redexgen.X.ZK
    public final long A8U() {
        return this.A00;
    }

    @Override // com.facebook.ads.redexgen.X.ZK
    public final ZJ A9e(long j11) {
        return this.A01;
    }

    @Override // com.facebook.ads.redexgen.X.ZK
    public final boolean ABR() {
        return false;
    }
}
