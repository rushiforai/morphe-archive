package com.facebook.ads.redexgen.X;

import java.util.ArrayList;
import java.util.List;

/* renamed from: com.facebook.ads.redexgen.X.3T, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C3T extends C06243u {
    public C06996r A00;
    public List<C2314ol> A01;

    public C3T(C0958Hi c0958Hi) {
        super(c0958Hi);
        this.A00 = new C06996r(this, 1, null, null, null);
    }

    public final void A27(C1539c2 c1539c2) {
        if (this.A00 != null) {
            this.A00.A0o(c1539c2);
        }
    }

    public C06996r getCarouselCardBehaviorHelper() {
        return this.A00;
    }

    public void setCardsInfo(ArrayList arrayList) {
        this.A01 = arrayList;
        this.A00.A0k(this.A01);
    }
}
