package com.facebook.ads.redexgen.X;

import android.view.View;

/* renamed from: com.facebook.ads.redexgen.X.vF, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnClickListenerC2713vF implements View.OnClickListener {
    public final /* synthetic */ ES A00;

    public ViewOnClickListenerC2713vF(ES es2) {
        this.A00 = es2;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            if (this.A00.A02 != null) {
                this.A00.A02.AAP();
            }
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
