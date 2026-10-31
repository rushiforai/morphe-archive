package com.bytedance.sdk.component.adexpress.dynamic.animation.ycx;

import android.animation.ObjectAnimator;
import android.view.View;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes2.dex */
public class syc extends dj {
    public syc(View view, com.bytedance.sdk.component.adexpress.dynamic.dj.ycx ycxVar) {
        super(view, ycxVar);
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.animation.ycx.dj
    public List<ObjectAnimator> ycx() {
        float f11;
        float fYcx = com.bytedance.sdk.component.adexpress.dj.ul.ycx(com.bytedance.sdk.component.adexpress.dj.ycx(), this.f23292zb.lt());
        float fYcx2 = com.bytedance.sdk.component.adexpress.dj.ul.ycx(com.bytedance.sdk.component.adexpress.dj.ycx(), this.f23292zb.ul());
        float f12 = 0.0f;
        if ("reverse".equals(this.f23292zb.dy())) {
            f11 = fYcx2;
            fYcx2 = 0.0f;
            f12 = fYcx;
            fYcx = 0.0f;
        } else {
            f11 = 0.0f;
        }
        if (com.bytedance.sdk.component.adexpress.dj.zb.ycx(this.sya.getContext())) {
            fYcx = -fYcx;
            f12 = -f12;
        }
        this.sya.setTranslationX(fYcx);
        this.sya.setTranslationY(fYcx2);
        ObjectAnimator duration = ObjectAnimator.ofFloat(this.sya, "translationX", fYcx, f12).setDuration((int) (this.f23292zb.jc() * 1000.0d));
        ObjectAnimator duration2 = ObjectAnimator.ofFloat(this.sya, "translationY", fYcx2, f11).setDuration((int) (this.f23292zb.jc() * 1000.0d));
        ArrayList arrayList = new ArrayList();
        arrayList.add(ycx(duration));
        arrayList.add(ycx(duration2));
        return arrayList;
    }
}
