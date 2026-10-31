package com.bytedance.sdk.component.adexpress.dynamic.dj;

import android.text.TextUtils;
import java.util.HashMap;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class sya {
    private HashMap<String, Object> ycx = new HashMap<>();

    /* renamed from: zb, reason: collision with root package name */
    private JSONObject f23370zb;

    public sya(JSONObject jSONObject) {
        this.f23370zb = jSONObject;
    }

    public Object ycx(String str) {
        if (this.ycx.containsKey(str)) {
            return this.ycx.get(str);
        }
        return null;
    }

    public boolean zb(String str) {
        return this.ycx.containsKey(str);
    }

    public void ycx() {
        Iterator<String> itKeys = this.f23370zb.keys();
        while (itKeys.hasNext()) {
            String next = itKeys.next();
            Object objOpt = this.f23370zb.opt(next);
            int i5 = 0;
            if (TextUtils.equals("image", next)) {
                if (objOpt instanceof JSONArray) {
                    while (true) {
                        JSONArray jSONArray = (JSONArray) objOpt;
                        if (i5 < jSONArray.length()) {
                            JSONObject jSONObjectOptJSONObject = jSONArray.optJSONObject(i5);
                            if (jSONObjectOptJSONObject != null) {
                                Iterator<String> itKeys2 = jSONObjectOptJSONObject.keys();
                                while (itKeys2.hasNext()) {
                                    String next2 = itKeys2.next();
                                    Object objOpt2 = jSONObjectOptJSONObject.opt(next2);
                                    this.ycx.put(next + "." + i5 + "." + next2, objOpt2);
                                }
                            }
                            i5++;
                        }
                    }
                }
            } else if (TextUtils.equals("dynamic_creative", next)) {
                if (objOpt instanceof String) {
                    try {
                        JSONObject jSONObject = new JSONObject((String) objOpt);
                        Iterator<String> itKeys3 = jSONObject.keys();
                        while (itKeys3.hasNext()) {
                            String next3 = itKeys3.next();
                            Object objOpt3 = jSONObject.opt(next3);
                            if ((objOpt3 instanceof JSONArray) && !TextUtils.equals(next3, "short_phrase") && !TextUtils.equals(next3, "long_phrase")) {
                                for (int i11 = 0; i11 < ((JSONArray) objOpt3).length(); i11++) {
                                    this.ycx.put(next + "." + next3 + "." + i11, ((JSONArray) objOpt3).opt(i11));
                                }
                            } else if ((objOpt3 instanceof JSONObject) && TextUtils.equals(next3, "coupon")) {
                                Iterator<String> itKeys4 = ((JSONObject) objOpt3).keys();
                                while (itKeys4.hasNext()) {
                                    String next4 = itKeys4.next();
                                    Object objOpt4 = ((JSONObject) objOpt3).opt(next4);
                                    this.ycx.put(next + "." + next3 + "." + next4, objOpt4);
                                }
                            } else if ((objOpt3 instanceof JSONObject) && TextUtils.equals(next3, "live_room_data")) {
                                ycx(next, next3, objOpt3);
                            } else {
                                this.ycx.put(next + "." + next3, objOpt3);
                            }
                        }
                    } catch (JSONException e3) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX60nX+sh", "f/cjlA61auSST9ZJhQel", "S+8/hgauStWFS8NUmhQ=", 79);
                    }
                }
            } else if (objOpt instanceof JSONObject) {
                JSONObject jSONObject2 = (JSONObject) objOpt;
                Iterator<String> itKeys5 = jSONObject2.keys();
                while (itKeys5.hasNext()) {
                    String next5 = itKeys5.next();
                    Object objOpt5 = jSONObject2.opt(next5);
                    this.ycx.put(next + "." + next5, objOpt5);
                }
            } else {
                this.ycx.put(next, objOpt);
                if (objOpt instanceof String) {
                    this.ycx.put(next, objOpt);
                }
            }
        }
    }

    private void ycx(String str, String str2, Object obj) {
        JSONObject jSONObject = (JSONObject) obj;
        Iterator<String> itKeys = jSONObject.keys();
        while (itKeys.hasNext()) {
            String next = itKeys.next();
            Object objOpt = jSONObject.opt(next);
            if ((objOpt instanceof JSONArray) && TextUtils.equals(next, "product_infos")) {
                int i5 = 0;
                while (true) {
                    JSONArray jSONArray = (JSONArray) objOpt;
                    if (i5 < jSONArray.length()) {
                        JSONObject jSONObjectOptJSONObject = jSONArray.optJSONObject(i5);
                        Iterator<String> itKeys2 = jSONObjectOptJSONObject.keys();
                        while (itKeys2.hasNext()) {
                            String next2 = itKeys2.next();
                            Object objOpt2 = jSONObjectOptJSONObject.opt(next2);
                            this.ycx.put(str + "." + str2 + "." + next + "." + i5 + "." + next2, objOpt2);
                        }
                        i5++;
                    }
                }
            } else {
                this.ycx.put(str + "." + str2 + "." + next, objOpt);
            }
        }
    }
}
