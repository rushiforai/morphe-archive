package com.facebook.ads.redexgen.X;

import android.view.View;

/* renamed from: com.facebook.ads.redexgen.X.sO, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnClickListenerC2536sO implements View.OnClickListener {
    public final /* synthetic */ C2528sG A00;
    public final /* synthetic */ FD A01;

    public ViewOnClickListenerC2536sO(FD fd2, C2528sG c2528sG) {
        this.A01 = fd2;
        this.A00 = c2528sG;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A00.A01();
            this.A01.A0D.ABY();
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
