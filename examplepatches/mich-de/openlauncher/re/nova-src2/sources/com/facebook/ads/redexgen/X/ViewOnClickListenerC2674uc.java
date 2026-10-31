package com.facebook.ads.redexgen.X;

import android.view.View;

/* renamed from: com.facebook.ads.redexgen.X.uc, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnClickListenerC2674uc implements View.OnClickListener {
    public final /* synthetic */ ViewOnClickListenerC0884El A00;
    public final /* synthetic */ String A01;

    public ViewOnClickListenerC2674uc(ViewOnClickListenerC0884El viewOnClickListenerC0884El, String str) {
        this.A00 = viewOnClickListenerC0884El;
        this.A01 = str;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A00.A0E(this.A01);
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
