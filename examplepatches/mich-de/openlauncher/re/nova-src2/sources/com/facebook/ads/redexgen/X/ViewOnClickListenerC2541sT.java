package com.facebook.ads.redexgen.X;

import android.view.View;

/* renamed from: com.facebook.ads.redexgen.X.sT, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnClickListenerC2541sT implements View.OnClickListener {
    public final /* synthetic */ C1823ge A00;
    public final /* synthetic */ C2528sG A01;
    public final /* synthetic */ C2542sU A02;

    public ViewOnClickListenerC2541sT(C2542sU c2542sU, C2528sG c2528sG, C1823ge c1823ge) {
        this.A02 = c2542sU;
        this.A01 = c2528sG;
        this.A00 = c1823ge;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A01.A01();
            this.A02.A02.AG9(this.A00);
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
