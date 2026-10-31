package com.bytedance.sdk.component.adexpress.lt;

import android.content.Context;
import android.text.TextUtils;
import android.widget.RelativeLayout;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class lt extends thx {
    private uh ycx;

    public lt(Context context, int i5, int i11, int i12, JSONObject jSONObject) {
        super(context);
        ycx(context, i5, i11, i12, jSONObject);
    }

    private void ycx(Context context, int i5, int i11, int i12, JSONObject jSONObject) {
        uh uhVar = new uh(context, com.bytedance.sdk.component.adexpress.sya.ycx.sya(context), i5, i11, i12, jSONObject);
        this.ycx = uhVar;
        addView(uhVar);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams.addRule(14);
        layoutParams.addRule(12);
        this.ycx.setLayoutParams(layoutParams);
    }

    public uh getShakeView() {
        return this.ycx;
    }

    public void setShakeText(String str) {
        if (this.ycx == null) {
            return;
        }
        if (TextUtils.isEmpty(str)) {
            this.ycx.setShakeText(b.f42142b);
        } else {
            this.ycx.setShakeText(str);
        }
    }
}
