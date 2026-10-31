package com.bytedance.adsdk.ycx.zb.zb.ycx;

/* loaded from: classes2.dex */
public abstract class wie implements com.bytedance.adsdk.ycx.zb.zb.ycx {
    protected com.bytedance.adsdk.ycx.zb.dj.sya sya;
    protected com.bytedance.adsdk.ycx.zb.zb.ycx ycx;

    /* renamed from: zb, reason: collision with root package name */
    protected com.bytedance.adsdk.ycx.zb.zb.ycx f22830zb;

    public wie(com.bytedance.adsdk.ycx.zb.dj.sya syaVar) {
        this.sya = syaVar;
    }

    public String toString() {
        return zb();
    }

    public void ycx(com.bytedance.adsdk.ycx.zb.zb.ycx ycxVar) {
        this.ycx = ycxVar;
    }

    public void zb(com.bytedance.adsdk.ycx.zb.zb.ycx ycxVar) {
        this.f22830zb = ycxVar;
    }

    @Override // com.bytedance.adsdk.ycx.zb.zb.ycx
    public com.bytedance.adsdk.ycx.zb.dj.lud ycx() {
        return com.bytedance.adsdk.ycx.zb.dj.lt.OPERATOR_RESULT;
    }

    @Override // com.bytedance.adsdk.ycx.zb.zb.ycx
    public String zb() {
        return this.ycx.zb() + this.sya.ycx() + this.f22830zb.zb();
    }
}
