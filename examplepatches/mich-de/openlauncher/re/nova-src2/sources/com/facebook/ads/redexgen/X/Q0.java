package com.facebook.ads.redexgen.X;

import java.io.IOException;

/* loaded from: assets/audience_network/classes.dex */
public final class Q0 implements InterfaceC1375Yn {
    public static String[] A03 = {"sjQnemeNO9R2SECcRpxmOKWSIZfLS7dI", "4Ed386kkW3rglcLqK45Jt0XJN2BuLR2c", "D5702c5InYf5Mo2vMw", "aP70OAkvRoDZv9WaiRPclTIkjJytVSq7", "4LuIFhBBnDZahCkjnmwrnPjGnW6AaM77", "RFj0D6fgLIyzHM6HnK5g6VvijfYTZHKs", "tpVJZyHfmUEcos61Xa247nPAzfauWFcZ", "VFr8etVtjtWlxEuhq8PZ"};
    public final int A00;
    public final Z0 A01;
    public final Z5 A02;

    @Override // com.facebook.ads.redexgen.X.InterfaceC1375Yn
    public final /* synthetic */ void AGz() {
    }

    public Q0(Z5 z52, int i5) {
        this.A02 = z52;
        this.A00 = i5;
        this.A01 = new Z0();
    }

    private long A00(Q9 q92) throws IOException {
        while (q92.A9L() < q92.A90() - 6 && !Z1.A09(q92, this.A02, this.A00, this.A01)) {
            q92.A4X(1);
        }
        long jA9L = q92.A9L();
        if (A03[7].length() == 29) {
            throw new RuntimeException();
        }
        A03[1] = "R3jMm65znLUvFEyujrEO9mGbJnid0nxs";
        if (jA9L >= q92.A90() - 6) {
            q92.A4X((int) (q92.A90() - q92.A9L()));
            return this.A02.A09;
        }
        return this.A01.A00;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1375Yn
    public final C1373Yl AKE(Q9 q92, long j11) throws IOException {
        long rightFrameFirstSampleNumber = q92.A9Q();
        long leftFrameFirstSampleNumber = A00(q92);
        long jA9L = q92.A9L();
        q92.A4X(Math.max(6, this.A02.A06));
        long searchPosition = A00(q92);
        long leftFramePosition = q92.A9L();
        if (leftFrameFirstSampleNumber <= j11 && searchPosition > j11) {
            return C1373Yl.A03(jA9L);
        }
        if (searchPosition <= j11) {
            return C1373Yl.A05(searchPosition, leftFramePosition);
        }
        return C1373Yl.A04(leftFrameFirstSampleNumber, rightFrameFirstSampleNumber);
    }
}
