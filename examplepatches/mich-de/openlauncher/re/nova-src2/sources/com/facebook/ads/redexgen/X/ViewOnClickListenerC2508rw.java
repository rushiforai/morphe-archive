package com.facebook.ads.redexgen.X;

import android.view.View;

/* renamed from: com.facebook.ads.redexgen.X.rw, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnClickListenerC2508rw implements View.OnClickListener {
    public final /* synthetic */ FI A00;

    public ViewOnClickListenerC2508rw(FI fi2) {
        this.A00 = fi2;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A00.A07.AEx();
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
