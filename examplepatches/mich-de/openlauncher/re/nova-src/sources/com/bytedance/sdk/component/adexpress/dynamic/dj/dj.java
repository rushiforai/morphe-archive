package com.bytedance.sdk.component.adexpress.dynamic.dj;

import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class dj {

    /* renamed from: dj, reason: collision with root package name */
    public String f23300dj;
    public String sya;
    public List<ycx> ycx;

    /* renamed from: zb, reason: collision with root package name */
    public String f23301zb;

    public static class ycx {
        public int ycx;

        /* renamed from: zb, reason: collision with root package name */
        public JSONObject f23302zb;
    }

    public static dj ycx(JSONObject jSONObject) {
        if (jSONObject == null) {
            return null;
        }
        dj djVar = new dj();
        String strOptString = jSONObject.optString("custom_components");
        ArrayList arrayList = new ArrayList();
        try {
            JSONArray jSONArray = new JSONArray(strOptString);
            for (int i5 = 0; i5 < jSONArray.length(); i5++) {
                JSONObject jSONObjectOptJSONObject = jSONArray.optJSONObject(i5);
                if (jSONObjectOptJSONObject != null) {
                    ycx ycxVar = new ycx();
                    ycxVar.ycx = jSONObjectOptJSONObject.optInt("id");
                    ycxVar.f23302zb = new JSONObject(jSONObjectOptJSONObject.optString("componentLayout"));
                    arrayList.add(ycxVar);
                }
            }
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX60nX+sh", "f/cjlA61auOJTNFtgASnIVU=", "S+8/hgaYYMGGettIixiu", 40);
        }
        djVar.ycx = arrayList;
        djVar.f23301zb = jSONObject.optString("diff_data");
        djVar.sya = jSONObject.optString("style_diff");
        djVar.f23300dj = jSONObject.optString("tag_diff");
        return djVar;
    }
}
