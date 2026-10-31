package com.bytedance.adsdk.ugeno.ul.zb;

import android.view.View;
import com.bytedance.adsdk.ugeno.jw.sya;

/* loaded from: classes2.dex */
public class zb implements sya.lud {
    @Override // com.bytedance.adsdk.ugeno.jw.sya.lud
    public void ycx(View view, float f11) {
        int width = view.getWidth();
        if (f11 < -1.0f || f11 > 1.0f) {
            view.setAlpha(0.0f);
            return;
        }
        if (f11 < 0.0f) {
            view.setTranslationX((-width) * f11);
        } else {
            view.setTranslationX(width);
            view.setTranslationX((-width) * f11);
        }
        view.setAlpha(Math.max(0.0f, 1.0f - Math.abs(f11)));
    }
}
