package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.Ov, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1147Ov implements InterfaceC1495bK {
    public long A00 = -1;
    public long A01 = -1;
    public Z4 A02;
    public Z5 A03;

    public C1147Ov(Z5 z52, Z4 z42) {
        this.A03 = z52;
        this.A02 = z42;
    }

    public final void A00(long j11) {
        this.A00 = j11;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1495bK
    public final ZK A68() {
        AbstractC1062Ln.A08(this.A00 != -1);
        return new Q6(this.A03, this.A00);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1495bK
    public final long AIa(Q9 q92) {
        if (this.A01 < 0) {
            return -1L;
        }
        long result = -(this.A01 + 2);
        this.A01 = -1L;
        return result;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1495bK
    public final void ALV(long j11) {
        long[] jArr = this.A02.A01;
        this.A01 = jArr[N1.A0L(jArr, j11, true, true)];
    }
}
