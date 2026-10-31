package com.bytedance.sdk.openadsdk.ycx.zb.ycx;

import android.content.Context;
import android.view.View;
import android.widget.FrameLayout;
import com.bytedance.sdk.openadsdk.core.jc.thx;
import com.bytedance.sdk.openadsdk.core.model.dy;
import org.json.JSONException;

/* loaded from: classes2.dex */
public class ycx extends com.bytedance.sdk.openadsdk.core.jc.ycx {

    /* renamed from: ok, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.ycx.zb.ycx f27485ok;
    private thx ycx;

    public ycx(Context context) {
        super(context);
    }

    public void setExtraFuncationHelper(com.bytedance.sdk.openadsdk.ycx.zb.ycx ycxVar) {
        this.f27485ok = ycxVar;
    }

    @Override // com.bytedance.sdk.openadsdk.core.jc.ycx
    public void ycx(View view, int i5, dy dyVar) throws JSONException {
        thx thxVar = this.ycx;
        if (thxVar != null) {
            thxVar.ycx(view, i5, dyVar);
        }
    }

    public void ycx(thx thxVar) {
        this.ycx = thxVar;
        thxVar.addView(this, new FrameLayout.LayoutParams(-1, -1));
    }
}
