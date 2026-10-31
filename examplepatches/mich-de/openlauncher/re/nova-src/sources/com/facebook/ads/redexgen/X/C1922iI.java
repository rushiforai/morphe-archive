package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.iI, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1922iI {
    public static byte[] A02;
    public static String[] A03 = {"bULQ32o9JJN83aCucFVWf9xMaMFfdsau", "BEVDZxUetTHXZyMQk8onv0fPj1ZBZ1Qa", "0vYpub5LBkfCpAgXclsnPo1", "vVWBcEJQjEsfNalmzVe1r7miASaPIW1B", "LFkzDQh", "g5RhG8eWHWtWI7ENz9qYtKd", "50dEOoYhOQRa91fvkd77j3svvS12NHRj", "eQbNRdF"};
    public long A00 = 0;
    public C1922iI A01;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 5);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A02 = new byte[]{-34, -34};
    }

    static {
        A02();
    }

    private void A01() {
        if (this.A01 == null) {
            this.A01 = new C1922iI();
        }
    }

    public final int A03(int i5) {
        if (this.A01 == null) {
            if (i5 >= 64) {
                return Long.bitCount(this.A00);
            }
            return Long.bitCount(this.A00 & ((1 << i5) - 1));
        }
        if (i5 < 64) {
            return Long.bitCount(this.A00 & ((1 << i5) - 1));
        }
        return this.A01.A03(i5 - 64) + Long.bitCount(this.A00);
    }

    public final void A04() {
        this.A00 = 0L;
        if (this.A01 != null) {
            this.A01.A04();
        }
    }

    public final void A05(int i5) {
        if (i5 >= 64) {
            if (this.A01 != null) {
                this.A01.A05(i5 - 64);
                return;
            }
            return;
        }
        long j11 = this.A00 & (~(1 << i5));
        if (A03[1].charAt(31) != 'a') {
            throw new RuntimeException();
        }
        String[] strArr = A03;
        strArr[6] = "FQtQPqX5zshXn4VmNwTVsnzPJS3Krcw4";
        strArr[3] = "mEVd87EgPvtBoIzzDeJnjIPIOSUL2jIs";
        this.A00 = j11;
    }

    public final void A06(int i5) {
        if (i5 >= 64) {
            A01();
            this.A01.A06(i5 - 64);
        } else {
            this.A00 |= 1 << i5;
        }
    }

    public final void A07(int i5, boolean z11) {
        if (i5 >= 64) {
            A01();
            this.A01.A07(i5 - 64, z11);
            return;
        }
        boolean z12 = (this.A00 & Long.MIN_VALUE) != 0;
        long j11 = (1 << i5) - 1;
        long j12 = this.A00 & j11;
        long j13 = this.A00;
        long mask = ~j11;
        this.A00 = j12 | ((j13 & mask) << 1);
        if (z11) {
            A06(i5);
        } else {
            A05(i5);
        }
        if (!z12 && this.A01 == null) {
            return;
        }
        A01();
        this.A01.A07(0, z12);
    }

    public final boolean A08(int i5) {
        if (i5 < 64) {
            return (this.A00 & (1 << i5)) != 0;
        }
        A01();
        return this.A01.A08(i5 - 64);
    }

    public final boolean A09(int i5) {
        if (i5 >= 64) {
            A01();
            return this.A01.A09(i5 - 64);
        }
        long j11 = 1 << i5;
        boolean z11 = (this.A00 & j11) != 0;
        long mask = this.A00;
        this.A00 = mask & (~j11);
        long j12 = j11 - 1;
        long j13 = this.A00 & j12;
        long mask2 = this.A00;
        long before = ~j12;
        this.A00 = j13 | Long.rotateRight(mask2 & before, 1);
        if (this.A01 != null) {
            if (this.A01.A08(0)) {
                A06(63);
            }
            this.A01.A09(0);
        }
        return z11;
    }

    public final String toString() {
        if (this.A01 != null) {
            return this.A01.toString() + A00(0, 2, 97) + Long.toBinaryString(this.A00);
        }
        long j11 = this.A00;
        if (A03[1].charAt(31) != 'a') {
            throw new RuntimeException();
        }
        String[] strArr = A03;
        strArr[2] = "hJ9KUEYMHtIt6rT1Ez0KfdL";
        strArr[5] = "B6CHA8tZa8vt0H5l4hWvu9Y";
        return Long.toBinaryString(j11);
    }
}
