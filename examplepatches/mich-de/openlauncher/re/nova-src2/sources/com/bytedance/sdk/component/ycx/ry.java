package com.bytedance.sdk.component.ycx;

import android.text.TextUtils;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public final class ry {
    private final Map<String, Object> ycx = new ConcurrentHashMap();

    private ry() {
    }

    public static ry ycx() {
        return new ry();
    }

    public String zb() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        try {
            for (Map.Entry<String, Object> entry : this.ycx.entrySet()) {
                jSONObject.put(entry.getKey(), entry.getValue());
            }
            return jSONObject.toString();
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VqjtZ", "ce87lFGWeuqTTQ==", "T+EHhgyyWtOSQ9la", 37);
            return b.f42142b;
        }
    }

    public ry ycx(String str, Object obj) {
        if (!TextUtils.isEmpty(str) && obj != null) {
            this.ycx.put(str, obj);
        }
        return this;
    }
}
