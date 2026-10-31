package com.facebook.ads.redexgen.X;

import java.util.Collections;
import java.util.List;

/* renamed from: com.facebook.ads.redexgen.X.Oe, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1130Oe implements InterfaceC1506bV {
    public final List<Long> A00;
    public final List<List<C1251Th>> A01;

    public C1130Oe(List<List<C1251Th>> list, List<Long> cueTimesUs) {
        this.A01 = list;
        this.A00 = cueTimesUs;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1506bV
    public final List<C1251Th> A88(long j11) {
        int iA0H = N1.A0H(this.A00, Long.valueOf(j11), true, false);
        if (iA0H == -1) {
            return Collections.emptyList();
        }
        return this.A01.get(iA0H);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1506bV
    public final long A8e(int i5) {
        boolean z11 = true;
        AbstractC1062Ln.A07(i5 >= 0);
        if (i5 >= this.A00.size()) {
            z11 = false;
        }
        AbstractC1062Ln.A07(z11);
        return this.A00.get(i5).longValue();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1506bV
    public final int A8f() {
        return this.A00.size();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1506bV
    public final int A9D(long j11) {
        int iA0G = N1.A0G(this.A00, Long.valueOf(j11), false, false);
        int index = this.A00.size();
        if (iA0G < index) {
            return iA0G;
        }
        return -1;
    }
}
