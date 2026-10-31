package com.bytedance.sdk.openadsdk.core.ry.zb.dj;

import android.content.Context;
import android.widget.FrameLayout;

/* loaded from: classes2.dex */
public class ycx extends com.bytedance.adsdk.ugeno.jc.zb.ycx {
    private final com.bytedance.adsdk.ugeno.jc.zb.ycx ycx;

    public ycx(Context context) {
        super(context);
        com.bytedance.adsdk.ugeno.jc.zb.ycx ycxVar = new com.bytedance.adsdk.ugeno.jc.zb.ycx(context);
        this.ycx = ycxVar;
        addView(ycxVar, new FrameLayout.LayoutParams(-1, -1));
    }

    public com.bytedance.adsdk.ugeno.jc.zb.ycx getPlayableView() {
        return this.ycx;
    }
}
