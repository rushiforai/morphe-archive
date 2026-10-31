package com.bytedance.sdk.openadsdk.dy.ycx;

import android.os.Build;
import android.text.TextUtils;
import com.amplitude.core.events.Identify;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.component.utils.pmi;
import com.bytedance.sdk.openadsdk.BuildConfig;
import com.bytedance.sdk.openadsdk.core.jc;
import com.bytedance.sdk.openadsdk.dy.ycx.dj;
import com.bytedance.sdk.openadsdk.utils.oby;
import com.bytedance.sdk.openadsdk.utils.tru;
import com.instabridge.mobilesdk.internal.esim.CarrierConfigurator;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.util.TTConst;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class dj<T extends dj> implements sya {

    /* renamed from: ea, reason: collision with root package name */
    private String f26798ea;

    /* renamed from: jc, reason: collision with root package name */
    private String f26799jc;

    /* renamed from: jw, reason: collision with root package name */
    private String f26800jw;

    /* renamed from: ok, reason: collision with root package name */
    private String f26802ok;

    /* renamed from: ry, reason: collision with root package name */
    private String f26803ry;
    private String sya;

    /* renamed from: ul, reason: collision with root package name */
    private String f26804ul;
    private String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private String f26805zb;

    /* renamed from: dj, reason: collision with root package name */
    private final String f26797dj = BuildConfig.VERSION_NAME;
    private long lud = System.currentTimeMillis() / 1000;

    /* renamed from: lt, reason: collision with root package name */
    private int f26801lt = 0;
    private int fby = 0;

    private dj() {
        try {
            this.f26803ry = tru.ycx();
        } catch (Throwable unused) {
            this.f26803ry = CarrierConfigurator.APN_TYPE;
        }
    }

    private T dy() {
        return this;
    }

    private JSONObject syc() {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("os", 1);
            jSONObject.put("model", Build.MODEL);
            jSONObject.put("vendor", Build.MANUFACTURER);
            jSONObject.put("package_name", oby.lt());
            jSONObject.put("ua", oby.dj());
        } catch (Throwable unused) {
        }
        return jSONObject;
    }

    public static dj<dj> zb() {
        return new dj<>();
    }

    public String dj() {
        return this.f26798ea;
    }

    public int ea() {
        return this.fby;
    }

    public long fby() {
        return this.lud;
    }

    public String jc() {
        return this.f26804ul;
    }

    public int jw() {
        return this.f26801lt;
    }

    public String lt() {
        return this.sya;
    }

    public String lud() {
        return this.f26805zb;
    }

    public String ok() {
        return this.f26800jw;
    }

    public String ry() {
        return this.f26799jc;
    }

    public String sya() {
        return this.ycx;
    }

    public String ul() {
        return TextUtils.isEmpty(BuildConfig.VERSION_NAME) ? b.f42142b : BuildConfig.VERSION_NAME;
    }

    public String xkz() {
        return this.f26802ok;
    }

    @Override // com.bytedance.sdk.openadsdk.dy.ycx.sya
    public JSONObject ycx() {
        JSONObject jSONObject;
        JSONObject jSONObject2 = new JSONObject();
        try {
            jSONObject2.put("ad_sdk_version", ul());
            jSONObject2.put("app_version", oby.fby());
            jSONObject2.put("timestamp", fby());
            jSONObject2.put("conn_type", pmi.zb(com.bytedance.sdk.openadsdk.core.pmi.ycx()));
            jSONObject2.put("appid", TextUtils.isEmpty(jc.zb().dj()) ? b.f42142b : jc.zb().dj());
            jSONObject2.put("device_info", syc());
            if (!TextUtils.isEmpty(sya())) {
                jSONObject2.put(TTConst.TRACK_TYPE, sya());
            }
            jSONObject2.put("error_code", ea());
            if (!TextUtils.isEmpty(ok())) {
                jSONObject2.put("error_msg", ok());
            }
            if (!TextUtils.isEmpty(lud())) {
                jSONObject2.put("rit", lud());
            }
            if (!TextUtils.isEmpty(lt())) {
                jSONObject2.put("creative_id", lt());
            }
            if (jw() > 0) {
                jSONObject2.put("adtype", jw());
            }
            if (!TextUtils.isEmpty(jc())) {
                jSONObject2.put("req_id", jc());
            }
            if (!TextUtils.isEmpty(ry())) {
                jSONObject2.put("extra", ry());
            }
            String strDj = dj();
            if (TextUtils.isEmpty(strDj)) {
                jSONObject = new JSONObject();
            } else {
                try {
                    jSONObject = new JSONObject(strDj);
                } catch (Throwable unused) {
                    jSONObject = null;
                }
            }
            if (jSONObject != null) {
                jSONObject.put("os_version_int", Build.VERSION.SDK_INT);
                jSONObject.put("pangle_client_unique_id", "pangle-" + this.f26803ry + Identify.UNSET_VALUE + System.currentTimeMillis());
                jSONObject2.put("event_extra", jSONObject.toString());
            } else if (!TextUtils.isEmpty(strDj)) {
                jSONObject2.put("event_extra", strDj);
            }
            if (!TextUtils.isEmpty(xkz())) {
                jSONObject2.put("duration", xkz());
            }
        } catch (Throwable th2) {
            htf.sya("LogStatsBase", th2.getMessage());
        }
        return jSONObject2;
    }

    public T dj(String str) {
        this.sya = str;
        return (T) dy();
    }

    public T fby(String str) {
        this.f26802ok = str;
        return (T) dy();
    }

    public T lt(String str) {
        this.f26800jw = str;
        return (T) dy();
    }

    public T lud(String str) {
        this.f26804ul = str;
        return (T) dy();
    }

    public T sya(String str) {
        this.f26805zb = str;
        return (T) dy();
    }

    public T ul(String str) {
        this.f26799jc = str;
        return (T) dy();
    }

    public T zb(String str) {
        this.f26798ea = str;
        return (T) dy();
    }

    public T zb(int i5) {
        this.fby = i5;
        return (T) dy();
    }

    public T ycx(String str) {
        this.ycx = str;
        return (T) dy();
    }

    public T ycx(int i5) {
        this.f26801lt = i5;
        return (T) dy();
    }
}
