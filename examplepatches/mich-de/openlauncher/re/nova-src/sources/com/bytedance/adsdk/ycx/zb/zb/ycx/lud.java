package com.bytedance.adsdk.ycx.zb.zb.ycx;

import java.util.Map;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class lud extends wie {
    public lud() {
        super(com.bytedance.adsdk.ycx.zb.dj.sya.GT_EQ);
    }

    @Override // com.bytedance.adsdk.ycx.zb.zb.ycx
    public Object ycx(Map<String, JSONObject> map) {
        Object objYcx;
        if (this.ycx.ycx(map) == null || (objYcx = this.f22830zb.ycx(map)) == null) {
            return null;
        }
        return Boolean.valueOf(!((Boolean) com.bytedance.adsdk.ycx.zb.lud.ycx.dj.ycx(r0, (Number) objYcx)).booleanValue());
    }
}
