package com.bytedance.sdk.component.adexpress.dynamic.sya.ycx;

import android.view.MotionEvent;
import android.view.View;
import com.bytedance.sdk.component.adexpress.dynamic.sya.jw;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.a;

/* loaded from: classes2.dex */
public class zb implements View.OnTouchListener {

    /* renamed from: dj, reason: collision with root package name */
    private boolean f23511dj;

    /* renamed from: lt, reason: collision with root package name */
    private com.bytedance.sdk.component.adexpress.dynamic.sya.fby f23512lt;
    private jw lud;
    private long sya;
    private float ycx;

    /* renamed from: zb, reason: collision with root package name */
    private float f23513zb;

    public zb(jw jwVar, com.bytedance.sdk.component.adexpress.dynamic.sya.fby fbyVar) {
        this.lud = jwVar;
        this.f23512lt = fbyVar;
    }

    @Override // android.view.View.OnTouchListener
    public boolean onTouch(View view, MotionEvent motionEvent) {
        int action = motionEvent.getAction();
        if (action == 0) {
            this.sya = System.currentTimeMillis();
            this.ycx = motionEvent.getX();
            this.f23513zb = motionEvent.getY();
            this.lud.lud();
        } else if (action != 1) {
            if (action == 2) {
                float x11 = motionEvent.getX();
                float y11 = motionEvent.getY();
                if (Math.abs(x11 - this.ycx) >= com.bytedance.sdk.component.adexpress.dj.ul.ycx(com.bytedance.sdk.component.adexpress.dj.ycx(), 10.0f) || Math.abs(y11 - this.f23513zb) >= com.bytedance.sdk.component.adexpress.dj.ul.ycx(com.bytedance.sdk.component.adexpress.dj.ycx(), 10.0f)) {
                    this.f23511dj = true;
                    this.lud.lt();
                }
            }
        } else {
            if (this.f23511dj) {
                return false;
            }
            if (System.currentTimeMillis() - this.sya >= a.f39430h) {
                com.bytedance.sdk.component.adexpress.dynamic.sya.fby fbyVar = this.f23512lt;
                if (fbyVar != null) {
                    fbyVar.ycx();
                }
            } else {
                this.lud.lt();
            }
        }
        return true;
    }
}
