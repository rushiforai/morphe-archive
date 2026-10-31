package com.facebook.ads.redexgen.X;

/* loaded from: assets/audience_network/classes.dex */
public final class WG {
    public final long A00;
    public final long A01;

    public WG(long j11, long j12) {
        this.A01 = j11;
        this.A00 = j12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof WG)) {
            return false;
        }
        WG wg2 = (WG) obj;
        return this.A01 == wg2.A01 && this.A00 == wg2.A00;
    }

    public final int hashCode() {
        return (((int) this.A01) * 31) + ((int) this.A00);
    }
}
