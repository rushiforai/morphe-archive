package com.facebook.ads.redexgen.X;

import android.view.MotionEvent;
import android.view.View;

/* renamed from: com.facebook.ads.redexgen.X.nZ, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnTouchListenerC2243nZ implements View.OnTouchListener {
    public final /* synthetic */ C0929Gf A00;
    public final /* synthetic */ boolean A01;
    public final /* synthetic */ boolean A02;

    public ViewOnTouchListenerC2243nZ(C0929Gf c0929Gf, boolean z11, boolean z12) {
        this.A00 = c0929Gf;
        this.A02 = z11;
        this.A01 = z12;
    }

    @Override // android.view.View.OnTouchListener
    public final boolean onTouch(View view, MotionEvent motionEvent) {
        if (!this.A02) {
            if (this.A01 && C2203mv.A1X(this.A00.A04)) {
                return false;
            }
            return true;
        }
        return false;
    }
}
