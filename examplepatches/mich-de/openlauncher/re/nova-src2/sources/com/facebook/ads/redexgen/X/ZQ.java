package com.facebook.ads.redexgen.X;

import java.io.IOException;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class ZQ {
    public static byte[] A07;
    public static String[] A08 = {"NeZWf5SP1U6NH62ZObMf8", "Kf09f2NdmrmrJE1cSFnQSDqn9kNnGcZb", "ZM3MjJGbj82IbzH5rqHa1Hcuy7NWr2B7", "agWhTIm2REL8Nt3n8JoLpsBM5fnG", "bZ6Z316w8XeZG90L5GJwbmZPjxyx", "xZ7qPBXtpyvdgWkNeaWk16nLQ9HxvSRa", "6Ei4x0C2d0K2vStLb8srRgrW8aHCO4mT", "9GX7UKp2zQdOOoVvP9aZHSj5d7sNmIia"};
    public int A00;
    public int A01;
    public int A02;
    public int A03;
    public long A04;
    public boolean A05;
    public final byte[] A06 = new byte[10];

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A07, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            byte b11 = (byte) ((bArrCopyOfRange[i13] - i12) - 55);
            if (A08[5].charAt(15) == 'Z') {
                throw new RuntimeException();
            }
            A08[0] = "xMeRguYSyBx4NX4wiXO1a";
            bArrCopyOfRange[i13] = b11;
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A07 = new byte[]{3, 33, 36, 20, -9, -13, -49, 18, 23, 36, 29, 26, -49, 34, 16, 28, 31, 27, 20, 34, -49, 28, 36, 34, 35, -49, 17, 20, -49, 18, 30, 29, 35, 24, 22, 36, 30, 36, 34, -49, 24, 29, -49, 35, 23, 20, -49, 34, 16, 28, 31, 27, 20, -49, 32, 36, 20, 36, 20, -35};
    }

    static {
        A01();
    }

    public final void A02() {
        this.A05 = false;
        this.A02 = 0;
    }

    public final void A03(Q9 q92) throws IOException {
        if (this.A05) {
            return;
        }
        q92.AI6(this.A06, 0, 10);
        q92.AK3();
        if (AbstractC1366Yd.A06(this.A06) == 0) {
            return;
        }
        this.A05 = true;
    }

    public final void A04(ZP zp2, long j11, int i5, int i11, int i12, ZN zn2) {
        AbstractC1062Ln.A0A(this.A01 <= i11 + i12, A00(0, 60, 120));
        if (!this.A05) {
            return;
        }
        int i13 = this.A02;
        this.A02 = i13 + 1;
        if (i13 == 0) {
            this.A04 = j11;
            this.A00 = i5;
            this.A03 = 0;
        }
        this.A03 += i11;
        this.A01 = i12;
        if (this.A02 >= 16) {
            A05(zp2, zn2);
        }
    }

    public final void A05(ZP zp2, ZN zn2) {
        if (this.A02 > 0) {
            zp2.AKC(this.A04, this.A00, this.A03, this.A01, zn2);
            this.A02 = 0;
        }
    }
}
