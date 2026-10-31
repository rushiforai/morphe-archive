package com.bytedance.adsdk.ugeno.ul.zb;

import android.text.TextUtils;
import android.view.View;
import com.bytedance.adsdk.ugeno.jw.sya;

/* loaded from: classes2.dex */
public class dj implements sya.lud {
    private String ycx;

    public void ycx(String str) {
        this.ycx = str;
    }

    @Override // com.bytedance.adsdk.ugeno.jw.sya.lud
    public void ycx(View view, float f11) {
        if (f11 < -1.0f || f11 > 1.0f) {
            view.setAlpha(0.0f);
        } else {
            view.setAlpha(1.0f);
            view.setTranslationX(view.getWidth() * (-f11));
            view.setTranslationY(view.getHeight() * f11);
        }
        if (TextUtils.equals(this.ycx, "cube")) {
            float height = f11 < 0.0f ? view.getHeight() : 0.0f;
            view.setPivotX(view.getWidth() * 0.5f);
            view.setPivotY(height);
            view.setRotationX(f11 * (-90.0f));
        }
    }
}
