package com.bytedance.sdk.component.adexpress.dynamic.animation.ycx;

import android.animation.ObjectAnimator;
import android.annotation.SuppressLint;
import android.view.View;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes2.dex */
public class ok extends dj {
    public ok(View view, com.bytedance.sdk.component.adexpress.dynamic.dj.ycx ycxVar) {
        super(view, ycxVar);
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.animation.ycx.dj
    @SuppressLint({"ObjectAnimatorBinding"})
    public List<ObjectAnimator> ycx() {
        int i5;
        int i11;
        this.sya.setTag(2097610711, Integer.valueOf(this.f23292zb.dj()));
        View view = this.sya;
        if (view == null || !com.bytedance.sdk.component.adexpress.dj.zb.ycx(view.getContext())) {
            i5 = 0;
            i11 = 1;
        } else {
            i11 = 0;
            i5 = 1;
        }
        ObjectAnimator duration = ObjectAnimator.ofFloat(this.sya, "shineValue", i5, i11).setDuration((int) (this.f23292zb.jc() * 1000.0d));
        ArrayList arrayList = new ArrayList();
        arrayList.add(ycx(duration));
        return arrayList;
    }
}
