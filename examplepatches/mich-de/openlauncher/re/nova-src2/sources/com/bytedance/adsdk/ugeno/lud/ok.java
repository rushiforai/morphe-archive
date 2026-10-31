package com.bytedance.adsdk.ugeno.lud;

import android.net.Uri;
import android.text.TextUtils;
import com.bytedance.adsdk.ugeno.lud.lt;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ok {
    public static lt.ycx ycx(String str, JSONObject jSONObject) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        lt.ycx ycxVar = new lt.ycx();
        String strYcx = com.bytedance.adsdk.ugeno.dj.zb.ycx(str, jSONObject);
        if (strYcx.contains("#")) {
            strYcx = strYcx.replace("#", "%23");
        }
        Uri uri = Uri.parse(strYcx);
        if (uri == null) {
            return null;
        }
        ycxVar.sya(strYcx);
        if (!TextUtils.isEmpty(uri.getScheme())) {
            ycxVar.ycx(uri.getScheme());
        }
        String authority = uri.getAuthority();
        if (TextUtils.isEmpty(authority)) {
            authority = uri.getPath();
        }
        ycxVar.zb(authority);
        ycxVar.dj(ycxVar.ycx() + "://" + ycxVar.zb());
        HashMap map = new HashMap();
        Set<String> queryParameterNames = uri.getQueryParameterNames();
        if (queryParameterNames != null && queryParameterNames.size() > 0) {
            for (String str2 : queryParameterNames) {
                map.put(str2, com.bytedance.adsdk.ugeno.dj.zb.ycx(uri.getQueryParameter(str2), jSONObject));
            }
        }
        ycxVar.ycx(map);
        return ycxVar;
    }

    public static lt.ycx ycx(JSONObject jSONObject, JSONObject jSONObject2) {
        if (jSONObject == null) {
            return null;
        }
        lt.ycx ycxVar = new lt.ycx();
        String strYcx = com.bytedance.adsdk.ugeno.dj.zb.ycx(jSONObject.optString("protocol"), jSONObject2);
        ycxVar.zb(com.bytedance.adsdk.ugeno.dj.zb.ycx(jSONObject.optString(PendingUpgradeStore.KEY_NAME), jSONObject2));
        if (TextUtils.isEmpty(strYcx)) {
            ycxVar.ycx("global");
        } else {
            ycxVar.ycx(strYcx);
        }
        ycxVar.dj(ycxVar.ycx() + "://" + ycxVar.zb());
        ycxVar.sya(String.valueOf(jSONObject.hashCode()));
        JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject("args");
        HashMap map = new HashMap();
        if (jSONObjectOptJSONObject != null) {
            Iterator<String> itKeys = jSONObjectOptJSONObject.keys();
            while (itKeys.hasNext()) {
                String next = itKeys.next();
                map.put(next, com.bytedance.adsdk.ugeno.dj.zb.ycx(jSONObjectOptJSONObject.opt(next), jSONObject2));
            }
        }
        ycxVar.ycx(map);
        return ycxVar;
    }
}
