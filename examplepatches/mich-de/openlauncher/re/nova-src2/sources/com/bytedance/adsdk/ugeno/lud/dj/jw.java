package com.bytedance.adsdk.ugeno.lud.dj;

import android.content.Context;
import android.view.MotionEvent;

/* loaded from: classes2.dex */
public class jw extends sya {

    /* renamed from: ea, reason: collision with root package name */
    private float f22445ea;

    /* renamed from: ok, reason: collision with root package name */
    private float f22446ok;

    /* renamed from: ry, reason: collision with root package name */
    private boolean f22447ry;
    private com.bytedance.adsdk.ugeno.lud.xkz xkz;

    public jw(Context context) {
        super(context);
    }

    @Override // com.bytedance.adsdk.ugeno.lud.dj.sya
    public boolean ycx(Object... objArr) {
        if (objArr == null || objArr.length <= 0) {
            return false;
        }
        MotionEvent motionEvent = (MotionEvent) objArr[0];
        com.bytedance.adsdk.ugeno.lud.xkz xkzVar = this.xkz;
        return xkzVar != null ? xkzVar.ycx(this.f22463zb, motionEvent, this.ycx, this) : ycx(this.f22463zb, motionEvent);
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0049  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean ycx(com.bytedance.adsdk.ugeno.zb.sya syaVar, MotionEvent motionEvent) {
        int action = motionEvent.getAction();
        if (action == 0) {
            this.f22445ea = motionEvent.getRawX();
            this.f22446ok = motionEvent.getRawY();
        } else if (action == 1) {
            if (this.f22447ry) {
                this.f22447ry = false;
                this.f22445ea = 0.0f;
                this.f22446ok = 0.0f;
                return false;
            }
            float rawX = motionEvent.getRawX();
            float rawY = motionEvent.getRawY();
            if (Math.abs(rawX - this.f22445ea) < 15.0f && Math.abs(rawY - this.f22446ok) < 15.0f) {
                com.bytedance.adsdk.ugeno.lud.ea eaVar = this.ycx;
                if (eaVar != null) {
                    eaVar.ycx(syaVar, this.f22461lt, this.sya.zb(), this.sya);
                    this.f22445ea = 0.0f;
                    this.f22446ok = 0.0f;
                    return true;
                }
            } else {
                this.f22447ry = false;
                return false;
            }
        } else if (action == 2) {
            float rawX2 = motionEvent.getRawX();
            float rawY2 = motionEvent.getRawY();
            if (Math.abs(rawX2 - this.f22445ea) >= 15.0f || Math.abs(rawY2 - this.f22446ok) >= 15.0f) {
                this.f22447ry = true;
            }
        } else if (action == 3) {
            this.f22447ry = false;
            float rawX3 = motionEvent.getRawX();
            if (motionEvent.getRawY() != 0.0f || rawX3 != 0.0f) {
            }
        }
        return true;
    }

    public void ycx(com.bytedance.adsdk.ugeno.lud.xkz xkzVar) {
        this.xkz = xkzVar;
    }
}
