package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.5Q, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public class C5Q extends B5 {
    public final /* synthetic */ C0793Ay A00;

    public C5Q(C0793Ay c0793Ay) {
        this.A00 = c0793Ay;
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    public final void A03(B6 b62) {
        if (this.A00.A01 == null || this.A00.A05 || b62.A00().getAction() != 0) {
            return;
        }
        this.A00.A07.removeCallbacksAndMessages(null);
        if (this.A00.A0G(EnumC1637dc.A05)) {
            this.A00.A03();
            this.A00.A06(true, false);
        }
        if (this.A00.A04) {
            this.A00.A07.postDelayed(new C0794Az(this), this.A00.A00);
        }
    }
}
