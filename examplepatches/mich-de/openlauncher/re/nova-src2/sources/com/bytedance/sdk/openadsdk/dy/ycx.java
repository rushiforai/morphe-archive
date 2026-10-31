package com.bytedance.sdk.openadsdk.dy;

import com.bytedance.sdk.openadsdk.core.hf;
import com.bytedance.sdk.openadsdk.utils.yzp;

/* loaded from: classes2.dex */
public class ycx {
    /* JADX INFO: Access modifiers changed from: private */
    public static void sya() {
        hf.ycx();
    }

    public static void ycx() {
        if (yzp.lt()) {
            yzp.ycx(new com.bytedance.sdk.component.fby.zb.sya("DailyTaskHelper") { // from class: com.bytedance.sdk.openadsdk.dy.ycx.1
                @Override // java.lang.Runnable
                public void run() {
                    ycx.sya();
                }
            });
        } else {
            sya();
        }
    }
}
