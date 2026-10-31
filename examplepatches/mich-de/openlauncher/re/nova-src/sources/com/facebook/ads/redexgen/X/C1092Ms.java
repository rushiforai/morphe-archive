package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.Ms, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1092Ms {
    public long A00;
    public long A01;
    public long A02;
    public final ThreadLocal<Long> A03 = new ThreadLocal<>();

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 14 out of bounds for length 14
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:147)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public final synchronized long A06(long j11) {
        if (j11 == -9223372036854775807L) {
            return -9223372036854775807L;
        }
        if (this.A01 != -9223372036854775807L) {
            long jA01 = A01(this.A01);
            long j12 = (4294967296L + jA01) / 8589934592L;
            long j13 = ((j12 - 1) * 8589934592L) + j11;
            long j14 = (8589934592L * j12) + j11;
            if (Math.abs(j13 - jA01) >= Math.abs(j14 - jA01)) {
                j13 = j14;
            }
            j11 = j13;
        }
        return A05(A00(j11));
    }

    public C1092Ms(long j11) {
        A07(j11);
    }

    public static long A00(long j11) {
        return (1000000 * j11) / 90000;
    }

    public static long A01(long j11) {
        return (90000 * j11) / 1000000;
    }

    public final synchronized long A02() {
        long j11;
        if (this.A00 != Long.MAX_VALUE && this.A00 != 9223372036854775806L) {
            j11 = this.A00;
        } else {
            j11 = -9223372036854775807L;
        }
        return j11;
    }

    public final synchronized long A03() {
        long jA02;
        if (this.A01 != -9223372036854775807L) {
            jA02 = this.A01 + this.A02;
        } else {
            jA02 = A02();
        }
        return jA02;
    }

    public final synchronized long A04() {
        return this.A02;
    }

    public final synchronized long A05(long j11) {
        long desiredSampleTimestampUs;
        if (j11 == -9223372036854775807L) {
            return -9223372036854775807L;
        }
        if (this.A02 == -9223372036854775807L) {
            if (this.A00 == 9223372036854775806L) {
                desiredSampleTimestampUs = ((Long) AbstractC1062Ln.A01(this.A03.get())).longValue();
            } else {
                desiredSampleTimestampUs = this.A00;
            }
            this.A02 = desiredSampleTimestampUs - j11;
            notifyAll();
        }
        this.A01 = j11;
        return this.A02 + j11;
    }

    public final synchronized void A07(long j11) {
        this.A00 = j11;
        this.A02 = j11 == Long.MAX_VALUE ? 0L : -9223372036854775807L;
        this.A01 = -9223372036854775807L;
    }
}
