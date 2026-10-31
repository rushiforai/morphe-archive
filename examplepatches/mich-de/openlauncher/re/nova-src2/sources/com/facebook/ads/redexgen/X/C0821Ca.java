package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import java.util.Map;

/* renamed from: com.facebook.ads.redexgen.X.Ca, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C0821Ca extends AbstractC1540c3 {
    public static String[] A06 = {"9EcwbXL", "xSjvPMkgWWioBuUjephCpzaMcXmM2sD", "H", "Z0OwbQNEejaaYPjBGD9d9AX", "LifEXsQyKShCOMizwIOXiweZ0", "XJXBCYBKjtegaNwUZmi8zWUKmanAO", "UJgIUi3fLAa", "b39pUeydvHz6vxm1zIrt3qO8a47iYX"};
    public final /* synthetic */ InterfaceC2224nG A00;
    public final /* synthetic */ C2417qT A01;
    public final /* synthetic */ C2314ol A02;
    public final /* synthetic */ CY A03;
    public final /* synthetic */ String A04;
    public final /* synthetic */ Map A05;

    public C0821Ca(CY cy2, String str, C2314ol c2314ol, InterfaceC2224nG interfaceC2224nG, Map map, C2417qT c2417qT) {
        this.A03 = cy2;
        this.A04 = str;
        this.A02 = c2314ol;
        this.A00 = interfaceC2224nG;
        this.A05 = map;
        this.A01 = c2417qT;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1540c3
    public final void A03() {
        if (this.A03.A02.A0Z()) {
            return;
        }
        String str = this.A04;
        if (A06[0].length() != 7) {
            throw new RuntimeException();
        }
        A06[7] = "G0eOJNFPtps4qsYKpGpuAXPxSINW56";
        if (!TextUtils.isEmpty(str) && !this.A03.A05.get(this.A02.A02())) {
            this.A00.AC7(this.A04, new C2618ti(this.A05).A05(this.A03.A03).A04(this.A01).A07());
            C1750fT.A07(this.A03.A00, this.A03.A06);
            this.A03.A05.put(this.A02.A02(), true);
        }
    }
}
