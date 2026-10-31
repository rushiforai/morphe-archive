package com.bytedance.sdk.openadsdk.ok;

import com.bytedance.sdk.component.adexpress.lud.lud;
import com.bytedance.sdk.component.ycx.htf;
import com.bytedance.sdk.openadsdk.component.reward.sya.fby;

/* loaded from: classes2.dex */
public class zb extends htf {
    @Override // com.bytedance.sdk.component.ycx.htf
    public void dj() {
        if (fby.sya()) {
            lud.ycx().zb(this.f24120jw, ((htf) this).fby);
        } else {
            lud.ycx().ycx(this.f24120jw, ((htf) this).fby);
        }
    }

    @Override // com.bytedance.sdk.component.ycx.htf
    public void sya() {
        if (this.f24120jw != null) {
            if (fby.sya()) {
                lud.ycx().zb(this.f24120jw, this, ((htf) this).fby);
            } else {
                lud.ycx().ycx(this.f24120jw, this, ((htf) this).fby);
            }
        }
    }
}
