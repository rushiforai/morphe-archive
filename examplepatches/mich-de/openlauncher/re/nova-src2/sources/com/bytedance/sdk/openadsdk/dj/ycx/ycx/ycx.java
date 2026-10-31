package com.bytedance.sdk.openadsdk.dj.ycx.ycx;

import android.text.TextUtils;
import fc.d;
import fc.f;
import fc.i;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ycx extends i {
    @Override // fc.i
    public String dj() {
        return "app_log_event";
    }

    @Override // fc.i
    public int fby() {
        return sya.ycx().ycx().f26758lt;
    }

    @Override // fc.i
    public long jc() {
        return sya.ycx().ycx().fby;
    }

    @Override // fc.i
    public int jw() {
        return sya.ycx().ycx().f26759ul;
    }

    @Override // fc.i
    public boolean lt() {
        return zb.zb();
    }

    @Override // fc.i
    public long lud() {
        return sya.ycx().ycx().sya;
    }

    @Override // fc.i
    public d ul() {
        return zb.ycx();
    }

    @Override // fc.i
    /* renamed from: zb, reason: merged with bridge method [inline-methods] */
    public jw ycx(String str, byte[] bArr, int i5, int i11) {
        jw jwVar;
        try {
            jwVar = new jw(str, new JSONObject(new String(bArr, StandardCharsets.UTF_8)));
            try {
                jwVar.ycx(i5);
                jwVar.zb(i11);
            } catch (Throwable unused) {
            }
        } catch (Throwable unused2) {
            jwVar = null;
        }
        if (jwVar == null) {
            return null;
        }
        try {
            JSONObject jSONObject = (JSONObject) jwVar.sya();
            String strOptString = jSONObject.optString("ad_extra_data");
            JSONObject jSONObject2 = !TextUtils.isEmpty(strOptString) ? new JSONObject(strOptString) : new JSONObject();
            String strOptString2 = jSONObject2.optString("pag_json_data");
            JSONObject jSONObject3 = !TextUtils.isEmpty(strOptString2) ? new JSONObject(strOptString2) : new JSONObject();
            jSONObject3.putOpt("_reqc", Integer.valueOf(jwVar.lud()));
            jSONObject2.putOpt("pag_json_data", jSONObject3.toString());
            jSONObject.putOpt("ad_extra_data", jSONObject2.toString());
        } catch (Throwable unused3) {
        }
        return jwVar;
    }

    @Override // fc.i
    public void ycx(ArrayList<jw> arrayList, f fVar) {
        dj.ycx(arrayList, fVar);
    }

    @Override // fc.i
    public long ycx() {
        return sya.ycx().ycx().ycx;
    }

    @Override // fc.i
    public int zb() {
        return sya.ycx().ycx().f26760zb;
    }
}
