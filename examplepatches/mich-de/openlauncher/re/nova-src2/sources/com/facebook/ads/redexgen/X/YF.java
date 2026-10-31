package com.facebook.ads.redexgen.X;

import java.util.List;
import kotlin.Metadata;

@Metadata
/* loaded from: assets/audience_network/classes.dex */
public final class YF {
    public long A01;
    public long A02;
    public long A03;
    public long A04;
    public final String A06;
    public final int A05 = 100;
    public long A00 = -1;

    public YF(String str, long j11, long j12, long j13) {
        this.A06 = str;
        this.A03 = this.A05 * j11;
        this.A01 = this.A05 * j12;
        this.A02 = this.A05 * j13;
        A0A(-1L);
    }

    public final long A00() {
        return this.A00;
    }

    public final long A01() {
        return this.A01;
    }

    public final long A02() {
        return this.A02;
    }

    public final long A03() {
        return this.A03;
    }

    public final long A04() {
        return this.A04;
    }

    public final List<String> A05() {
        return AbstractC05700v.A0A(String.valueOf(this.A03), String.valueOf(this.A01), String.valueOf(this.A02));
    }

    public final void A06(long j11) {
        this.A00 = j11;
    }

    public final void A07(long j11) {
        this.A01 = j11;
    }

    public final void A08(long j11) {
        this.A02 = j11;
    }

    public final void A09(long j11) {
        this.A03 = j11;
    }

    public final void A0A(long j11) {
        this.A04 = this.A05 * j11;
    }
}
