package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.8D, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C8D implements PG {
    public static byte[] A06;
    public static String[] A07 = {"2icu", "B1mvOt7GkHbPF2TtK7X", "pwBOz21jQxIaXXFUVlm8ueXuTAny3iEF", "ISgGsIP", "UZOBFuQkU6lCREC17idqsI9J9nMogxu1", "jF2Onx4fIdhG58rhfua", "ifZhvt9ghZ", "suE1VeL5mSWFetVzskM26xFxAQQfG2iy"};
    public final int A00;
    public final long A01;
    public final long A02;
    public final long A03;
    public final long A04;
    public final long[] A05;

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A06, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 61);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A06 = new byte[]{53, 57, 55, 38, 33, 40, 79, 11, 14, 27, 14, 79, 28, 6, 21, 10, 79, 2, 6, 28, 2, 14, 27, 12, 7, 85, 79, 44, 29, 26, 19, 39, 17, 17, 31, 17, 6};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    @Override // com.facebook.ads.redexgen.X.ZK
    public final ZJ A9e(long j11) {
        double d5;
        if (!ABR()) {
            return new ZJ(new ZL(0L, this.A03 + this.A00));
        }
        long jA0T = N1.A0T(j11, 0L, this.A04);
        double d11 = (jA0T * 100.0d) / this.A04;
        String[] strArr = A07;
        if (strArr[1].length() != strArr[5].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A07;
        strArr2[7] = "nxnS3Iyg9PiuUdWtqhBJQvBJGWbhZfSg";
        strArr2[4] = "1oEjCPIpwi3C7MyFSVvQFWTEeeNlBH3O";
        if (d11 <= 0.0d) {
            d5 = 0.0d;
        } else if (d11 >= 100.0d) {
            d5 = 256.0d;
        } else {
            int i5 = (int) d11;
            double d12 = ((long[]) AbstractC1062Ln.A02(this.A05))[i5];
            d5 = (((i5 == 99 ? 256.0d : r6[i5 + 1]) - d12) * (d11 - i5)) + d12;
        }
        return new ZJ(new ZL(jA0T, this.A03 + N1.A0T(Math.round((d5 / 256.0d) * this.A02), this.A00, this.A02 - 1)));
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 17 out of bounds for length 16
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    @Override // com.facebook.ads.redexgen.X.PG
    public final long A9u(long j11) {
        double d5;
        long j12 = j11 - this.A03;
        if (!ABR() || j12 <= this.A00) {
            return 0L;
        }
        long[] jArr = (long[]) AbstractC1062Ln.A02(this.A05);
        double d11 = (j12 * 256.0d) / this.A02;
        int iA0L = N1.A0L(jArr, (long) d11, true, true);
        long jA00 = A00(iA0L);
        long j13 = jArr[iA0L];
        long jA002 = A00(iA0L + 1);
        if (j13 == (iA0L == 99 ? 256L : jArr[iA0L + 1])) {
            d5 = 0.0d;
            if (A07[2].charAt(1) == 'Q') {
                throw new RuntimeException();
            }
            A07[0] = "ueEX";
        } else {
            double d12 = d11 - j13;
            String[] strArr = A07;
            if (strArr[3].length() == strArr[6].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A07;
            strArr2[1] = "dAQlRgg5QkuGXjliK7E";
            strArr2[5] = "DLUTf60wXPxv8TEoq0F";
            d5 = d12 / (r2 - j13);
        }
        return Math.round((jA002 - jA00) * d5) + jA00;
    }

    static {
        A03();
    }

    public C8D(long j11, int i5, long j12) {
        this(j11, i5, j12, -1L, null);
    }

    public C8D(long j11, int i5, long j12, long j13, long[] jArr) {
        this.A03 = j11;
        this.A00 = i5;
        this.A04 = j12;
        this.A05 = jArr;
        this.A02 = j13;
        this.A01 = j13 != -1 ? j11 + j13 : -1L;
    }

    private long A00(int i5) {
        return (this.A04 * i5) / 100;
    }

    public static C8D A01(long durationUs, long dataSize, Z9 z92, C1084Mk c1084Mk) {
        int iA0L;
        int i5 = z92.A04;
        int i11 = z92.A03;
        int iA0C = c1084Mk.A0C();
        if ((iA0C & 1) != 1 || (iA0L = c1084Mk.A0L()) == 0) {
            return null;
        }
        long jA0U = N1.A0U(iA0L, i5 * 1000000, i11);
        if ((iA0C & 6) != 6) {
            return new C8D(dataSize, z92.A02, jA0U);
        }
        long jA0Q = c1084Mk.A0Q();
        long[] jArr = new long[100];
        for (int i12 = 0; i12 < 100; i12++) {
            long jA0I = c1084Mk.A0I();
            String[] strArr = A07;
            String str = strArr[7];
            String str2 = strArr[4];
            int iCharAt = str.charAt(12);
            int i13 = str2.charAt(12);
            if (iCharAt == i13) {
                throw new RuntimeException();
            }
            A07[2] = "bCdxHBjEQ3bU3PwRoZGtHXPzNO9Tmadn";
            jArr[i12] = jA0I;
        }
        if (durationUs != -1 && durationUs != dataSize + jA0Q) {
            MV.A07(A02(27, 10, 73), A02(2, 25, 82) + durationUs + A02(0, 2, 36) + (dataSize + jA0Q));
        }
        return new C8D(dataSize, z92.A02, jA0U, jA0Q, jArr);
    }

    @Override // com.facebook.ads.redexgen.X.PG
    public final long A8K() {
        return this.A01;
    }

    @Override // com.facebook.ads.redexgen.X.ZK
    public final long A8U() {
        return this.A04;
    }

    @Override // com.facebook.ads.redexgen.X.ZK
    public final boolean ABR() {
        return this.A05 != null;
    }
}
