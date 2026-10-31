package com.facebook.ads.redexgen.X;

import android.view.View;

/* renamed from: com.facebook.ads.redexgen.X.Cd, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C0824Cd implements InterfaceC2751vr {
    public final /* synthetic */ C0823Cc A00;

    public C0824Cd(C0823Cc c0823Cc) {
        this.A00 = c0823Cc;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2751vr
    public final void AHg(View view) {
        if (this.A00.A0G) {
            this.A00.A0E = false;
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2751vr
    public final void AHi(View view) {
        ED ed = (ED) view;
        ed.A1m();
        if (this.A00.A0G) {
            this.A00.A0E = true;
        }
        if (this.A00.A0B.A0Z() && ((Integer) ed.getTag(-1593835536)).intValue() == 0) {
            this.A00.A0B.A0U();
        }
    }
}
