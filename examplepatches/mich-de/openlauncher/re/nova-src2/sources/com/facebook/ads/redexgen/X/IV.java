package com.facebook.ads.redexgen.X;

import android.view.View;
import android.widget.RelativeLayout;
import java.lang.ref.WeakReference;

/* loaded from: assets/audience_network/classes.dex */
public class IV implements InterfaceC2459r9 {
    public final WeakReference<C1998jY> A00;

    public IV(C1998jY c1998jY) {
        this.A00 = new WeakReference<>(c1998jY);
    }

    private void A00(C1998jY c1998jY) {
        C1908i4 c1908i4A07 = c1998jY.A07();
        if (c1908i4A07 != null && c1998jY.A04() != null) {
            c1998jY.A04().bringChildToFront(c1908i4A07);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2459r9
    public void A4U(View view, int i5, RelativeLayout.LayoutParams layoutParams) {
        C1998jY c1998jY = this.A00.get();
        if (c1998jY != null && c1998jY.A04() != null) {
            c1998jY.A04().addView(view, i5, layoutParams);
            A00(c1998jY);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2459r9
    public void A4V(View view, RelativeLayout.LayoutParams layoutParams) {
        C1998jY c1998jY = this.A00.get();
        if (c1998jY != null && c1998jY.A04() != null) {
            c1998jY.A04().addView(view, layoutParams);
            A00(c1998jY);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2459r9
    public void A5C(String str) {
        if (this.A00.get() != null) {
            this.A00.get().A0C(str);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2459r9
    public void A5D(String str, C2170mO c2170mO) {
        if (this.A00.get() != null) {
            this.A00.get().A0E(str, c2170mO);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2459r9
    public void ABW(String str, C1756fZ c1756fZ) {
        if (this.A00.get() != null) {
            this.A00.get().A0D(str, c1756fZ);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2459r9
    public void AEH(int i5) {
        C1998jY activityApi = this.A00.get();
        if (activityApi != null) {
            activityApi.finish(i5);
        }
    }
}
