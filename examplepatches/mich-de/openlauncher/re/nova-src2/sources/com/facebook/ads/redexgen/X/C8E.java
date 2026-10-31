package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.8E, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C8E implements PG {
    public static byte[] A04;
    public static String[] A05 = {"bA4e1z6As", "c3N1v1uaCfxav4Mw3HMG2AQN8swT9mR", "lUu1rO4zNqXJ4ryfhGc2NKn2fiD0uwNg", "YBEtGvAC1dTSw64hRsmMPn68ptyvPiKl", "FIfb8FnnDVgfBaCjZPhXOUWw0EPTPdMZ", "2ykuuNLiacMWDPAdKRmEygel4j9Z7QqQ", "bNTQkpbEj", "DmYGMWHLpnfjbXb4W2CAsypnKs6pLMqu"};
    public final long A00;
    public final long A01;
    public final long[] A02;
    public final long[] A03;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public static C8E A00(long j11, long j12, Z9 z92, C1084Mk c1084Mk) {
        int iA0I;
        long j13 = j12;
        c1084Mk.A0g(10);
        int iA0C = c1084Mk.A0C();
        if (iA0C <= 0) {
            return null;
        }
        int i5 = z92.A03;
        long jA0U = N1.A0U(iA0C, (i5 >= 32000 ? 1152 : 576) * 1000000, i5);
        int iA0M = c1084Mk.A0M();
        int iA0M2 = c1084Mk.A0M();
        int iA0M3 = c1084Mk.A0M();
        c1084Mk.A0g(2);
        long j14 = j13 + z92.A02;
        String[] strArr = A05;
        if (strArr[6].length() != strArr[0].length()) {
            throw new RuntimeException();
        }
        A05[1] = "jjhEcnRvoL";
        long[] jArr = new long[iA0M];
        long[] jArr2 = new long[iA0M];
        for (int i11 = 0; i11 < iA0M; i11++) {
            jArr[i11] = (i11 * jA0U) / iA0M;
            jArr2[i11] = Math.max(j13, j14);
            switch (iA0M3) {
                case 1:
                    iA0I = c1084Mk.A0I();
                    break;
                case 2:
                    iA0I = c1084Mk.A0M();
                    break;
                case 3:
                    iA0I = c1084Mk.A0K();
                    break;
                case 4:
                    iA0I = c1084Mk.A0L();
                    break;
                default:
                    if (A05[2].charAt(9) == 'K') {
                        throw new RuntimeException();
                    }
                    A05[1] = "atFuU";
                    return null;
            }
            j13 += iA0I * iA0M2;
        }
        if (j11 != -1 && j11 != j13) {
            MV.A07(A01(27, 10, 71), A01(2, 25, 102) + j11 + A01(0, 2, 60) + j13);
        }
        return new C8E(jArr, jArr2, jA0U, j13);
    }

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 13);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A04 = new byte[]{117, 105, -55, -75, -59, -68, -109, -41, -44, -25, -44, -109, -26, -36, -19, -40, -109, -32, -36, -26, -32, -44, -25, -42, -37, -83, -109, -86, -74, -58, -67, -89, -71, -71, -65, -71, -58};
    }

    static {
        A02();
    }

    public C8E(long[] jArr, long[] jArr2, long j11, long j12) {
        this.A03 = jArr;
        this.A02 = jArr2;
        this.A01 = j11;
        this.A00 = j12;
    }

    @Override // com.facebook.ads.redexgen.X.PG
    public final long A8K() {
        return this.A00;
    }

    @Override // com.facebook.ads.redexgen.X.ZK
    public final long A8U() {
        return this.A01;
    }

    @Override // com.facebook.ads.redexgen.X.ZK
    public final ZJ A9e(long j11) {
        int iA0L = N1.A0L(this.A03, j11, true, true);
        ZL zl2 = new ZL(this.A03[iA0L], this.A02[iA0L]);
        if (zl2.A01 < j11) {
            int tableIndex = this.A03.length;
            if (iA0L != tableIndex - 1) {
                int tableIndex2 = iA0L + 1;
                long j12 = this.A03[tableIndex2];
                int tableIndex3 = iA0L + 1;
                ZL nextSeekPoint = new ZL(j12, this.A02[tableIndex3]);
                return new ZJ(zl2, nextSeekPoint);
            }
        }
        return new ZJ(zl2);
    }

    @Override // com.facebook.ads.redexgen.X.PG
    public final long A9u(long j11) {
        return this.A03[N1.A0L(this.A02, j11, true, true)];
    }

    @Override // com.facebook.ads.redexgen.X.ZK
    public final boolean ABR() {
        return true;
    }
}
