package com.bytedance.sdk.component.adexpress.dynamic.dynamicview;

import android.content.Context;
import android.widget.FrameLayout;

/* loaded from: classes2.dex */
public class dv extends lt {
    private int ycx;

    public dv(Context context, DynamicRootView dynamicRootView, com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar) {
        super(context, dynamicRootView, fbyVar);
        this.ycx = 0;
        com.bytedance.sdk.component.adexpress.lt.tn tnVar = new com.bytedance.sdk.component.adexpress.lt.tn(context, null);
        this.syc = tnVar;
        tnVar.setTag(Integer.valueOf(getClickArea()));
        addView(this.syc, getWidgetLayoutParams());
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lt
    public FrameLayout.LayoutParams getWidgetLayoutParams() {
        int iYcx = (int) (com.bytedance.sdk.component.adexpress.dj.ul.ycx(com.bytedance.sdk.component.adexpress.dj.ycx(), com.bytedance.sdk.component.adexpress.dj.ul.ycx(com.bytedance.sdk.component.adexpress.dj.ycx(), this.f23413ok.dj()) + this.f23413ok.sya()) + (com.bytedance.sdk.component.adexpress.dj.ul.ycx(com.bytedance.sdk.component.adexpress.dj.ycx(), this.f23413ok.lud()) * 5.0f));
        if (this.f23416ul > iYcx && 4 == this.f23413ok.fby()) {
            this.ycx = (this.f23416ul - iYcx) / 2;
        }
        this.f23416ul = iYcx;
        return new FrameLayout.LayoutParams(this.f23416ul, this.fby);
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lt, com.bytedance.sdk.component.adexpress.dynamic.dynamicview.rmy
    public boolean jw() throws NumberFormatException {
        DynamicRootView dynamicRootView;
        super.jw();
        double dRy = this.f23413ok.ry();
        if (com.bytedance.sdk.component.adexpress.dj.zb() && (dRy < 0.0d || dRy > 5.0d || ((dynamicRootView = this.xkz) != null && dynamicRootView.getRenderRequest() != null && this.xkz.getRenderRequest().jc() != 4))) {
            this.syc.setVisibility(8);
            return true;
        }
        double d5 = (dRy < 0.0d || dRy > 5.0d) ? 5.0d : dRy;
        this.syc.setVisibility(0);
        ((com.bytedance.sdk.component.adexpress.lt.tn) this.syc).ycx(d5, this.f23413ok.ul(), (int) this.f23413ok.lud(), ((int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.f23409ea, this.f23413ok.zb())) + ((int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.f23409ea, this.f23413ok.ycx())) + ((int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.f23409ea, this.f23413ok.lud())));
        return true;
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud
    public void lt() {
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(this.f23416ul, this.fby);
        layoutParams.topMargin = this.f23410jc;
        int i5 = this.f23411jw + this.ycx;
        layoutParams.leftMargin = i5;
        layoutParams.setMarginStart(i5);
        layoutParams.setMarginEnd(layoutParams.rightMargin);
        setLayoutParams(layoutParams);
    }
}
