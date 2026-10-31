package com.facebook.ads.redexgen.X;

import java.util.Collections;
import java.util.List;

/* loaded from: assets/audience_network/classes.dex */
public final class RV implements InterfaceC1506bV {
    public final long A00;
    public final AbstractC07549l<C1251Th> A01;

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9l != com.google.common.collect.ImmutableList<com.facebook.ads.androidx.media3.common.text.Cue> */
    public RV(long j11, AbstractC07549l<C1251Th> abstractC07549l) {
        this.A00 = j11;
        this.A01 = abstractC07549l;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1506bV
    public final List<C1251Th> A88(long j11) {
        return j11 >= this.A00 ? this.A01 : Collections.emptyList();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1506bV
    public final long A8e(int i5) {
        AbstractC1062Ln.A07(i5 == 0);
        return this.A00;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1506bV
    public final int A8f() {
        return 1;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1506bV
    public final int A9D(long j11) {
        return this.A00 > j11 ? 0 : -1;
    }
}
