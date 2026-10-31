package com.bytedance.sdk.openadsdk.core.ry.lt;

import android.content.Context;
import android.text.TextUtils;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.component.utils.pmi;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.uh;
import com.bytedance.sdk.openadsdk.utils.oby;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class lt {
    private final String ycx = "UGenV3OpenLinks";

    /* renamed from: zb, reason: collision with root package name */
    private final String f25942zb = "landingStyle";
    private final String sya = TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL;

    /* renamed from: dj, reason: collision with root package name */
    private final String f25941dj = "fallbackUrl";

    public void ycx(Context context, boolean z11, tn tnVar, String str, Map<String, Object> map, com.bytedance.sdk.openadsdk.core.widget.lt ltVar) {
        int i5;
        if (map == null || map.isEmpty()) {
            return;
        }
        try {
            Object obj = map.get("landingStyle");
            Object obj2 = map.get(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL);
            Object obj3 = map.get("fallbackUrl");
            if (obj != null) {
                try {
                    i5 = Integer.parseInt(String.valueOf(obj));
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+yqQDfJs35BY0k6f", "bskomzXvRteFRPtUghqz", "VP4omyK4RcaOTudcixSMIVXlPg==", 36);
                }
            } else {
                i5 = -1;
            }
            if (ycx(i5, obj2 != null ? String.valueOf(obj2) : null, obj3 != null ? String.valueOf(obj3) : null)) {
                uh.ycx(context, z11, ycx(map), tnVar, str, oby.ycx(str), null, ltVar);
            }
        } catch (Throwable th3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+yqQDfJs35BY0k6f", "bskomzXvRteFRPtUghqz", "VP4omyK4RcaOTudcixSMIVXlPg==", 65);
            htf.sya("UGenV3OpenLinks", th3.getMessage());
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x001f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private boolean ycx(int i5, String str, String str2) {
        if (i5 == 1) {
            if (!pmi.ycx(str)) {
                return false;
            }
        } else if (i5 != 2) {
            if (i5 == 3) {
            }
        } else if ((TextUtils.isEmpty(str) && TextUtils.isEmpty(str2)) || !pmi.ycx(str2)) {
            return false;
        }
        return true;
    }

    private JSONObject ycx(Map<String, Object> map) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        if (map != null) {
            try {
                for (Map.Entry<String, Object> entry : map.entrySet()) {
                    Object value = entry.getValue();
                    if (value != null) {
                        jSONObject.put(entry.getKey(), String.valueOf(value));
                    }
                }
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+yqQDfJs35BY0k6f", "bskomzXvRteFRPtUghqz", "Vu89xymvZsk=", 103);
            }
        }
        return jSONObject;
    }
}
