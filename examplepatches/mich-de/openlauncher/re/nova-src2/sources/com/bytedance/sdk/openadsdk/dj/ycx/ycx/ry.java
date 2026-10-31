package com.bytedance.sdk.openadsdk.dj.ycx.ycx;

import com.bytedance.sdk.openadsdk.utils.tru;
import java.nio.charset.StandardCharsets;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ry extends jc<JSONObject> {
    public ry(String str, JSONObject jSONObject) {
        super(str, jSONObject);
    }

    public static ry ycx(String str, boolean z11, int i5, String str2) {
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.putOpt("track_url", str);
            jSONObject.putOpt("replace_holder", Boolean.valueOf(z11));
            jSONObject.putOpt("track_type", Integer.valueOf(i5));
            jSONObject.putOpt("ad_id", str2);
            ry ryVar = new ry(tru.ycx(), jSONObject);
            ryVar.ycx(1);
            return ryVar;
        } catch (Throwable unused) {
            return null;
        }
    }

    @Override // fc.h
    public byte[] dj() {
        String string;
        JSONObject jSONObject = (JSONObject) sya();
        if (jSONObject == null || (string = jSONObject.toString()) == null) {
            return null;
        }
        return string.getBytes(StandardCharsets.UTF_8);
    }

    public String ea() {
        JSONObject jSONObject = (JSONObject) sya();
        if (jSONObject != null) {
            return jSONObject.optString("ad_id");
        }
        return null;
    }

    public int fby() {
        JSONObject jSONObject = (JSONObject) sya();
        if (jSONObject != null) {
            return jSONObject.optInt("track_type");
        }
        return 0;
    }

    public String jc() {
        JSONObject jSONObject = (JSONObject) sya();
        if (jSONObject != null) {
            return jSONObject.optString("track_url");
        }
        return null;
    }

    public boolean jw() {
        JSONObject jSONObject = (JSONObject) sya();
        if (jSONObject != null) {
            return jSONObject.optBoolean("replace_holder");
        }
        return false;
    }
}
