package com.bytedance.sdk.openadsdk.dj.ycx.ycx;

import android.os.SystemClock;
import android.text.TextUtils;
import fc.g;
import java.nio.charset.StandardCharsets;
import java.util.Iterator;
import java.util.concurrent.atomic.AtomicInteger;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class jw extends jc<JSONObject> {
    private static final AtomicInteger ycx = new AtomicInteger(0);

    /* renamed from: zb, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.dj.ycx f26746zb;

    public jw(final com.bytedance.sdk.openadsdk.dj.ycx ycxVar) {
        super(ycxVar.ycx, new g() { // from class: com.bytedance.sdk.openadsdk.dj.ycx.ycx.jw.1
            final int ycx = jw.ycx.getAndAdd(1);

            /* renamed from: zb, reason: collision with root package name */
            final long f26747zb = SystemClock.elapsedRealtime();

            @Override // fc.g
            /* renamed from: zb, reason: merged with bridge method [inline-methods] */
            public JSONObject ycx() throws JSONException {
                JSONObject jSONObject = new JSONObject();
                try {
                    JSONObject jSONObjectDj = ycxVar.dj();
                    Iterator<String> itKeys = jSONObjectDj.keys();
                    while (itKeys.hasNext()) {
                        String next = itKeys.next();
                        jSONObject.putOpt(next, jSONObjectDj.opt(next));
                    }
                    String strOptString = jSONObject.optString("ad_extra_data", null);
                    JSONObject jSONObject2 = TextUtils.isEmpty(strOptString) ? new JSONObject() : new JSONObject(strOptString);
                    String strOptString2 = jSONObject2.optString("pag_json_data");
                    JSONObject jSONObject3 = TextUtils.isEmpty(strOptString2) ? new JSONObject() : new JSONObject(strOptString2);
                    jSONObject3.putOpt("_nl", 1);
                    jSONObject3.putOpt("_ei", Integer.valueOf(this.ycx));
                    jSONObject3.putOpt("_reqc", 0);
                    jSONObject3.putOpt("_c_t_s", Long.valueOf(SystemClock.elapsedRealtime() - this.f26747zb));
                    if (lt.zb()) {
                        jSONObject3.put("_ad_staging_flag", 3);
                    }
                    jSONObject2.putOpt("pag_json_data", jSONObject3.toString());
                    jSONObject.putOpt("ad_extra_data", jSONObject2.toString());
                    return jSONObject;
                } catch (Exception unused) {
                    return null;
                }
            }
        });
        ycx(ycxVar.fby() ? 1 : 0);
        this.f26746zb = ycxVar;
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

    public String fby() {
        com.bytedance.sdk.openadsdk.dj.ycx ycxVar = this.f26746zb;
        if (ycxVar != null) {
            return ycxVar.lt();
        }
        return null;
    }

    @Override // fc.h
    public String toString() {
        com.bytedance.sdk.openadsdk.dj.ycx ycxVar = this.f26746zb;
        return ycxVar != null ? ycxVar.lt() : super.toString();
    }

    public jw(String str, JSONObject jSONObject) {
        super(str, jSONObject);
    }
}
