package com.facebook.ads.redexgen.X;

import java.util.Set;

/* renamed from: com.facebook.ads.redexgen.X.bW, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1507bW {
    public C1501bQ A00;
    public Set<String> A01;
    public Set<String> A02;
    public boolean A03;
    public boolean A04 = true;
    public boolean A05;

    public final C1507bW A00(C1501bQ c1501bQ) {
        this.A00 = c1501bQ;
        return this;
    }

    public final C1507bW A01(Set<String> pinnedCertificates) {
        this.A01 = pinnedCertificates;
        return this;
    }

    public final C1507bW A02(Set<String> pinnedPublicKeys) {
        this.A02 = pinnedPublicKeys;
        return this;
    }

    public final C1507bW A03(boolean z11) {
        this.A04 = z11;
        return this;
    }

    public final C1507bW A04(boolean z11) {
        this.A03 = z11;
        return this;
    }

    public final C1507bW A05(boolean z11) {
        this.A05 = z11;
        return this;
    }

    public final C1505bU A06() {
        return new C1505bU(this.A00, this.A04, this.A02, this.A01, this.A03, this.A05);
    }
}
