package com.facebook.ads.redexgen.X;

/* loaded from: assets/audience_network/classes.dex */
public class BY extends AbstractC2172mQ<C5V> {
    public final /* synthetic */ C5Z A00;

    public BY(C5Z c5z) {
        this.A00 = c5z;
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    public final void A03(C5V c5v) {
        int iA00 = c5v.A00();
        int currentPositionMS = this.A00.A00;
        if (currentPositionMS > 0) {
            int currentPositionMS2 = this.A00.A0C.getDuration();
            if (iA00 == currentPositionMS2) {
                int duration = this.A00.A0C.getDuration();
                int currentPositionMS3 = this.A00.A00;
                if (duration > currentPositionMS3) {
                    return;
                }
            }
        }
        this.A00.A0k(iA00);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
    public final Class<C5V> A01() {
        return C5V.class;
    }
}
