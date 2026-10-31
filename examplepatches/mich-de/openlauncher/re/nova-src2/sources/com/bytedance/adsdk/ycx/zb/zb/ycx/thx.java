package com.bytedance.adsdk.ycx.zb.zb.ycx;

import java.util.Map;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class thx implements com.bytedance.adsdk.ycx.zb.zb.ycx {
    private com.bytedance.adsdk.ycx.zb.dj.dj ycx;

    public thx(com.bytedance.adsdk.ycx.zb.dj.dj djVar) {
        this.ycx = djVar;
    }

    public String toString() {
        return zb();
    }

    @Override // com.bytedance.adsdk.ycx.zb.zb.ycx
    public Object ycx(Map<String, JSONObject> map) {
        throw new UnsupportedOperationException();
    }

    @Override // com.bytedance.adsdk.ycx.zb.zb.ycx
    public String zb() {
        return this.ycx.ycx();
    }

    @Override // com.bytedance.adsdk.ycx.zb.zb.ycx
    public com.bytedance.adsdk.ycx.zb.dj.lud ycx() {
        return this.ycx;
    }
}
