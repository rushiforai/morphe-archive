package com.bytedance.sdk.openadsdk.core.widget;

import android.content.Context;
import android.view.View;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.utils.dc;

/* loaded from: classes2.dex */
public class sya extends com.bytedance.sdk.openadsdk.core.lt.dj {
    public sya(Context context) {
        super(context);
        ycx();
    }

    private void ycx() {
        setVisibility(8);
        setId(com.bytedance.sdk.openadsdk.utils.wie.gxx);
    }

    public void ycx(int i5, tn tnVar) {
        if (tnVar.wnd() || (tnVar.mu() && tnVar.dv())) {
            dc.ycx((View) this, 0);
            com.bytedance.sdk.openadsdk.htf.zb.zb().ycx((int) dc.ycx(getContext(), i5, true), this, tnVar);
        }
    }
}
