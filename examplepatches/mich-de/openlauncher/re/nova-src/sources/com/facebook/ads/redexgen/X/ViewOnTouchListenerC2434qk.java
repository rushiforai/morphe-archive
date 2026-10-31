package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.View;

/* renamed from: com.facebook.ads.redexgen.X.qk, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class ViewOnTouchListenerC2434qk implements View.OnTouchListener {
    public final GestureDetector A00;

    public ViewOnTouchListenerC2434qk(int i5, int i11, Context context, InterfaceC2433qj interfaceC2433qj) {
        this.A00 = new GestureDetector(context, new C2432qi(this, interfaceC2433qj, i5, i11));
    }

    public final void A00(View view) {
        if (view != null) {
            view.setOnTouchListener(this);
        }
    }

    @Override // android.view.View.OnTouchListener
    public final boolean onTouch(View view, MotionEvent motionEvent) {
        return this.A00.onTouchEvent(motionEvent);
    }
}
