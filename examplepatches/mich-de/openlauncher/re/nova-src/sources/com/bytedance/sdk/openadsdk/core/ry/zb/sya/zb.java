package com.bytedance.sdk.openadsdk.core.ry.zb.sya;

import android.content.Context;
import com.bytedance.adsdk.ugeno.lud;
import com.bytedance.adsdk.zb.lt;

/* loaded from: classes2.dex */
public class zb extends lt {
    private lud ycx;

    public zb(Context context) {
        super(context);
    }

    @Override // com.bytedance.adsdk.zb.lt, android.widget.ImageView, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        lud ludVar = this.ycx;
        if (ludVar != null) {
            ludVar.ul();
        }
    }

    @Override // com.bytedance.adsdk.zb.lt, android.widget.ImageView, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        lud ludVar = this.ycx;
        if (ludVar != null) {
            ludVar.fby();
        }
    }

    public void ycx(lud ludVar) {
        this.ycx = ludVar;
    }
}
