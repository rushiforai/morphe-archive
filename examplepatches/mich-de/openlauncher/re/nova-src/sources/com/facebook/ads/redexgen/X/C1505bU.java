package com.facebook.ads.redexgen.X;

import java.util.Set;

/* renamed from: com.facebook.ads.redexgen.X.bU, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1505bU {
    public C1501bQ A00;
    public Set<String> A01;
    public Set<String> A02;
    public boolean A03;
    public boolean A04;
    public boolean A05;

    public C1505bU(C1501bQ c1501bQ, boolean z11, Set<String> pinnedPublicKeys, Set<String> pinnedCertificates, boolean z12, boolean z13) {
        this.A00 = c1501bQ;
        this.A04 = z11;
        this.A02 = pinnedPublicKeys;
        this.A01 = pinnedCertificates;
        this.A03 = z12;
        this.A05 = z13;
    }

    public final C1501bQ A00() {
        return this.A00;
    }

    public final Set<String> A01() {
        return this.A01;
    }

    public final Set<String> A02() {
        return this.A02;
    }

    public final boolean A03() {
        return this.A04;
    }

    public final boolean A04() {
        return this.A03;
    }

    public final boolean A05() {
        return this.A05;
    }
}
