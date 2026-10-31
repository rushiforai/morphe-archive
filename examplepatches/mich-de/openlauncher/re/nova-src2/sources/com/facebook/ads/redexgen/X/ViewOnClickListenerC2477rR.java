package com.facebook.ads.redexgen.X;

import android.view.View;

/* renamed from: com.facebook.ads.redexgen.X.rR, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnClickListenerC2477rR implements View.OnClickListener {
    public final /* synthetic */ C07066y A00;

    public ViewOnClickListenerC2477rR(C07066y c07066y) {
        this.A00 = c07066y;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View v11) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A00.A0B.onClick(v11);
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
