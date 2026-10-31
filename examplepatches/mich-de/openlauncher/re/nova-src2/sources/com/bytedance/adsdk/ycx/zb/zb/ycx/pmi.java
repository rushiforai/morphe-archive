package com.bytedance.adsdk.ycx.zb.zb.ycx;

import java.util.Map;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class pmi extends wie {

    /* renamed from: dj, reason: collision with root package name */
    private static final ThreadLocal<StringBuilder> f22828dj = new ThreadLocal<StringBuilder>() { // from class: com.bytedance.adsdk.ycx.zb.zb.ycx.pmi.1
        @Override // java.lang.ThreadLocal
        /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
        public StringBuilder initialValue() {
            return new StringBuilder();
        }
    };

    public pmi() {
        super(com.bytedance.adsdk.ycx.zb.dj.sya.PLUS);
    }

    @Override // com.bytedance.adsdk.ycx.zb.zb.ycx
    public Object ycx(Map<String, JSONObject> map) {
        Object objYcx;
        Object objYcx2 = this.ycx.ycx(map);
        if (objYcx2 == null || (objYcx = this.f22830zb.ycx(map)) == null) {
            return null;
        }
        if (!(objYcx2 instanceof String) && !(objYcx instanceof String)) {
            return com.bytedance.adsdk.ycx.zb.lud.ycx.fby.ycx((Number) objYcx2, (Number) objYcx);
        }
        StringBuilder sb2 = f22828dj.get();
        sb2.append(objYcx2);
        sb2.append(objYcx);
        String string = sb2.toString();
        sb2.setLength(0);
        return string;
    }
}
