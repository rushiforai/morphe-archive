package com.facebook.ads.redexgen.X;

import android.view.View;

/* renamed from: com.facebook.ads.redexgen.X.vB, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnClickListenerC2709vB implements View.OnClickListener {
    public final /* synthetic */ ET A00;

    public ViewOnClickListenerC2709vB(ET et2) {
        this.A00 = et2;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            if (!this.A00.A0M) {
                this.A00.A0N = true;
                if (this.A00.A0c != null) {
                    this.A00.A0f(((C07297v) this.A00.A0c).A0O().toString());
                }
                if (this.A00.A0E.A1N() >= 0) {
                    this.A00.A08.postDelayed(this.A00.A0i, this.A00.A0E.A1N());
                }
            }
            this.A00.A0i(this.A00.A0M ? false : true);
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
