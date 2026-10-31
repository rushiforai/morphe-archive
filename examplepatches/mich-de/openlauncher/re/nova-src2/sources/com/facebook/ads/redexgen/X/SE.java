package com.facebook.ads.redexgen.X;

import android.os.Looper;
import com.facebook.ads.AdError;

/* loaded from: assets/audience_network/classes.dex */
public class SE implements InterfaceC1212Ru {
    @Override // com.facebook.ads.redexgen.X.InterfaceC1212Ru
    public final /* synthetic */ InterfaceC1211Rt AIG(C1207Rp c1207Rp, VC vc) {
        return AbstractC1209Rr.A00(this, c1207Rp, vc);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1212Ru
    public final /* synthetic */ void AIH() {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1212Ru
    public final InterfaceC1198Rg A3Y(C1207Rp c1207Rp, VC vc) {
        if (vc.A0O == null) {
            return null;
        }
        return new SC(new C1196Re(new SP(1), AdError.MEDIAVIEW_MISSING_ERROR_CODE));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1212Ru
    public final int A87(VC vc) {
        return vc.A0O != null ? 1 : 0;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1212Ru
    public final void AKw(Looper looper, QD qd2) {
    }
}
