package com.facebook.ads.redexgen.X;

import java.util.Collections;
import java.util.List;

/* renamed from: com.facebook.ads.redexgen.X.Od, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1129Od implements InterfaceC1506bV {
    public final long[] A00;
    public final C1251Th[] A01;

    public C1129Od(C1251Th[] c1251ThArr, long[] jArr) {
        this.A01 = c1251ThArr;
        this.A00 = jArr;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1506bV
    public final List<C1251Th> A88(long j11) {
        int iA0L = N1.A0L(this.A00, j11, true, false);
        if (iA0L == -1 || this.A01[iA0L] == C1251Th.A0J) {
            return Collections.emptyList();
        }
        return Collections.singletonList(this.A01[iA0L]);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1506bV
    public final long A8e(int i5) {
        boolean z11 = true;
        AbstractC1062Ln.A07(i5 >= 0);
        if (i5 >= this.A00.length) {
            z11 = false;
        }
        AbstractC1062Ln.A07(z11);
        return this.A00[i5];
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1506bV
    public final int A8f() {
        return this.A00.length;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1506bV
    public final int A9D(long j11) {
        int iA0K = N1.A0K(this.A00, j11, false, false);
        int index = this.A00.length;
        if (iA0K < index) {
            return iA0K;
        }
        return -1;
    }
}
