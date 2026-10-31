package com.bytedance.adsdk.ycx.zb.zb.ycx;

import b.c0;
import java.util.Map;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class htf implements com.bytedance.adsdk.ycx.zb.zb.ycx {
    private final String ycx;

    public htf(String str) {
        this.ycx = str;
    }

    public String toString() {
        return zb();
    }

    @Override // com.bytedance.adsdk.ycx.zb.zb.ycx
    public Object ycx(Map<String, JSONObject> map) {
        return this.ycx;
    }

    @Override // com.bytedance.adsdk.ycx.zb.zb.ycx
    public String zb() {
        return c0.q(new StringBuilder("'"), this.ycx, "'");
    }

    @Override // com.bytedance.adsdk.ycx.zb.zb.ycx
    public com.bytedance.adsdk.ycx.zb.dj.lud ycx() {
        return com.bytedance.adsdk.ycx.zb.dj.lt.STRING;
    }
}
