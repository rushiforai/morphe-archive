package com.facebook.ads.redexgen.X;

/* loaded from: assets/audience_network/classes.dex */
public final class WO implements Comparable<WO> {
    public final boolean A00;
    public final boolean A01;

    public WO(VC vc, int i5) {
        this.A00 = (vc.A0H & 1) != 0;
        this.A01 = C07398h.A0S(i5, false);
    }

    @Override // java.lang.Comparable
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    public final int compareTo(WO wo2) {
        return AbstractC1314Vy.A01().A09(this.A01, wo2.A01).A09(this.A00, wo2.A00).A05();
    }
}
