package com.bytedance.sdk.component.adexpress.dynamic.animation.ycx;

import android.animation.ObjectAnimator;
import android.annotation.SuppressLint;
import android.view.View;
import android.view.ViewGroup;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes2.dex */
public class fby extends dj {
    public fby(View view, com.bytedance.sdk.component.adexpress.dynamic.dj.ycx ycxVar) {
        super(view, ycxVar);
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.animation.ycx.dj
    @SuppressLint({"ObjectAnimatorBinding"})
    public List<ObjectAnimator> ycx() {
        ObjectAnimator duration = ObjectAnimator.ofFloat(this.sya, "rippleValue", 0.0f, 1.0f).setDuration((int) (this.f23292zb.jc() * 1000.0d));
        ((ViewGroup) this.sya.getParent()).setClipChildren(false);
        ((ViewGroup) this.sya.getParent().getParent()).setClipChildren(false);
        ((ViewGroup) this.sya.getParent().getParent().getParent()).setClipChildren(false);
        this.sya.setTag(2097610712, this.f23292zb.fby());
        ArrayList arrayList = new ArrayList();
        arrayList.add(ycx(duration));
        return arrayList;
    }
}
