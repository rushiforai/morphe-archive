package com.bytedance.sdk.openadsdk.core.settings;

import android.text.TextUtils;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class lt {
    public static final lt ycx = new lt(null);

    /* renamed from: zb, reason: collision with root package name */
    public static String f26119zb = b.f42142b;

    /* renamed from: dj, reason: collision with root package name */
    public boolean f26120dj;

    /* renamed from: lt, reason: collision with root package name */
    public boolean f26121lt;
    public boolean lud;
    public String sya;

    public lt(String str) {
        this.sya = "https://lf-static.tiktokpangle-cdn-us.com/obj/ad-pattern-tx/3p_monitor.9db44671.js";
        this.f26120dj = true;
        this.lud = true;
        this.f26121lt = true;
        try {
            JSONObject jSONObjectOptJSONObject = new JSONObject(str).optJSONObject("performance_js");
            String strOptString = jSONObjectOptJSONObject.optString(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, "https://lf-static.tiktokpangle-cdn-us.com/obj/ad-pattern-tx/3p_monitor.9db44671.js");
            if (!TextUtils.isEmpty(strOptString)) {
                this.sya = strOptString;
            }
            JSONArray jSONArrayOptJSONArray = jSONObjectOptJSONObject.optJSONArray("execute_time");
            ArrayList arrayList = new ArrayList();
            for (int i5 = 0; i5 < jSONArrayOptJSONArray.length(); i5++) {
                arrayList.add(jSONArrayOptJSONArray.optString(i5));
            }
            this.f26120dj = arrayList.contains("load_finish");
            this.f26121lt = arrayList.contains("load_fail");
            this.lud = arrayList.contains("load");
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiBF7VnwJM=", "cf0Omg26YMCMY9lbgw==", "B+cjnBfi", 35);
        }
    }
}
