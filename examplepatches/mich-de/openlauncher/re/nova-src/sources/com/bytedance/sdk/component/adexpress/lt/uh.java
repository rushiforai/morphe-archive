package com.bytedance.sdk.component.adexpress.lt;

import android.content.Context;
import android.text.TextUtils;
import android.view.View;
import android.widget.TextView;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class uh extends pmi {
    private TextView ycx;

    public uh(Context context, View view, int i5, int i11, int i12, JSONObject jSONObject) {
        super(context, view, i5, i11, i12, jSONObject);
    }

    @Override // com.bytedance.sdk.component.adexpress.lt.pmi
    public void setShakeText(String str) {
        if (this.ycx == null) {
            return;
        }
        if (!TextUtils.isEmpty(str)) {
            this.ycx.setText(str);
            return;
        }
        try {
            this.ycx.setText(com.bytedance.sdk.component.utils.wwx.zb(this.ycx.getContext(), "tt_splash_default_click_shake"));
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJ+zoRN0kk=", "aOYsngafZc6DQeFUiQY=", "SOs5pgu9YsK0T89J", 42);
            e3.getMessage();
        }
    }

    @Override // com.bytedance.sdk.component.adexpress.lt.pmi
    public void ycx(Context context, View view) {
        addView(view);
        this.ycx = (TextView) findViewById(2097610747);
    }
}
