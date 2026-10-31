package com.bytedance.sdk.component.adexpress.dynamic.dynamicview;

import android.content.Context;
import android.graphics.PorterDuff;
import android.text.TextUtils;
import android.widget.ImageView;

/* loaded from: classes2.dex */
public class xkz extends lt {
    public xkz(Context context, DynamicRootView dynamicRootView, com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar) {
        super(context, dynamicRootView, fbyVar);
        ImageView imageView = new ImageView(context);
        this.syc = imageView;
        imageView.setTag(Integer.valueOf(getClickArea()));
        if (com.bytedance.sdk.component.adexpress.dj.zb()) {
            this.fby = Math.max(dynamicRootView.getLogoUnionHeight(), this.fby);
        }
        addView(this.syc, getWidgetLayoutParams());
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lt, com.bytedance.sdk.component.adexpress.dynamic.dynamicview.rmy
    public boolean jw() {
        super.jw();
        if (com.bytedance.sdk.component.adexpress.dj.zb()) {
            ((ImageView) this.syc).setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        }
        DynamicRootView dynamicRootView = this.xkz;
        if (dynamicRootView == null || dynamicRootView.getRenderRequest() == null || TextUtils.isEmpty(this.xkz.getRenderRequest().tru())) {
            setVisibility(8);
        } else {
            String strTru = this.xkz.getRenderRequest().tru();
            if (strTru.equals("logo")) {
                ((ImageView) this.syc).setImageResource(com.bytedance.sdk.component.utils.wwx.dj(getContext(), "tt_ad_logo"));
            } else {
                com.bytedance.sdk.component.lud.jc jcVarLud = com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().lud().ycx(strTru).ycx(this.f23416ul).zb(this.fby).dj(this.f23416ul).lud(this.fby);
                String strXkz = this.xkz.getRenderRequest().xkz();
                if (!TextUtils.isEmpty(strXkz)) {
                    jcVarLud.zb(strXkz);
                }
                jcVarLud.ycx((ImageView) this.syc);
            }
        }
        ((ImageView) this.syc).setColorFilter(this.f23413ok.ul(), PorterDuff.Mode.SRC_IN);
        return true;
    }
}
