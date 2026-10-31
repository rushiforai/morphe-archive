package com.bytedance.sdk.openadsdk.ok.ycx;

import android.text.TextUtils;
import com.amplitude.android.migration.DatabaseConstants;
import com.bytedance.sdk.openadsdk.core.dwi;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.Arrays;
import java.util.HashSet;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class wwx extends com.bytedance.sdk.component.ycx.pmi<JSONObject, JSONObject> {
    public static final HashSet<String> ycx = new HashSet<>(Arrays.asList("setStorageItem", "getStorageItem", "removeAllStorage", "removeStorageItem"));

    /* renamed from: zb, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.core.model.tn f26937zb;

    public wwx(com.bytedance.sdk.openadsdk.core.model.tn tnVar) {
        this.f26937zb = tnVar;
    }

    public static void ycx(com.bytedance.sdk.component.ycx.syc sycVar, com.bytedance.sdk.openadsdk.core.model.tn tnVar) {
        sycVar.ycx(ycx, new wwx(tnVar));
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    @Override // com.bytedance.sdk.component.ycx.dj
    public JSONObject ycx(String str, JSONObject jSONObject, com.bytedance.sdk.component.ycx.lud ludVar) throws Exception {
        String strEtw;
        com.bytedance.sdk.openadsdk.core.model.tn tnVar = this.f26937zb;
        if (tnVar == null || (strEtw = tnVar.etw()) == null) {
            return null;
        }
        JSONObject jSONObject2 = new JSONObject();
        str.getClass();
        char c11 = 65535;
        switch (str.hashCode()) {
            case -1166163208:
                if (str.equals("getStorageItem")) {
                    c11 = 0;
                    break;
                }
                break;
            case 541948222:
                if (str.equals("removeAllStorage")) {
                    c11 = 1;
                    break;
                }
                break;
            case 1357067884:
                if (str.equals("setStorageItem")) {
                    c11 = 2;
                    break;
                }
                break;
            case 1498706186:
                if (str.equals("removeStorageItem")) {
                    c11 = 3;
                    break;
                }
                break;
        }
        switch (c11) {
            case 0:
                String strOptString = jSONObject.optString(DatabaseConstants.KEY_FIELD);
                if (!TextUtils.isEmpty(strOptString) && dwi.ycx().zb(strEtw, strOptString)) {
                    jSONObject2.put("value", dwi.ycx().ycx(strEtw, strOptString));
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, "0");
                    break;
                } else {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, "1");
                    break;
                }
                break;
            case 1:
                dwi.ycx().ycx(strEtw);
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, "0");
                break;
            case 2:
                String strOptString2 = jSONObject.optString(DatabaseConstants.KEY_FIELD);
                String strOptString3 = jSONObject.optString("value");
                if (strOptString2 != null) {
                    dwi.ycx().ycx(strEtw, strOptString2, strOptString3);
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, "0");
                    break;
                } else {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, "1");
                    break;
                }
            case 3:
                String strOptString4 = jSONObject.optString(DatabaseConstants.KEY_FIELD);
                if (!TextUtils.isEmpty(strOptString4)) {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, dwi.ycx().sya(strEtw, strOptString4) ? "0" : "1");
                    break;
                } else {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, "1");
                    break;
                }
        }
        return null;
    }
}
