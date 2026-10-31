package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.Cy, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C0845Cy implements InterfaceC2004je {
    public final /* synthetic */ C06785w A00;

    public C0845Cy(C06785w c06785w) {
        this.A00 = c06785w;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2004je
    public final boolean AAw() {
        if (!this.A00.A0A.get()) {
            return true;
        }
        if (((D8) this.A00).A03.A3J() && ((D8) this.A00).A09.getToolbarActionMode() == 8) {
            return true;
        }
        return this.A00.A0t();
    }
}
