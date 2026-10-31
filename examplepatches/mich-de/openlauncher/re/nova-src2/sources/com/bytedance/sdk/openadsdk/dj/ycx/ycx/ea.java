package com.bytedance.sdk.openadsdk.dj.ycx.ycx;

import android.text.TextUtils;
import java.nio.charset.StandardCharsets;
import java.util.Iterator;
import java.util.concurrent.atomic.AtomicInteger;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ea extends jc<JSONObject> {
    private static final AtomicInteger ycx = new AtomicInteger(0);

    public ea(String str, JSONObject jSONObject) {
        super(str, jSONObject);
    }

    public static JSONObject ycx(JSONObject jSONObject) throws JSONException {
        JSONObject jSONObject2 = new JSONObject();
        if (jSONObject != null) {
            try {
                Iterator<String> itKeys = jSONObject.keys();
                while (itKeys.hasNext()) {
                    String next = itKeys.next();
                    jSONObject2.putOpt(next, jSONObject.opt(next));
                }
                String strOptString = jSONObject2.optString("event_extra");
                JSONObject jSONObject3 = TextUtils.isEmpty(strOptString) ? new JSONObject() : new JSONObject(strOptString);
                jSONObject3.putOpt("_nl", 1);
                jSONObject3.putOpt("_ei", Integer.valueOf(ycx.getAndAdd(1)));
                jSONObject3.putOpt("_reqc", 0);
                jSONObject2.putOpt("event_extra", jSONObject3.toString());
            } catch (Exception unused) {
            }
        }
        return jSONObject2;
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
}
