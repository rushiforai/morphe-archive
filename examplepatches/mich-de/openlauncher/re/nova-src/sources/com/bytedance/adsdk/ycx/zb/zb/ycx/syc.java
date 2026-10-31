package com.bytedance.adsdk.ycx.zb.zb.ycx;

import java.util.Map;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class syc implements com.bytedance.adsdk.ycx.zb.zb.ycx {
    private Number ycx;

    public syc(String str) throws NumberFormatException {
        if (str.indexOf(46) < 0) {
            try {
                this.ycx = Integer.valueOf(str);
            } catch (NumberFormatException unused) {
                this.ycx = Long.valueOf(str);
            }
        } else {
            Float fValueOf = Float.valueOf(str);
            this.ycx = fValueOf;
            if (Float.isInfinite(fValueOf.floatValue())) {
                this.ycx = Double.valueOf(str);
            }
        }
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
        return this.ycx.toString();
    }

    @Override // com.bytedance.adsdk.ycx.zb.zb.ycx
    public com.bytedance.adsdk.ycx.zb.dj.lud ycx() {
        return com.bytedance.adsdk.ycx.zb.dj.lt.NUMBER;
    }
}
