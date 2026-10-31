package com.bytedance.sdk.openadsdk.component.jw;

import android.content.Context;
import android.view.View;
import android.widget.FrameLayout;
import com.bytedance.sdk.openadsdk.core.jc.thx;
import com.bytedance.sdk.openadsdk.core.model.dy;
import org.json.JSONException;

/* loaded from: classes2.dex */
public class ycx extends com.bytedance.sdk.openadsdk.core.jc.ycx {
    private thx ycx;

    public ycx(Context context) {
        super(context);
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
