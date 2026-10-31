package com.bytedance.sdk.component.adexpress.dynamic.sya.ycx;

import android.view.MotionEvent;
import android.view.View;

/* loaded from: classes2.dex */
public class dj implements View.OnTouchListener {

    /* renamed from: dj, reason: collision with root package name */
    private float f23477dj;

    /* renamed from: ea, reason: collision with root package name */
    private boolean f23478ea;
    private boolean fby;

    /* renamed from: jc, reason: collision with root package name */
    private int f23479jc;

    /* renamed from: jw, reason: collision with root package name */
    private com.bytedance.sdk.component.adexpress.dynamic.sya.fby f23480jw;

    /* renamed from: lt, reason: collision with root package name */
    private float f23481lt;
    private boolean lud = true;
    private float sya;

    /* renamed from: ul, reason: collision with root package name */
    private float f23482ul;
    private float ycx;

    /* renamed from: zb, reason: collision with root package name */
    private float f23483zb;

    public dj(com.bytedance.sdk.component.adexpress.dynamic.sya.fby fbyVar, int i5, boolean z11) {
        this.f23480jw = fbyVar;
        this.f23479jc = i5;
        this.f23478ea = z11;
    }

    @Override // android.view.View.OnTouchListener
    public boolean onTouch(View view, MotionEvent motionEvent) {
        com.bytedance.sdk.component.adexpress.dynamic.sya.fby fbyVar;
        com.bytedance.sdk.component.adexpress.dynamic.sya.fby fbyVar2;
        com.bytedance.sdk.component.adexpress.dynamic.sya.fby fbyVar3;
        int action = motionEvent.getAction();
        if (action == 0) {
            this.ycx = motionEvent.getX();
            this.f23483zb = motionEvent.getY();
            this.f23481lt = motionEvent.getY();
            this.lud = true;
        } else if (action != 1) {
            if (action == 2) {
                float y11 = motionEvent.getY();
                this.f23482ul = y11;
                if (Math.abs(y11 - this.f23481lt) > 10.0f) {
                    this.fby = true;
                }
                this.f23477dj = motionEvent.getX();
                this.sya = motionEvent.getY();
                if (Math.abs(this.f23477dj - this.ycx) > 8.0f || Math.abs(this.sya - this.f23483zb) > 8.0f) {
                    this.lud = false;
                }
            }
        } else {
            if (!this.fby && !this.lud) {
                return false;
            }
            if (this.f23478ea || (fbyVar3 = this.f23480jw) == null) {
                int iZb = com.bytedance.sdk.component.adexpress.dj.ul.zb(com.bytedance.sdk.component.adexpress.dj.ycx(), Math.abs(this.f23482ul - this.f23481lt));
                if (this.f23482ul - this.f23481lt < 0.0f && iZb > this.f23479jc && (fbyVar2 = this.f23480jw) != null) {
                    fbyVar2.ycx();
                } else if (this.lud && (fbyVar = this.f23480jw) != null) {
                    fbyVar.ycx();
                }
            } else {
                fbyVar3.ycx();
            }
        }
        return true;
    }
}
