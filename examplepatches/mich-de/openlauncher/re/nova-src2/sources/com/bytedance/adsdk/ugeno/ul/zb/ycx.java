package com.bytedance.adsdk.ugeno.ul.zb;

import android.view.View;
import com.bytedance.adsdk.ugeno.jw.sya;

/* loaded from: classes2.dex */
public class ycx implements sya.lud {
    @Override // com.bytedance.adsdk.ugeno.jw.sya.lud
    public void ycx(View view, float f11) {
        view.setPivotX(f11 < 0.0f ? view.getWidth() : 0.0f);
        view.setPivotY(view.getHeight() * 0.5f);
        view.setRotationY(f11 * 90.0f);
    }
}
