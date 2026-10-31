package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.5I, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public class C5I extends B5 {
    public final /* synthetic */ C0788At A00;

    public C5I(C0788At c0788At) {
        this.A00 = c0788At;
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    public final void A03(B6 b62) {
        if (this.A00.A01 == null || b62.A00().getAction() != 0) {
            return;
        }
        this.A00.A04.removeCallbacksAndMessages(null);
        this.A00.A07(new C1656dw(this));
    }
}
