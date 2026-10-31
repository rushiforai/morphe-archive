package com.bytedance.sdk.component.adexpress.dynamic.dynamicview;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.widget.ImageView;

/* loaded from: classes2.dex */
public class av extends lt implements com.bytedance.sdk.component.adexpress.dynamic.sya {
    private boolean ycx;

    public av(Context context, DynamicRootView dynamicRootView, com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar) {
        super(context, dynamicRootView, fbyVar);
        this.f23416ul = this.fby;
        ImageView imageView = new ImageView(context);
        this.syc = imageView;
        imageView.setTag(Integer.valueOf(getClickArea()));
        addView(this.syc, getWidgetLayoutParams());
        dynamicRootView.setTimeOutListener(this);
        if (dynamicRootView.getRenderRequest() != null) {
            if (!dynamicRootView.getRenderRequest().hf()) {
                this.syc.setVisibility(8);
                setVisibility(8);
            }
            this.ycx = dynamicRootView.getRenderRequest().ry();
        }
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lt, com.bytedance.sdk.component.adexpress.dynamic.dynamicview.rmy
    public boolean jw() {
        super.jw();
        View view = this.syc;
        if (view != null) {
            ((ImageView) view).setScaleType(ImageView.ScaleType.CENTER_CROP);
            Drawable drawableYcx = com.bytedance.sdk.component.adexpress.dj.sya.ycx(getContext(), this.f23413ok);
            if (drawableYcx != null) {
                ((ImageView) this.syc).setBackground(drawableYcx);
            }
            Drawable drawableSya = this.ycx ? com.bytedance.sdk.component.utils.wwx.sya(getContext(), "tt_close_btn") : com.bytedance.sdk.component.utils.wwx.sya(getContext(), "tt_skip_btn");
            if (drawableSya != null) {
                drawableSya.setAutoMirrored(true);
                ((ImageView) this.syc).setImageDrawable(drawableSya);
            }
            int iYcx = (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.f23409ea, this.f23413ok.zb());
            this.syc.setPadding(iYcx, iYcx, iYcx, iYcx);
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
