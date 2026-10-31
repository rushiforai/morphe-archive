package com.bytedance.adsdk.ugeno.core.zb;

import android.content.Context;
import android.view.MotionEvent;
import android.view.ViewConfiguration;
import com.bytedance.adsdk.ugeno.core.ry;
import com.bytedance.adsdk.ugeno.core.syc;

/* loaded from: classes2.dex */
public class sya {

    /* renamed from: dj, reason: collision with root package name */
    private Context f22267dj;

    /* renamed from: lt, reason: collision with root package name */
    private final int f22268lt;
    private boolean lud;
    private ry sya;
    private float ycx;

    /* renamed from: zb, reason: collision with root package name */
    private float f22269zb;

    public sya(Context context, ry ryVar) {
        this.f22267dj = context;
        this.sya = ryVar;
        this.f22268lt = ViewConfiguration.get(context).getScaledTouchSlop();
    }

    public boolean ycx(syc sycVar, com.bytedance.adsdk.ugeno.zb.sya syaVar, MotionEvent motionEvent) {
        int action = motionEvent.getAction();
        if (action == 0) {
            this.ycx = motionEvent.getX();
            this.f22269zb = motionEvent.getY();
        } else if (action != 1) {
            if (action == 2) {
                float x11 = motionEvent.getX();
                float y11 = motionEvent.getY();
                if (Math.abs(x11 - this.ycx) >= this.f22268lt || Math.abs(y11 - this.f22269zb) >= this.f22268lt) {
                    this.lud = true;
                }
            } else if (action == 3) {
                this.lud = false;
            }
        } else {
            if (this.lud) {
                this.lud = false;
                return false;
            }
            float x12 = motionEvent.getX();
            float y12 = motionEvent.getY();
            if (Math.abs(x12 - this.ycx) >= this.f22268lt || Math.abs(y12 - this.f22269zb) >= this.f22268lt) {
                this.lud = false;
            } else if (sycVar != null) {
                sycVar.ycx(this.sya, syaVar, syaVar);
                return true;
            }
        }
        return true;
    }
}
