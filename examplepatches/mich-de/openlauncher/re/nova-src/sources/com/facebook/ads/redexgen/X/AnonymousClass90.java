package com.facebook.ads.redexgen.X;

import java.nio.ByteBuffer;

/* renamed from: com.facebook.ads.redexgen.X.90, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class AnonymousClass90 extends SK {
    public int[] A00;
    public int[] A01;

    @Override // com.facebook.ads.redexgen.X.SK
    public final LX A09(LX lx2) throws LY {
        int[] iArr = this.A01;
        if (iArr == null) {
            return LX.A06;
        }
        if (lx2.A02 == 2) {
            int i5 = lx2.A01 != iArr.length ? 1 : 0;
            int i11 = 0;
            while (i11 < iArr.length) {
                int i12 = iArr[i11];
                if (i12 < lx2.A01) {
                    i5 |= i12 != i11 ? 1 : 0;
                    i11++;
                } else {
                    throw new LY(lx2);
                }
            }
            if (i5 != 0) {
                return new LX(lx2.A03, iArr.length, 2);
            }
            return LX.A06;
        }
        throw new LY(lx2);
    }

    @Override // com.facebook.ads.redexgen.X.SK
    public final void A0A() {
        this.A00 = this.A01;
    }

    public final void A0C(int[] iArr) {
        this.A01 = iArr;
    }

    @Override // com.facebook.ads.redexgen.X.LZ
    public final void AIU(ByteBuffer byteBuffer) {
        int[] iArr = (int[]) AbstractC1062Ln.A01(this.A00);
        int iPosition = byteBuffer.position();
        int outputSize = byteBuffer.limit();
        int position = outputSize - iPosition;
        ByteBuffer byteBufferA00 = A00(this.A06.A00 * (position / this.A05.A00));
        while (iPosition < outputSize) {
            for (int i5 : iArr) {
                byteBufferA00.putShort(byteBuffer.getShort((i5 * 2) + iPosition));
            }
            iPosition += this.A05.A00;
        }
        byteBuffer.position(outputSize);
        byteBufferA00.flip();
    }
}
