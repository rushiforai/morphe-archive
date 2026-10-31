package com.bytedance.sdk.component.jw;

import android.content.Context;
import android.view.View;
import android.view.ViewConfiguration;

/* loaded from: classes2.dex */
public abstract class sya implements View.OnTouchListener {
    private ViewConfiguration ycx;

    /* renamed from: zb, reason: collision with root package name */
    private int f23806zb = -1;

    public abstract void ycx(View.OnTouchListener onTouchListener);

    public boolean ycx(float f11, float f12, float f13, float f14, Context context) {
        if (this.ycx == null) {
            this.ycx = ViewConfiguration.get(context);
        }
        if (this.f23806zb == -1) {
            this.f23806zb = this.ycx.getScaledTouchSlop();
        }
        return Math.abs(f11 - f13) <= ((float) this.f23806zb) && Math.abs(f12 - f14) <= ((float) this.f23806zb);
    }
}
