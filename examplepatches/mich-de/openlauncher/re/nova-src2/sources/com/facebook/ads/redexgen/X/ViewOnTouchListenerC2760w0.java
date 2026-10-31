package com.facebook.ads.redexgen.X;

import android.view.MotionEvent;
import android.view.View;

/* renamed from: com.facebook.ads.redexgen.X.w0, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnTouchListenerC2760w0 implements View.OnTouchListener {
    public final /* synthetic */ C6U A00;

    public ViewOnTouchListenerC2760w0(C6U c6u) {
        this.A00 = c6u;
    }

    @Override // android.view.View.OnTouchListener
    public final boolean onTouch(View view, MotionEvent motionEvent) {
        this.A00.A0G.dispatchTouchEvent(MotionEvent.obtain(motionEvent));
        return false;
    }
}
