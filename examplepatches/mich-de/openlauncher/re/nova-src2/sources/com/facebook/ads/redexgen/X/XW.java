package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class XW {
    public static String[] A08 = {"0tyK0ADICv4wKdYK7zO0aIpXCTAujWTH", "jEFpuqw0tQkNAQYDH3y7ctAa70mXE2BH", "mgTzrmeWAqL9H5RkM3AF3H4MwCyXbFLz", "MpOICz3Ec36sF2e8dpjiTZ7pUq4Hqs4N", "K1I3v9luXEne9Amra3LArTgdwLGOrCyk", "lvNUH5c9DjtnICc", "M3jXIwWF", "CvezMNlmHXUm0GyBJHTQhbG"};
    public int A00;
    public long A01;
    public long A02;
    public long A03;
    public long A04;
    public long A05;
    public long A06;
    public final boolean[] A07 = new boolean[15];

    public static int A00(long j11) {
        return (int) (j11 % 15);
    }

    public final long A01() {
        if (this.A05 == 0) {
            return 0L;
        }
        long j11 = this.A06;
        if (A08[2].charAt(3) != 'z') {
            throw new RuntimeException();
        }
        A08[7] = "xMd0t6Xf9tkaeaPeSEnATrj";
        return j11 / this.A05;
    }

    public final long A02() {
        return this.A06;
    }

    public final void A03() {
        this.A03 = 0L;
        this.A05 = 0L;
        this.A06 = 0L;
        this.A00 = 0;
        Arrays.fill(this.A07, false);
    }

    public final void A04(long j11) {
        if (this.A03 == 0) {
            this.A02 = j11;
        } else if (this.A03 == 1) {
            this.A01 = j11 - this.A02;
            this.A06 = this.A01;
            this.A05 = 1L;
        } else {
            long j12 = j11 - this.A04;
            int iA00 = A00(this.A03);
            if (Math.abs(j12 - this.A01) <= 1000000) {
                this.A05++;
                this.A06 += j12;
                if (this.A07[iA00]) {
                    this.A07[iA00] = false;
                    this.A00--;
                }
            } else if (!this.A07[iA00]) {
                this.A07[iA00] = true;
                this.A00++;
            }
        }
        this.A03++;
        this.A04 = j11;
    }

    public final boolean A05() {
        if (this.A03 == 0) {
            return false;
        }
        return this.A07[A00(this.A03 - 1)];
    }

    public final boolean A06() {
        return this.A03 > 15 && this.A00 == 0;
    }
}
