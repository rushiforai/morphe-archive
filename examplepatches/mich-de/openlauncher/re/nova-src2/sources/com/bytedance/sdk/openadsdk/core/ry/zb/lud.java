package com.bytedance.sdk.openadsdk.core.ry.zb;

import android.content.Context;
import android.widget.FrameLayout;
import com.bytedance.sdk.openadsdk.core.widget.PAGLogoView;
import org.json.JSONException;

/* loaded from: classes2.dex */
public class lud extends com.bytedance.adsdk.ugeno.zb.sya<FrameLayout> {
    public lud(Context context) {
        super(context);
    }

    @Override // com.bytedance.adsdk.ugeno.zb.sya
    /* renamed from: sya, reason: merged with bridge method [inline-methods] */
    public FrameLayout ycx() {
        FrameLayout frameLayout = new FrameLayout(this.f22701zb);
        com.bytedance.sdk.openadsdk.core.model.zb zbVar = new com.bytedance.sdk.openadsdk.core.model.zb();
        zbVar.ycx(true);
        PAGLogoView pAGLogoView = new PAGLogoView(this.f22701zb);
        pAGLogoView.initData(zbVar);
        frameLayout.addView(pAGLogoView);
        return frameLayout;
    }

    @Override // com.bytedance.adsdk.ugeno.zb.sya
    public void zb() throws JSONException {
        super.zb();
    }
}
