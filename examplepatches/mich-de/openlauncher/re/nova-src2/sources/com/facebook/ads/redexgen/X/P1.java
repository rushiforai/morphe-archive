package com.facebook.ads.redexgen.X;

/* loaded from: assets/audience_network/classes.dex */
public final class P1 implements ZK {
    public final /* synthetic */ C1148Ow A00;

    public P1(C1148Ow c1148Ow) {
        this.A00 = c1148Ow;
    }

    @Override // com.facebook.ads.redexgen.X.ZK
    public final long A8U() {
        return this.A00.A0B.A0C(this.A00.A07);
    }

    @Override // com.facebook.ads.redexgen.X.ZK
    public final ZJ A9e(long j11) {
        long jA0D = this.A00.A0B.A0D(j11);
        long j12 = this.A00.A09;
        long j13 = this.A00.A08;
        long targetGranule = this.A00.A09;
        long j14 = (j13 - targetGranule) * jA0D;
        long targetGranule2 = this.A00.A07;
        long estimatedPosition = N1.A0T((j12 + (j14 / targetGranule2)) - 30000, this.A00.A09, this.A00.A08 - 1);
        return new ZJ(new ZL(j11, estimatedPosition));
    }

    @Override // com.facebook.ads.redexgen.X.ZK
    public final boolean ABR() {
        return true;
    }
}
