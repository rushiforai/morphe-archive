package com.facebook.ads.redexgen.X;

import java.util.Collections;
import java.util.List;
import java.util.Map;

/* loaded from: assets/audience_network/classes.dex */
public final class OV implements InterfaceC1506bV {
    public final C1545c8 A00;
    public final Map<String, C1552cF> A01;
    public final Map<String, String> A02;
    public final Map<String, C1546c9> A03;
    public final long[] A04;

    public OV(C1545c8 c1545c8, Map<String, C1552cF> map, Map<String, C1546c9> map2, Map<String, String> imageMap) {
        this.A00 = c1545c8;
        this.A03 = map2;
        this.A02 = imageMap;
        this.A01 = map != null ? Collections.unmodifiableMap(map) : Collections.emptyMap();
        this.A04 = c1545c8.A0G();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1506bV
    public final List<C1251Th> A88(long j11) {
        return this.A00.A0E(j11, this.A01, this.A03, this.A02);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1506bV
    public final long A8e(int i5) {
        return this.A04[i5];
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1506bV
    public final int A8f() {
        return this.A04.length;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1506bV
    public final int A9D(long j11) {
        int iA0K = N1.A0K(this.A04, j11, false, false);
        int index = this.A04.length;
        if (iA0K < index) {
            return iA0K;
        }
        return -1;
    }
}
