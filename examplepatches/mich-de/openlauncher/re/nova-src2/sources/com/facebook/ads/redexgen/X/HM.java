package com.facebook.ads.redexgen.X;

import java.util.Map;

/* loaded from: assets/audience_network/classes.dex */
public abstract class HM implements InterfaceC2098lD {
    public final C2095lA A00;

    public HM(C2095lA c2095lA) {
        this.A00 = c2095lA;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2098lD
    public final Map<String, String> A69() {
        return C2157mB.A01(this.A00);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2098lD
    public final Map<String, String> A7W() {
        return C2136lp.A02();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2098lD
    public final String A8x() {
        return C2136lp.A00();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2098lD
    public final String A8z() {
        return AbstractC2063kb.A00().A03();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2098lD
    public final boolean ABC() {
        return C2341pE.A00().A03();
    }
}
