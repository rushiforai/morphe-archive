package com.fyber.inneractive.sdk.response.nativead.parser;

import com.amplitude.android.migration.DatabaseConstants;
import com.fyber.inneractive.sdk.response.nativead.g;
import com.fyber.inneractive.sdk.util.v;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.ArrayList;
import java.util.HashMap;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public abstract class a {
    public static ArrayList a(JSONArray jSONArray) {
        g gVar;
        ArrayList arrayList = new ArrayList();
        if (jSONArray != null && jSONArray.length() != 0) {
            for (int i5 = 0; i5 < jSONArray.length(); i5++) {
                JSONObject jSONObjectOptJSONObject = jSONArray.optJSONObject(i5);
                if (jSONObjectOptJSONObject == null || jSONObjectOptJSONObject.names() == null) {
                    gVar = null;
                } else {
                    gVar = new g();
                    gVar.f31080a = jSONObjectOptJSONObject.optInt(DatabaseConstants.EVENT_FIELD);
                    gVar.f31081b = jSONObjectOptJSONObject.optInt("method");
                    gVar.f31082c = v.a(jSONObjectOptJSONObject, TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL);
                    JSONObject jSONObjectOptJSONObject2 = jSONObjectOptJSONObject.optJSONObject("customdata");
                    HashMap map = gVar.f31083d;
                    HashMap map2 = new HashMap();
                    if (jSONObjectOptJSONObject2 != null) {
                        HashMap map3 = new HashMap();
                        JSONArray jSONArrayNames = jSONObjectOptJSONObject2.names();
                        if (jSONArrayNames != null && jSONArrayNames.length() != 0) {
                            for (int i11 = 0; i11 < jSONArrayNames.length(); i11++) {
                                String strOptString = jSONArrayNames.optString(i11);
                                if (strOptString != null && !strOptString.isEmpty() && !jSONObjectOptJSONObject2.isNull(strOptString)) {
                                    String strOptString2 = jSONObjectOptJSONObject2.optString(strOptString);
                                    if (!strOptString2.isEmpty()) {
                                        map3.put(strOptString, strOptString2);
                                    }
                                }
                            }
                        }
                        map2.putAll(map3);
                    }
                    map.putAll(map2);
                }
                if (gVar != null) {
                    arrayList.add(gVar);
                }
            }
        }
        return arrayList;
    }
}
