package com.facebook.ads.redexgen.X;

/* loaded from: assets/audience_network/classes.dex */
public class BX extends AbstractC2172mQ<C5Y> {
    public final /* synthetic */ C5Z A00;

    public BX(C5Z c5z) {
        this.A00 = c5z;
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    public final void A03(C5Y c5y) {
        int iA00 = c5y.A00();
        int duration = c5y.A01();
        int currentPosition = this.A00.A00;
        if (currentPosition > 0 && iA00 == duration) {
            int currentPosition2 = this.A00.A00;
            if (duration > currentPosition2) {
                return;
            }
        }
        int currentPosition3 = iA00 + 500;
        if (duration < currentPosition3) {
            if (duration == 0) {
                C5Z c5z = this.A00;
                int currentPosition4 = this.A00.A00;
                c5z.A0j(currentPosition4);
                return;
            }
            this.A00.A0j(duration);
            return;
        }
        this.A00.A0j(iA00);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
    public final Class<C5Y> A01() {
        return C5Y.class;
    }
}
