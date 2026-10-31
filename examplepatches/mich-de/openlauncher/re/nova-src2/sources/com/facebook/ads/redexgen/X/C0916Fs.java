package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.Fs, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C0916Fs extends AbstractC1965j1 {
    public final /* synthetic */ C06243u A00;

    public C0916Fs(C06243u c06243u) {
        this.A00 = c06243u;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1965j1
    public final void A0P(C7O c7o, int i5) {
        InterfaceC2466rG interfaceC2466rG;
        super.A0P(c7o, i5);
        J7 linearLayoutManager = this.A00.getLayoutManager();
        int scrollPosition = linearLayoutManager.A38();
        AbstractC1948ik adapter = this.A00.getAdapter();
        if (scrollPosition < 0 || adapter == null || scrollPosition >= adapter.A0B() || !(c7o.A1H(scrollPosition) instanceof InterfaceC2466rG) || (interfaceC2466rG = (InterfaceC2466rG) c7o.A1H(scrollPosition)) == null) {
            return;
        }
        interfaceC2466rG.AKX();
    }
}
