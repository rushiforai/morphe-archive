package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.8H, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C8H implements PG {
    public long A00;
    public final long A01;
    public final MW A03 = new MW();
    public final MW A02 = new MW();

    public C8H(long j11, long j12, long j13) {
        this.A00 = j11;
        this.A01 = j13;
        this.A03.A04(0L);
        this.A02.A04(j12);
    }

    public final void A00(long j11) {
        this.A00 = j11;
    }

    public final void A01(long j11, long j12) {
        if (A02(j11)) {
            return;
        }
        this.A03.A04(j11);
        this.A02.A04(j12);
    }

    public final boolean A02(long j11) {
        long lastIndexedTimeUs = this.A03.A03(this.A03.A02() - 1);
        return j11 - lastIndexedTimeUs < 100000;
    }

    @Override // com.facebook.ads.redexgen.X.PG
    public final long A8K() {
        return this.A01;
    }

    @Override // com.facebook.ads.redexgen.X.ZK
    public final long A8U() {
        return this.A00;
    }

    @Override // com.facebook.ads.redexgen.X.ZK
    public final ZJ A9e(long j11) {
        int iA0C = N1.A0C(this.A03, j11, true, true);
        ZL zl2 = new ZL(this.A03.A03(iA0C), this.A02.A03(iA0C));
        if (zl2.A01 != j11) {
            int targetIndex = this.A03.A02();
            if (iA0C != targetIndex - 1) {
                int targetIndex2 = iA0C + 1;
                long jA03 = this.A03.A03(targetIndex2);
                int targetIndex3 = iA0C + 1;
                ZL nextSeekPoint = new ZL(jA03, this.A02.A03(targetIndex3));
                return new ZJ(zl2, nextSeekPoint);
            }
        }
        return new ZJ(zl2);
    }

    @Override // com.facebook.ads.redexgen.X.PG
    public final long A9u(long j11) {
        return this.A03.A03(N1.A0C(this.A02, j11, true, true));
    }

    @Override // com.facebook.ads.redexgen.X.ZK
    public final boolean ABR() {
        return true;
    }
}
