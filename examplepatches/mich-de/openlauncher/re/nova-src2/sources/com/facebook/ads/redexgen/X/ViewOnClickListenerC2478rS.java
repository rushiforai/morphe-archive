package com.facebook.ads.redexgen.X;

import android.view.View;

/* renamed from: com.facebook.ads.redexgen.X.rS, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnClickListenerC2478rS implements View.OnClickListener {
    public final /* synthetic */ C2481rV A00;

    public ViewOnClickListenerC2478rS(C2481rV c2481rV) {
        this.A00 = c2481rV;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A00.A0D();
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
