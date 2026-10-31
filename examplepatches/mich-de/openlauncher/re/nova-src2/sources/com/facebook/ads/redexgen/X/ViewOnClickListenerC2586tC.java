package com.facebook.ads.redexgen.X;

import android.view.View;

/* renamed from: com.facebook.ads.redexgen.X.tC, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnClickListenerC2586tC implements View.OnClickListener {
    public final /* synthetic */ F6 A00;

    public ViewOnClickListenerC2586tC(F6 f62) {
        this.A00 = f62;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A00.A09.A0F().AAa();
            if (this.A00.A06 != null) {
                this.A00.A06.AEP();
            }
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
