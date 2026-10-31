package com.facebook.ads.redexgen.X;

import android.view.View;

/* renamed from: com.facebook.ads.redexgen.X.sS, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnClickListenerC2540sS implements View.OnClickListener {
    public final /* synthetic */ C2542sU A00;

    public ViewOnClickListenerC2540sS(C2542sU c2542sU) {
        this.A00 = c2542sU;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A00.A02.AAG();
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
