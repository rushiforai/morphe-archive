package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.Aw, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C0791Aw extends AbstractC2172mQ<C5V> {
    public final /* synthetic */ C0790Av A00;

    public C0791Aw(C0790Av c0790Av) {
        this.A00 = c0790Av;
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    public final void A03(C5V c5v) {
        if (this.A00.A00 == null) {
            return;
        }
        this.A00.setText(this.A00.A02(this.A00.A00.getDuration() - this.A00.A00.getCurrentPositionInMillis()));
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
    public final Class<C5V> A01() {
        return C5V.class;
    }
}
