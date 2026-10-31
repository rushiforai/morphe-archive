package com.bytedance.sdk.openadsdk.dj.ycx;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* loaded from: classes2.dex */
class lud implements com.bytedance.sdk.component.lt.ycx.lud.dj {
    private final com.bytedance.sdk.component.ul.zb ycx;

    public lud(com.bytedance.sdk.component.ul.zb zbVar) {
        this.ycx = zbVar;
    }

    @Override // com.bytedance.sdk.component.lt.ycx.lud.dj
    public String sya() {
        com.bytedance.sdk.component.ul.zb zbVar = this.ycx;
        return zbVar != null ? zbVar.zb() : b.f42142b;
    }

    @Override // com.bytedance.sdk.component.lt.ycx.lud.dj
    public boolean ycx() {
        com.bytedance.sdk.component.ul.zb zbVar = this.ycx;
        if (zbVar != null) {
            return zbVar.lt();
        }
        return false;
    }

    @Override // com.bytedance.sdk.component.lt.ycx.lud.dj
    public int zb() {
        com.bytedance.sdk.component.ul.zb zbVar = this.ycx;
        if (zbVar != null) {
            return zbVar.ycx();
        }
        return -1;
    }
}
