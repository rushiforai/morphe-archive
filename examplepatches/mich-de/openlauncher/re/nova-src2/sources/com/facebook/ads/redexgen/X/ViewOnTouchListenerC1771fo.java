package com.facebook.ads.redexgen.X;

import android.view.MotionEvent;
import android.view.View;

/* renamed from: com.facebook.ads.redexgen.X.fo, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnTouchListenerC1771fo implements View.OnTouchListener {
    public final /* synthetic */ C0799Be A00;

    public ViewOnTouchListenerC1771fo(C0799Be c0799Be) {
        this.A00 = c0799Be;
    }

    @Override // android.view.View.OnTouchListener
    public final boolean onTouch(View view, MotionEvent motionEvent) {
        this.A00.A0C.A02(new B6(view, motionEvent));
        return false;
    }
}
