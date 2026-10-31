package com.facebook.ads.redexgen.X;

/* loaded from: assets/audience_network/classes.dex */
public final class XX {
    public int A00;
    public boolean A04;
    public boolean A05;
    public XW A03 = new XW();
    public XW A02 = new XW();
    public long A01 = -9223372036854775807L;

    public final float A00() {
        if (A06()) {
            return (float) (1.0E9d / this.A03.A01());
        }
        return -1.0f;
    }

    public final int A01() {
        return this.A00;
    }

    public final long A02() {
        if (A06()) {
            return this.A03.A01();
        }
        return -9223372036854775807L;
    }

    public final long A03() {
        if (A06()) {
            return this.A03.A02();
        }
        return -9223372036854775807L;
    }

    public final void A04() {
        this.A03.A03();
        this.A02.A03();
        this.A04 = false;
        this.A01 = -9223372036854775807L;
        this.A00 = 0;
    }

    public final void A05(long j11) {
        this.A03.A04(j11);
        if (this.A03.A06() && !this.A05) {
            this.A04 = false;
        } else if (this.A01 != -9223372036854775807L) {
            if (!this.A04 || this.A02.A05()) {
                this.A02.A03();
                this.A02.A04(this.A01);
            }
            this.A04 = true;
            this.A02.A04(j11);
        }
        if (this.A04 && this.A02.A06()) {
            XW xw2 = this.A03;
            XW previousMatcher = this.A02;
            this.A03 = previousMatcher;
            this.A02 = xw2;
            this.A04 = false;
            this.A05 = false;
        }
        this.A01 = j11;
        this.A00 = this.A03.A06() ? 0 : this.A00 + 1;
    }

    public final boolean A06() {
        return this.A03.A06();
    }
}
