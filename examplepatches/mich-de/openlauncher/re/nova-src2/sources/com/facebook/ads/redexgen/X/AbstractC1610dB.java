package com.facebook.ads.redexgen.X;

import android.util.Pair;
import java.io.IOException;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.dB, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1610dB {
    public static byte[] A00;

    static {
        A05();
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 17 out of bounds for length 16
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static C1608d9 A02(Q9 q92) throws IOException {
        byte[] bArr;
        C1084Mk c1084Mk = new C1084Mk(16);
        C1609dA c1609dAA03 = A03(1718449184, q92, c1084Mk);
        AbstractC1062Ln.A08(c1609dAA03.A01 >= 16);
        q92.AI6(c1084Mk.A0l(), 0, 16);
        c1084Mk.A0f(0);
        int iA0G = c1084Mk.A0G();
        int iA0G2 = c1084Mk.A0G();
        int iA0F = c1084Mk.A0F();
        int iA0F2 = c1084Mk.A0F();
        int iA0G3 = c1084Mk.A0G();
        int iA0G4 = c1084Mk.A0G();
        int i5 = ((int) c1609dAA03.A01) - 16;
        if (i5 > 0) {
            bArr = new byte[i5];
            q92.AI6(bArr, 0, i5);
        } else {
            bArr = N1.A07;
        }
        q92.ALL((int) (q92.A9L() - q92.A9Q()));
        return new C1608d9(iA0G, iA0G2, iA0F, iA0F2, iA0G3, iA0G4, bArr);
    }

    public static String A04(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 102);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A05() {
        A00 = new byte[]{105, 66, 95, 68, 65, 10, 67, 89, 10, 94, 69, 69, 10, 70, 75, 88, 77, 79, 10, 2, 84, 24, 109, 104, 1, 3, 10, 94, 69, 10, 89, 65, 67, 90, 17, 10, 67, 78, 16, 10, 37, 11, 2, 3, 30, 5, 2, 11, 76, 25, 2, 7, 2, 3, 27, 2, 76, 59, 45, 58, 76, 15, 4, 25, 2, 7, 86, 76, 55, 12, 17, 23, 18, 18, 13, 16, 22, 7, 6, 66, 4, 13, 16, 15, 66, 22, 27, 18, 7, 88, 66, 51, 5, 18, 44, 1, 5, 0, 1, 22, 54, 1, 5, 0, 1, 22};
    }

    public static long A00(Q9 q92) throws IOException {
        C1084Mk c1084Mk = new C1084Mk(8);
        C1609dA chunkHeader = C1609dA.A00(q92, c1084Mk);
        if (chunkHeader.A00 != 1685272116) {
            q92.AK3();
            return -1L;
        }
        q92.A4X(8);
        c1084Mk.A0f(0);
        q92.AI6(c1084Mk.A0l(), 0, 8);
        long sampleDataSize = c1084Mk.A0N();
        q92.ALL(((int) chunkHeader.A01) + 8);
        return sampleDataSize;
    }

    public static Pair<Long, Long> A01(Q9 q92) throws IOException {
        q92.AK3();
        C1609dA c1609dAA03 = A03(1684108385, q92, new C1084Mk(8));
        q92.ALL(8);
        return Pair.create(Long.valueOf(q92.A9Q()), Long.valueOf(c1609dAA03.A01));
    }

    public static C1609dA A03(int i5, Q9 q92, C1084Mk c1084Mk) throws IOException {
        C1609dA c1609dAA00 = C1609dA.A00(q92, c1084Mk);
        while (c1609dAA00.A00 != i5) {
            MV.A07(A04(91, 15, 2), A04(40, 28, 10) + c1609dAA00.A00);
            long j11 = c1609dAA00.A01 + 8;
            if (j11 <= 2147483647L) {
                q92.ALL((int) j11);
                c1609dAA00 = C1609dA.A00(q92, c1084Mk);
            } else {
                throw L9.A00(A04(0, 40, 76) + c1609dAA00.A00);
            }
        }
        return c1609dAA00;
    }

    public static boolean A06(Q9 q92) throws IOException {
        C1084Mk c1084Mk = new C1084Mk(8);
        C1609dA c1609dAA00 = C1609dA.A00(q92, c1084Mk);
        if (c1609dAA00.A00 != 1380533830 && c1609dAA00.A00 != 1380333108) {
            return false;
        }
        q92.AI6(c1084Mk.A0l(), 0, 4);
        c1084Mk.A0f(0);
        int iA0C = c1084Mk.A0C();
        if (iA0C != 1463899717) {
            MV.A05(A04(91, 15, 2), A04(68, 23, 4) + iA0C);
            return false;
        }
        return true;
    }
}
