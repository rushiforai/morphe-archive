package com.facebook.ads.redexgen.X;

import android.view.View;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.a;

/* renamed from: com.facebook.ads.redexgen.X.ts, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnClickListenerC2628ts implements View.OnClickListener {
    public final /* synthetic */ AbstractC0891Es A00;

    public ViewOnClickListenerC2628ts(AbstractC0891Es abstractC0891Es) {
        this.A00 = abstractC0891Es;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            if (this.A00.A0J.getVisibility() == 8) {
                this.A00.A0V.A0F().ABg();
                this.A00.A0t(0);
                this.A00.A0G.postDelayed(this.A00.A0Y, a.f39430h);
            } else {
                this.A00.A0V.A0F().ABh();
                this.A00.A0W();
                this.A00.A0G.removeCallbacks(this.A00.A0Y);
                this.A00.A0t(8);
            }
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
