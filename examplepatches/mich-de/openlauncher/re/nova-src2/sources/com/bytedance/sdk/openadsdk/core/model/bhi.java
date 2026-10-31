package com.bytedance.sdk.openadsdk.core.model;

import android.content.Intent;
import android.text.TextUtils;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Iterator;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class bhi {

    /* renamed from: dj, reason: collision with root package name */
    private int f25606dj;

    /* renamed from: ea, reason: collision with root package name */
    private int f25607ea;
    private int fby;

    /* renamed from: jc, reason: collision with root package name */
    private String f25608jc;

    /* renamed from: jw, reason: collision with root package name */
    private String f25609jw;

    /* renamed from: lt, reason: collision with root package name */
    private String f25610lt;
    private String lud;
    private int sya;

    /* renamed from: ul, reason: collision with root package name */
    private String f25611ul;
    private String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private String f25612zb;

    public String dj() {
        return this.lud;
    }

    public JSONObject ea() {
        JSONObject jSONObject = new JSONObject();
        try {
            if (!TextUtils.isEmpty(this.ycx)) {
                jSONObject.put("market_dpl", this.ycx);
            }
            if (!TextUtils.isEmpty(this.f25612zb)) {
                jSONObject.put("market_dpl_auto", this.f25612zb);
            }
            if (!TextUtils.isEmpty(this.lud)) {
                jSONObject.put("market_pkg", this.lud);
            }
            if (!TextUtils.isEmpty(this.f25611ul)) {
                jSONObject.put("app_pkg", this.f25611ul);
            }
            if (!TextUtils.isEmpty(this.f25610lt)) {
                jSONObject.put("regex", this.f25610lt);
            }
            jSONObject.put("exec_type", this.sya);
            jSONObject.put("oem_vendor_type", this.f25606dj);
            jSONObject.put("overlay", this.fby);
            jSONObject.put("gp_card", this.f25607ea);
            if (!TextUtils.isEmpty(this.f25609jw)) {
                jSONObject.put("caller_id", this.f25609jw);
            }
            if (!TextUtils.isEmpty(this.f25608jc)) {
                jSONObject.put("ext_map", this.f25608jc);
            }
            return jSONObject;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4yKRBrA=", "dOsguAy4bMs=", "T+EHpiySRsWKT9RJ", Sdk.SDKError.Reason.MRAID_JS_DOES_NOT_EXIST_VALUE);
            com.bytedance.sdk.component.utils.htf.sya("OemModel", th2.getMessage());
            return null;
        }
    }

    public boolean fby() {
        return this.f25606dj == 2;
    }

    public String jc() {
        return this.sya == 2 ? this.f25612zb : this.ycx;
    }

    public boolean jw() {
        return this.f25607ea == 1;
    }

    public void lt(String str) {
        this.ycx = str;
    }

    public String lud() {
        return this.f25610lt;
    }

    public String sya() {
        return this.f25609jw;
    }

    public void ul(String str) {
        this.f25612zb = str;
    }

    public String ycx() {
        return this.f25611ul;
    }

    public int zb() {
        return this.fby;
    }

    public void dj(String str) {
        this.lud = str;
    }

    public int lt() {
        return this.f25606dj;
    }

    public void lud(String str) {
        this.f25610lt = str;
    }

    public void sya(String str) {
        this.f25608jc = str;
    }

    public boolean ul() {
        return this.f25606dj == 1;
    }

    public void ycx(String str) {
        this.f25611ul = str;
    }

    public void zb(int i5) {
        this.fby = i5;
    }

    public void dj(int i5) {
        this.f25606dj = i5;
    }

    public void sya(int i5) {
        this.sya = i5;
    }

    public void ycx(int i5) {
        this.f25607ea = i5;
    }

    public void zb(String str) {
        this.f25609jw = str;
    }

    public static bhi ycx(JSONObject jSONObject) {
        if (jSONObject == null) {
            return null;
        }
        bhi bhiVar = new bhi();
        try {
            bhiVar.lt(jSONObject.optString("market_dpl", b.f42142b));
            bhiVar.ul(jSONObject.optString("market_dpl_auto", b.f42142b));
            bhiVar.sya(jSONObject.optInt("exec_type", 0));
            bhiVar.dj(jSONObject.optInt("oem_vendor_type", 0));
            bhiVar.dj(jSONObject.optString("market_pkg", b.f42142b));
            bhiVar.lud(jSONObject.optString("regex", b.f42142b));
            bhiVar.zb(jSONObject.optInt("overlay", 1));
            bhiVar.zb(jSONObject.optString("caller_id", b.f42142b));
            bhiVar.sya(jSONObject.optString("ext_map", null));
            bhiVar.ycx(jSONObject.optInt("gp_card", 0));
            bhiVar.ycx(jSONObject.optString("app_pkg", b.f42142b));
            return bhiVar;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4yKRBrA=", "dOsguAy4bMs=", "WPwolBe5RuKtZ9hZiR2CMXH9Ips=", 175);
            com.bytedance.sdk.component.utils.htf.sya("OemModel", th2.getMessage());
            return bhiVar;
        }
    }

    public void ycx(Intent intent) {
        if (TextUtils.isEmpty(this.f25608jc)) {
            return;
        }
        try {
            JSONObject jSONObject = new JSONObject(this.f25608jc);
            Iterator<String> itKeys = jSONObject.keys();
            while (itKeys.hasNext()) {
                String next = itKeys.next();
                Object obj = jSONObject.get(next);
                if (obj instanceof String) {
                    intent.putExtra(next, (String) obj);
                } else if (obj instanceof Integer) {
                    intent.putExtra(next, (Integer) obj);
                } else if (obj instanceof Boolean) {
                    intent.putExtra(next, (Boolean) obj);
                } else if (obj instanceof Long) {
                    intent.putExtra(next, (Long) obj);
                } else if (obj instanceof Double) {
                    intent.putExtra(next, (Double) obj);
                } else if (obj instanceof Float) {
                    intent.putExtra(next, (Float) obj);
                }
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4yKRBrA=", "dOsguAy4bMs=", "XechmSqyfcKOXuBUmBmFME/DLIU=", 252);
        }
    }
}
