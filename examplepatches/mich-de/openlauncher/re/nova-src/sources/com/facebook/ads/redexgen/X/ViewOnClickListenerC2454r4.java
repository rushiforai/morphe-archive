package com.facebook.ads.redexgen.X;

import android.view.View;

/* renamed from: com.facebook.ads.redexgen.X.r4, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnClickListenerC2454r4 implements View.OnClickListener {
    public final /* synthetic */ C0922Fy A00;

    public ViewOnClickListenerC2454r4(C0922Fy c0922Fy) {
        this.A00 = c0922Fy;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A00.A0G();
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
