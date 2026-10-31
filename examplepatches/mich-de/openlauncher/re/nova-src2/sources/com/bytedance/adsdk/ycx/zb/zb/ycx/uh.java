package com.bytedance.adsdk.ycx.zb.zb.ycx;

import java.util.Map;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class uh implements com.bytedance.adsdk.ycx.zb.zb.zb {
    private com.bytedance.adsdk.ycx.zb.zb.ycx sya;
    private com.bytedance.adsdk.ycx.zb.zb.ycx ycx;

    /* renamed from: zb, reason: collision with root package name */
    private com.bytedance.adsdk.ycx.zb.zb.ycx f22829zb;

    @Override // com.bytedance.adsdk.ycx.zb.zb.zb
    public void sya(com.bytedance.adsdk.ycx.zb.zb.ycx ycxVar) {
        this.sya = ycxVar;
    }

    public String toString() {
        return zb();
    }

    @Override // com.bytedance.adsdk.ycx.zb.zb.ycx
    public Object ycx(Map<String, JSONObject> map) {
        Object objYcx = this.ycx.ycx(map);
        if (objYcx == null) {
            return null;
        }
        return ((Boolean) objYcx).booleanValue() ? this.f22829zb.ycx(map) : this.sya.ycx(map);
    }

    @Override // com.bytedance.adsdk.ycx.zb.zb.zb
    public void zb(com.bytedance.adsdk.ycx.zb.zb.ycx ycxVar) {
        this.f22829zb = ycxVar;
    }

    @Override // com.bytedance.adsdk.ycx.zb.zb.ycx
    public String zb() {
        return this.ycx.zb() + "?" + this.f22829zb.zb() + ":" + this.sya.zb();
    }

    @Override // com.bytedance.adsdk.ycx.zb.zb.ycx
    public com.bytedance.adsdk.ycx.zb.dj.lud ycx() {
        return com.bytedance.adsdk.ycx.zb.dj.lt.OPERATOR_RESULT;
    }

    @Override // com.bytedance.adsdk.ycx.zb.zb.zb
    public void ycx(com.bytedance.adsdk.ycx.zb.zb.ycx ycxVar) {
        this.ycx = ycxVar;
    }
}
