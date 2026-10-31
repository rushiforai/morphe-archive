package com.facebook.ads.redexgen.X;

import android.view.View;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.a;

/* renamed from: com.facebook.ads.redexgen.X.sc, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnClickListenerC2550sc implements View.OnClickListener {
    public final /* synthetic */ C2551sd A00;

    public ViewOnClickListenerC2550sc(C2551sd c2551sd) {
        this.A00 = c2551sd;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            if (this.A00.A02.getVisibility() == 8) {
                this.A00.A07(0);
                this.A00.A00.postDelayed(this.A00.A08, a.f39430h);
            } else {
                this.A00.A06();
                this.A00.A00.removeCallbacks(this.A00.A08);
                this.A00.A07(8);
            }
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
