package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.view.View;

/* loaded from: assets/audience_network/classes.dex */
public class HS implements InterfaceC2309og {
    @Override // com.facebook.ads.redexgen.X.InterfaceC2309og
    public final void AJr(Throwable th2, Object obj) {
        if (obj instanceof InterfaceC2091l6) {
            C0958Hi adContext = ((InterfaceC2091l6) obj).A7M();
            if (adContext != null) {
                adContext.A0Q(th2);
                return;
            }
            return;
        }
        if (!(obj instanceof View)) {
            return;
        }
        Context context = ((View) obj).getContext();
        if (!(context instanceof C0958Hi)) {
            return;
        }
        ((C0958Hi) context).A0Q(th2);
    }
}
