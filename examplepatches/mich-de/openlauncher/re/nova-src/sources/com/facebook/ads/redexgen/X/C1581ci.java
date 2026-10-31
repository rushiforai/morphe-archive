package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.ci, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1581ci {
    public static String[] A04 = {"FH7QfcEZGyvjBlIYHtv1m0qDr", "5Zl2dwblbkX6m8G166WzuMI2Ub9aKUHq", "E7nh1WR8P86jgbeK1FJQDa8Vw4em1h", "K3wrG2m6xhACXNATMrYnZq9Olq75yJin", "DCU3IqRwRRhIh", "X0FWhz9pDXt", "O3SkkilEjtUjYXGkQYvFa6FeWEKjSgkj", "oroUdAH2J0J"};
    public static final byte[] A05 = {0, 0, 1};
    public int A00;
    public int A01;
    public byte[] A02;
    public boolean A03;

    public C1581ci(int i5) {
        this.A02 = new byte[i5];
    }

    public final void A00() {
        this.A03 = false;
        this.A00 = 0;
        this.A01 = 0;
    }

    public final void A01(byte[] bArr, int i5, int i11) {
        if (!this.A03) {
            return;
        }
        int i12 = i11 - i5;
        int length = this.A02.length;
        if (A04[2].length() != 30) {
            throw new RuntimeException();
        }
        A04[3] = "GV7Yq15ZE6iqVCSYqSdqBHA6ixR9fJcn";
        int readLength = this.A00;
        if (length < readLength + i12) {
            byte[] bArr2 = this.A02;
            int i13 = this.A00;
            if (A04[0].length() != 25) {
                A04[6] = "hbLrfcvatORDSrDn2C3KvYG2coE3E3li";
                int readLength2 = (i13 + i12) * 1;
                this.A02 = Arrays.copyOf(bArr2, readLength2);
            } else {
                A04[6] = "tno0zaTLTLAKNutgeWkuviadQVo650E6";
                int readLength3 = (i13 + i12) * 2;
                this.A02 = Arrays.copyOf(bArr2, readLength3);
            }
        }
        byte[] bArr3 = this.A02;
        int readLength4 = this.A00;
        System.arraycopy(bArr, i5, bArr3, readLength4, i12);
        int readLength5 = this.A00;
        this.A00 = readLength5 + i12;
    }

    public final boolean A02(int i5, int i11) {
        if (this.A03) {
            this.A00 -= i11;
            if (this.A01 == 0 && i5 == 181) {
                this.A01 = this.A00;
            } else {
                this.A03 = false;
                return true;
            }
        } else if (i5 == 179) {
            this.A03 = true;
        }
        A01(A05, 0, A05.length);
        return false;
    }
}
