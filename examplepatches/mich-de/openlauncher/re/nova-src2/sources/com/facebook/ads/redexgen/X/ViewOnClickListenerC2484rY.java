package com.facebook.ads.redexgen.X;

import android.view.View;

/* renamed from: com.facebook.ads.redexgen.X.rY, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnClickListenerC2484rY implements View.OnClickListener {
    public final /* synthetic */ FS A00;

    public ViewOnClickListenerC2484rY(FS fs2) {
        this.A00 = fs2;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A00.A0T.A04(EnumC2231nN.A07, null);
            this.A00.A0W.A5C(this.A00.A0X.A8X());
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
