package com.facebook.ads.redexgen.X;

import java.io.Serializable;
import java.util.Collections;
import java.util.List;

/* renamed from: com.facebook.ads.redexgen.X.fQ, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1747fQ implements Serializable {
    public static final long serialVersionUID = -2102939945352398575L;
    public long A00;
    public long A01;
    public boolean A02;
    public boolean A03;
    public boolean A04;
    public boolean A05;
    public boolean A06;
    public final List<C2277o9> A07;
    public final List<String> A08;

    public C1747fQ(List<String> screenshots, long j11, long j12, boolean z11, boolean z12, boolean z13, boolean z14, boolean z15, List<C2277o9> list) {
        this.A08 = screenshots;
        this.A00 = j11;
        this.A01 = j12;
        this.A04 = z11;
        this.A02 = z12;
        this.A03 = z13;
        this.A05 = z14;
        this.A06 = z15;
        this.A07 = list;
    }

    public final long A00() {
        return this.A00;
    }

    public final long A01() {
        return this.A01;
    }

    public final List<C2277o9> A02() {
        return Collections.unmodifiableList(this.A07);
    }

    public final List<String> A03() {
        return Collections.unmodifiableList(this.A08);
    }

    public final boolean A04() {
        return this.A02;
    }

    public final boolean A05() {
        return this.A03;
    }

    public final boolean A06() {
        return this.A04;
    }

    public final boolean A07() {
        return this.A05;
    }

    public final boolean A08() {
        return this.A06;
    }
}
