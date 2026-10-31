package com.bytedance.sdk.openadsdk.dj.ycx;

import android.annotation.SuppressLint;
import android.content.Context;
import android.os.Build;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import com.amplitude.android.TrackingOptions;
import com.amplitude.android.migration.DatabaseConstants;
import com.amplitude.android.plugins.AndroidContextPlugin;
import com.amplitude.core.events.Identify;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.component.utils.wwx;
import com.bytedance.sdk.openadsdk.BuildConfig;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.core.ry;
import com.bytedance.sdk.openadsdk.core.settings.ea;
import com.bytedance.sdk.openadsdk.utils.DeviceUtils;
import com.bytedance.sdk.openadsdk.utils.bhi;
import com.bytedance.sdk.openadsdk.utils.dc;
import com.bytedance.sdk.openadsdk.utils.hf;
import com.bytedance.sdk.openadsdk.utils.oby;
import com.bytedance.sdk.openadsdk.utils.rmf;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ycx {

    /* renamed from: lt, reason: collision with root package name */
    private static volatile ycx f26726lt;

    /* renamed from: dj, reason: collision with root package name */
    private final boolean f26727dj = sya();
    private final String lud;
    private Context sya;
    private long ycx;

    /* renamed from: zb, reason: collision with root package name */
    private int f26728zb;

    private ycx() {
        Context contextYcx = pmi.ycx();
        if (contextYcx != null) {
            this.sya = contextYcx.getApplicationContext();
        }
        this.lud = lud();
    }

    private int dj() {
        int rawOffset = TimeZone.getDefault().getRawOffset() / 3600000;
        if (rawOffset < -12) {
            rawOffset = -12;
        }
        if (rawOffset > 12) {
            return 12;
        }
        return rawOffset;
    }

    private String lt() {
        StringBuilder sb2 = new StringBuilder();
        try {
            if (bhi.lt()) {
                sb2.append("MIUI-");
            } else if (bhi.sya()) {
                sb2.append("FLYME-");
            } else {
                String strSyc = bhi.syc();
                if (bhi.ycx(strSyc)) {
                    sb2.append("EMUI-");
                }
                if (!TextUtils.isEmpty(strSyc)) {
                    sb2.append(strSyc);
                    sb2.append(Identify.UNSET_VALUE);
                }
            }
            sb2.append(Build.VERSION.INCREMENTAL);
        } catch (Throwable unused) {
        }
        return sb2.toString();
    }

    private String lud() {
        return DeviceUtils.sya(this.sya) ? "tv" : DeviceUtils.zb(this.sya) ? "android_pad" : "android";
    }

    private boolean sya() {
        try {
            if (!new File("/system/bin/su").exists()) {
                if (!new File("/system/xbin/su").exists()) {
                    return false;
                }
            }
            return true;
        } catch (Exception unused) {
            return false;
        }
    }

    public static ycx ycx() {
        if (f26726lt == null) {
            synchronized (ycx.class) {
                try {
                    if (f26726lt == null) {
                        f26726lt = new ycx();
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return f26726lt;
    }

    public List<String> zb(List<com.bytedance.sdk.openadsdk.dj.ycx> list) {
        JSONArray jSONArrayOptJSONArray = (list.isEmpty() || list.get(0) == null || list.get(0).dj() == null) ? null : list.get(0).dj().optJSONArray("app_log_url_back");
        ArrayList arrayList = new ArrayList();
        if (jSONArrayOptJSONArray != null && jSONArrayOptJSONArray.length() > 0) {
            for (int i5 = 0; i5 < jSONArrayOptJSONArray.length(); i5++) {
                String strLt = oby.lt(jSONArrayOptJSONArray.optString(i5));
                if (!TextUtils.isEmpty(strLt)) {
                    arrayList.add(strLt);
                }
            }
        }
        return arrayList;
    }

    public String ycx(List<com.bytedance.sdk.openadsdk.dj.ycx> list) {
        String strOptString;
        if (list.size() > 0 && list.get(0) != null && list.get(0).dj() != null) {
            strOptString = list.get(0).dj().optString("app_log_url");
        } else {
            strOptString = b.f42142b;
        }
        return oby.lud(strOptString);
    }

    @SuppressLint({"HardwareIds"})
    public JSONObject zb() throws JSONException {
        Context contextYcx;
        JSONObject jSONObject = new JSONObject();
        try {
            if (this.sya == null && (contextYcx = pmi.ycx()) != null) {
                this.sya = contextYcx.getApplicationContext();
            }
            jSONObject.put("ua", oby.dj());
            jSONObject.put("ad_sdk_version", BuildConfig.VERSION_NAME);
            jSONObject.put("app_version", oby.fby());
            jSONObject.put("sim_op", ycx(this.sya));
            jSONObject.put("root", this.f26727dj ? 1 : 0);
            jSONObject.put("timezone", dj());
            jSONObject.put("access", hf.ycx(this.sya));
            jSONObject.put("os", AndroidContextPlugin.PLATFORM);
            jSONObject.put(TrackingOptions.AMP_TRACKING_OPTION_OS_VERSION, Build.VERSION.RELEASE);
            jSONObject.put("os_api", Build.VERSION.SDK_INT);
            jSONObject.put("device_type", this.lud);
            jSONObject.put(TrackingOptions.AMP_TRACKING_OPTION_DEVICE_MODEL, Build.MODEL);
            jSONObject.put(TrackingOptions.AMP_TRACKING_OPTION_DEVICE_BRAND, Build.BRAND);
            jSONObject.put(TrackingOptions.AMP_TRACKING_OPTION_DEVICE_MANUFACTURER, Build.MANUFACTURER);
            jSONObject.put(TrackingOptions.AMP_TRACKING_OPTION_LANGUAGE, Locale.getDefault().getLanguage());
            jSONObject.put("resolution", dc.lt(this.sya) + "x" + dc.dj(this.sya));
            jSONObject.put("display_density", ycx(dc.ea(this.sya)));
            jSONObject.put("density_dpi", dc.ea(this.sya));
            jSONObject.put("aid", "1371");
            jSONObject.put("device_id", ry.ycx(this.sya));
            jSONObject.put("rom", lt());
            jSONObject.put("cpu_abi", Build.CPU_ABI);
            jSONObject.put("ut", this.f26728zb);
            jSONObject.put("uid", this.ycx);
            jSONObject.put("google_aid", com.bytedance.sdk.openadsdk.thx.ycx.zb.ycx.ycx().zb());
            jSONObject.put("locale_language", DeviceUtils.dj());
            jSONObject.put("screen_bright", Math.ceil(DeviceUtils.lud() * 10.0f) / 10.0d);
            jSONObject.put("is_screen_off", !DeviceUtils.zb() ? 1 : 0);
            ea eaVarDj = pmi.dj();
            Context context = this.sya;
            if (context != null) {
                jSONObject.put("force_language", wwx.ycx(context, "tt_choose_language"));
            }
            if (eaVarDj.bhi("mnc")) {
                jSONObject.put("mnc", rmf.sya());
            }
            if (eaVarDj.bhi("mcc")) {
                jSONObject.put("mcc", rmf.zb());
            }
        } catch (Exception unused) {
        }
        return jSONObject;
    }

    private void ycx(com.bytedance.sdk.openadsdk.dj.ycx ycxVar) {
        if (ycxVar == null) {
            return;
        }
        try {
            String strOptString = ycxVar.dj().optJSONObject("params").optString("log_extra", b.f42142b);
            long jYcx = tn.ycx(strOptString);
            int iDj = tn.dj(strOptString);
            if (jYcx == 0) {
                jYcx = this.ycx;
            }
            this.ycx = jYcx;
            if (iDj == 0) {
                iDj = this.f26728zb;
            }
            this.f26728zb = iDj;
        } catch (Exception e3) {
            htf.sya("AdLogParamsGenerate", "getInfoFromLogExtra exception", e3.getMessage());
        }
    }

    public JSONObject ycx(List<com.bytedance.sdk.openadsdk.dj.ycx> list, long j11, JSONObject jSONObject) throws JSONException {
        JSONObject jSONObject2 = new JSONObject();
        try {
            ycx(list.get(0));
            jSONObject2.put("header", jSONObject);
            JSONArray jSONArray = new JSONArray();
            Iterator<com.bytedance.sdk.openadsdk.dj.ycx> it = list.iterator();
            while (it.hasNext()) {
                jSONArray.put(it.next().lud());
            }
            jSONObject2.put("event_v3", jSONArray);
            jSONObject2.put("magic_tag", "ss_app_log");
            jSONObject2.put("_gen_time", j11);
            jSONObject2.put("local_time", j11 / 1000);
        } catch (JSONException unused) {
        }
        return jSONObject2;
    }

    public List<com.bytedance.sdk.openadsdk.dj.ycx> ycx(List<com.bytedance.sdk.openadsdk.dj.ycx> list, int i5) throws JSONException {
        ArrayList arrayList = new ArrayList();
        for (com.bytedance.sdk.openadsdk.dj.ycx ycxVar : list) {
            try {
                JSONObject jSONObject = new JSONObject();
                JSONObject jSONObjectDj = ycxVar.dj();
                jSONObject.putOpt(DatabaseConstants.EVENT_FIELD, jSONObjectDj.optString("label"));
                long jOptLong = jSONObjectDj.optLong("event_ts", System.currentTimeMillis());
                jSONObject.putOpt("local_time_ms", Long.valueOf(jOptLong));
                jSONObject.putOpt("datetime", com.bytedance.sdk.openadsdk.dj.lt.sya.format(new Date(jOptLong)));
                JSONObject jSONObject2 = new JSONObject();
                Iterator<String> itKeys = jSONObjectDj.keys();
                while (itKeys.hasNext()) {
                    String next = itKeys.next();
                    if (!TextUtils.equals(next, "label")) {
                        jSONObject2.putOpt(next, jSONObjectDj.opt(next));
                    }
                }
                if (i5 > 0 && ycxVar.sya() == 3) {
                    jSONObject2.put("_ad_staging_flag", i5);
                }
                jSONObject.putOpt("params", jSONObject2);
                arrayList.add(new com.bytedance.sdk.openadsdk.dj.lt(ycxVar.ycx, jSONObject));
            } catch (Exception e3) {
                htf.sya("AdLogParamsGenerate", e3.getMessage());
            }
        }
        return arrayList;
    }

    private String ycx(Context context) {
        try {
            TelephonyManager telephonyManager = (TelephonyManager) context.getSystemService("phone");
            if (telephonyManager == null) {
                return b.f42142b;
            }
            return telephonyManager.getSimOperator();
        } catch (Throwable unused) {
            return b.f42142b;
        }
    }

    private String ycx(int i5) {
        if (i5 == 120) {
            return "ldpi";
        }
        if (i5 == 160) {
            return "mdpi";
        }
        if (i5 == 240) {
            return "hdpi";
        }
        if (i5 == 320) {
            return "xhdpi";
        }
        if (i5 == 480) {
            return "xxhdpi";
        }
        if (i5 != 640) {
            return "mdpi";
        }
        return "xxxhdpi";
    }
}
