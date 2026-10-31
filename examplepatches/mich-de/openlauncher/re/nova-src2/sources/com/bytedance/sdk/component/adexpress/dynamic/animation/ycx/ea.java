package com.bytedance.sdk.component.adexpress.dynamic.animation.ycx;

import android.animation.ObjectAnimator;
import android.view.View;
import android.view.ViewGroup;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes2.dex */
public class ea extends dj {
    public ea(View view, com.bytedance.sdk.component.adexpress.dynamic.dj.ycx ycxVar) {
        super(view, ycxVar);
        ViewGroup viewGroup = (ViewGroup) view.getParent();
        if (viewGroup != null) {
            viewGroup.setClipChildren(false);
            viewGroup.setClipToPadding(false);
            ViewGroup viewGroup2 = (ViewGroup) viewGroup.getParent();
            if (viewGroup2 == null || !(viewGroup2 instanceof com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud)) {
                return;
            }
            viewGroup2.setClipChildren(false);
            viewGroup2.setClipToPadding(false);
            ViewGroup viewGroup3 = (ViewGroup) viewGroup2.getParent();
            if (viewGroup3 == null || !(viewGroup3 instanceof com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud)) {
                return;
            }
            viewGroup3.setClipChildren(false);
            viewGroup3.setClipToPadding(false);
        }
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.animation.ycx.dj
    public List<ObjectAnimator> ycx() {
        float f11;
        float fEa = (float) this.f23292zb.ea();
        float fOk = (float) this.f23292zb.ok();
        String strDy = this.f23292zb.dy();
        float f12 = 1.0f;
        if ("reverse".equals(strDy) || "alternate-reverse".equals(strDy)) {
            f11 = 1.0f;
        } else {
            f11 = fOk;
            fOk = 1.0f;
            f12 = fEa;
            fEa = 1.0f;
        }
        this.sya.setTag(2097610710, this.f23292zb.zb());
        ObjectAnimator duration = ObjectAnimator.ofFloat(this.sya, "scaleX", fEa, f12).setDuration((int) (this.f23292zb.jc() * 1000.0d));
        ObjectAnimator duration2 = ObjectAnimator.ofFloat(this.sya, "scaleY", fOk, f11).setDuration((int) (this.f23292zb.jc() * 1000.0d));
        ArrayList arrayList = new ArrayList();
        arrayList.add(ycx(duration));
        arrayList.add(ycx(duration2));
        return arrayList;
    }
}
