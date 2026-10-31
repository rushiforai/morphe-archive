package com.bytedance.sdk.openadsdk.core.model;

import android.text.TextUtils;
import com.vungle.ads.internal.protos.Sdk;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class oty {

    /* renamed from: dj, reason: collision with root package name */
    private int f25720dj;

    /* renamed from: ea, reason: collision with root package name */
    private boolean f25722ea;

    /* renamed from: jw, reason: collision with root package name */
    private String f25724jw;

    /* renamed from: lt, reason: collision with root package name */
    private int f25725lt;
    private int lud;

    /* renamed from: ok, reason: collision with root package name */
    private JSONObject f25726ok;
    private xz pmi;

    /* renamed from: ry, reason: collision with root package name */
    private int f25727ry;
    private int sya;

    /* renamed from: uh, reason: collision with root package name */
    private zb f25728uh;

    /* renamed from: ul, reason: collision with root package name */
    private JSONObject f25729ul;
    private int xkz;
    private int ycx;

    /* renamed from: zb, reason: collision with root package name */
    private int f25730zb = 10;
    private int fby = 1;

    /* renamed from: jc, reason: collision with root package name */
    private ycx f25723jc = new ycx();
    private int syc = 1;

    /* renamed from: dy, reason: collision with root package name */
    private String f25721dy = "Next Ad";
    private String wie = "Next ad in %1$ds";

    public static oty ycx(String str) {
        oty otyVar = new oty();
        if (TextUtils.isEmpty(str)) {
            return otyVar;
        }
        try {
            JSONObject jSONObject = new JSONObject(str);
            otyVar.ycx = jSONObject.optInt("auto_switch");
            otyVar.f25730zb = jSONObject.optInt("playable_preload_count");
            otyVar.sya = jSONObject.optInt("disable_on_interaction");
            otyVar.f25720dj = jSONObject.optInt("ceiling_type");
            otyVar.lud = jSONObject.optInt("can_loop");
            otyVar.f25725lt = jSONObject.optInt("multi_skip_time", -1);
            otyVar.fby = jSONObject.optInt("load_more_strategy");
            otyVar.syc = jSONObject.optInt("report_show_by_percent", 1);
            JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject("gesture_tpl_info");
            otyVar.f25729ul = jSONObjectOptJSONObject;
            if (jSONObjectOptJSONObject != null) {
                xz xzVarYcx = xz.ycx(jSONObjectOptJSONObject);
                otyVar.pmi = xzVarYcx;
                if (xzVarYcx != null && !TextUtils.isEmpty(xzVarYcx.sya())) {
                    com.bytedance.sdk.openadsdk.core.ry.ycx.zb.ycx().ycx(new com.bytedance.sdk.openadsdk.core.ry.fby.ycx().ycx(otyVar.pmi.ycx()).zb(otyVar.pmi.zb()).sya(otyVar.pmi.sya()).dj(otyVar.pmi.dj()), "guide");
                }
                int iOptInt = otyVar.f25729ul.optInt("delay_show_time", 5);
                otyVar.f25727ry = iOptInt;
                if (iOptInt < 0) {
                    otyVar.f25727ry = 5;
                }
                int iOptInt2 = otyVar.f25729ul.optInt("dismiss_after_idle_time", 3);
                otyVar.xkz = iOptInt2;
                if (iOptInt2 <= 0) {
                    otyVar.xkz = 3;
                }
            }
            otyVar.f25724jw = jSONObject.optString("agg_endcard_url");
            otyVar.f25722ea = jSONObject.optBoolean("has_more");
            otyVar.f25726ok = jSONObject.optJSONObject("session_params");
            otyVar.f25723jc = ycx.ycx(jSONObject.optJSONObject("layout_config"));
            otyVar.f25728uh = zb.ycx(jSONObject.optJSONObject("progress_config"));
            return otyVar;
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4yKRBrA=", "dvshgQqdbeSPRNFUiw==", "XfwimCmPRuk=", Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE);
            return otyVar;
        }
    }

    public int dj() {
        return this.f25727ry;
    }

    public int dy() {
        return this.f25730zb;
    }

    public boolean ea() {
        return this.f25720dj == 1;
    }

    public int fby() {
        return this.fby;
    }

    public boolean jc() {
        return this.lud == 1;
    }

    public int jw() {
        return this.f25725lt;
    }

    public ycx lt() {
        return this.f25723jc;
    }

    public int lud() {
        return this.xkz;
    }

    public JSONObject ok() {
        return this.f25726ok;
    }

    public boolean ry() {
        return this.f25722ea;
    }

    public JSONObject sya() {
        xz xzVar = this.pmi;
        if (xzVar == null) {
            return null;
        }
        return xzVar.lud();
    }

    public boolean syc() {
        return this.ycx == 1;
    }

    public String ul() {
        return this.f25724jw;
    }

    public zb wie() {
        return this.f25728uh;
    }

    public boolean xkz() {
        return this.sya == 1;
    }

    public JSONObject zb() {
        xz xzVar = this.pmi;
        if (xzVar == null) {
            return null;
        }
        try {
            String strDj = xzVar.dj();
            if (!TextUtils.isEmpty(strDj)) {
                return new JSONObject(strDj);
            }
            String strYcx = com.bytedance.sdk.openadsdk.core.ry.ycx.zb.ycx().ycx("guide", this.pmi.ycx(), this.pmi.zb());
            if (TextUtils.isEmpty(strYcx)) {
                return null;
            }
            return new JSONObject(strYcx);
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4yKRBrA=", "dvshgQqdbeSPRNFUiw==", "XOs5sha1bcK0T9pNgBC0LQ==", 148);
            return null;
        }
    }

    public static class ycx {

        /* renamed from: dj, reason: collision with root package name */
        private int f25731dj;
        private int lud;
        private int sya;
        private int ycx;

        /* renamed from: zb, reason: collision with root package name */
        private int f25732zb;

        public static ycx ycx(JSONObject jSONObject) {
            ycx ycxVar = new ycx();
            if (jSONObject == null) {
                return ycxVar;
            }
            ycxVar.ycx = Math.max(0, jSONObject.optInt("padding_left", 0));
            ycxVar.f25732zb = Math.max(0, jSONObject.optInt("padding_right", 0));
            ycxVar.sya = Math.max(0, jSONObject.optInt("padding_top", 0));
            ycxVar.f25731dj = Math.max(0, jSONObject.optInt("padding_bottom", 0));
            ycxVar.lud = Math.max(0, jSONObject.optInt("card_spacing", 0));
            return ycxVar;
        }

        public int dj() {
            return this.f25732zb;
        }

        public int lud() {
            return this.lud;
        }

        public int sya() {
            return this.ycx;
        }

        public int zb() {
            return this.sya;
        }

        public int ycx() {
            return this.f25731dj;
        }
    }

    public static class zb {

        /* renamed from: dj, reason: collision with root package name */
        private float f25733dj;
        private float lud;
        private String sya;
        private int ycx;

        /* renamed from: zb, reason: collision with root package name */
        private String f25734zb;

        public static zb ycx(JSONObject jSONObject) {
            zb zbVar = new zb();
            if (jSONObject == null) {
                return zbVar;
            }
            zbVar.ycx = jSONObject.optInt("progress_type", 0);
            zbVar.f25734zb = jSONObject.optString("progress_color");
            zbVar.sya = jSONObject.optString("progress_background_color");
            zbVar.f25733dj = jSONObject.optInt("progress_size", 0);
            zbVar.lud = jSONObject.optInt("bar_radius", 0);
            return zbVar;
        }

        public float dj() {
            return this.f25733dj;
        }

        public float lud() {
            return this.lud;
        }

        public String sya() {
            return this.sya;
        }

        public String zb() {
            return this.f25734zb;
        }

        public int ycx() {
            return this.ycx;
        }
    }

    public boolean ycx() {
        return this.syc == 1;
    }
}
