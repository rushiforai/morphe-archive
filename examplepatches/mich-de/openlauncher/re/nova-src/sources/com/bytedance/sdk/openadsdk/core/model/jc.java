package com.bytedance.sdk.openadsdk.core.model;

import android.text.TextUtils;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class jc {
    private String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private List<String> f25691zb;

    public jc(String str) {
        this.ycx = b.f42142b;
        this.f25691zb = new ArrayList();
        HashMap<String, Object> map = TextUtils.isEmpty(str) ? new HashMap<>() : ycx(str);
        try {
            this.ycx = (String) map.get("auto_test_param");
            JSONArray jSONArray = new JSONArray((String) map.get("auto_test_hosts"));
            this.f25691zb = new ArrayList();
            for (int i5 = 0; i5 < jSONArray.length(); i5++) {
                this.f25691zb.add(jSONArray.optString(i5));
            }
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4yKRBrA=", "evs5mje5etOtRdNYgA==", "B+cjnBfi", 45);
            com.bytedance.sdk.component.utils.htf.sya("AutoTestModel", e3.getMessage());
        }
    }

    public String ycx() {
        return this.ycx;
    }

    public List<String> zb() {
        return this.f25691zb;
    }

    private static final HashMap<String, Object> ycx(String str) {
        if (TextUtils.isEmpty(str)) {
            return new HashMap<>();
        }
        HashMap<String, Object> map = new HashMap<>();
        try {
            JSONArray jSONArray = new JSONArray(str);
            for (int i5 = 0; i5 < jSONArray.length(); i5++) {
                JSONObject jSONObjectOptJSONObject = jSONArray.optJSONObject(i5);
                map.put(jSONObjectOptJSONObject.optString(PendingUpgradeStore.KEY_NAME), jSONObjectOptJSONObject.optString("value"));
            }
            return map;
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4yKRBrA=", "evs5mje5etOtRdNYgA==", "Uf0imzezRMaQ", 71);
            return new HashMap<>();
        }
    }
}
