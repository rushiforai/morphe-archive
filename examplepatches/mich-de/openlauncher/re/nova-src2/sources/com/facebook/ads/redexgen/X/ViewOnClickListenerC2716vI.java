package com.facebook.ads.redexgen.X;

import android.view.View;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.a;

/* renamed from: com.facebook.ads.redexgen.X.vI, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnClickListenerC2716vI implements View.OnClickListener {
    public final /* synthetic */ ER A00;

    public ViewOnClickListenerC2716vI(ER er2) {
        this.A00 = er2;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            if (this.A00.A03 == null || this.A00.A03.getVisibility() != 8) {
                this.A00.A0P();
                this.A00.A0B.removeCallbacks(this.A00.A0V);
                this.A00.A0T(8);
            } else {
                this.A00.A0T(0);
                this.A00.A0B.postDelayed(this.A00.A0V, a.f39430h);
            }
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
