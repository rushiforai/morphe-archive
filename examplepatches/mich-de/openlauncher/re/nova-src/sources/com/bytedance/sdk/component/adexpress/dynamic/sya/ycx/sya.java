package com.bytedance.sdk.component.adexpress.dynamic.sya.ycx;

import android.view.MotionEvent;
import android.view.View;

/* loaded from: classes2.dex */
public class sya implements View.OnTouchListener {

    /* renamed from: dj, reason: collision with root package name */
    private float f23492dj;
    private boolean fby;

    /* renamed from: jw, reason: collision with root package name */
    private boolean f23493jw;

    /* renamed from: lt, reason: collision with root package name */
    private com.bytedance.sdk.component.adexpress.dynamic.sya.fby f23494lt;
    private boolean lud;
    private float sya;

    /* renamed from: ul, reason: collision with root package name */
    private int f23495ul;
    private float ycx;

    /* renamed from: zb, reason: collision with root package name */
    private float f23496zb;

    public sya(com.bytedance.sdk.component.adexpress.dynamic.sya.fby fbyVar) {
        this(fbyVar, 5);
    }

    @Override // android.view.View.OnTouchListener
    public boolean onTouch(View view, MotionEvent motionEvent) {
        com.bytedance.sdk.component.adexpress.dynamic.sya.fby fbyVar;
        com.bytedance.sdk.component.adexpress.dynamic.sya.fby fbyVar2;
        com.bytedance.sdk.component.adexpress.dynamic.sya.fby fbyVar3;
        if (this.f23493jw) {
            return true;
        }
        int action = motionEvent.getAction();
        if (action == 0) {
            this.ycx = motionEvent.getX();
            this.f23496zb = motionEvent.getY();
        } else if (action != 1) {
            if (action == 2) {
                this.f23492dj = motionEvent.getX();
                this.sya = motionEvent.getY();
                if (Math.abs(this.f23492dj - this.ycx) > 10.0f) {
                    this.lud = true;
                }
                if (Math.abs(this.f23492dj - this.ycx) > 8.0f || Math.abs(this.sya - this.f23496zb) > 8.0f) {
                    this.fby = false;
                }
                int iZb = com.bytedance.sdk.component.adexpress.dj.ul.zb(com.bytedance.sdk.component.adexpress.dj.ycx(), Math.abs(this.f23492dj - this.ycx));
                if (this.f23492dj > this.ycx && iZb > this.f23495ul && (fbyVar3 = this.f23494lt) != null) {
                    fbyVar3.ycx();
                    this.f23493jw = true;
                }
            }
        } else {
            if (!this.lud && !this.fby) {
                return false;
            }
            float x11 = motionEvent.getX();
            float y11 = motionEvent.getY();
            int iZb2 = com.bytedance.sdk.component.adexpress.dj.ul.zb(com.bytedance.sdk.component.adexpress.dj.ycx(), Math.abs(this.f23492dj - this.ycx));
            if (this.f23492dj > this.ycx && iZb2 > this.f23495ul && (fbyVar2 = this.f23494lt) != null) {
                fbyVar2.ycx();
                this.f23493jw = true;
            }
            float fAbs = Math.abs(x11 - this.ycx);
            float fAbs2 = Math.abs(y11 - this.f23496zb);
            if ((fAbs < 8.0f || fAbs2 < 8.0f) && (fbyVar = this.f23494lt) != null) {
                fbyVar.zb();
                this.f23493jw = true;
            }
        }
        return true;
    }

    public sya(com.bytedance.sdk.component.adexpress.dynamic.sya.fby fbyVar, int i5) {
        this.f23495ul = 5;
        this.fby = true;
        this.f23494lt = fbyVar;
        if (i5 > 0) {
            this.f23495ul = i5;
        }
    }
}
