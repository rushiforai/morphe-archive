package com.facebook.ads.redexgen.X;

import android.view.View;
import android.widget.LinearLayout;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.tx, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class ViewOnClickListenerC2633tx implements View.OnClickListener {
    public final /* synthetic */ LinearLayout A00;
    public final /* synthetic */ C2635tz A01;

    public ViewOnClickListenerC2633tx(C2635tz c2635tz, LinearLayout linearLayout) {
        this.A01 = c2635tz;
        this.A00 = linearLayout;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            if (this.A01.A03.getVisibility() == 8) {
                this.A01.A08.A0F().ABg();
                this.A01.A07(0);
                this.A00.getHandler().postDelayed(this.A01.A0B, this.A01.A00);
            } else {
                this.A01.A08.A0F().ABh();
                this.A01.A06();
                this.A00.getHandler().removeCallbacks(this.A01.A0B);
                this.A01.A07(8);
            }
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
