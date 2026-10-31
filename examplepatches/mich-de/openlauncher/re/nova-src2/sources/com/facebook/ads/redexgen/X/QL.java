package com.facebook.ads.redexgen.X;

/* loaded from: assets/audience_network/classes.dex */
public class QL implements ZK {
    public final long A00;
    public final long A01;
    public final long A02;
    public final long A03;
    public final long A04;
    public final long A05;
    public final InterfaceC1372Yj A06;

    public QL(InterfaceC1372Yj interfaceC1372Yj, long j11, long j12, long j13, long j14, long j15, long j16) {
        this.A06 = interfaceC1372Yj;
        this.A03 = j11;
        this.A05 = j12;
        this.A02 = j13;
        this.A04 = j14;
        this.A01 = j15;
        this.A00 = j16;
    }

    public final long A05(long j11) {
        return this.A06.ALk(j11);
    }

    @Override // com.facebook.ads.redexgen.X.ZK
    public final long A8U() {
        return this.A03;
    }

    @Override // com.facebook.ads.redexgen.X.ZK
    public final ZJ A9e(long j11) {
        return new ZJ(new ZL(j11, C1371Yi.A05(this.A06.ALk(j11), this.A05, this.A02, this.A04, this.A01, this.A00)));
    }

    @Override // com.facebook.ads.redexgen.X.ZK
    public final boolean ABR() {
        return true;
    }
}
