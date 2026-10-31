package com.bytedance.sdk.component.adexpress.dynamic.sya;

import android.content.Context;
import android.view.ViewGroup;
import android.widget.FrameLayout;

/* loaded from: classes2.dex */
public class ycx implements ul {
    private com.bytedance.sdk.component.adexpress.lt.zb ycx;

    public ycx(Context context, com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud ludVar, com.bytedance.sdk.component.adexpress.dynamic.dj.ul ulVar) {
        double dUr = ulVar.ur();
        dUr = dUr == 0.0d ? 1.0d : dUr;
        double dWr = ulVar.wr();
        int dynamicWidth = (int) (ludVar.getDynamicWidth() * 0.32d * dUr);
        int dynamicWidth2 = (int) (ludVar.getDynamicWidth() * 0.32d * (dWr != 0.0d ? dWr : 1.0d));
        this.ycx = new com.bytedance.sdk.component.adexpress.lt.zb(context, dynamicWidth, dynamicWidth2);
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(dynamicWidth, dynamicWidth2);
        layoutParams.gravity = 17;
        layoutParams.topMargin = (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(context, ulVar.iq() - 7);
        layoutParams.leftMargin = (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(context, ulVar.dqs() - 3);
        this.ycx.setLayoutParams(layoutParams);
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.sya.ul
    public ViewGroup sya() {
        return this.ycx;
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.sya.ul
    public void ycx() {
        this.ycx.ycx();
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.sya.ul
    public void zb() {
        this.ycx.zb();
    }
}
