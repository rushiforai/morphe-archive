package com.bytedance.sdk.component.adexpress.dynamic.sya.ycx;

import android.view.MotionEvent;
import android.view.View;

/* loaded from: classes2.dex */
public class lt implements View.OnTouchListener {
    private static int sya = 10;

    /* renamed from: dj, reason: collision with root package name */
    private boolean f23488dj;
    private com.bytedance.sdk.component.adexpress.dynamic.sya.fby lud;
    private float ycx;

    /* renamed from: zb, reason: collision with root package name */
    private float f23489zb;

    public lt(com.bytedance.sdk.component.adexpress.dynamic.sya.fby fbyVar) {
        this.lud = fbyVar;
    }

    @Override // android.view.View.OnTouchListener
    public boolean onTouch(View view, MotionEvent motionEvent) {
        int action = motionEvent.getAction();
        if (action == 0) {
            this.ycx = motionEvent.getX();
            this.f23489zb = motionEvent.getY();
        } else if (action != 1) {
            if (action == 2) {
                float x11 = motionEvent.getX();
                float y11 = motionEvent.getY();
                if (Math.abs(x11 - this.ycx) >= sya || Math.abs(y11 - this.f23489zb) >= sya) {
                    this.f23488dj = true;
                }
            } else if (action == 3) {
                this.f23488dj = false;
            }
        } else {
            if (this.f23488dj) {
                this.f23488dj = false;
                return false;
            }
            float x12 = motionEvent.getX();
            float y12 = motionEvent.getY();
            if (Math.abs(x12 - this.ycx) >= sya || Math.abs(y12 - this.f23489zb) >= sya) {
                this.f23488dj = false;
            } else {
                com.bytedance.sdk.component.adexpress.dynamic.sya.fby fbyVar = this.lud;
                if (fbyVar != null) {
                    fbyVar.ycx();
                }
            }
        }
        return true;
    }
}
