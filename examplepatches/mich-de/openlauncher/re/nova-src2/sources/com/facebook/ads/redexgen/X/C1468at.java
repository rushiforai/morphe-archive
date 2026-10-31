package com.facebook.ads.redexgen.X;

import com.facebook.ads.androidx.media3.common.DrmInitData;

/* renamed from: com.facebook.ads.redexgen.X.at, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1468at {
    public static String[] A0A = {"hn1FHZJnLh3thuxxKEIhZTqnlh5aWEbw", "qDjh889adJz1MC", "vY3CRqHO1bVmmLT8Hq7gqQ8FFHoNB", "cMHnnSo25D50Rxc59rDVSvzIsgO5hE1C", "TK2vIC7x9g9unoc", "GEWgj", "ZHEG6A7QvYcS4oy88WRiW8fDIFxtCxmZ", "QYDDDh5QI"};
    public int A00;
    public int A01;
    public int A02;
    public int A03;
    public C1462an A04;
    public C1485bA A05;
    public final ZP A06;
    public final C1487bC A07 = new C1487bC();
    public final C1084Mk A09 = new C1084Mk(1);
    public final C1084Mk A08 = new C1084Mk();

    public C1468at(ZP zp2) {
        this.A06 = zp2;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public C1486bB A00() {
        C1486bB c1486bBA00;
        int i5 = this.A07.A06.A02;
        if (this.A07.A07 != null) {
            c1486bBA00 = this.A07.A07;
        } else {
            c1486bBA00 = this.A05.A00(i5);
        }
        if (c1486bBA00 != null) {
            boolean z11 = c1486bBA00.A03;
            String[] strArr = A0A;
            String str = strArr[1];
            String str2 = strArr[4];
            int length = str.length();
            int sampleDescriptionIndex = str2.length();
            if (length == sampleDescriptionIndex) {
                throw new RuntimeException();
            }
            A0A[6] = "M7WQN7echjzu5PJ9kXxaPiCmmnvjA1W3";
            if (z11) {
                return c1486bBA00;
            }
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A02() {
        C1486bB c1486bBA00 = A00();
        if (c1486bBA00 == null) {
            return;
        }
        C1487bC c1487bC = this.A07;
        if (A0A[3].charAt(17) != 'r') {
            throw new RuntimeException();
        }
        A0A[6] = "2xb7HPeFQWra9WDOakKd0dOCmGEctuq2";
        C1084Mk sampleEncryptionData = c1487bC.A0H;
        if (c1486bBA00.A00 != 0) {
            sampleEncryptionData.A0g(c1486bBA00.A00);
        }
        if (this.A07.A06(this.A01)) {
            sampleEncryptionData.A0g(sampleEncryptionData.A0M() * 6);
        }
    }

    public final int A04() {
        C1084Mk c1084Mk;
        int vectorSize;
        C1486bB c1486bBA00 = A00();
        if (c1486bBA00 == null) {
            return 0;
        }
        if (c1486bBA00.A00 != 0) {
            c1084Mk = this.A07.A0H;
            vectorSize = c1486bBA00.A00;
        } else {
            byte[] initVectorData = c1486bBA00.A04;
            this.A08.A0j(initVectorData, initVectorData.length);
            c1084Mk = this.A08;
            vectorSize = initVectorData.length;
        }
        boolean zA06 = this.A07.A06(this.A01);
        this.A09.A00[0] = (byte) ((zA06 ? 128 : 0) | vectorSize);
        this.A09.A0f(0);
        ZP zp2 = this.A06;
        C1084Mk initializationVectorData = this.A09;
        zp2.AK9(initializationVectorData, 1);
        this.A06.AK9(c1084Mk, vectorSize);
        if (!zA06) {
            return vectorSize + 1;
        }
        C1084Mk c1084Mk2 = this.A07.A0H;
        int iA0M = c1084Mk2.A0M();
        c1084Mk2.A0g(-2);
        int i5 = (iA0M * 6) + 2;
        this.A06.AK9(c1084Mk2, i5);
        return vectorSize + 1 + i5;
    }

    public final void A05() {
        this.A07.A01();
        this.A01 = 0;
        this.A02 = 0;
        this.A00 = 0;
        this.A03 = 0;
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x0006 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A06(long j11) {
        for (int i5 = this.A01; i5 < searchIndex && this.A07.A00(i5) < j11; i5++) {
            C1487bC c1487bC = this.A07;
            if (A0A[6].charAt(17) == 'a') {
                throw new RuntimeException();
            }
            String[] strArr = A0A;
            strArr[5] = "UiDsF";
            strArr[7] = "D9RX4x7Ey";
            if (c1487bC.A0G[i5]) {
                this.A03 = i5;
            }
        }
    }

    public final void A07(DrmInitData drmInitData) {
        C1486bB encryptionBox = this.A05.A00(this.A07.A06.A02);
        this.A06.A7E(this.A05.A07.A09(drmInitData.A01(encryptionBox != null ? encryptionBox.A02 : null)));
    }

    public final void A08(C1485bA c1485bA, C1462an c1462an) {
        this.A05 = (C1485bA) AbstractC1062Ln.A01(c1485bA);
        this.A04 = (C1462an) AbstractC1062Ln.A01(c1462an);
        this.A06.A7E(c1485bA.A07);
        A05();
    }

    public final boolean A09() {
        this.A01++;
        this.A00++;
        if (this.A00 != this.A07.A0C[this.A02]) {
            return true;
        }
        this.A02++;
        this.A00 = 0;
        return false;
    }
}
