package com.bytedance.sdk.component.adexpress.dynamic.dynamicview;

import android.content.Context;
import android.text.TextUtils;
import b.c0;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* loaded from: classes2.dex */
public class syc extends lt {
    String ycx;

    /* renamed from: zb, reason: collision with root package name */
    com.bytedance.sdk.component.adexpress.dynamic.dj.fby f23422zb;

    public syc(Context context, DynamicRootView dynamicRootView, com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar, String str) {
        super(context, dynamicRootView, fbyVar);
        this.ycx = str;
        this.f23422zb = fbyVar;
        com.bytedance.sdk.component.adexpress.lt.jc lottieView = getLottieView();
        if (lottieView != null) {
            addView(lottieView, getWidgetLayoutParams());
        }
    }

    private com.bytedance.sdk.component.adexpress.lt.jc getLottieView() {
        com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar = this.f23414ry;
        if (fbyVar == null || fbyVar.jc() == null || this.f23409ea == null || TextUtils.isEmpty(this.ycx)) {
            return null;
        }
        com.bytedance.sdk.component.adexpress.dynamic.dj.lt ltVarLud = this.f23414ry.jc().lud();
        String strGiw = ltVarLud != null ? ltVarLud.giw() : b.f42142b;
        if (TextUtils.isEmpty(strGiw)) {
            return null;
        }
        String strS = c0.s(new StringBuilder(), this.ycx, "static/lotties/", strGiw, ".json");
        com.bytedance.sdk.component.adexpress.lt.jc jcVar = new com.bytedance.sdk.component.adexpress.lt.jc(this.f23409ea);
        jcVar.setImageLottieTosPath(strS);
        jcVar.fby();
        return jcVar;
    }
}
