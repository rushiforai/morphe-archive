package com.bytedance.sdk.openadsdk.activity;

import android.app.Activity;
import android.content.Context;
import com.bytedance.sdk.openadsdk.core.lt.sya;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.lt.zb;

/* loaded from: classes2.dex */
public class TTFullWebActivity extends TTUnifyWebActivity {
    @Override // com.bytedance.sdk.openadsdk.activity.TTUnifyWebActivity, com.bytedance.sdk.openadsdk.activity.single.TTBaseActivity, android.app.Activity
    public void finish() {
        if (((TTUnifyWebActivity) this).f24275dj != null) {
            zb.ycx().ycx("videoForceBreak", this.lud);
        }
        com.bytedance.sdk.openadsdk.component.reward.sya.zb zbVar = ((TTUnifyWebActivity) this).f24275dj;
        if (zbVar != null) {
            zbVar.wie();
        }
        super.finish();
    }

    @Override // com.bytedance.sdk.openadsdk.activity.TTUnifyWebActivity
    public boolean ycx() {
        return false;
    }

    @Override // com.bytedance.sdk.openadsdk.activity.TTUnifyWebActivity
    public void zb() {
        super.finish();
    }

    @Override // com.bytedance.sdk.openadsdk.activity.TTUnifyWebActivity
    public com.bytedance.sdk.openadsdk.component.reward.sya.zb ycx(Activity activity, Context context, tn tnVar, String str, sya syaVar, String str2, boolean z11) {
        return new com.bytedance.sdk.openadsdk.component.reward.sya.sya(activity, context, tnVar, str, syaVar, str2, z11);
    }
}
