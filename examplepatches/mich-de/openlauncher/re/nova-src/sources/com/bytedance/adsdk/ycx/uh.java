package com.bytedance.adsdk.ycx;

import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class uh implements xkz {
    @Override // com.bytedance.adsdk.ycx.xkz
    /* renamed from: zb, reason: merged with bridge method [inline-methods] */
    public Number ycx(JSONObject jSONObject, Object[] objArr) {
        Object obj;
        if (objArr == null || objArr.length == 0 || (obj = objArr[0]) == null) {
            return null;
        }
        if (obj instanceof Number) {
            return (Number) obj;
        }
        if (obj instanceof Boolean) {
            return Integer.valueOf(((Boolean) obj).booleanValue() ? 1 : 0);
        }
        if (!(obj instanceof String)) {
            return null;
        }
        try {
            String strTrim = ((String) obj).trim();
            if (!strTrim.equalsIgnoreCase(InneractiveMediationDefs.SHOW_HOUSE_AD_YES) && !strTrim.equalsIgnoreCase("false")) {
                return strTrim.contains(".") ? Double.valueOf(Double.parseDouble(strTrim)) : Long.valueOf(Long.parseLong(strTrim));
            }
            return null;
        } catch (NumberFormatException unused) {
            return null;
        }
    }
}
