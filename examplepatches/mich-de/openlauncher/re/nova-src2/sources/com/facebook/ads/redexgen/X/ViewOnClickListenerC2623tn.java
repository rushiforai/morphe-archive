package com.facebook.ads.redexgen.X;

import android.view.View;

/* renamed from: com.facebook.ads.redexgen.X.tn, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnClickListenerC2623tn implements View.OnClickListener {
    public final /* synthetic */ C06805y A00;

    public ViewOnClickListenerC2623tn(C06805y c06805y) {
        this.A00 = c06805y;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            if (this.A00.A0h instanceof C07297v) {
                if (!this.A00.A0J) {
                    this.A00.A0p.ADH();
                    this.A00.A0K = true;
                    this.A00.A10(((C07297v) this.A00.A0h).A0O().toString());
                    if (((AbstractC0861Do) this.A00).A08.A1N() >= 0) {
                        this.A00.A0d.postDelayed(this.A00.A11, ((AbstractC0861Do) this.A00).A08.A1N());
                    }
                }
                this.A00.A15(this.A00.A0J ? false : true);
            }
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
