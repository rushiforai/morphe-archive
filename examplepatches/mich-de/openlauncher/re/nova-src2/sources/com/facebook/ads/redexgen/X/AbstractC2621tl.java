package com.facebook.ads.redexgen.X;

import android.view.View;

/* renamed from: com.facebook.ads.redexgen.X.tl, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2621tl {
    public static void A00(View view, boolean z11, View.OnClickListener onClickListener) {
        if (!z11) {
            view.setOnClickListener(onClickListener);
        } else {
            if (!z11) {
                return;
            }
            ViewOnClickListenerC2620tk viewOnClickListenerC2620tk = new ViewOnClickListenerC2620tk(onClickListener);
            view.setOnClickListener(viewOnClickListenerC2620tk);
            view.setOnTouchListener(new ViewOnTouchListenerC2619tj(viewOnClickListenerC2620tk));
        }
    }
}
