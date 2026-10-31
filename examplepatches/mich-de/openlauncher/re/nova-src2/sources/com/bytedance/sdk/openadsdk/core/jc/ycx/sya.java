package com.bytedance.sdk.openadsdk.core.jc.ycx;

import android.view.View;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.utils.dc;

/* loaded from: classes2.dex */
public class sya implements com.bytedance.sdk.openadsdk.ry.ycx {
    private final View ycx;

    public sya(View view) {
        this.ycx = view;
    }

    @Override // com.bytedance.sdk.openadsdk.ry.ycx
    public int ycx() {
        View view = this.ycx;
        int measuredHeight = view != null ? view.getMeasuredHeight() : -1;
        return measuredHeight <= 0 ? dc.lt(pmi.ycx()) : measuredHeight;
    }

    @Override // com.bytedance.sdk.openadsdk.ry.ycx
    public int zb() {
        View view = this.ycx;
        int measuredWidth = view != null ? view.getMeasuredWidth() : -1;
        return measuredWidth <= 0 ? dc.dj(pmi.ycx()) : measuredWidth;
    }
}
