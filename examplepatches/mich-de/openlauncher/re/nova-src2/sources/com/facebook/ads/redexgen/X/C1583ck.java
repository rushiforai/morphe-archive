package com.facebook.ads.redexgen.X;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.ck, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1583ck {
    public static byte[] A05;
    public static String[] A06 = {b.f42142b, "Ztslnazxor8je3yQ", "LrjEQgLfXaVfUrfJ3FsNA", "g0PlC4cClPaJK", "gqtai4aqees8ko4uRasZLq", "cwDsCyJmQ2vNzOgiixEsI2pICzxZGVFY", "eA3BPdFTk5Npb5ccD3G94", b.f42142b};
    public static final byte[] A07;
    public int A00;
    public int A01;
    public byte[] A02;
    public int A03;
    public boolean A04;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A05, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 121);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A05 = new byte[]{47, 25, 29, 26, 57, 76, 72, 75, 76, 89, -47, -22, -31, -12, -20, -31, -33, -16, -31, -32, -100, -17, -16, -35, -18, -16, -100, -33, -21, -32, -31, -100, -14, -35, -24, -15, -31};
    }

    static {
        A01();
        A07 = new byte[]{0, 0, 1};
    }

    public C1583ck(int i5) {
        this.A02 = new byte[i5];
    }

    public final void A02() {
        this.A04 = false;
        this.A00 = 0;
        this.A03 = 0;
    }

    public final void A03(byte[] bArr, int i5, int i11) {
        if (!this.A04) {
            return;
        }
        int i12 = i11 - i5;
        int length = this.A02.length;
        int readLength = this.A00;
        if (length < readLength + i12) {
            byte[] bArr2 = this.A02;
            int readLength2 = this.A00;
            this.A02 = Arrays.copyOf(bArr2, (readLength2 + i12) * 2);
        }
        byte[] bArr3 = this.A02;
        int readLength3 = this.A00;
        System.arraycopy(bArr, i5, bArr3, readLength3, i12);
        int i13 = this.A00;
        if (A06[4].length() == 11) {
            throw new RuntimeException();
        }
        String[] strArr = A06;
        strArr[2] = "w1mJkV58ydwmQGDuAB0J9";
        strArr[3] = "C0zHqlOqkd4hB";
        this.A00 = i13 + i12;
    }

    public final boolean A04(int i5, int i11) {
        int i12 = this.A03;
        String strA00 = A00(10, 27, 3);
        String strA002 = A00(0, 10, 110);
        switch (i12) {
            case 0:
                if (i5 == 176) {
                    this.A03 = 1;
                    this.A04 = true;
                    break;
                }
                break;
            case 1:
                if (i5 != 181) {
                    MV.A07(strA002, strA00);
                    A02();
                    break;
                } else {
                    this.A03 = 2;
                    break;
                }
            case 2:
                if (i5 > 31) {
                    MV.A07(strA002, strA00);
                    A02();
                    break;
                } else {
                    this.A03 = 3;
                    break;
                }
            case 3:
                if ((i5 & 240) != 32) {
                    MV.A07(strA002, strA00);
                    A02();
                    break;
                } else {
                    this.A01 = this.A00;
                    this.A03 = 4;
                    break;
                }
            case 4:
                if (i5 == 179 || i5 == 181) {
                    this.A00 -= i11;
                    this.A04 = false;
                    return true;
                }
            default:
                throw new IllegalStateException();
        }
        A03(A07, 0, A07.length);
        return false;
    }
}
