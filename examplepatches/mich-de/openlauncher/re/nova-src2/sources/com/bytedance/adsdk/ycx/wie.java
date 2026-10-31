package com.bytedance.adsdk.ycx;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class wie implements xkz {
    private JSONArray zb(Object obj, Object[] objArr) {
        int iYcx;
        int iYcx2;
        JSONArray jSONArray = (JSONArray) obj;
        Object obj2 = objArr.length >= 2 ? objArr[1] : null;
        Object obj3 = objArr.length >= 3 ? objArr[2] : null;
        int length = jSONArray.length();
        if (obj2 == null || (iYcx = ycx(obj2, 0)) < 0) {
            iYcx = 0;
        } else if (iYcx > length) {
            iYcx = length;
        }
        if (obj3 != null && (iYcx2 = ycx(obj3, 0)) >= 0 && iYcx2 <= length) {
            length = iYcx2;
        }
        if (iYcx > length) {
            iYcx = length;
        }
        JSONArray jSONArray2 = new JSONArray();
        while (iYcx < length) {
            jSONArray2.put(jSONArray.opt(iYcx));
            iYcx++;
        }
        return jSONArray2;
    }

    @Override // com.bytedance.adsdk.ycx.xkz
    public Object ycx(JSONObject jSONObject, Object[] objArr) {
        if (objArr == null || objArr.length <= 0) {
            return null;
        }
        Object obj = objArr[0];
        if ((obj instanceof String) || (obj instanceof Number)) {
            return ycx(obj, objArr);
        }
        if (obj instanceof JSONArray) {
            return zb(obj, objArr);
        }
        return null;
    }

    private String ycx(Object obj, Object[] objArr) {
        String string;
        int iYcx;
        int iYcx2;
        if (obj instanceof String) {
            string = (String) obj;
        } else if (obj instanceof Number) {
            string = obj.toString();
        } else {
            string = b.f42142b;
        }
        Object obj2 = objArr.length >= 2 ? objArr[1] : null;
        Object obj3 = objArr.length >= 3 ? objArr[2] : null;
        int length = string.length();
        if (obj2 == null || (iYcx = ycx(obj2, 0)) < 0) {
            iYcx = 0;
        } else if (iYcx > length) {
            iYcx = length;
        }
        if (obj3 != null && (iYcx2 = ycx(obj3, 0)) >= 0 && iYcx2 <= length) {
            length = iYcx2;
        }
        if (iYcx > length) {
            iYcx = length;
        }
        return string.substring(iYcx, length);
    }

    private int ycx(Object obj, int i5) {
        if (obj instanceof Number) {
            return ((Number) obj).intValue();
        }
        if (obj instanceof String) {
            try {
                return (int) Double.parseDouble((String) obj);
            } catch (NumberFormatException unused) {
            }
        }
        return i5;
    }
}
