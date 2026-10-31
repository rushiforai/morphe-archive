package com.facebook.ads.redexgen.X;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public class JA implements InterfaceC1958iu {
    public static byte[] A04;
    public static String[] A05 = {"yYJ6SOT3uDFyj2TBTti7WWfRsn28EaA0", "ibfMp1J9gSZsYrxVf4NvaZx8D9JO1QBg", "rjgnGVcZwB7yGoiyculy9B4zYqmoHpCR", b.f42142b, "BFeMqfRovMahqpkErO60kJAdny9RRdno", "ZwvbtEc0kmFFJCTTqnK3GQ6ySyfI7Whf", "3RaP0tr92GxZHPCEm9", "lHI5DV8"};
    public int A00;
    public int A01;
    public int A02;
    public int[] A03;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 83);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A04 = new byte[]{-87, -66, -42, -52, -46, -47, 125, -51, -52, -48, -58, -47, -58, -52, -53, -48, 125, -54, -46, -48, -47, 125, -65, -62, 125, -53, -52, -53, -118, -53, -62, -60, -66, -47, -58, -45, -62, -60, -35, -20, -39, -32, -108, -40, -35, -25, -24, -43, -30, -41, -39, -108, -31, -23, -25, -24, -108, -42, -39, -108, -30, -29, -30, -95, -30, -39, -37, -43, -24, -35, -22, -39};
    }

    static {
        A01();
    }

    public final void A02() {
        if (this.A03 != null) {
            int[] iArr = this.A03;
            if (A05[7].length() != 7) {
                throw new RuntimeException();
            }
            A05[7] = "V5jR13F";
            Arrays.fill(iArr, -1);
        }
        this.A00 = 0;
    }

    public final void A03(int i5, int i11) {
        this.A01 = i5;
        this.A02 = i11;
    }

    public final void A04(C7O c7o, boolean z11) {
        this.A00 = 0;
        if (this.A03 != null) {
            Arrays.fill(this.A03, -1);
        }
        AbstractC1960iw abstractC1960iw = c7o.A06;
        if (c7o.A04 != null && abstractC1960iw != null && abstractC1960iw.A2t()) {
            if (z11) {
                boolean zA0J = c7o.A00.A0J();
                String[] strArr = A05;
                if (strArr[0].charAt(30) != strArr[5].charAt(30)) {
                    A05[7] = "b5aEeD0";
                    if (!zA0J) {
                        abstractC1960iw.A2G(c7o.A04.A0B(), this);
                    }
                }
                throw new RuntimeException();
            }
            if (!c7o.A1y()) {
                abstractC1960iw.A2F(this.A01, this.A02, c7o.A0s, this);
            }
            int i5 = this.A00;
            int i11 = abstractC1960iw.A00;
            String[] strArr2 = A05;
            if (strArr2[3].length() != strArr2[6].length()) {
                A05[7] = "TjVTm35";
                if (i5 > i11) {
                    abstractC1960iw.A00 = this.A00;
                    abstractC1960iw.A08 = z11;
                    c7o.A0r.A0P();
                    return;
                }
                return;
            }
            throw new RuntimeException();
        }
    }

    public final boolean A05(int i5) {
        if (this.A03 != null) {
            int i11 = this.A00 * 2;
            for (int i12 = 0; i12 < i11; i12 += 2) {
                int count = this.A03[i12];
                if (count == i5) {
                    String[] strArr = A05;
                    String str = strArr[0];
                    String str2 = strArr[5];
                    int i13 = str.charAt(30);
                    int count2 = str2.charAt(30);
                    if (i13 == count2) {
                        throw new RuntimeException();
                    }
                    A05[2] = "SVfMGWcG5IEJEA83X9P3956xbutBXkdM";
                    return true;
                }
            }
            return false;
        }
        return false;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1958iu
    public final void A4S(int i5, int i11) {
        if (i5 >= 0) {
            if (i11 >= 0) {
                int i12 = this.A00 * 2;
                if (this.A03 == null) {
                    this.A03 = new int[4];
                    Arrays.fill(this.A03, -1);
                } else {
                    int storagePosition = this.A03.length;
                    if (i12 >= storagePosition) {
                        int[] iArr = this.A03;
                        int storagePosition2 = i12 * 2;
                        this.A03 = new int[storagePosition2];
                        System.arraycopy(iArr, 0, this.A03, 0, iArr.length);
                    }
                }
                this.A03[i12] = i5;
                int storagePosition3 = i12 + 1;
                this.A03[storagePosition3] = i11;
                int storagePosition4 = this.A00;
                this.A00 = storagePosition4 + 1;
                return;
            }
            throw new IllegalArgumentException(A00(37, 35, 33));
        }
        throw new IllegalArgumentException(A00(0, 37, 10));
    }
}
