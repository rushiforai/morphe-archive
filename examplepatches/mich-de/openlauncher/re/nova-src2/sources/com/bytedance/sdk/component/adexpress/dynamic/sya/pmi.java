package com.bytedance.sdk.component.adexpress.dynamic.sya;

import android.content.Context;
import android.widget.FrameLayout;

/* loaded from: classes2.dex */
public class pmi implements ul<com.bytedance.sdk.component.adexpress.lt.ea> {
    private final com.bytedance.sdk.component.adexpress.lt.ea ycx;

    public pmi(Context context, com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud ludVar, com.bytedance.sdk.component.adexpress.dynamic.dj.ul ulVar) {
        com.bytedance.sdk.component.adexpress.lt.ea eaVar = new com.bytedance.sdk.component.adexpress.lt.ea(context);
        this.ycx = eaVar;
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-2, -2);
        layoutParams.gravity = 81;
        layoutParams.bottomMargin = (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(context, ulVar.rl() > 0 ? ulVar.rl() : com.bytedance.sdk.component.adexpress.dj.zb() ? 0 : 120);
        eaVar.setLayoutParams(layoutParams);
        eaVar.setClipChildren(false);
        eaVar.setText(ulVar.uf());
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.sya.ul
    /* renamed from: dj, reason: merged with bridge method [inline-methods] */
    public com.bytedance.sdk.component.adexpress.lt.ea sya() {
        return this.ycx;
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.sya.ul
    public void ycx() {
        com.bytedance.sdk.component.adexpress.lt.ea eaVar = this.ycx;
        if (eaVar != null) {
            eaVar.ycx();
        }
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.sya.ul
    public void zb() {
        com.bytedance.sdk.component.adexpress.lt.ea eaVar = this.ycx;
        if (eaVar != null) {
            eaVar.zb();
        }
    }
}
