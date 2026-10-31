package com.bytedance.sdk.openadsdk.ea;

import android.content.Context;
import android.text.TextUtils;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.openadsdk.core.model.lt;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.utils.oby;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ycx implements sya {
    private final Map<String, com.bytedance.sdk.openadsdk.thx.ycx.ycx.sya> sya = new HashMap();
    private final tn ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final zb f26829zb;

    private ycx(zb zbVar, tn tnVar) {
        this.f26829zb = zbVar;
        this.ycx = tnVar;
    }

    public static ycx ycx(zb zbVar, tn tnVar) {
        return new ycx(zbVar, tnVar);
    }

    @Override // com.bytedance.sdk.openadsdk.ea.sya
    public void ycx() {
        this.sya.clear();
    }

    private tn ycx(JSONObject jSONObject, String str) {
        if (jSONObject == null) {
            return null;
        }
        tn tnVar = new tn();
        tnVar.lud(jSONObject);
        if (!TextUtils.isEmpty(str)) {
            tnVar.tru(str);
        }
        if (this.ycx != null) {
            String strYcx = tnVar.znc() != null ? tnVar.znc().ycx() : null;
            if (TextUtils.isEmpty(strYcx)) {
                return this.ycx;
            }
            lt ltVarZnc = this.ycx.znc();
            if (ltVarZnc != null && strYcx.equals(ltVarZnc.ycx())) {
                return this.ycx;
            }
            if (ltVarZnc != null && strYcx.contains("play.google.com/store") && !strYcx.contains("referrer")) {
                tnVar.znc().ycx(ltVarZnc.ycx());
            }
        }
        return tnVar;
    }

    @Override // com.bytedance.sdk.openadsdk.ea.sya
    public void ycx(Context context, JSONObject jSONObject, String str, int i5, boolean z11) {
        JSONObject jSONObjectOptJSONObject;
        if (context == null || jSONObject == null || (jSONObjectOptJSONObject = jSONObject.optJSONObject("data")) == null) {
            return;
        }
        ycx(context, ycx(jSONObjectOptJSONObject, str), jSONObjectOptJSONObject, i5, z11);
    }

    private void ycx(Context context, tn tnVar, JSONObject jSONObject, int i5, boolean z11) {
        if (context == null || tnVar == null || tnVar.znc() == null || jSONObject == null || this.f26829zb == null || this.sya.get(tnVar.znc().ycx()) != null) {
            return;
        }
        String strZb = oby.zb(i5);
        if (TextUtils.isEmpty(strZb)) {
            return;
        }
        this.sya.put(tnVar.znc().ycx(), ycx(context, strZb));
    }

    @Override // com.bytedance.sdk.openadsdk.ea.sya
    public void ycx(Context context, JSONObject jSONObject, String str) {
        if (context == null || this.ycx == null) {
            return;
        }
        com.bytedance.sdk.openadsdk.thx.ycx.ycx.dj.ycx(context, str).ycx(this.ycx);
    }

    @Override // com.bytedance.sdk.openadsdk.ea.sya
    public void ycx(JSONObject jSONObject) throws JSONException {
        JSONObject jSONObjectOptJSONObject;
        if (jSONObject == null || (jSONObjectOptJSONObject = jSONObject.optJSONObject("data")) == null) {
            return;
        }
        ycx(ycx(jSONObjectOptJSONObject, (String) null), jSONObjectOptJSONObject);
    }

    private void ycx(tn tnVar, JSONObject jSONObject) throws JSONException {
        if (this.f26829zb == null || tnVar == null || tnVar.znc() == null) {
            return;
        }
        String strYcx = tnVar.znc().ycx();
        if (this.sya.containsKey(strYcx)) {
            this.sya.remove(strYcx);
            try {
                JSONObject jSONObject2 = new JSONObject();
                jSONObject2.put(PglCryptUtils.KEY_MESSAGE, "success");
                jSONObject2.put("status", "unsubscribed");
                jSONObject2.put("appad", jSONObject);
                this.f26829zb.ycx("app_ad_event", jSONObject2);
            } catch (JSONException e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4YCojpS6iqQ", "cf0MhROdbeOPXdlRgxCkBVrgLJIGrg==", "TuAegAGvatWJSNJ5gwauJFTvKb0Csm3LhVg=", 149);
                htf.sya("JsAppAdDownloadManager", e3.getMessage());
            }
        }
    }

    private com.bytedance.sdk.openadsdk.thx.ycx.ycx.sya ycx(Context context, String str) {
        return com.bytedance.sdk.openadsdk.thx.ycx.ycx.dj.ycx(context, str);
    }
}
