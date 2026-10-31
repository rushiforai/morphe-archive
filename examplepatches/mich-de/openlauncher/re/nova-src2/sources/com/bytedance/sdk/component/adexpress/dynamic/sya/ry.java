package com.bytedance.sdk.component.adexpress.dynamic.sya;

import android.content.Context;
import android.widget.FrameLayout;

/* loaded from: classes2.dex */
public class ry implements ul {
    private com.bytedance.sdk.component.adexpress.lt.xkz ycx;

    public ry(Context context, com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud ludVar, com.bytedance.sdk.component.adexpress.dynamic.dj.ul ulVar) {
        this.ycx = new com.bytedance.sdk.component.adexpress.lt.xkz(context);
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(ludVar.getDynamicHeight(), ludVar.getDynamicHeight());
        layoutParams.gravity = 8388629;
        this.ycx.setLayoutParams(layoutParams);
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.sya.ul
    /* renamed from: dj, reason: merged with bridge method [inline-methods] */
    public com.bytedance.sdk.component.adexpress.lt.xkz sya() {
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
