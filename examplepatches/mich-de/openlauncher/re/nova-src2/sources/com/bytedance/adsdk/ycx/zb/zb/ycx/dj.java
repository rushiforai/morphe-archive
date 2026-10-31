package com.bytedance.adsdk.ycx.zb.zb.ycx;

import java.util.Map;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class dj extends wie {
    public dj() {
        super(com.bytedance.adsdk.ycx.zb.dj.sya.EQ);
    }

    @Override // com.bytedance.adsdk.ycx.zb.zb.ycx
    public Object ycx(Map<String, JSONObject> map) {
        Object objYcx = this.ycx.ycx(map);
        Object objYcx2 = this.f22830zb.ycx(map);
        return (objYcx == null && objYcx2 == null) ? Boolean.TRUE : (objYcx != null || objYcx2 == null) ? (objYcx == null || objYcx2 != null) ? ((objYcx instanceof Number) && (objYcx2 instanceof Number)) ? Boolean.valueOf(com.bytedance.adsdk.ycx.zb.lud.ycx.zb.ycx((Number) objYcx, (Number) objYcx2)) : Boolean.valueOf(objYcx.equals(objYcx2)) : Boolean.FALSE : Boolean.FALSE;
    }
}
