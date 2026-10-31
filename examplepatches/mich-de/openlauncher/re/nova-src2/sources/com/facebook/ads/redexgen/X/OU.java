package com.facebook.ads.redexgen.X;

import java.util.Collections;
import java.util.List;

/* loaded from: assets/audience_network/classes.dex */
public final class OU implements InterfaceC1506bV {
    public static final OU A01 = new OU();
    public final List<C1251Th> A00;

    public OU() {
        this.A00 = Collections.emptyList();
    }

    public OU(C1251Th c1251Th) {
        this.A00 = Collections.singletonList(c1251Th);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1506bV
    public final List<C1251Th> A88(long j11) {
        return j11 >= 0 ? this.A00 : Collections.emptyList();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1506bV
    public final long A8e(int i5) {
        AbstractC1062Ln.A07(i5 == 0);
        return 0L;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1506bV
    public final int A8f() {
        return 1;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1506bV
    public final int A9D(long j11) {
        return j11 < 0 ? 0 : -1;
    }
}
