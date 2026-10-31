package com.bytedance.sdk.openadsdk.common;

import android.content.Context;
import android.os.SystemClock;
import com.bytedance.sdk.openadsdk.core.model.tn;

/* loaded from: classes2.dex */
public class dj extends ok {
    public dj(Context context) {
        super(context);
        this.f24711zb = false;
    }

    @Override // com.bytedance.sdk.openadsdk.common.ok
    public void ycx() {
        post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.common.dj.1
            @Override // java.lang.Runnable
            public void run() {
                dj djVar = dj.this;
                if (djVar.ycx != null) {
                    djVar.setVisibility(0);
                }
            }
        });
    }

    public void ycx(tn tnVar, String str, int i5, String str2, long j11, boolean z11, int i11, long j12) {
        if (getVisibility() != 8) {
            com.bytedance.sdk.openadsdk.dj.sya.ycx(tnVar, str, i5, str2, SystemClock.elapsedRealtime() - j11, z11, i11, j12);
            super.zb();
        }
    }
}
