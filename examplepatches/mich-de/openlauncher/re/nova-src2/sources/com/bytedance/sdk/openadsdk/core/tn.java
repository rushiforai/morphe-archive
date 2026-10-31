package com.bytedance.sdk.openadsdk.core;

import com.bytedance.sdk.openadsdk.AdSlot;
import com.bytedance.sdk.openadsdk.FilterWord;
import com.bytedance.sdk.openadsdk.core.dv;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public interface tn<T> {

    public interface ycx {
        void ycx(int i5, String str);

        void ycx(com.bytedance.sdk.openadsdk.core.model.ycx ycxVar, com.bytedance.sdk.openadsdk.core.model.sya syaVar);
    }

    public interface zb {
        void ycx(int i5, String str);

        void ycx(dv.zb zbVar);
    }

    com.bytedance.sdk.component.adexpress.ycx.sya.ycx ycx();

    com.bytedance.sdk.openadsdk.dj.lud ycx(JSONObject jSONObject, String str, List<String> list);

    JSONObject ycx(AdSlot adSlot, com.bytedance.sdk.openadsdk.core.model.tru truVar, int i5) throws JSONException;

    JSONObject ycx(JSONObject jSONObject);

    void ycx(AdSlot adSlot, com.bytedance.sdk.openadsdk.core.model.tru truVar, int i5, thx thxVar);

    void ycx(String str);

    void ycx(String str, List<FilterWord> list, JSONObject jSONObject, String str2, String str3);

    void ycx(JSONObject jSONObject, zb zbVar);

    void ycx(JSONObject jSONObject, String str);

    com.bytedance.sdk.openadsdk.dj.lud zb(JSONObject jSONObject);
}
