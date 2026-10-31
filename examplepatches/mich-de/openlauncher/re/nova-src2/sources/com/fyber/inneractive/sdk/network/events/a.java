package com.fyber.inneractive.sdk.network.events;

import android.text.TextUtils;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.network.t;
import com.fyber.inneractive.sdk.network.w;
import com.fyber.inneractive.sdk.network.x;
import com.fyber.inneractive.sdk.response.e;
import java.util.HashMap;
import org.json.JSONException;

/* loaded from: classes3.dex */
public abstract class a {
    public static void a(t tVar, String str, String str2, InneractiveAdRequest inneractiveAdRequest, e eVar, HashMap map, Boolean bool) {
        w wVar = new w(tVar, inneractiveAdRequest, eVar);
        x xVar = new x();
        if (bool != null) {
            xVar.a(bool, "loaded_from_cache");
        }
        xVar.a(str, "errorCode").a(str2, "templateURL");
        if (map != null && !map.isEmpty()) {
            for (String str3 : map.keySet()) {
                String str4 = (String) map.get(str3);
                if (!TextUtils.isEmpty(str4)) {
                    xVar.a(str4, str3);
                }
            }
        }
        wVar.f28823f.put(xVar.f28825a);
        wVar.a((String) null);
    }

    public static void a(t tVar, b bVar, InneractiveAdRequest inneractiveAdRequest, e eVar, String str, String str2, Boolean bool) throws JSONException {
        w wVar = new w(tVar, inneractiveAdRequest, eVar);
        x xVar = new x();
        xVar.a(bVar.name(), "errorCode");
        if (!TextUtils.isEmpty(str2)) {
            xVar.a(str2, "templateURL");
        }
        if (!TextUtils.isEmpty(str)) {
            xVar.a(str, "error");
        }
        if (bool != null) {
            xVar.a(bool, "loaded_from_cache");
        }
        wVar.f28823f.put(xVar.f28825a);
        wVar.a((String) null);
    }
}
