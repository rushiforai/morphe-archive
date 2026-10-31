package com.facebook.ads.redexgen.X;

import android.view.View;
import java.util.Iterator;

/* renamed from: com.facebook.ads.redexgen.X.uK, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnClickListenerC2656uK implements View.OnClickListener {
    public final /* synthetic */ C2659uN A00;

    public ViewOnClickListenerC2656uK(C2659uN c2659uN) {
        this.A00 = c2659uN;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A00.A05.AFq();
            if (this.A00.A00 != null) {
                AbstractC2426qc.A0M(this.A00.A00);
            }
            Iterator it = this.A00.A07.iterator();
            while (it.hasNext()) {
                AbstractC2426qc.A0P((View) it.next(), 0);
            }
            AbstractC2426qc.A0K(this.A00);
            if (this.A00.A06 == null) {
                return;
            }
            AbstractC2426qc.A0P(this.A00.A06, 0);
            this.A00.A06.A0f(EnumC1664e4.A03, 14);
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
