package com.bytedance.sdk.component.adexpress.dynamic.sya;

import android.content.Context;
import android.widget.FrameLayout;
import com.bytedance.sdk.component.adexpress.lt.thx;

/* loaded from: classes2.dex */
public class dj extends wie<com.bytedance.sdk.component.adexpress.lt.ul> {
    public dj(Context context, com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud ludVar, com.bytedance.sdk.component.adexpress.dynamic.dj.ul ulVar) {
        super(context, ludVar, ulVar);
        ycx(ulVar);
    }

    private void ycx(com.bytedance.sdk.component.adexpress.dynamic.dj.ul ulVar) {
        this.ycx = new com.bytedance.sdk.component.adexpress.lt.ul(this.f23476zb);
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, -2);
        layoutParams.gravity = 81;
        layoutParams.bottomMargin = (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.f23476zb, ulVar.rl());
        this.ycx.setLayoutParams(layoutParams);
        this.ycx.setSlideText(this.f23475dj.uf());
        thx thxVar = this.ycx;
        if (thxVar instanceof com.bytedance.sdk.component.adexpress.lt.ul) {
            ((com.bytedance.sdk.component.adexpress.lt.ul) thxVar).setButtonText(this.f23475dj.jc());
        }
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.sya.wie
    public void dj() {
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.sya.wie, com.bytedance.sdk.component.adexpress.dynamic.sya.ul
    public void zb() {
        this.ycx.zb();
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.sya.wie, com.bytedance.sdk.component.adexpress.dynamic.sya.ul
    public void ycx() {
        this.ycx.ycx();
    }
}
