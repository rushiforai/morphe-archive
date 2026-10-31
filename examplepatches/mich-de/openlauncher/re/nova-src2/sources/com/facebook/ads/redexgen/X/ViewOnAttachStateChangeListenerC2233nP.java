package com.facebook.ads.redexgen.X;

import android.view.View;

/* renamed from: com.facebook.ads.redexgen.X.nP, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnAttachStateChangeListenerC2233nP implements View.OnAttachStateChangeListener {
    public final /* synthetic */ EnumC2231nN A00;
    public final /* synthetic */ C2232nO A01;

    public ViewOnAttachStateChangeListenerC2233nP(C2232nO c2232nO, EnumC2231nN enumC2231nN) {
        this.A01 = c2232nO;
        this.A00 = enumC2231nN;
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewAttachedToWindow(View view) {
        this.A01.A04(this.A00, null);
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewDetachedFromWindow(View view) {
    }
}
