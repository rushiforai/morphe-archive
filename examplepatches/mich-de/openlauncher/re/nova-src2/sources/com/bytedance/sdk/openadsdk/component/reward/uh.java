package com.bytedance.sdk.openadsdk.component.reward;

import android.content.Context;
import com.bytedance.sdk.openadsdk.TTClientBidding;

/* loaded from: classes2.dex */
class uh implements TTClientBidding {
    private final fby ycx;

    public uh(Context context, com.bytedance.sdk.openadsdk.core.model.ycx ycxVar) {
        this.ycx = new fby(context, ycxVar);
    }

    @Override // com.bytedance.sdk.openadsdk.TTClientBidding
    public void loss(Double d5, String str, String str2) {
        this.ycx.loss(d5, str, str2);
    }

    @Override // com.bytedance.sdk.openadsdk.TTClientBidding
    public void win(Double d5) {
        this.ycx.win(d5);
    }

    public fby ycx() {
        return this.ycx;
    }

    public void zb() {
        this.ycx.ycx();
    }
}
