package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.Yi, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1371Yi {
    public long A00;
    public long A01;
    public long A02;
    public long A03;
    public long A04;
    public final long A05;
    public final long A06;
    public final long A07;

    public C1371Yi(long j11, long j12, long j13, long j14, long j15, long j16, long j17) {
        this.A06 = j11;
        this.A07 = j12;
        this.A03 = j13;
        this.A01 = j14;
        this.A02 = j15;
        this.A00 = j16;
        this.A05 = j17;
        this.A04 = A05(j12, j13, j14, j15, j16, j17);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public long A00() {
        return this.A00;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public long A01() {
        return this.A02;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public long A02() {
        return this.A04;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public long A03() {
        return this.A06;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public long A04() {
        return this.A07;
    }

    public static long A05(long j11, long j12, long j13, long bytesToSkip, long confidenceInterval, long j14) {
        if (bytesToSkip + 1 >= confidenceInterval || j12 + 1 >= j13) {
            return bytesToSkip;
        }
        long j15 = (long) ((j11 - j12) * ((confidenceInterval - bytesToSkip) / (j13 - j12)));
        return N1.A0T(((bytesToSkip + j15) - j14) - (j15 / 20), bytesToSkip, confidenceInterval - 1);
    }

    private void A0B() {
        this.A04 = A05(this.A07, this.A03, this.A01, this.A02, this.A00, this.A05);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0C(long j11, long j12) {
        this.A01 = j11;
        this.A00 = j12;
        A0B();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0D(long j11, long j12) {
        this.A03 = j11;
        this.A02 = j12;
        A0B();
    }
}
