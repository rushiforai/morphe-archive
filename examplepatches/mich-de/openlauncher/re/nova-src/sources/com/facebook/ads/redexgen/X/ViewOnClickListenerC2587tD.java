package com.facebook.ads.redexgen.X;

import android.view.View;

/* renamed from: com.facebook.ads.redexgen.X.tD, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnClickListenerC2587tD implements View.OnClickListener {
    public final /* synthetic */ F6 A00;

    public ViewOnClickListenerC2587tD(F6 f62) {
        this.A00 = f62;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            if (this.A00.A08.canGoBack()) {
                this.A00.A08.goBack();
            }
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
