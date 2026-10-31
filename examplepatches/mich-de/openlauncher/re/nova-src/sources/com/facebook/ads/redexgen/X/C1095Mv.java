package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.Mv, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1095Mv implements NK {
    public InterfaceC1671eB A02;
    public long A01 = 5242880;
    public int A00 = 20480;

    public final C1095Mv A00(InterfaceC1671eB interfaceC1671eB) {
        this.A02 = interfaceC1671eB;
        return this;
    }

    @Override // com.facebook.ads.redexgen.X.NK
    public final C1094Mu A5q() {
        return new C1094Mu((InterfaceC1671eB) AbstractC1062Ln.A01(this.A02), this.A01, this.A00);
    }
}
