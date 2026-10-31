package com.facebook.ads.redexgen.X;

/* loaded from: assets/audience_network/classes.dex */
public class J2 implements InterfaceC1985jL {
    public final /* synthetic */ C7O A00;

    public J2(C7O c7o) {
        this.A00 = c7o;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1985jL
    public final void AIM(AbstractC1978jE abstractC1978jE, C1955ir c1955ir, C1955ir c1955ir2) {
        this.A00.A1s(abstractC1978jE, c1955ir, c1955ir2);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1985jL
    public final void AIO(AbstractC1978jE abstractC1978jE, C1955ir c1955ir, C1955ir c1955ir2) {
        this.A00.A0r.A0d(abstractC1978jE);
        this.A00.A1t(abstractC1978jE, c1955ir, c1955ir2);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1985jL
    public final void AIQ(AbstractC1978jE abstractC1978jE, C1955ir c1955ir, C1955ir c1955ir2) {
        abstractC1978jE.A0k(false);
        if (this.A00.A0C) {
            if (this.A00.A05.A0R(abstractC1978jE, abstractC1978jE, c1955ir, c1955ir2)) {
                this.A00.A1Q();
            }
        } else {
            if (!this.A00.A05.A0Q(abstractC1978jE, c1955ir, c1955ir2)) {
                return;
            }
            this.A00.A1Q();
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1985jL
    public final void ALt(AbstractC1978jE abstractC1978jE) {
        this.A00.A06.A2S(abstractC1978jE.A0H, this.A00.A0r);
    }
}
