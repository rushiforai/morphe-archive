package com.bytedance.sdk.component.adexpress.dynamic.dynamicview;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.widget.ImageView;

/* loaded from: classes2.dex */
public class jw extends lt {
    public jw(Context context, DynamicRootView dynamicRootView, com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar) {
        super(context, dynamicRootView, fbyVar);
        if (com.bytedance.sdk.component.adexpress.dj.zb()) {
            this.syc = new ImageView(context);
        } else {
            this.syc = new com.bytedance.sdk.component.adexpress.lt.jw(context);
        }
        this.syc.setTag(3);
        addView(this.syc, getWidgetLayoutParams());
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lt, com.bytedance.sdk.component.adexpress.dynamic.dynamicview.rmy
    public boolean jw() {
        super.jw();
        if (com.bytedance.sdk.component.adexpress.dj.zb()) {
            Drawable drawableYcx = com.bytedance.sdk.component.adexpress.dj.sya.ycx(getContext(), this.f23413ok);
            if (drawableYcx != null) {
                this.syc.setBackground(drawableYcx);
            }
            int iDj = com.bytedance.sdk.component.utils.wwx.dj(getContext(), "tt_close_btn");
            if (iDj > 0) {
                ((ImageView) this.syc).setImageResource(iDj);
            }
            ((ImageView) this.syc).setScaleType(ImageView.ScaleType.FIT_XY);
            return true;
        }
        int iYcx = (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.f23409ea, this.f23413ok.wie());
        View view = this.syc;
        if (view instanceof com.bytedance.sdk.component.adexpress.lt.jw) {
            ((com.bytedance.sdk.component.adexpress.lt.jw) view).setRadius((int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.f23409ea, this.f23413ok.syc()));
            ((com.bytedance.sdk.component.adexpress.lt.jw) this.syc).setStrokeWidth(iYcx);
            ((com.bytedance.sdk.component.adexpress.lt.jw) this.syc).setStrokeColor(this.f23413ok.dy());
            ((com.bytedance.sdk.component.adexpress.lt.jw) this.syc).setBgColor(this.f23413ok.bhi());
            ((com.bytedance.sdk.component.adexpress.lt.jw) this.syc).setDislikeColor(this.f23413ok.ul());
            ((com.bytedance.sdk.component.adexpress.lt.jw) this.syc).setDislikeWidth((int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.f23409ea, 1.0f));
        }
        return true;
    }
}
