package com.bytedance.sdk.component.adexpress.dynamic.sya.ycx;

import android.view.MotionEvent;
import android.view.View;

/* loaded from: classes2.dex */
public class fby implements View.OnTouchListener {

    /* renamed from: dj, reason: collision with root package name */
    private float f23484dj;

    /* renamed from: lt, reason: collision with root package name */
    private float f23485lt;
    private float lud;
    private final int sya = 10;

    /* renamed from: ul, reason: collision with root package name */
    private float f23486ul;
    private final com.bytedance.sdk.component.adexpress.dynamic.sya.fby ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final boolean f23487zb;

    public fby(com.bytedance.sdk.component.adexpress.dynamic.sya.fby fbyVar, boolean z11) {
        this.ycx = fbyVar;
        this.f23487zb = z11;
    }

    @Override // android.view.View.OnTouchListener
    public boolean onTouch(View view, MotionEvent motionEvent) {
        com.bytedance.sdk.component.adexpress.dynamic.sya.fby fbyVar;
        com.bytedance.sdk.component.adexpress.dynamic.sya.fby fbyVar2;
        int action = motionEvent.getAction();
        if (action == 0) {
            this.f23484dj = motionEvent.getX();
            this.lud = motionEvent.getY();
            new StringBuilder(", mStartY: ").append(this.lud);
        } else if (action == 1) {
            this.f23485lt = motionEvent.getX();
            this.f23486ul = motionEvent.getY();
            new StringBuilder(", mEndY: ").append(this.f23486ul);
            if (this.f23487zb || (fbyVar2 = this.ycx) == null) {
                float f11 = this.f23485lt - this.f23484dj;
                float f12 = this.f23486ul - this.lud;
                if (com.bytedance.sdk.component.adexpress.dj.ul.zb(com.bytedance.sdk.component.adexpress.dj.ycx(), Math.abs((float) Math.sqrt((f12 * f12) + (f11 * f11)))) > 10.0f && (fbyVar = this.ycx) != null) {
                    fbyVar.ycx();
                }
            } else {
                fbyVar2.ycx();
            }
        }
        return true;
    }
}
