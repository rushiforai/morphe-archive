package com.facebook.ads.redexgen.X;

import android.view.View;

/* renamed from: com.facebook.ads.redexgen.X.uL, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnClickListenerC2657uL implements View.OnClickListener {
    public final /* synthetic */ C2659uN A00;

    public ViewOnClickListenerC2657uL(C2659uN c2659uN) {
        this.A00 = c2659uN;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A00.A05();
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
