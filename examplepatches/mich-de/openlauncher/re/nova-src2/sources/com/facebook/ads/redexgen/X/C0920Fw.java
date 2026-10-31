package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.Fw, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C0920Fw implements InterfaceC2004je {
    public final /* synthetic */ C0917Ft A00;

    public C0920Fw(C0917Ft c0917Ft) {
        this.A00 = c0917Ft;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2004je
    public final boolean AAw() {
        if (this.A00.A0G.canGoBack()) {
            this.A00.A0G.goBack();
            return true;
        }
        return false;
    }
}
