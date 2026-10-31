package com.facebook.ads.redexgen.X;

/* loaded from: assets/audience_network/classes.dex */
public final class NR implements ZK {
    public final int A00;
    public final long A01;
    public final long A02;
    public final long A03;
    public final C1608d9 A04;

    public NR(C1608d9 c1608d9, int i5, long j11, long j12) {
        this.A04 = c1608d9;
        this.A00 = i5;
        this.A03 = j11;
        this.A01 = (j12 - j11) / c1608d9.A02;
        this.A02 = A00(this.A01);
    }

    private long A00(long j11) {
        return N1.A0U(j11 * this.A00, 1000000L, this.A04.A04);
    }

    @Override // com.facebook.ads.redexgen.X.ZK
    public final long A8U() {
        return this.A02;
    }

    @Override // com.facebook.ads.redexgen.X.ZK
    public final ZJ A9e(long j11) {
        long jA0T = N1.A0T((this.A04.A04 * j11) / (this.A00 * 1000000), 0L, this.A01 - 1);
        long j12 = this.A03 + (this.A04.A02 * jA0T);
        long jA00 = A00(jA0T);
        ZL zl2 = new ZL(jA00, j12);
        if (jA00 >= j11 || jA0T == this.A01 - 1) {
            return new ZJ(zl2);
        }
        long j13 = 1 + jA0T;
        return new ZJ(zl2, new ZL(A00(j13), this.A03 + (this.A04.A02 * j13)));
    }

    @Override // com.facebook.ads.redexgen.X.ZK
    public final boolean ABR() {
        return true;
    }
}
