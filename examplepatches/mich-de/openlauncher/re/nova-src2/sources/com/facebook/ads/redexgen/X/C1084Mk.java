package com.facebook.ads.redexgen.X;

import java.nio.charset.Charset;
import java.util.Arrays;
import java.util.Set;

/* renamed from: com.facebook.ads.redexgen.X.Mk, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1084Mk {
    public static byte[] A03;
    public static String[] A04 = {"w79GyGrR0KXUdyFlczXBOTQInBnsQT1J", "2vAWxnWp80wcwxFT2Voy", "m6eGOomlOcNAqPaawDA549Nz30e9XDec", "VRJoFU", "A4uXGTqATj5dLaCvvqORM87O5fPLlpk", "nCDPpg", "eNTE3gMtXrndnAE4XZKbfreU0xB4XrZ", "2Y5RseltTvKkT1bBSOX1"};
    public static final Set<Charset> A05;
    public static final char[] A06;
    public static final char[] A07;
    public byte[] A00;
    public int A01;
    public int A02;

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 14);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A03 = new byte[]{-102, -65, -57, -78, -67, -70, -75, 113, -90, -91, -105, 126, -119, 113, -60, -74, -62, -58, -74, -65, -76, -74, 113, -76, -64, -65, -59, -70, -65, -58, -78, -59, -70, -64, -65, 113, -77, -54, -59, -74, -117, 113, -103, -66, -58, -79, -68, -71, -76, 112, -91, -92, -106, 125, -120, 112, -61, -75, -63, -59, -75, -66, -77, -75, 112, -74, -71, -62, -61, -60, 112, -78, -55, -60, -75, -118, 112, -78, -51, -50, 126, -64, -57, -46, 126, -52, -51, -46, 126, -40, -61, -48, -51, -104, 126, 114, -117, -112, -110, -115, -115, -116, -113, -111, -126, -127, 61, -128, -123, 126, -113, -112, -126, -111, 87, 61};
    }

    static {
        A04();
        A06 = new char[]{'\r', '\n'};
        A07 = new char[]{'\n'};
        A05 = XR.A05(XA.A01, XA.A05, XA.A02, XA.A03, XA.A04);
    }

    public C1084Mk() {
        this.A00 = N1.A07;
    }

    public C1084Mk(int i5) {
        this.A00 = new byte[i5];
        this.A01 = i5;
    }

    public C1084Mk(byte[] bArr) {
        this.A00 = bArr;
        this.A01 = bArr.length;
    }

    public C1084Mk(byte[] bArr, int i5) {
        this.A00 = bArr;
        this.A01 = i5;
    }

    private char A00(Charset charset, char[] cArr) {
        char cA01;
        int i5;
        if ((charset.equals(XA.A05) || charset.equals(XA.A01)) && A07() >= 1) {
            cA01 = C3C.A01(AnonymousClass36.A00(this.A00[this.A02]));
            i5 = 1;
        } else if ((charset.equals(XA.A02) || charset.equals(XA.A03)) && A07() >= 2) {
            cA01 = C3C.A00(this.A00[this.A02], this.A00[this.A02 + 1]);
            i5 = 2;
        } else {
            if (!charset.equals(XA.A04) || A07() < 2) {
                return (char) 0;
            }
            cA01 = C3C.A00(this.A00[this.A02 + 1], this.A00[this.A02]);
            i5 = 2;
        }
        if (!C3C.A04(cArr, cA01)) {
            return (char) 0;
        }
        this.A02 += i5;
        char character = C3C.A01(cA01);
        return character;
    }

    /* JADX WARN: Incorrect condition in loop: B:9:0x0018 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private int A01(Charset charset) {
        int i5;
        if (charset.equals(XA.A05) || charset.equals(XA.A01)) {
            i5 = 1;
        } else if (charset.equals(XA.A02) || charset.equals(XA.A04) || charset.equals(XA.A03)) {
            i5 = 2;
        } else {
            throw new IllegalArgumentException(A03(95, 21, 15) + charset);
        }
        for (int i11 = this.A02; i11 < i - (i5 - 1); i11 += i5) {
            if ((charset.equals(XA.A05) || charset.equals(XA.A01)) && N1.A16(this.A00[i11])) {
                return i11;
            }
            if ((charset.equals(XA.A02) || charset.equals(XA.A03)) && this.A00[i11] == 0) {
                byte b11 = this.A00[i11 + 1];
                String[] strArr = A04;
                String str = strArr[6];
                String str2 = strArr[4];
                int i12 = str.length();
                if (i12 != str2.length()) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A04;
                strArr2[3] = "dDv4NF";
                strArr2[5] = "aUmEKi";
                if (N1.A16(b11)) {
                    return i11;
                }
            }
            if (charset.equals(XA.A04) && this.A00[i11 + 1] == 0 && N1.A16(this.A00[i11])) {
                return i11;
            }
        }
        int stride = this.A01;
        return stride;
    }

    /* JADX WARN: Incorrect condition in loop: B:8:0x000c */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private final String A02(char c11) {
        if (A07() == 0) {
            return null;
        }
        int i5 = this.A02;
        while (i5 < stringLimit) {
            int stringLimit = this.A00[i5];
            if (stringLimit == c11) {
                break;
            }
            i5++;
        }
        byte[] bArr = this.A00;
        int i11 = this.A02;
        int stringLimit2 = this.A02;
        String strA0r = N1.A0r(bArr, i11, i5 - stringLimit2);
        this.A02 = i5;
        int i12 = this.A02;
        int stringLimit3 = this.A01;
        if (i12 < stringLimit3) {
            int stringLimit4 = this.A02;
            this.A02 = stringLimit4 + 1;
        }
        return strA0r;
    }

    private void A05(Charset charset) {
        if (A00(charset, A06) == '\r') {
            A00(charset, A07);
        }
    }

    public final double A06() {
        return Double.longBitsToDouble(A0P());
    }

    public final int A07() {
        return this.A01 - this.A02;
    }

    public final int A08() {
        return this.A00.length;
    }

    public final int A09() {
        return this.A02;
    }

    public final int A0A() {
        return this.A01;
    }

    public final int A0B() {
        return this.A00[this.A02] & 255;
    }

    public final int A0C() {
        byte[] bArr = this.A00;
        int i5 = this.A02;
        this.A02 = i5 + 1;
        int i11 = (bArr[i5] & 255) << 24;
        byte[] bArr2 = this.A00;
        int i12 = this.A02;
        this.A02 = i12 + 1;
        int i13 = i11 | ((bArr2[i12] & 255) << 16);
        byte[] bArr3 = this.A00;
        int i14 = this.A02;
        this.A02 = i14 + 1;
        int i15 = i13 | ((bArr3[i14] & 255) << 8);
        byte[] bArr4 = this.A00;
        int i16 = this.A02;
        this.A02 = i16 + 1;
        return i15 | (bArr4[i16] & 255);
    }

    public final int A0D() {
        byte[] bArr = this.A00;
        int i5 = this.A02;
        this.A02 = i5 + 1;
        int i11 = ((bArr[i5] & 255) << 24) >> 8;
        byte[] bArr2 = this.A00;
        int i12 = this.A02;
        this.A02 = i12 + 1;
        int i13 = i11 | ((bArr2[i12] & 255) << 8);
        byte[] bArr3 = this.A00;
        int i14 = this.A02;
        this.A02 = i14 + 1;
        return i13 | (bArr3[i14] & 255);
    }

    public final int A0E() {
        byte[] bArr = this.A00;
        int i5 = this.A02;
        this.A02 = i5 + 1;
        int i11 = bArr[i5] & 255;
        byte[] bArr2 = this.A00;
        int i12 = this.A02;
        this.A02 = i12 + 1;
        int i13 = i11 | ((bArr2[i12] & 255) << 8);
        byte[] bArr3 = this.A00;
        int i14 = this.A02;
        this.A02 = i14 + 1;
        int i15 = i13 | ((bArr3[i14] & 255) << 16);
        byte[] bArr4 = this.A00;
        int i16 = this.A02;
        this.A02 = i16 + 1;
        return i15 | ((bArr4[i16] & 255) << 24);
    }

    public final int A0F() {
        int iA0E = A0E();
        if (iA0E >= 0) {
            return iA0E;
        }
        throw new IllegalStateException(A03(77, 18, 80) + iA0E);
    }

    public final int A0G() {
        byte[] bArr = this.A00;
        int i5 = this.A02;
        this.A02 = i5 + 1;
        int i11 = bArr[i5] & 255;
        byte[] bArr2 = this.A00;
        int i12 = this.A02;
        this.A02 = i12 + 1;
        return i11 | ((bArr2[i12] & 255) << 8);
    }

    public final int A0H() {
        int b22 = A0I();
        int b12 = A0I();
        int b42 = A0I();
        int b32 = A0I();
        int b23 = (b22 << 21) | (b12 << 14);
        int b13 = b42 << 7;
        return b23 | b13 | b32;
    }

    public final int A0I() {
        byte[] bArr = this.A00;
        int i5 = this.A02;
        this.A02 = i5 + 1;
        return bArr[i5] & 255;
    }

    public final int A0J() {
        byte[] bArr = this.A00;
        int i5 = this.A02;
        this.A02 = i5 + 1;
        int i11 = (bArr[i5] & 255) << 8;
        byte[] bArr2 = this.A00;
        int i12 = this.A02;
        this.A02 = i12 + 1;
        int i13 = i11 | (bArr2[i12] & 255);
        int result = this.A02;
        this.A02 = result + 2;
        return i13;
    }

    public final int A0K() {
        byte[] bArr = this.A00;
        int i5 = this.A02;
        this.A02 = i5 + 1;
        int i11 = (bArr[i5] & 255) << 16;
        byte[] bArr2 = this.A00;
        int i12 = this.A02;
        this.A02 = i12 + 1;
        int i13 = i11 | ((bArr2[i12] & 255) << 8);
        byte[] bArr3 = this.A00;
        int i14 = this.A02;
        this.A02 = i14 + 1;
        return i13 | (bArr3[i14] & 255);
    }

    public final int A0L() {
        int iA0C = A0C();
        if (iA0C >= 0) {
            return iA0C;
        }
        throw new IllegalStateException(A03(77, 18, 80) + iA0C);
    }

    public final int A0M() {
        byte[] bArr = this.A00;
        int i5 = this.A02;
        this.A02 = i5 + 1;
        int i11 = (bArr[i5] & 255) << 8;
        byte[] bArr2 = this.A00;
        int i12 = this.A02;
        this.A02 = i12 + 1;
        return i11 | (bArr2[i12] & 255);
    }

    public final long A0N() {
        byte[] bArr = this.A00;
        this.A02 = this.A02 + 1;
        long j11 = bArr[r1] & 255;
        byte[] bArr2 = this.A00;
        this.A02 = this.A02 + 1;
        long j12 = j11 | ((bArr2[r1] & 255) << 8);
        byte[] bArr3 = this.A00;
        this.A02 = this.A02 + 1;
        long j13 = j12 | ((bArr3[r1] & 255) << 16);
        byte[] bArr4 = this.A00;
        this.A02 = this.A02 + 1;
        long j14 = j13 | ((bArr4[r1] & 255) << 24);
        byte[] bArr5 = this.A00;
        this.A02 = this.A02 + 1;
        long j15 = j14 | ((bArr5[r1] & 255) << 32);
        byte[] bArr6 = this.A00;
        this.A02 = this.A02 + 1;
        long j16 = j15 | ((bArr6[r1] & 255) << 40);
        byte[] bArr7 = this.A00;
        this.A02 = this.A02 + 1;
        long j17 = j16 | ((bArr7[r1] & 255) << 48);
        byte[] bArr8 = this.A00;
        this.A02 = this.A02 + 1;
        return j17 | ((255 & bArr8[r1]) << 56);
    }

    public final long A0O() {
        byte[] bArr = this.A00;
        this.A02 = this.A02 + 1;
        long j11 = bArr[r1] & 255;
        byte[] bArr2 = this.A00;
        this.A02 = this.A02 + 1;
        long j12 = j11 | ((bArr2[r1] & 255) << 8);
        byte[] bArr3 = this.A00;
        this.A02 = this.A02 + 1;
        long j13 = j12 | ((bArr3[r1] & 255) << 16);
        byte[] bArr4 = this.A00;
        this.A02 = this.A02 + 1;
        return j13 | ((255 & bArr4[r1]) << 24);
    }

    public final long A0P() {
        byte[] bArr = this.A00;
        this.A02 = this.A02 + 1;
        long j11 = (bArr[r1] & 255) << 56;
        byte[] bArr2 = this.A00;
        this.A02 = this.A02 + 1;
        long j12 = j11 | ((bArr2[r1] & 255) << 48);
        byte[] bArr3 = this.A00;
        this.A02 = this.A02 + 1;
        long j13 = j12 | ((bArr3[r1] & 255) << 40);
        byte[] bArr4 = this.A00;
        this.A02 = this.A02 + 1;
        long j14 = j13 | ((bArr4[r1] & 255) << 32);
        byte[] bArr5 = this.A00;
        this.A02 = this.A02 + 1;
        long j15 = j14 | ((bArr5[r1] & 255) << 24);
        byte[] bArr6 = this.A00;
        this.A02 = this.A02 + 1;
        long j16 = j15 | ((bArr6[r1] & 255) << 16);
        byte[] bArr7 = this.A00;
        this.A02 = this.A02 + 1;
        long j17 = j16 | ((bArr7[r1] & 255) << 8);
        byte[] bArr8 = this.A00;
        this.A02 = this.A02 + 1;
        return j17 | (255 & bArr8[r1]);
    }

    public final long A0Q() {
        byte[] bArr = this.A00;
        this.A02 = this.A02 + 1;
        long j11 = (bArr[r1] & 255) << 24;
        byte[] bArr2 = this.A00;
        this.A02 = this.A02 + 1;
        long j12 = j11 | ((bArr2[r1] & 255) << 16);
        byte[] bArr3 = this.A00;
        this.A02 = this.A02 + 1;
        long j13 = j12 | ((bArr3[r1] & 255) << 8);
        byte[] bArr4 = this.A00;
        this.A02 = this.A02 + 1;
        return j13 | (255 & bArr4[r1]);
    }

    public final long A0R() {
        long jA0P = A0P();
        if (jA0P >= 0) {
            return jA0P;
        }
        throw new IllegalStateException(A03(77, 18, 80) + jA0P);
    }

    public final long A0S() {
        int i5 = 0;
        byte[] bArr = this.A00;
        int length = this.A02;
        long value = bArr[length];
        int i11 = 7;
        while (true) {
            if (i11 < 0) {
                break;
            }
            int length2 = 1 << i11;
            if ((length2 & value) != 0) {
                i11--;
            } else if (i11 < 6) {
                int length3 = 1 << i11;
                value &= length3 - 1;
                i5 = 7 - i11;
            } else if (i11 == 7) {
                i5 = 1;
            }
        }
        if (i5 != 0) {
            for (int x11 = 1; x11 < i5; x11++) {
                byte[] bArr2 = this.A00;
                int length4 = this.A02;
                int i12 = bArr2[length4 + x11];
                int i13 = i12 & 192;
                if (i13 == 128) {
                    int length5 = i12 & 63;
                    value = (value << 6) | length5;
                } else {
                    throw new NumberFormatException(A03(0, 42, 67) + value);
                }
            }
            int length6 = this.A02;
            this.A02 = length6 + i5;
            return value;
        }
        throw new NumberFormatException(A03(42, 35, 66) + value);
    }

    public final String A0T() {
        return A0Y(XA.A05);
    }

    public final String A0U() {
        return A02((char) 0);
    }

    public final String A0V(int i5) {
        if (i5 == 0) {
            return A03(0, 0, 38);
        }
        int i11 = i5;
        int stringLength = this.A02;
        int lastIndex = (stringLength + i5) - 1;
        int stringLength2 = this.A01;
        if (lastIndex < stringLength2) {
            int stringLength3 = this.A00[lastIndex];
            if (stringLength3 == 0) {
                i11--;
            }
        }
        byte[] bArr = this.A00;
        int stringLength4 = this.A02;
        String strA0r = N1.A0r(bArr, stringLength4, i11);
        int stringLength5 = this.A02;
        this.A02 = stringLength5 + i5;
        return strA0r;
    }

    public final String A0W(int i5) {
        return A0X(i5, XA.A05);
    }

    public final String A0X(int i5, Charset charset) {
        String str = new String(this.A00, this.A02, i5, charset);
        this.A02 += i5;
        return str;
    }

    public final String A0Y(Charset charset) {
        AbstractC1062Ln.A09(A05.contains(charset), A03(95, 21, 15) + charset);
        if (A07() == 0) {
            return null;
        }
        if (!charset.equals(XA.A01)) {
            A0Z();
        }
        int iA01 = A01(charset);
        int lineLimit = this.A02;
        String strA0X = A0X(iA01 - lineLimit, charset);
        int i5 = this.A02;
        int lineLimit2 = this.A01;
        if (i5 == lineLimit2) {
            return strA0X;
        }
        A05(charset);
        return strA0X;
    }

    public final Charset A0Z() {
        if (A07() >= 3 && this.A00[this.A02] == -17 && this.A00[this.A02 + 1] == -69 && this.A00[this.A02 + 2] == -65) {
            this.A02 += 3;
            return XA.A05;
        }
        if (A07() >= 2) {
            if (this.A00[this.A02] == -2 && this.A00[this.A02 + 1] == -1) {
                this.A02 += 2;
                return XA.A03;
            }
            if (this.A00[this.A02] == -1 && this.A00[this.A02 + 1] == -2) {
                this.A02 += 2;
                return XA.A04;
            }
            return null;
        }
        return null;
    }

    public final short A0a() {
        byte[] bArr = this.A00;
        int i5 = this.A02;
        this.A02 = i5 + 1;
        int i11 = bArr[i5] & 255;
        byte[] bArr2 = this.A00;
        int i12 = this.A02;
        this.A02 = i12 + 1;
        return (short) (i11 | ((bArr2[i12] & 255) << 8));
    }

    public final short A0b() {
        byte[] bArr = this.A00;
        int i5 = this.A02;
        this.A02 = i5 + 1;
        int i11 = (bArr[i5] & 255) << 8;
        byte[] bArr2 = this.A00;
        int i12 = this.A02;
        this.A02 = i12 + 1;
        return (short) (i11 | (bArr2[i12] & 255));
    }

    public final void A0c(int i5) {
        if (i5 > A08()) {
            this.A00 = Arrays.copyOf(this.A00, i5);
        }
    }

    public final void A0d(int i5) {
        A0j(A08() < i5 ? new byte[i5] : this.A00, i5);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x001c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A0e(int i5) {
        boolean z11;
        if (i5 >= 0) {
            byte[] bArr = this.A00;
            String[] strArr = A04;
            if (strArr[7].length() != strArr[1].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A04;
            strArr2[0] = "vXPGM4oYuMhP8cn0sKMu98erHclfQUXK";
            strArr2[2] = "0htGrTtOmHJaUq6aJPI9T2s360ZxgZpc";
            z11 = i5 <= bArr.length;
        }
        AbstractC1062Ln.A07(z11);
        this.A01 = i5;
    }

    public final void A0f(int i5) {
        AbstractC1062Ln.A07(i5 >= 0 && i5 <= this.A01);
        String[] strArr = A04;
        if (strArr[0].charAt(3) != strArr[2].charAt(3)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A04;
        strArr2[0] = "XgOG9slgQTcdepqBCUxoFpnj4sip3HLE";
        strArr2[2] = "W3LGnL2r3Pk4TC9VMdmiPxsj9G2St223";
        this.A02 = i5;
    }

    public final void A0g(int i5) {
        A0f(this.A02 + i5);
    }

    public final void A0h(C1083Mj c1083Mj, int i5) {
        A0k(c1083Mj.A00, 0, i5);
        c1083Mj.A08(0);
    }

    public final void A0i(byte[] bArr) {
        A0j(bArr, bArr.length);
    }

    public final void A0j(byte[] bArr, int i5) {
        this.A00 = bArr;
        this.A01 = i5;
        this.A02 = 0;
    }

    public final void A0k(byte[] bArr, int i5, int i11) {
        System.arraycopy(this.A00, this.A02, bArr, i5, i11);
        this.A02 += i11;
    }

    public final byte[] A0l() {
        return this.A00;
    }
}
