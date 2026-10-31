package com.facebook.ads.redexgen.X;

import android.view.View;

/* renamed from: com.facebook.ads.redexgen.X.sZ, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnClickListenerC2547sZ implements View.OnClickListener {
    public final /* synthetic */ FC A00;

    public ViewOnClickListenerC2547sZ(FC fc2) {
        this.A00 = fc2;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A00.A0D.AAG();
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
