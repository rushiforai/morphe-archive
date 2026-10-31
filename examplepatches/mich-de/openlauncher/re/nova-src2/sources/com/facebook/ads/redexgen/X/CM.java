package com.facebook.ads.redexgen.X;

import java.util.HashMap;
import kotlin.Metadata;

@Metadata
/* loaded from: assets/audience_network/classes.dex */
public final class CM extends AbstractC1540c3 {
    public final /* synthetic */ int A00;
    public final /* synthetic */ CL A01;
    public final /* synthetic */ HashMap<String, String> A02;

    public CM(CL cl2, int i5, HashMap<String, String> map) {
        this.A01 = cl2;
        this.A00 = i5;
        this.A02 = map;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1540c3
    public final void A03() {
        if (this.A01.A08.A0Z()) {
            return;
        }
        if ((this.A01.A09.length() > 0) && !this.A01.A02.get(this.A00)) {
            this.A01.A05.AC7(this.A01.A09, new C2618ti(this.A02).A05(this.A01.A01).A04(this.A01.A06).A07());
            C1750fT.A07(this.A01.A03, this.A01.A04);
            this.A01.A02.put(this.A00, true);
        }
    }
}
