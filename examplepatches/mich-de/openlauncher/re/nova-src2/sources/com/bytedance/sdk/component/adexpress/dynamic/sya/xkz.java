package com.bytedance.sdk.component.adexpress.dynamic.sya;

import android.content.Context;
import android.widget.FrameLayout;

/* loaded from: classes2.dex */
public class xkz implements ul<com.bytedance.sdk.component.adexpress.lt.syc> {
    private com.bytedance.sdk.component.adexpress.lt.syc ycx;

    public xkz(Context context, com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud ludVar, com.bytedance.sdk.component.adexpress.dynamic.dj.ul ulVar) {
        this.ycx = new com.bytedance.sdk.component.adexpress.lt.syc(context);
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams((int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(context, 180.0f), (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(context, 180.0f));
        layoutParams.gravity = 17;
        layoutParams.leftMargin = (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(context, 20.0f);
        this.ycx.setLayoutParams(layoutParams);
        this.ycx.setGuideText(ulVar.uf());
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.sya.ul
    /* renamed from: dj, reason: merged with bridge method [inline-methods] */
    public com.bytedance.sdk.component.adexpress.lt.syc sya() {
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
