package com.bytedance.sdk.component.adexpress.dynamic.dynamicview;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.GradientDrawable;

/* loaded from: classes2.dex */
public class pmi extends lt {
    public zb ycx;

    public pmi(Context context, DynamicRootView dynamicRootView, com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar) {
        super(context, dynamicRootView, fbyVar);
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud
    public GradientDrawable getDrawable() {
        zb zbVar = new zb();
        this.ycx = zbVar;
        return zbVar;
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lt, com.bytedance.sdk.component.adexpress.dynamic.dynamicview.rmy
    public boolean jw() {
        return super.jw();
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud
    public zb ycx(Bitmap bitmap) {
        ycx ycxVar = new ycx(bitmap, this.ycx);
        this.ycx = ycxVar;
        return ycxVar;
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud
    public GradientDrawable ycx(GradientDrawable.Orientation orientation, int[] iArr) {
        zb zbVar = new zb(orientation, iArr);
        this.ycx = zbVar;
        return zbVar;
    }
}
