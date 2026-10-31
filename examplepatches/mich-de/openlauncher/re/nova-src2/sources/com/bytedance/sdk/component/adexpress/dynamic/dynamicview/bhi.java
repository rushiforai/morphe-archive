package com.bytedance.sdk.component.adexpress.dynamic.dynamicview;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.widget.ImageView;

/* loaded from: classes2.dex */
public class bhi extends lt implements com.bytedance.sdk.component.adexpress.dynamic.sya {
    private boolean ycx;

    public bhi(Context context, DynamicRootView dynamicRootView, com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar) {
        super(context, dynamicRootView, fbyVar);
        if (dynamicRootView.getRenderRequest() != null) {
            this.ycx = dynamicRootView.getRenderRequest().ry();
        }
        this.f23416ul = this.fby;
        ImageView imageView = new ImageView(context);
        this.syc = imageView;
        imageView.setTag(Integer.valueOf(getClickArea()));
        addView(this.syc, getWidgetLayoutParams());
        dynamicRootView.setTimeOutListener(this);
        if (dynamicRootView.getRenderRequest() == null || dynamicRootView.getRenderRequest().hf()) {
            return;
        }
        this.syc.setVisibility(8);
        setVisibility(8);
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lt, com.bytedance.sdk.component.adexpress.dynamic.dynamicview.rmy
    public boolean jw() {
        Drawable drawableSya;
        super.jw();
        ((ImageView) this.syc).setScaleType(ImageView.ScaleType.CENTER_CROP);
        Drawable drawableYcx = com.bytedance.sdk.component.adexpress.dj.sya.ycx(getContext(), this.f23413ok);
        if (drawableYcx != null) {
            ((ImageView) this.syc).setBackground(drawableYcx);
        }
        if (this.ycx) {
            drawableSya = com.bytedance.sdk.component.utils.wwx.sya(getContext(), "tt_close_btn");
        } else {
            drawableSya = com.bytedance.sdk.component.utils.wwx.sya(getContext(), "tt_skip_btn");
            if (drawableSya != null) {
                drawableSya.setAutoMirrored(true);
            }
        }
        if (drawableSya != null) {
            ((ImageView) this.syc).setImageDrawable(drawableSya);
        }
        setVisibility(8);
        return true;
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.sya
    public void ycx(CharSequence charSequence, boolean z11, int i5, boolean z12) {
        int i11 = 0;
        if (!z11 && !z12) {
            i11 = 8;
        }
        setVisibility(i11);
    }
}
