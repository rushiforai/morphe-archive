package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import java.util.Map;
import kotlin.Metadata;

@Metadata
/* loaded from: assets/audience_network/classes.dex */
public final class C0 extends AbstractC1540c3 {
    public static String[] A03 = {"7QiPHOSfASxUpNU6TD2bwAUc2h4KqeOK", "JUTNm8kTmJ3rCPx8lEIgvBLgr17n46wk", "FyxHX5ox0vb7x3A44VT2gDubksZYSJjc", "1zrQwRYxSIFUHRomCHw2xaxUn7MsFeer", "0vBWWMU0WFbUOdbhC9KYLFkcSMOuwU0Q", "IzWzwEXv", "dfQVSJ", "Zvkip1x3OOFmGOtSaTV6Jn3c16WmJA1n"};
    public final /* synthetic */ C1962iy A00;
    public final /* synthetic */ C0819By A01;
    public final /* synthetic */ Map<String, String> A02;

    public C0(C0819By c0819By, C1962iy c1962iy, Map<String, String> map) {
        this.A01 = c0819By;
        this.A00 = c1962iy;
        this.A02 = map;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1540c3
    public final void A03() {
        C1539c2 c1539c2 = this.A01.A01;
        C1539c2 vc = this.A01.A08;
        if (!vc.A0Z()) {
            boolean zIsEmpty = TextUtils.isEmpty(this.A01.A09);
            String[] strArr = A03;
            if (strArr[3].charAt(10) != strArr[7].charAt(10)) {
                throw new RuntimeException();
            }
            A03[2] = "0NibZtMWwDqXadHgwVsnWvsqOs29A86a";
            if (!zIsEmpty && !this.A01.A02.get(this.A00.A02())) {
                this.A01.A06.AC7(this.A01.A09, new C2618ti(this.A02).A05(c1539c2).A04(this.A01.A07).A07());
                C1750fT.A07(this.A01.A04, this.A01.A05);
                this.A01.A02.put(this.A00.A02(), true);
            }
        }
    }
}
