package com.bytedance.sdk.component.adexpress.dynamic.sya;

import android.content.Context;
import android.view.View;
import android.widget.FrameLayout;
import com.bytedance.sdk.component.adexpress.lt.pmi;
import com.bytedance.sdk.component.adexpress.lt.thx;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class lt extends wie<com.bytedance.sdk.component.adexpress.lt.lt> {
    public lt(Context context, com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud ludVar, com.bytedance.sdk.component.adexpress.dynamic.dj.ul ulVar, int i5, int i11, int i12, JSONObject jSONObject) {
        super(context, ludVar, ulVar);
        this.f23476zb = context;
        this.f23475dj = ulVar;
        this.sya = ludVar;
        ycx(i5, i11, i12, jSONObject, ulVar);
    }

    private void ycx(int i5, int i11, int i12, JSONObject jSONObject, com.bytedance.sdk.component.adexpress.dynamic.dj.ul ulVar) {
        this.ycx = new com.bytedance.sdk.component.adexpress.lt.lt(this.f23476zb, i5, i11, i12, jSONObject);
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.f23476zb, 300.0f));
        layoutParams.gravity = 81;
        layoutParams.bottomMargin = (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.f23476zb, ulVar.rl() > 0 ? ulVar.rl() : com.bytedance.sdk.component.adexpress.dj.zb() ? 0 : 120);
        this.ycx.setLayoutParams(layoutParams);
        this.ycx.setClipChildren(false);
        this.ycx.setSlideText(this.f23475dj.uf());
        thx thxVar = this.ycx;
        if (thxVar instanceof com.bytedance.sdk.component.adexpress.lt.lt) {
            ((com.bytedance.sdk.component.adexpress.lt.lt) thxVar).setShakeText(this.f23475dj.uz());
            final com.bytedance.sdk.component.adexpress.lt.uh shakeView = ((com.bytedance.sdk.component.adexpress.lt.lt) this.ycx).getShakeView();
            if (shakeView != null) {
                shakeView.setOnShakeViewListener(new pmi.ycx() { // from class: com.bytedance.sdk.component.adexpress.dynamic.sya.lt.1
                });
                shakeView.setOnClickListener((View.OnClickListener) this.sya.getDynamicClickListener());
            }
        }
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.sya.wie
    public void dj() {
    }
}
