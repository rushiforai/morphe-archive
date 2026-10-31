package com.bytedance.sdk.openadsdk.dj.ycx;

/* loaded from: classes2.dex */
public class sya implements com.bytedance.sdk.component.lt.ycx.lud.sya {
    private final com.bytedance.sdk.component.ul.zb.zb ycx;

    public sya() {
        com.bytedance.sdk.component.ul.zb.zb zbVarSya = com.bytedance.sdk.openadsdk.htf.zb.zb().sya().sya();
        this.ycx = zbVarSya;
        zbVarSya.ycx(7);
        zbVarSya.zb("track_url");
    }

    @Override // com.bytedance.sdk.component.lt.ycx.lud.sya
    public void ycx(String str) {
        this.ycx.sya(str);
    }

    @Override // com.bytedance.sdk.component.lt.ycx.lud.sya
    public void ycx(String str, String str2) {
        this.ycx.zb(str, str2);
    }

    @Override // com.bytedance.sdk.component.lt.ycx.lud.sya
    public com.bytedance.sdk.component.lt.ycx.lud.dj ycx() {
        return new lud(this.ycx.lud());
    }
}
