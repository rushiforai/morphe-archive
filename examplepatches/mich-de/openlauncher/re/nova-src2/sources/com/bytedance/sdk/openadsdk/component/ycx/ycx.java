package com.bytedance.sdk.openadsdk.component.ycx;

import android.content.Context;
import android.util.SparseArray;
import android.view.View;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.sya.sya;
import com.bytedance.sdk.openadsdk.oty.zb.lud;
import java.util.HashMap;

/* loaded from: classes2.dex */
public class ycx extends com.bytedance.sdk.openadsdk.core.sya.ycx {
    private final com.bytedance.sdk.openadsdk.component.fby.ycx ycx;

    public ycx(Context context, tn tnVar, String str, int i5, com.bytedance.sdk.openadsdk.component.fby.ycx ycxVar) {
        super(context, tnVar, str, i5);
        this.ycx = ycxVar;
    }

    @Override // com.bytedance.sdk.openadsdk.core.sya.ycx, com.bytedance.sdk.openadsdk.core.sya.zb, com.bytedance.sdk.openadsdk.core.sya.sya
    public void ycx(View view, float f11, float f12, float f13, float f14, SparseArray<sya.ycx> sparseArray, boolean z11) {
        if (view.getTag() == "open_ad_click_button_tag") {
            ycx("click_bar");
        } else {
            ycx("click_material");
        }
        HashMap map = new HashMap();
        map.put("duration", Long.valueOf(this.ycx.sya()));
        ycx(map);
        super.ycx(view, f11, f12, f13, f14, sparseArray, z11);
        lud.ycx(((com.bytedance.sdk.openadsdk.core.sya.zb) this).f26168lt, 9);
    }
}
