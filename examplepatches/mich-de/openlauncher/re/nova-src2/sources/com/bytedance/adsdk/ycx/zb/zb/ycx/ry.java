package com.bytedance.adsdk.ycx.zb.zb.ycx;

import java.util.Map;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ry extends wie {
    public ry() {
        super(com.bytedance.adsdk.ycx.zb.dj.sya.MULTI);
    }

    @Override // com.bytedance.adsdk.ycx.zb.zb.ycx
    public Object ycx(Map<String, JSONObject> map) {
        Object objYcx;
        Object objYcx2 = this.ycx.ycx(map);
        if (objYcx2 == null || (objYcx = this.f22830zb.ycx(map)) == null) {
            return null;
        }
        return com.bytedance.adsdk.ycx.zb.lud.ycx.ul.ycx((Number) objYcx2, (Number) objYcx);
    }
}
