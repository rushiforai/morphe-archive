package com.bytedance.sdk.component.adexpress.dynamic.animation.ycx;

import android.animation.ObjectAnimator;
import android.view.View;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes2.dex */
public class ycx extends dj {
    public ycx(View view, com.bytedance.sdk.component.adexpress.dynamic.dj.ycx ycxVar) {
        super(view, ycxVar);
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.animation.ycx.dj
    public List<ObjectAnimator> ycx() {
        float fPmi = this.f23292zb.pmi() / 100.0f;
        float fUh = this.f23292zb.uh() / 100.0f;
        if ("reverse".equals(this.f23292zb.dy()) && this.f23292zb.xkz() <= 0.0d) {
            fUh = fPmi;
            fPmi = fUh;
        }
        this.sya.setAlpha(fPmi);
        ObjectAnimator duration = ObjectAnimator.ofFloat(this.sya, "alpha", fPmi, fUh).setDuration((int) (this.f23292zb.jc() * 1000.0d));
        ArrayList arrayList = new ArrayList();
        arrayList.add(ycx(duration));
        return arrayList;
    }
}
