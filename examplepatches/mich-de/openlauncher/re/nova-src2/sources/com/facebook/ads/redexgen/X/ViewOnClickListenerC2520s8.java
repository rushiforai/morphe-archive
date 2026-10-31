package com.facebook.ads.redexgen.X;

import android.view.View;

/* renamed from: com.facebook.ads.redexgen.X.s8, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnClickListenerC2520s8 implements View.OnClickListener {
    public final /* synthetic */ C2522sA A00;

    public ViewOnClickListenerC2520s8(C2522sA c2522sA) {
        this.A00 = c2522sA;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A00.A04.ABX();
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
