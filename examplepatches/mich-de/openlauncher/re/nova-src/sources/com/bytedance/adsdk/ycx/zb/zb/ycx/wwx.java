package com.bytedance.adsdk.ycx.zb.zb.ycx;

import android.text.TextUtils;
import b.c0;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class wwx implements com.bytedance.adsdk.ycx.zb.zb.ycx {
    private final String ycx;

    public wwx(String str) {
        this.ycx = str;
    }

    public String toString() {
        return c0.q(new StringBuilder("VariableNode [literals="), this.ycx, "]");
    }

    @Override // com.bytedance.adsdk.ycx.zb.zb.ycx
    public Object ycx(Map<String, JSONObject> map) {
        Object objYcx;
        if (map == null || map.size() <= 0 || (objYcx = ycx(this.ycx, map.get("default_key"))) == JSONObject.NULL) {
            return null;
        }
        return objYcx;
    }

    @Override // com.bytedance.adsdk.ycx.zb.zb.ycx
    public String zb() {
        return this.ycx;
    }

    @Override // com.bytedance.adsdk.ycx.zb.zb.ycx
    public com.bytedance.adsdk.ycx.zb.dj.lud ycx() {
        return com.bytedance.adsdk.ycx.zb.dj.lt.VARIABLE;
    }

    public Object ycx(String str, JSONObject jSONObject) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        return ycx(str.split("\\."), 0, jSONObject);
    }

    private Object ycx(String[] strArr, int i5, JSONObject jSONObject) throws NumberFormatException {
        Object objOpt;
        if (strArr != null && strArr.length > 0 && i5 < strArr.length && jSONObject != null) {
            String str = strArr[i5];
            int iIndexOf = str.indexOf("[");
            int iIndexOf2 = str.indexOf("]");
            if (iIndexOf >= 0 && iIndexOf2 >= 0 && iIndexOf <= iIndexOf2) {
                String strSubstring = str.substring(0, iIndexOf);
                try {
                    int i11 = Integer.parseInt(str.substring(iIndexOf + 1, iIndexOf2));
                    Object objOpt2 = jSONObject.opt(strSubstring);
                    objOpt = objOpt2 instanceof JSONArray ? ((JSONArray) objOpt2).opt(i11) : null;
                } catch (NumberFormatException unused) {
                    return null;
                }
            } else {
                objOpt = jSONObject.opt(str);
            }
            if (i5 == strArr.length - 1) {
                return objOpt;
            }
            if (objOpt instanceof String) {
                try {
                    return ycx(strArr, i5 + 1, new JSONObject((String) objOpt));
                } catch (JSONException unused2) {
                    return objOpt;
                }
            }
            if (objOpt instanceof JSONObject) {
                return ycx(strArr, i5 + 1, (JSONObject) objOpt);
            }
        }
        return null;
    }
}
