package com.bytedance.sdk.openadsdk.core.jc.ycx;

import com.bytedance.sdk.component.jw.fby;
import com.bytedance.sdk.openadsdk.ry.ea;

/* loaded from: classes2.dex */
public class dj implements ea {
    private final fby ycx;

    public dj(fby fbyVar) {
        this.ycx = fbyVar;
    }

    @Override // com.bytedance.sdk.openadsdk.ry.ea
    public void ycx() {
        fby fbyVar = this.ycx;
        if (fbyVar == null) {
            return;
        }
        fbyVar.syc();
    }

    @Override // com.bytedance.sdk.openadsdk.ry.ea
    public void zb() {
        fby fbyVar = this.ycx;
        if (fbyVar == null) {
            return;
        }
        fbyVar.pmi();
    }
}
