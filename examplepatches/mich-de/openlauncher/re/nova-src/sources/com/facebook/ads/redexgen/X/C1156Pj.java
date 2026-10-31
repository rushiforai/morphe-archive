package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.Pj, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1156Pj {
    public final long A00;
    public final long A01;
    public static String[] A02 = {"SLZ5bt2", "TxmLMeH058DekG56M7wy4nR5KMq5pMPh", "eBbdgg1", "qYRnZmHlNNOmdhzPczecuBQTrVXdvPhL", "XHrw677fMneecKWCQwAKaoAXefA0whbX", "TfeBQ6bu34UKNE7Gc9tjiUBuIN8abPgz", "lPJVSIPfqeQvwQkHJHYX1ciyqzvm8k2w", "F39FrC2LczUQ7fzRYqAV4ggGr8hXBi6w"};
    public static final C1156Pj A05 = new C1156Pj(0, 0);
    public static final C1156Pj A03 = new C1156Pj(Long.MAX_VALUE, Long.MAX_VALUE);
    public static final C1156Pj A07 = new C1156Pj(Long.MAX_VALUE, 0);
    public static final C1156Pj A06 = new C1156Pj(0, Long.MAX_VALUE);
    public static final C1156Pj A04 = A05;

    public C1156Pj(long j11, long j12) {
        AbstractC1062Ln.A07(j11 >= 0);
        AbstractC1062Ln.A07(j12 >= 0);
        this.A01 = j11;
        this.A00 = j12;
    }

    public final long A00(long minPositionUs, long j11, long j12) {
        if (this.A01 == 0 && this.A00 == 0) {
            return minPositionUs;
        }
        long jA0V = N1.A0V(minPositionUs, this.A01, Long.MIN_VALUE);
        long jA0S = N1.A0S(minPositionUs, this.A00, Long.MAX_VALUE);
        boolean z11 = true;
        boolean z12 = jA0V <= j11 && j11 <= jA0S;
        if (jA0V > j12 || j12 > jA0S) {
            z11 = false;
        }
        if (z12 && z11) {
            long jAbs = Math.abs(j11 - minPositionUs);
            long maxPositionUs = Math.abs(j12 - minPositionUs);
            if (jAbs <= maxPositionUs) {
                return j11;
            }
            return j12;
        }
        if (z12) {
            return j11;
        }
        if (z11) {
            return j12;
        }
        return jA0V;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (A02[4].charAt(13) == 'J') {
            throw new RuntimeException();
        }
        String[] strArr = A02;
        strArr[5] = "nyvPka8FxV5magz4P2aOgFXOCbZI4PbG";
        strArr[3] = "SXRLMRY4P0Iz3ySZjOtsK8erpvbOKPV5";
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        C1156Pj c1156Pj = (C1156Pj) obj;
        return this.A01 == c1156Pj.A01 && this.A00 == c1156Pj.A00;
    }

    public final int hashCode() {
        return (((int) this.A01) * 31) + ((int) this.A00);
    }
}
