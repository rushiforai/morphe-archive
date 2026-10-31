package com.facebook.ads.redexgen.X;

import android.view.View;
import android.widget.RelativeLayout;

/* renamed from: com.facebook.ads.redexgen.X.7E, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C7E extends IV {
    public C7E(C1998jY c1998jY) {
        super(c1998jY);
    }

    @Override // com.facebook.ads.redexgen.X.IV, com.facebook.ads.redexgen.X.InterfaceC2459r9
    public final /* bridge */ /* synthetic */ void A4U(View view, int i5, RelativeLayout.LayoutParams layoutParams) {
        super.A4U(view, i5, layoutParams);
    }

    @Override // com.facebook.ads.redexgen.X.IV, com.facebook.ads.redexgen.X.InterfaceC2459r9
    public final /* bridge */ /* synthetic */ void A4V(View view, RelativeLayout.LayoutParams layoutParams) {
        super.A4V(view, layoutParams);
    }

    @Override // com.facebook.ads.redexgen.X.IV, com.facebook.ads.redexgen.X.InterfaceC2459r9
    public final void A5C(String str) {
        super.A5C(str);
        if (this.A00.get() == null) {
            return;
        }
        String strA03 = EnumC1658dy.A08.A03();
        String rewardedVideoError = EnumC1658dy.A09.A03();
        if (str.equals(strA03)) {
            this.A00.get().finish(11);
        } else if (str.equals(rewardedVideoError)) {
            this.A00.get().finish(12);
        }
    }

    @Override // com.facebook.ads.redexgen.X.IV, com.facebook.ads.redexgen.X.InterfaceC2459r9
    public final /* bridge */ /* synthetic */ void A5D(String str, C2170mO c2170mO) {
        super.A5D(str, c2170mO);
    }

    @Override // com.facebook.ads.redexgen.X.IV, com.facebook.ads.redexgen.X.InterfaceC2459r9
    public final /* bridge */ /* synthetic */ void ABW(String str, C1756fZ c1756fZ) {
        super.ABW(str, c1756fZ);
    }

    @Override // com.facebook.ads.redexgen.X.IV, com.facebook.ads.redexgen.X.InterfaceC2459r9
    public final /* bridge */ /* synthetic */ void AEH(int i5) {
        super.AEH(i5);
    }
}
