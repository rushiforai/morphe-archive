package com.bytedance.adsdk.ycx;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.math.BigDecimal;
import java.util.Locale;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class fby implements xkz {
    @Override // com.bytedance.adsdk.ycx.xkz
    /* renamed from: zb, reason: merged with bridge method [inline-methods] */
    public String ycx(JSONObject jSONObject, Object[] objArr) {
        if (objArr == null) {
            return b.f42142b;
        }
        try {
            if (objArr.length < 2) {
                return b.f42142b;
            }
            Object obj = objArr[0];
            Object obj2 = objArr[1];
            return (((obj instanceof String) || (obj instanceof Number)) && (obj2 instanceof String)) ? com.bytedance.adsdk.ugeno.sya.zb.ycx(new BigDecimal(String.valueOf(obj)), (String) obj2, Locale.getDefault(), 2, 1, 2) : b.f42142b;
        } catch (Throwable unused) {
            return b.f42142b;
        }
    }
}
