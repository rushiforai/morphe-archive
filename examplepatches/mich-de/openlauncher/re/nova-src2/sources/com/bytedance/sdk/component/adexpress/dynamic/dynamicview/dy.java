package com.bytedance.sdk.component.adexpress.dynamic.dynamicview;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.widget.ImageView;

/* loaded from: classes2.dex */
public class dy extends lt implements com.bytedance.sdk.component.adexpress.dynamic.zb {
    public dy(Context context, DynamicRootView dynamicRootView, com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar) {
        super(context, dynamicRootView, fbyVar);
        ImageView imageView = new ImageView(context);
        this.syc = imageView;
        imageView.setTag(5);
        addView(this.syc, getWidgetLayoutParams());
        dynamicRootView.setMuteListener(this);
        if (dynamicRootView.getRenderRequest() == null || dynamicRootView.getRenderRequest().hf()) {
            return;
        }
        this.syc.setVisibility(8);
        setVisibility(8);
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lt, com.bytedance.sdk.component.adexpress.dynamic.dynamicview.rmy
    public boolean jw() {
        super.jw();
        if (com.bytedance.sdk.component.adexpress.dj.zb()) {
            ((ImageView) this.syc).setScaleType(ImageView.ScaleType.FIT_CENTER);
        } else {
            ((ImageView) this.syc).setScaleType(ImageView.ScaleType.CENTER);
        }
        setSoundMute(this.xkz.mIsMute);
        if (!com.bytedance.sdk.component.adexpress.dj.zb()) {
            ((ImageView) this.syc).setBackgroundDrawable(com.bytedance.sdk.component.adexpress.dj.fby.ycx(0, Integer.valueOf(this.f23413ok.bhi()), new int[]{this.fby / 2}, null, null, null));
            return true;
        }
        Drawable drawableYcx = com.bytedance.sdk.component.adexpress.dj.sya.ycx(getContext(), this.f23413ok);
        if (drawableYcx == null) {
            return true;
        }
        ((ImageView) this.syc).setBackground(drawableYcx);
        return true;
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud
    public boolean lud() {
        return true;
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.zb
    public void setSoundMute(boolean z11) {
        ((ImageView) this.syc).setImageResource(z11 ? com.bytedance.sdk.component.utils.wwx.dj(getContext(), "tt_reward_full_mute") : com.bytedance.sdk.component.utils.wwx.dj(getContext(), "tt_reward_full_unmute"));
        if (((ImageView) this.syc).getDrawable() != null) {
            ((ImageView) this.syc).getDrawable().setAutoMirrored(true);
        }
    }
}
