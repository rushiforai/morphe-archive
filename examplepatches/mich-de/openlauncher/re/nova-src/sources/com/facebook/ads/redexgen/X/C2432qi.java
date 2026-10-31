package com.facebook.ads.redexgen.X;

import android.view.GestureDetector;
import android.view.MotionEvent;

/* renamed from: com.facebook.ads.redexgen.X.qi, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C2432qi extends GestureDetector.SimpleOnGestureListener {
    public final /* synthetic */ int A00;
    public final /* synthetic */ int A01;
    public final /* synthetic */ InterfaceC2433qj A02;
    public final /* synthetic */ ViewOnTouchListenerC2434qk A03;

    public C2432qi(ViewOnTouchListenerC2434qk viewOnTouchListenerC2434qk, InterfaceC2433qj interfaceC2433qj, int i5, int i11) {
        this.A03 = viewOnTouchListenerC2434qk;
        this.A02 = interfaceC2433qj;
        this.A00 = i5;
        this.A01 = i11;
    }

    @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
    public final boolean onDown(MotionEvent motionEvent) {
        return true;
    }

    @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
    public final boolean onFling(MotionEvent motionEvent, MotionEvent motionEvent2, float f11, float f12) {
        if (motionEvent == null || motionEvent2 == null) {
            return false;
        }
        float y11 = motionEvent2.getY() - motionEvent.getY();
        float diffX = motionEvent2.getX() - motionEvent.getX();
        float diffY = Math.abs(y11);
        if (diffY > Math.abs(diffX) && y11 > this.A00) {
            float diffY2 = Math.abs(f12);
            if (diffY2 > this.A01) {
                this.A02.AHF();
                return true;
            }
        }
        return false;
    }

    @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnDoubleTapListener
    public final boolean onSingleTapConfirmed(MotionEvent motionEvent) {
        this.A02.AH4();
        return true;
    }
}
