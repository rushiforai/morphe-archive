package com.facebook.ads.redexgen.X;

import android.view.View;

/* renamed from: com.facebook.ads.redexgen.X.t4, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnAttachStateChangeListenerC2578t4 implements View.OnAttachStateChangeListener {
    public final /* synthetic */ C2579t5 A00;

    public ViewOnAttachStateChangeListenerC2578t4(C2579t5 c2579t5) {
        this.A00 = c2579t5;
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewAttachedToWindow(View view) {
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewDetachedFromWindow(View view) {
        this.A00.A09();
        this.A00.A03.setOnClickListener(null);
    }
}
