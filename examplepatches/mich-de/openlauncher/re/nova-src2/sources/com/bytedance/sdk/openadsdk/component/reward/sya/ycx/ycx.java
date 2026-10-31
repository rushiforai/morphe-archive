package com.bytedance.sdk.openadsdk.component.reward.sya.ycx;

import android.view.MotionEvent;

/* loaded from: classes2.dex */
public class ycx implements com.bytedance.sdk.component.jw.lud {
    private dj ycx;

    /* renamed from: zb, reason: collision with root package name */
    private boolean f24915zb;

    public ycx(dj djVar) {
        this.f24915zb = false;
        this.ycx = djVar;
        if (djVar == null) {
            this.f24915zb = false;
        } else {
            this.f24915zb = djVar.dj();
        }
    }

    @Override // com.bytedance.sdk.component.jw.lud
    public boolean ycx(MotionEvent motionEvent) {
        if (ycx(this.ycx, motionEvent.getX(), motionEvent.getY()) && this.f24915zb) {
            return false;
        }
        this.f24915zb = false;
        return false;
    }

    @Override // com.bytedance.sdk.component.jw.lud
    public boolean zb(MotionEvent motionEvent) {
        return this.f24915zb && ycx(this.ycx, motionEvent.getX(), motionEvent.getY());
    }

    public void ycx(boolean z11) {
        this.f24915zb = z11;
    }

    public boolean ycx(dj djVar, float f11, float f12) {
        if (djVar == null) {
            return false;
        }
        return djVar.ycx(f11, f12);
    }
}
