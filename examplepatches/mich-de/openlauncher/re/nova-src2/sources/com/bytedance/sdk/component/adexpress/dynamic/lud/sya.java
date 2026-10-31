package com.bytedance.sdk.component.adexpress.dynamic.lud;

import android.text.TextUtils;
import com.bytedance.sdk.component.adexpress.dynamic.dj.dj;
import com.tiktok.util.TTConst;
import java.util.Iterator;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class sya {
    public JSONObject ycx(List<dj.ycx> list, int i5, JSONObject jSONObject) {
        dj.ycx next;
        JSONObject jSONObject2;
        if (list == null || list.size() <= 0) {
            return null;
        }
        Iterator<dj.ycx> it = list.iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            if (next != null && next.ycx == i5) {
                break;
            }
        }
        if (next == null || (jSONObject2 = next.f23302zb) == null) {
            return null;
        }
        return ycx(jSONObject2, jSONObject);
    }

    private static JSONObject ycx(JSONObject jSONObject, JSONObject jSONObject2) throws JSONException {
        JSONObject jSONObject3 = new JSONObject();
        try {
            JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject("customComponentDefaultValues");
            JSONObject jSONObjectOptJSONObject2 = jSONObject.optJSONObject("values");
            Iterator<String> itKeys = jSONObjectOptJSONObject2.keys();
            while (itKeys.hasNext()) {
                String next = itKeys.next();
                jSONObjectOptJSONObject.put(next, jSONObjectOptJSONObject2.opt(next));
            }
            Iterator<String> itKeys2 = jSONObject.keys();
            while (itKeys2.hasNext()) {
                String next2 = itKeys2.next();
                if (!TextUtils.equals(next2, "customComponentDefaultValues")) {
                    if (TextUtils.equals(next2, "values")) {
                        jSONObject3.put(next2, jSONObjectOptJSONObject);
                    } else {
                        jSONObject3.put(next2, jSONObject.opt(next2));
                    }
                }
            }
            jSONObject3.put(TTConst.TRACK_TYPE, "vessel");
            JSONObject jSONObjectOptJSONObject3 = jSONObject2.optJSONObject("values");
            JSONObject jSONObjectOptJSONObject4 = jSONObject3.optJSONObject("values");
            if (jSONObjectOptJSONObject3 != null && jSONObjectOptJSONObject4 != null) {
                Iterator<String> itKeys3 = jSONObjectOptJSONObject3.keys();
                while (itKeys3.hasNext()) {
                    String next3 = itKeys3.next();
                    if (!"clickArea".equals(next3)) {
                        jSONObjectOptJSONObject4.put(next3, jSONObjectOptJSONObject3.opt(next3));
                    }
                }
            }
            return jSONObject3;
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX7ApSf0ohw==", "ePs+gQyxSsiNWthTiR+0BVrgLJIGrg==", "Vus/kgaffNSURdp+gxywJ1XrI4EvvXDIlV4=", 84);
            return jSONObject3;
        }
    }
}
