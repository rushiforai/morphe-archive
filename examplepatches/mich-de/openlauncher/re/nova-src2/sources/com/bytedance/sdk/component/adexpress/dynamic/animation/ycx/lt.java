package com.bytedance.sdk.component.adexpress.dynamic.animation.ycx;

import android.animation.ObjectAnimator;
import android.view.View;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes2.dex */
public class lt extends dj {
    public lt(View view, com.bytedance.sdk.component.adexpress.dynamic.dj.ycx ycxVar) {
        super(view, ycxVar);
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.animation.ycx.dj
    public List<ObjectAnimator> ycx() {
        float f11 = this.sya.getLayoutParams().width;
        this.sya.setTranslationX(f11);
        ObjectAnimator duration = ObjectAnimator.ofFloat(this.sya, "translationX", f11, 0.0f).setDuration((int) (this.f23292zb.jc() * 1000.0d));
        ObjectAnimator duration2 = ObjectAnimator.ofFloat(this.sya, "alpha", 0.0f, 1.0f).setDuration((int) (this.f23292zb.jc() * 1000.0d));
        ArrayList arrayList = new ArrayList();
        arrayList.add(ycx(duration));
        arrayList.add(ycx(duration2));
        return arrayList;
    }
}
