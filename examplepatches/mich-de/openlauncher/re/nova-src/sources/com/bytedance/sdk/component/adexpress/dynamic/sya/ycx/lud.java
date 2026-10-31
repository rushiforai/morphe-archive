package com.bytedance.sdk.component.adexpress.dynamic.sya.ycx;

import android.view.MotionEvent;
import android.view.View;

/* loaded from: classes2.dex */
public class lud implements View.OnTouchListener {

    /* renamed from: dj, reason: collision with root package name */
    private com.bytedance.sdk.component.adexpress.dynamic.sya.fby f23490dj;
    private int lud;
    private boolean sya;
    private float ycx;

    /* renamed from: zb, reason: collision with root package name */
    private float f23491zb;

    public lud(com.bytedance.sdk.component.adexpress.dynamic.sya.fby fbyVar, int i5) {
        this.f23490dj = fbyVar;
        this.lud = i5;
    }

    @Override // android.view.View.OnTouchListener
    public boolean onTouch(View view, MotionEvent motionEvent) {
        com.bytedance.sdk.component.adexpress.dynamic.sya.fby fbyVar;
        int action = motionEvent.getAction();
        if (action == 0) {
            this.ycx = motionEvent.getY();
        } else if (action != 1) {
            if (action == 2) {
                float y11 = motionEvent.getY();
                this.f23491zb = y11;
                if (Math.abs(y11 - this.ycx) > 10.0f) {
                    this.sya = true;
                }
            }
        } else {
            if (!this.sya) {
                return false;
            }
            int iZb = com.bytedance.sdk.component.adexpress.dj.ul.zb(com.bytedance.sdk.component.adexpress.dj.ycx(), Math.abs(this.f23491zb - this.ycx));
            if (this.f23491zb - this.ycx < 0.0f && iZb > this.lud && (fbyVar = this.f23490dj) != null) {
                fbyVar.ycx();
                this.ycx = 0.0f;
                this.f23491zb = 0.0f;
                this.sya = false;
            }
        }
        return true;
    }
}
