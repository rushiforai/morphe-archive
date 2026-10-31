package com.facebook.ads.redexgen.X;

import com.facebook.ads.androidx.media3.common.DrmInitData;

/* renamed from: com.facebook.ads.redexgen.X.aw, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1471aw {
    public static String[] A0C = {"8V3AH1jFj1uCH77jnL5gp4Dcj8s8JrSM", "uVEOV64jTbCDi0V18Z8p9KlatCZHWnRb", "aJxaQfyqbyR1ntlpLHwHseR3oRN9Smur", "RjBE4eVJq7bpqZZeKNEZ67ufThpbLV11", "NmKxiyzWR", "JMTKFh", "be3pU6YoM", "2MIEm5bDWuGrUK7"};
    public int A00;
    public int A01;
    public int A02;
    public int A03;
    public C1462an A04;
    public C1488bD A05;
    public boolean A06;
    public final ZP A08;
    public final C1487bC A09 = new C1487bC();
    public final C1084Mk A07 = new C1084Mk();
    public final C1084Mk A0B = new C1084Mk(1);
    public final C1084Mk A0A = new C1084Mk();

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    /* JADX WARN: Removed duplicated region for block: B:18:0x0061  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x0087  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int A04(int i5, int i11) {
        C1084Mk c1084Mk;
        int length;
        int i12;
        C1486bB c1486bBA07 = A07();
        if (c1486bBA07 == null) {
            return 0;
        }
        if (c1486bBA07.A00 != 0) {
            c1084Mk = this.A09.A0H;
            length = c1486bBA07.A00;
        } else {
            byte[] bArr = (byte[]) N1.A0f(c1486bBA07.A04);
            this.A0A.A0j(bArr, bArr.length);
            c1084Mk = this.A0A;
            length = bArr.length;
        }
        boolean zA06 = this.A09.A06(this.A01);
        String[] strArr = A0C;
        if (strArr[1].charAt(6) == strArr[0].charAt(6)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0C;
        strArr2[4] = "OtcMSLIlX";
        strArr2[6] = "XgpN2eLUS";
        boolean z11 = zA06 || i11 != 0;
        byte[] bArrA0l = this.A0B.A0l();
        if (A0C[7].length() != 15) {
            String[] strArr3 = A0C;
            strArr3[4] = "tgIDNgGjB";
            strArr3[6] = "jtXG7kQuk";
            i12 = z11 ? 128 : 0;
        } else {
            A0C[2] = "eRxyDAQwuIwVQ80Smqp4WU1lJfOBSGN5";
            if (z11) {
            }
        }
        bArrA0l[0] = (byte) (i12 | length);
        this.A0B.A0f(0);
        this.A08.AKA(this.A0B, 1, 1);
        this.A08.AKA(c1084Mk, length, 1);
        if (!z11) {
            return length + 1;
        }
        if (!zA06) {
            this.A07.A0d(8);
            byte[] bArrA0l2 = this.A07.A0l();
            bArrA0l2[0] = 0;
            bArrA0l2[1] = 1;
            bArrA0l2[2] = (byte) ((i11 >> 8) & 255);
            bArrA0l2[3] = (byte) (i11 & 255);
            bArrA0l2[4] = (byte) ((i5 >> 24) & 255);
            bArrA0l2[5] = (byte) ((i5 >> 16) & 255);
            bArrA0l2[6] = (byte) ((i5 >> 8) & 255);
            bArrA0l2[7] = (byte) (i5 & 255);
            this.A08.AKA(this.A07, 8, 1);
            return length + 1 + 8;
        }
        C1084Mk c1084Mk2 = this.A09.A0H;
        int iA0M = c1084Mk2.A0M();
        c1084Mk2.A0g(-2);
        int i13 = (iA0M * 6) + 2;
        if (i11 != 0) {
            this.A07.A0d(i13);
            byte[] bArrA0l3 = this.A07.A0l();
            c1084Mk2.A0k(bArrA0l3, 0, i13);
            int i14 = (((bArrA0l3[2] & 255) << 8) | (bArrA0l3[3] & 255)) + i11;
            bArrA0l3[2] = (byte) ((i14 >> 8) & 255);
            bArrA0l3[3] = (byte) (i14 & 255);
            c1084Mk2 = this.A07;
        }
        this.A08.AKA(c1084Mk2, i13, 1);
        return length + 1 + i13;
    }

    public C1471aw(ZP zp2, C1488bD c1488bD, C1462an c1462an) {
        this.A08 = zp2;
        this.A05 = c1488bD;
        this.A04 = c1462an;
        A0C(c1488bD, c1462an);
    }

    public final int A02() {
        int i5;
        if (!this.A06) {
            i5 = this.A05.A04[this.A01];
        } else {
            boolean[] zArr = this.A09.A0G;
            int flags = this.A01;
            i5 = zArr[flags] ? 1 : 0;
        }
        if (A07() != null) {
            return i5 | 1073741824;
        }
        return i5;
    }

    public final int A03() {
        if (!this.A06) {
            return this.A05.A05[this.A01];
        }
        return this.A09.A0B[this.A01];
    }

    public final long A05() {
        if (!this.A06) {
            return this.A05.A06[this.A01];
        }
        return this.A09.A0E[this.A02];
    }

    public final long A06() {
        if (!this.A06) {
            long[] jArr = this.A05.A07;
            String[] strArr = A0C;
            if (strArr[1].charAt(6) == strArr[0].charAt(6)) {
                throw new RuntimeException();
            }
            A0C[5] = "mjoQKRu63KzbWmqupbcZb9H";
            return jArr[this.A01];
        }
        C1487bC c1487bC = this.A09;
        if (A0C[2].charAt(2) != 'x') {
            A0C[5] = "Z6Pv8tWM";
            return c1487bC.A00(this.A01);
        }
        A0C[5] = "7ODvdZhwoAjuY5fACjNYPENoE";
        return c1487bC.A00(this.A01);
    }

    public final C1486bB A07() {
        C1486bB c1486bBA00;
        if (!this.A06) {
            return null;
        }
        int i5 = ((C1462an) N1.A0f(this.A09.A06)).A02;
        if (this.A09.A07 != null) {
            c1486bBA00 = this.A09.A07;
        } else {
            c1486bBA00 = this.A05.A03.A00(i5);
        }
        if (c1486bBA00 == null || !c1486bBA00.A03) {
            return null;
        }
        C1486bB encryptionBox = c1486bBA00;
        return encryptionBox;
    }

    public final void A08() {
        this.A09.A01();
        this.A01 = 0;
        this.A02 = 0;
        this.A00 = 0;
        this.A03 = 0;
        this.A06 = false;
    }

    public final void A09() {
        C1486bB c1486bBA07 = A07();
        if (c1486bBA07 == null) {
            return;
        }
        C1084Mk c1084Mk = this.A09.A0H;
        if (c1486bBA07.A00 != 0) {
            c1084Mk.A0g(c1486bBA07.A00);
        }
        boolean zA06 = this.A09.A06(this.A01);
        if (A0C[7].length() != 15) {
            throw new RuntimeException();
        }
        A0C[7] = "ya3ecvWsgH5ZH1e";
        if (zA06) {
            c1084Mk.A0g(c1084Mk.A0M() * 6);
        }
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x0006 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A0A(long j11) {
        for (int i5 = this.A01; i5 < searchIndex && this.A09.A00(i5) <= j11; i5++) {
            if (this.A09.A0G[i5]) {
                this.A03 = i5;
            }
        }
    }

    public final void A0B(DrmInitData drmInitData) {
        C1486bB encryptionBox = this.A05.A03.A00(((C1462an) N1.A0f(this.A09.A06)).A02);
        this.A08.A7E(this.A05.A03.A07.A07().A0u(drmInitData.A01(encryptionBox != null ? encryptionBox.A02 : null)).A14());
    }

    public final void A0C(C1488bD c1488bD, C1462an c1462an) {
        this.A05 = c1488bD;
        this.A04 = c1462an;
        this.A08.A7E(c1488bD.A03.A07);
        A08();
    }

    public final boolean A0D() {
        this.A01++;
        if (!this.A06) {
            return false;
        }
        this.A00++;
        if (this.A00 != this.A09.A0C[this.A02]) {
            return true;
        }
        this.A02++;
        this.A00 = 0;
        return false;
    }
}
