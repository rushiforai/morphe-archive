package com.facebook.ads.redexgen.X;

import android.view.View;

/* renamed from: com.facebook.ads.redexgen.X.ok, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnClickListenerC2313ok implements View.OnClickListener {
    public final /* synthetic */ C2312oj A00;

    public ViewOnClickListenerC2313ok(C2312oj c2312oj) {
        this.A00 = c2312oj;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A00.A05.performClick();
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
