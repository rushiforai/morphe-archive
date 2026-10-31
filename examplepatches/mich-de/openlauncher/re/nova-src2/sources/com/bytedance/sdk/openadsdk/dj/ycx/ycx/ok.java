package com.bytedance.sdk.openadsdk.dj.ycx.ycx;

import android.text.TextUtils;
import fc.d;
import fc.f;
import fc.i;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ok extends i {
    @Override // fc.i
    public String dj() {
        return "stats_log_event";
    }

    @Override // fc.i
    public int fby() {
        return sya.ycx().zb().f26758lt;
    }

    @Override // fc.i
    public long jc() {
        return sya.ycx().zb().fby;
    }

    @Override // fc.i
    public int jw() {
        return sya.ycx().zb().f26759ul;
    }

    @Override // fc.i
    public boolean lt() {
        return zb.zb();
    }

    @Override // fc.i
    public long lud() {
        return sya.ycx().zb().sya;
    }

    @Override // fc.i
    public d ul() {
        return zb.ycx();
    }

    @Override // fc.i
    /* renamed from: zb, reason: merged with bridge method [inline-methods] */
    public ea ycx(String str, byte[] bArr, int i5, int i11) {
        ea eaVar;
        try {
            eaVar = new ea(str, new JSONObject(new String(bArr, StandardCharsets.UTF_8)));
            try {
                eaVar.ycx(i5);
                eaVar.zb(i11);
            } catch (Throwable unused) {
            }
        } catch (Throwable unused2) {
            eaVar = null;
        }
        if (eaVar == null) {
            return null;
        }
        try {
            JSONObject jSONObject = (JSONObject) eaVar.sya();
            String strOptString = jSONObject.optString("event_extra");
            JSONObject jSONObject2 = !TextUtils.isEmpty(strOptString) ? new JSONObject(strOptString) : new JSONObject();
            jSONObject2.putOpt("_reqc", Integer.valueOf(eaVar.lud()));
            jSONObject.putOpt("event_extra", jSONObject2.toString());
        } catch (Throwable unused3) {
        }
        return eaVar;
    }

    @Override // fc.i
    public void ycx(ArrayList<ea> arrayList, f fVar) {
        dj.zb(arrayList, fVar);
    }

    @Override // fc.i
    public long ycx() {
        return sya.ycx().zb().ycx;
    }

    @Override // fc.i
    public int zb() {
        return sya.ycx().zb().f26760zb;
    }
}
