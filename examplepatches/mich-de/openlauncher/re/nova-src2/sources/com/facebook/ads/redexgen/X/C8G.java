package com.facebook.ads.redexgen.X;

import android.util.Pair;
import com.facebook.ads.androidx.media3.extractor.metadata.id3.MlltFrame;

/* renamed from: com.facebook.ads.redexgen.X.8G, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C8G implements PG {
    public static String[] A03 = {"3R8Z89pOHpkKC4uBoFccHBzFCGUd", "W4iL9", "gMed8v3WklgjQD9Zxzws3gsG2D8FYxDO", "csW5cmIKdPi9B0IxUhS6fL2EnMlkm", "i5QZdv7fqP4abMje0lXiWhg2DUMK9Lw5", "VrwIDpXyT68ecuwtTRPGToazuEFe6", "Hb0A2x6b2mITaHHt11IFrq", "9SSa2"};
    public final long A00;
    public final long[] A01;
    public final long[] A02;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 16 out of bounds for length 16
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static Pair<Long, Long> A00(long j11, long[] jArr, long[] jArr2) {
        double d5;
        int iA0L = N1.A0L(jArr, j11, true, true);
        long j12 = jArr[iA0L];
        long j13 = jArr2[iA0L];
        int i5 = iA0L + 1;
        if (i5 == jArr.length) {
            return Pair.create(Long.valueOf(j12), Long.valueOf(j13));
        }
        long j14 = jArr[i5];
        long j15 = jArr2[i5];
        if (j14 == j12) {
            d5 = 0.0d;
        } else {
            double d11 = j11 - j12;
            long j16 = j14 - j12;
            if (A03[5].length() != 29) {
                throw new RuntimeException();
            }
            A03[7] = "Bw4Fm";
            d5 = d11 / j16;
        }
        return Pair.create(Long.valueOf(j11), Long.valueOf(((long) ((j15 - j13) * d5)) + j13));
    }

    public C8G(long[] jArr, long[] jArr2, long j11) {
        this.A01 = jArr;
        this.A02 = jArr2;
        this.A00 = j11 == -9223372036854775807L ? N1.A0O(jArr2[jArr2.length - 1]) : j11;
    }

    public static C8G A01(long j11, MlltFrame mlltFrame, long j12) {
        int length = mlltFrame.A03.length;
        int referenceCount = length + 1;
        long[] jArr = new long[referenceCount];
        int referenceCount2 = length + 1;
        long[] jArr2 = new long[referenceCount2];
        jArr[0] = j11;
        jArr2[0] = 0;
        long j13 = 0;
        for (int i5 = 1; i5 <= length; i5++) {
            int i11 = mlltFrame.A00;
            int referenceCount3 = i5 - 1;
            int i12 = i11 + mlltFrame.A03[referenceCount3];
            if (A03[7].length() != 5) {
                throw new RuntimeException();
            }
            A03[4] = "siqjnf6Q5qRVXEjHuFTxicOAkrZKrJhL";
            j11 += i12;
            int referenceCount4 = i5 - 1;
            j13 += mlltFrame.A01 + mlltFrame.A04[referenceCount4];
            jArr[i5] = j11;
            jArr2[i5] = j13;
        }
        return new C8G(jArr, jArr2, j12);
    }

    @Override // com.facebook.ads.redexgen.X.PG
    public final long A8K() {
        return -1L;
    }

    @Override // com.facebook.ads.redexgen.X.ZK
    public final long A8U() {
        return this.A00;
    }

    @Override // com.facebook.ads.redexgen.X.ZK
    public final ZJ A9e(long j11) {
        Pair<Long, Long> pairA00 = A00(N1.A0P(N1.A0T(j11, 0L, this.A00)), this.A02, this.A01);
        return new ZJ(new ZL(N1.A0O(((Long) pairA00.first).longValue()), ((Long) pairA00.second).longValue()));
    }

    @Override // com.facebook.ads.redexgen.X.PG
    public final long A9u(long j11) {
        Pair<Long, Long> positionAndTimeMs = A00(j11, this.A01, this.A02);
        return N1.A0O(((Long) positionAndTimeMs.second).longValue());
    }

    @Override // com.facebook.ads.redexgen.X.ZK
    public final boolean ABR() {
        return true;
    }
}
