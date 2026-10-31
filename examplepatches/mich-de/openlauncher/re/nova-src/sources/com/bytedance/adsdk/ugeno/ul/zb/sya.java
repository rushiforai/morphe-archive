package com.bytedance.adsdk.ugeno.ul.zb;

import android.view.View;
import com.bytedance.adsdk.ugeno.jw.sya;

/* loaded from: classes2.dex */
public class sya implements sya.lud {
    final float ycx = 0.8f;

    /* renamed from: zb, reason: collision with root package name */
    final float f22527zb = 0.5f;

    @Override // com.bytedance.adsdk.ugeno.jw.sya.lud
    public void ycx(View view, float f11) {
        float f12 = ((f11 < 0.0f ? 0.19999999f : -0.19999999f) * f11) + 1.0f;
        float f13 = (f11 * (f11 < 0.0f ? 0.5f : -0.5f)) + 1.0f;
        if (f11 < 0.0f) {
            view.setPivotX(view.getWidth());
            view.setPivotY(view.getHeight() / 2);
        } else {
            view.setPivotX(0.0f);
            view.setPivotY(view.getHeight() / 2);
        }
        view.setScaleX(f12);
        view.setScaleY(f12);
        view.setAlpha(Math.abs(f13));
    }
}
