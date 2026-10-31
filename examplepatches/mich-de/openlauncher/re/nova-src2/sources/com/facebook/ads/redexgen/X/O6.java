package com.facebook.ads.redexgen.X;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Arrays;
import java.util.Collections;
import org.checkerframework.checker.nullness.qual.EnsuresNonNull;
import org.checkerframework.checker.nullness.qual.RequiresNonNull;

/* loaded from: assets/audience_network/classes.dex */
public final class O6 implements InterfaceC1580ch {
    public static byte[] A0E;
    public static String[] A0F = {"CbcqVeMZcITZtFNWimpvuwuahLhtLYXZ", "29kzKeHhA3C3SOqoer3TQXxbA4Kiq9Rh", "i3Hm0CLNouIA5Ct27jLuzhj7sJKKlOu9", "3Mx", "LY", "OmcmlkJq9Di9uclbn5GDfi7kauo8avZP", "EHo2Ng1BpOfM2fD6qAyAT", "rsOVVWfwWvZhLCQOx2FZq2QQaJwyNbVm"};
    public long A01;
    public ZP A02;
    public C1588cp A03;
    public String A04;
    public boolean A05;
    public final C1594cv A0C;
    public final boolean[] A0D = new boolean[3];
    public final C1589cq A0B = new C1589cq(32, 128);
    public final C1589cq A09 = new C1589cq(33, 128);
    public final C1589cq A07 = new C1589cq(34, 128);
    public final C1589cq A08 = new C1589cq(39, 128);
    public final C1589cq A0A = new C1589cq(40, 128);
    public long A00 = -9223372036854775807L;
    public final C1084Mk A06 = new C1084Mk();

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0E, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 121);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A0E = new byte[]{31, 9, 13, 12, 41, 60, 56, 59, 60, 73, 33, 58, 49, 68, 60, 49, 47, 64, 49, 48, -20, 45, 63, 60, 49, 47, 64, 43, 62, 45, 64, 53, 59, 43, 53, 48, 47, -20, 66, 45, 56, 65, 49, 6, -20, 35, 22, 17, 18, 28, -36, 21, 18, 35, 16};
    }

    static {
        A03();
    }

    public O6(C1594cv c1594cv) {
        this.A0C = c1594cv;
    }

    /* JADX WARN: Code restructure failed: missing block: B:94:0x0265, code lost:
    
        throw new java.lang.RuntimeException();
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static VC A00(String str, C1589cq c1589cq, C1589cq c1589cq2, C1589cq c1589cq3) {
        byte[] bArr = new byte[c1589cq.A00 + c1589cq2.A00 + c1589cq3.A00];
        System.arraycopy(c1589cq.A01, 0, bArr, 0, c1589cq.A00);
        System.arraycopy(c1589cq2.A01, 0, bArr, c1589cq.A00, c1589cq2.A00);
        System.arraycopy(c1589cq3.A01, 0, bArr, c1589cq.A00 + c1589cq2.A00, c1589cq3.A00);
        ZG zg2 = new ZG(c1589cq2.A01, 0, c1589cq2.A00);
        zg2.A07(44);
        int i5 = zg2.A05(3);
        zg2.A06();
        int iA05 = zg2.A05(2);
        boolean zA0A = zg2.A0A();
        int generalProfileCompatibilityFlags = zg2.A05(5);
        int generalLevelIdc = 0;
        int i11 = 0;
        while (true) {
            if (i11 >= 32) {
                break;
            }
            if (zg2.A0A()) {
                generalLevelIdc |= 1 << i11;
            }
            i11++;
        }
        int[] iArr = new int[6];
        for (int i12 = 0; i12 < iArr.length; i12++) {
            iArr[i12] = zg2.A05(8);
        }
        int toSkip = zg2.A05(8);
        int i13 = 0;
        int i14 = 0;
        while (true) {
            if (i14 < i5) {
                boolean zA0A2 = zg2.A0A();
                if (A0F[3].length() == 8) {
                    break;
                }
                A0F[3] = "YgcM4WqDIjoN50hJZK7BrDzFeKRGf";
                if (zA0A2) {
                    i13 += 89;
                }
                if (zg2.A0A()) {
                    i13 += 8;
                }
                i14++;
            } else {
                zg2.A07(i13);
                if (i5 > 0) {
                    zg2.A07((8 - i5) * 2);
                }
                zg2.A04();
                int iA04 = zg2.A04();
                if (iA04 == 3) {
                    zg2.A06();
                }
                int maxSubLayersMinus1 = zg2.A04();
                int picHeightInLumaSamples = zg2.A04();
                if (zg2.A0A()) {
                    int generalProfileSpace = zg2.A04();
                    int iA042 = zg2.A04();
                    int toSkip2 = zg2.A04();
                    int iA043 = zg2.A04();
                    int subHeightC = (iA04 == 1 || iA04 == 2) ? 2 : 1;
                    maxSubLayersMinus1 -= (generalProfileSpace + iA042) * subHeightC;
                    picHeightInLumaSamples -= (toSkip2 + iA043) * (iA04 == 1 ? 2 : 1);
                }
                zg2.A04();
                zg2.A04();
                int i15 = zg2.A04();
                for (int picHeightInLumaSamples2 = zg2.A0A() ? 0 : i5; picHeightInLumaSamples2 <= i5; picHeightInLumaSamples2++) {
                    zg2.A04();
                    zg2.A04();
                    zg2.A04();
                }
                zg2.A04();
                zg2.A04();
                zg2.A04();
                zg2.A04();
                zg2.A04();
                zg2.A04();
                if (zg2.A0A() && zg2.A0A()) {
                    A06(zg2);
                }
                zg2.A07(2);
                boolean scalingListEnabled = zg2.A0A();
                String[] strArr = A0F;
                if (strArr[4].length() == strArr[6].length()) {
                    throw new RuntimeException();
                }
                A0F[5] = "dYITnwNNekWcLXcH7Glmv1nIaQrxavL4";
                if (scalingListEnabled) {
                    zg2.A07(8);
                    zg2.A04();
                    zg2.A04();
                    zg2.A06();
                }
                A07(zg2);
                if (zg2.A0A()) {
                    for (int i16 = 0; i16 < zg2.A04(); i16++) {
                        zg2.A07(i15 + 4 + 1);
                    }
                }
                zg2.A07(2);
                float f11 = 1.0f;
                if (zg2.A0A()) {
                    if (zg2.A0A()) {
                        int iA052 = zg2.A05(8);
                        if (iA052 == 255) {
                            int iA053 = zg2.A05(16);
                            int iA054 = zg2.A05(16);
                            if (iA053 != 0 && iA054 != 0) {
                                f11 = iA053 / iA054;
                            }
                        } else {
                            int chromaFormatIdc = ZE.A04.length;
                            if (iA052 < chromaFormatIdc) {
                                f11 = ZE.A04[iA052];
                            } else {
                                MV.A07(A01(0, 10, 94), A01(10, 35, 83) + iA052);
                            }
                        }
                    }
                    if (zg2.A0A()) {
                        zg2.A06();
                    }
                    if (zg2.A0A()) {
                        zg2.A07(4);
                        if (zg2.A0A()) {
                            zg2.A07(24);
                        }
                    }
                    if (zg2.A0A()) {
                        zg2.A04();
                        String[] strArr2 = A0F;
                        if (strArr2[4].length() != strArr2[6].length()) {
                            A0F[3] = b.f42142b;
                            zg2.A04();
                        }
                    }
                    zg2.A06();
                    if (zg2.A0A()) {
                        picHeightInLumaSamples *= 2;
                    }
                }
                return new C1029Ke().A0y(str).A11(A01(45, 10, 52)).A0w(Lv.A03(iA05, zA0A, generalProfileCompatibilityFlags, generalLevelIdc, iArr, toSkip)).A0r(maxSubLayersMinus1).A0f(picHeightInLumaSamples).A0Y(f11).A12(Collections.singletonList(bArr)).A14();
            }
        }
    }

    @EnsuresNonNull
    private void A02() {
        AbstractC1062Ln.A02(this.A02);
    }

    @RequiresNonNull
    private void A04(long j11, int i5, int i11, long j12) {
        this.A03.A05(j11, i5, this.A05);
        if (!this.A05) {
            this.A0B.A04(i11);
            this.A09.A04(i11);
            this.A07.A04(i11);
            if (this.A0B.A03() && this.A09.A03() && this.A07.A03()) {
                this.A02.A7E(A00(this.A04, this.A0B, this.A09, this.A07));
                this.A05 = true;
            }
        }
        if (this.A08.A04(i11)) {
            int iA02 = ZE.A02(this.A08.A01, this.A08.A00);
            C1084Mk c1084Mk = this.A06;
            if (A0F[5].charAt(29) != 'v') {
                throw new RuntimeException();
            }
            String[] strArr = A0F;
            strArr[4] = "20";
            strArr[6] = "ouyj7ZGHdueUcsFAx6xq9";
            c1084Mk.A0j(this.A08.A01, iA02);
            this.A06.A0g(5);
            this.A0C.A02(j12, this.A06);
        }
        C1589cq c1589cq = this.A0A;
        if (A0F[5].charAt(29) != 'v') {
            throw new RuntimeException();
        }
        String[] strArr2 = A0F;
        strArr2[1] = "neXRZElxjMn6hJ6d25KRCyi4OfcVmles";
        strArr2[0] = "97iYtqDlRXoqBp4YWI39vVXATG2bNt9l";
        if (c1589cq.A04(i11)) {
            this.A06.A0j(this.A0A.A01, ZE.A02(this.A0A.A01, this.A0A.A00));
            this.A06.A0g(5);
            this.A0C.A02(j12, this.A06);
        }
    }

    @RequiresNonNull
    private void A05(long j11, int i5, int i11, long j12) {
        this.A03.A04(j11, i5, i11, j12, this.A05);
        if (!this.A05) {
            this.A0B.A01(i11);
            this.A09.A01(i11);
            this.A07.A01(i11);
        }
        this.A08.A01(i11);
        this.A0A.A01(i11);
    }

    public static void A06(ZG zg2) {
        int i5 = 0;
        while (true) {
            String[] strArr = A0F;
            String str = strArr[4];
            String str2 = strArr[6];
            int length = str.length();
            int sizeId = str2.length();
            if (length == sizeId) {
                throw new RuntimeException();
            }
            A0F[5] = "gy4Ab9uqHgQsI8KELBsGaRF1ZFdb2vFi";
            if (i5 < 4) {
                int i11 = 0;
                while (i11 < 6) {
                    int matrixId = 1;
                    if (!zg2.A0A()) {
                        zg2.A04();
                    } else {
                        int sizeId2 = i5 << 1;
                        int iMin = Math.min(64, 1 << (sizeId2 + 4));
                        if (i5 > 1) {
                            zg2.A03();
                        }
                        for (int sizeId3 = 0; sizeId3 < iMin; sizeId3++) {
                            zg2.A03();
                        }
                    }
                    if (i5 == 3) {
                        matrixId = 3;
                    }
                    i11 += matrixId;
                }
                i5++;
            } else {
                return;
            }
        }
    }

    public static void A07(ZG zg2) {
        int iA04 = zg2.A04();
        boolean zA0A = false;
        int i5 = 0;
        for (int numPositivePics = 0; numPositivePics < iA04; numPositivePics++) {
            if (numPositivePics != 0) {
                zA0A = zg2.A0A();
            }
            if (zA0A) {
                zg2.A06();
                zg2.A04();
                for (int i11 = 0; i11 <= i5; i11++) {
                    if (zg2.A0A()) {
                        zg2.A06();
                    }
                }
            } else {
                int j11 = zg2.A04();
                int stRpsIdx = zg2.A04();
                i5 = j11 + stRpsIdx;
                if (A0F[3].length() == 8) {
                    throw new RuntimeException();
                }
                A0F[3] = "5hTei";
                for (int numShortTermRefPicSets = 0; numShortTermRefPicSets < j11; numShortTermRefPicSets++) {
                    zg2.A04();
                    zg2.A06();
                }
                for (int numShortTermRefPicSets2 = 0; numShortTermRefPicSets2 < stRpsIdx; numShortTermRefPicSets2++) {
                    zg2.A04();
                    zg2.A06();
                }
            }
        }
    }

    @RequiresNonNull
    private void A08(byte[] bArr, int i5, int i11) {
        this.A03.A06(bArr, i5, i11);
        if (!this.A05) {
            this.A0B.A02(bArr, i5, i11);
            this.A09.A02(bArr, i5, i11);
            this.A07.A02(bArr, i5, i11);
        }
        this.A08.A02(bArr, i5, i11);
        this.A0A.A02(bArr, i5, i11);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1580ch
    public final void A5j(C1084Mk c1084Mk) {
        A02();
        while (c1084Mk.A07() > 0) {
            int iA09 = c1084Mk.A09();
            int iA0A = c1084Mk.A0A();
            byte[] bArrA0l = c1084Mk.A0l();
            long j11 = this.A01;
            int offset = c1084Mk.A07();
            this.A01 = j11 + offset;
            ZP zp2 = this.A02;
            int offset2 = c1084Mk.A07();
            zp2.AK9(c1084Mk, offset2);
            while (iA09 < iA0A) {
                int iA04 = ZE.A04(bArrA0l, iA09, iA0A, this.A0D);
                if (iA04 == iA0A) {
                    A08(bArrA0l, iA09, iA0A);
                    return;
                }
                int bytesWrittenPastPosition = ZE.A00(bArrA0l, iA04);
                int i5 = iA04 - iA09;
                if (i5 > 0) {
                    A08(bArrA0l, iA09, iA04);
                }
                int lengthToNalUnit = iA0A - iA04;
                long j12 = this.A01 - lengthToNalUnit;
                int offset3 = i5 < 0 ? -i5 : 0;
                A04(j12, lengthToNalUnit, offset3, this.A00);
                long absolutePosition = this.A00;
                A05(j12, lengthToNalUnit, bytesWrittenPastPosition, absolutePosition);
                iA09 = iA04 + 3;
            }
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1580ch
    public final void A6B(InterfaceC1384Yw interfaceC1384Yw, C1601d2 c1601d2) {
        c1601d2.A05();
        this.A04 = c1601d2.A04();
        this.A02 = interfaceC1384Yw.ALm(c1601d2.A03(), 2);
        this.A03 = new C1588cp(this.A02);
        this.A0C.A03(interfaceC1384Yw, c1601d2);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1580ch
    public final void AI2() {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1580ch
    public final void AI3(long j11, int i5) {
        if (j11 != -9223372036854775807L) {
            this.A00 = j11;
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1580ch
    public final void AKN() {
        this.A01 = 0L;
        this.A00 = -9223372036854775807L;
        ZE.A0H(this.A0D);
        this.A0B.A00();
        this.A09.A00();
        this.A07.A00();
        this.A08.A00();
        this.A0A.A00();
        if (this.A03 != null) {
            this.A03.A03();
        }
    }
}
