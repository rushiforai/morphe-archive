package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import java.util.Map;

/* loaded from: assets/audience_network/classes.dex */
public class CS extends AbstractC1540c3 {
    public final /* synthetic */ InterfaceC2224nG A00;
    public final /* synthetic */ C2417qT A01;
    public final /* synthetic */ C2314ol A02;
    public final /* synthetic */ CQ A03;
    public final /* synthetic */ String A04;
    public final /* synthetic */ Map A05;

    public CS(CQ cq2, String str, C2314ol c2314ol, InterfaceC2224nG interfaceC2224nG, Map map, C2417qT c2417qT) {
        this.A03 = cq2;
        this.A04 = str;
        this.A02 = c2314ol;
        this.A00 = interfaceC2224nG;
        this.A05 = map;
        this.A01 = c2417qT;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1540c3
    public final void A03() {
        if (!this.A03.A0A.A0Z() && !TextUtils.isEmpty(this.A04) && !this.A03.A07.get(this.A02.A02())) {
            this.A00.AC7(this.A04, new C2618ti(this.A05).A05(this.A03.A02).A04(this.A01).A07());
            C1750fT.A07(this.A03.A00, this.A03.A08);
            this.A03.A07.put(this.A02.A02(), true);
        }
    }
}
