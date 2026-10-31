package com.bytedance.sdk.component.adexpress.dynamic.sya;

import android.content.Context;
import android.widget.FrameLayout;
import com.bytedance.sdk.component.adexpress.lt.thx;

/* loaded from: classes2.dex */
public class lud extends wie<com.bytedance.sdk.component.adexpress.lt.ul> {
    public lud(Context context, com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud ludVar, com.bytedance.sdk.component.adexpress.dynamic.dj.ul ulVar) {
        super(context, ludVar, ulVar);
        ycx(ulVar);
    }

    private void ycx(com.bytedance.sdk.component.adexpress.dynamic.dj.ul ulVar) {
        this.ycx = new com.bytedance.sdk.component.adexpress.lt.fby(this.f23476zb);
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, -1);
        layoutParams.gravity = 81;
        this.ycx.setLayoutParams(layoutParams);
        thx thxVar = this.ycx;
        if (thxVar instanceof com.bytedance.sdk.component.adexpress.lt.fby) {
            ((com.bytedance.sdk.component.adexpress.lt.fby) thxVar).setButtonText(this.f23475dj.uf());
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
