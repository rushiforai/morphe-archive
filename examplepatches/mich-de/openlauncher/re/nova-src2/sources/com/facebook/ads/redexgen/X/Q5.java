package com.facebook.ads.redexgen.X;

/* loaded from: assets/audience_network/classes.dex */
public final class Q5 implements ZK {
    public final long A00;
    public final boolean A01;
    public final long[] A02;
    public final long[] A03;

    public Q5(long[] jArr, long[] jArr2, long j11) {
        AbstractC1062Ln.A07(jArr.length == jArr2.length);
        int length = jArr2.length;
        this.A01 = length > 0;
        if (this.A01 && jArr2[0] > 0) {
            int length2 = length + 1;
            this.A02 = new long[length2];
            int length3 = length + 1;
            this.A03 = new long[length3];
            System.arraycopy(jArr, 0, this.A02, 1, length);
            System.arraycopy(jArr2, 0, this.A03, 1, length);
        } else {
            this.A02 = jArr;
            this.A03 = jArr2;
        }
        this.A00 = j11;
    }

    @Override // com.facebook.ads.redexgen.X.ZK
    public final long A8U() {
        return this.A00;
    }

    @Override // com.facebook.ads.redexgen.X.ZK
    public final ZJ A9e(long j11) {
        if (!this.A01) {
            return new ZJ(ZL.A03);
        }
        int iA0L = N1.A0L(this.A03, j11, true, true);
        ZL zl2 = new ZL(this.A03[iA0L], this.A02[iA0L]);
        if (zl2.A01 != j11) {
            int targetIndex = this.A03.length;
            if (iA0L != targetIndex - 1) {
                int targetIndex2 = iA0L + 1;
                long j12 = this.A03[targetIndex2];
                int targetIndex3 = iA0L + 1;
                ZL rightSeekPoint = new ZL(j12, this.A02[targetIndex3]);
                return new ZJ(zl2, rightSeekPoint);
            }
        }
        return new ZJ(zl2);
    }

    @Override // com.facebook.ads.redexgen.X.ZK
    public final boolean ABR() {
        return this.A01;
    }
}
