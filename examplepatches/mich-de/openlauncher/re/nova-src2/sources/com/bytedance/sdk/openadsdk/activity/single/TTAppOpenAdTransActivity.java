package com.bytedance.sdk.openadsdk.activity.single;

import android.app.Activity;
import android.os.Bundle;
import com.bytedance.sdk.openadsdk.utils.dc;

/* loaded from: classes2.dex */
public class TTAppOpenAdTransActivity extends TTAppOpenAdActivity {
    @Override // com.bytedance.sdk.openadsdk.activity.single.TTAppOpenAdActivity, com.bytedance.sdk.openadsdk.activity.single.TTBaseActivity, android.app.Activity
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (this.fby || !dc.dj((Activity) this)) {
            return;
        }
        getWindow().getDecorView().setPadding(0, (int) dc.ycx(), 0, 0);
    }
}
