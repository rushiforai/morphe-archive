package com.bytedance.sdk.openadsdk.dj;

import android.text.TextUtils;
import com.amplitude.core.events.Identify;
import com.amplitude.core.events.Plan;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.openadsdk.core.model.av;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.utils.tru;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ycx implements com.bytedance.sdk.component.lt.ycx.dj.ycx.zb {

    /* renamed from: ea, reason: collision with root package name */
    private static final Set<String> f26701ea = new HashSet(Arrays.asList("insight_log"));

    /* renamed from: ok, reason: collision with root package name */
    private static final Map<String, String> f26702ok = new HashMap<String, String>() { // from class: com.bytedance.sdk.openadsdk.dj.ycx.1
        {
            put("id", "extra_id");
            put(Plan.AMP_PLAN_SOURCE, "extra_source");
            put(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, "extra_url");
            put("toolType", "extra_tool_type");
            put("storeOpenType", "store_open_type");
            put("errorCode", "error_code");
            put("md5", "extra_md5");
            put("areaType", "area_type");
            put("rectInfo", "rect_info");
        }
    };

    /* renamed from: dj, reason: collision with root package name */
    private long f26703dj;

    /* renamed from: dv, reason: collision with root package name */
    private int f26704dv;

    /* renamed from: dy, reason: collision with root package name */
    private String f26705dy;
    private int fby;

    /* renamed from: hf, reason: collision with root package name */
    private List<String> f26706hf;
    private String htf;

    /* renamed from: jc, reason: collision with root package name */
    private int f26707jc;

    /* renamed from: jw, reason: collision with root package name */
    private int f26708jw;

    /* renamed from: lt, reason: collision with root package name */
    private final String f26709lt;
    private long lud;
    private String oty;
    private String pmi;

    /* renamed from: ry, reason: collision with root package name */
    private final AtomicBoolean f26710ry;
    private boolean sya;
    private String syc;
    private com.bytedance.sdk.openadsdk.dj.zb.ycx thx;

    /* renamed from: tn, reason: collision with root package name */
    private String f26711tn;

    /* renamed from: uh, reason: collision with root package name */
    private String f26712uh;

    /* renamed from: ul, reason: collision with root package name */
    private int f26713ul;
    private String wie;
    private String wwx;
    private JSONObject xkz;
    public final String ycx;

    /* renamed from: zb, reason: collision with root package name */
    protected final JSONObject f26714zb;

    /* renamed from: com.bytedance.sdk.openadsdk.dj.ycx$ycx, reason: collision with other inner class name */
    public static final class C0097ycx {

        /* renamed from: dj, reason: collision with root package name */
        private String f26729dj;

        /* renamed from: dy, reason: collision with root package name */
        private final long f26730dy;

        /* renamed from: ea, reason: collision with root package name */
        private String f26731ea;
        private String fby;
        private String htf;

        /* renamed from: jc, reason: collision with root package name */
        private JSONObject f26732jc;

        /* renamed from: jw, reason: collision with root package name */
        private String f26733jw;

        /* renamed from: lt, reason: collision with root package name */
        private String f26734lt;
        private String lud;

        /* renamed from: ok, reason: collision with root package name */
        private final int f26735ok;
        private int pmi;

        /* renamed from: ry, reason: collision with root package name */
        private String f26736ry;
        private String sya;
        private com.bytedance.sdk.openadsdk.dj.zb.ycx syc;
        private List<String> thx;

        /* renamed from: uh, reason: collision with root package name */
        private boolean f26737uh;

        /* renamed from: ul, reason: collision with root package name */
        private String f26738ul;
        private int wie;
        private com.bytedance.sdk.openadsdk.dj.zb.zb xkz;
        public int ycx;

        /* renamed from: zb, reason: collision with root package name */
        private String f26739zb;

        public C0097ycx(long j11, tn tnVar) {
            this.wie = -1;
            this.pmi = -1;
            this.ycx = -1;
            if (tnVar != null) {
                this.f26737uh = av.zb(tnVar);
                this.wie = tnVar.dqs();
                this.pmi = tnVar.iq();
                this.ycx = tnVar.pk();
            }
            this.f26730dy = j11;
            this.f26735ok = com.bytedance.sdk.component.utils.pmi.sya(com.bytedance.sdk.openadsdk.core.pmi.ycx());
        }

        public C0097ycx dj(String str) {
            this.lud = str;
            return this;
        }

        public C0097ycx fby(String str) {
            this.htf = str;
            return this;
        }

        public C0097ycx lt(String str) {
            this.f26733jw = str;
            return this;
        }

        public C0097ycx lud(String str) {
            this.fby = str;
            return this;
        }

        public C0097ycx sya(String str) {
            this.f26729dj = str;
            return this;
        }

        public C0097ycx ul(String str) {
            this.f26738ul = str;
            return this;
        }

        public C0097ycx zb(String str) {
            this.sya = str;
            return this;
        }

        public C0097ycx ycx(String str) {
            this.f26736ry = str;
            return this;
        }

        public C0097ycx ycx(List<String> list) {
            this.thx = list;
            return this;
        }

        public C0097ycx ycx(JSONObject jSONObject) {
            if (jSONObject == null) {
                return this;
            }
            this.f26732jc = jSONObject;
            return this;
        }

        public void ycx(com.bytedance.sdk.openadsdk.dj.zb.ycx ycxVar) {
            com.bytedance.sdk.openadsdk.lt.zb.ycx().ycx(this.f26729dj, this.htf, this.f26738ul, this.sya);
            this.syc = ycxVar;
            ycx ycxVar2 = new ycx(this);
            try {
                com.bytedance.sdk.openadsdk.dj.zb.zb zbVar = this.xkz;
                if (zbVar != null) {
                    zbVar.ycx(ycxVar2.f26714zb, this.f26730dy);
                } else {
                    new com.bytedance.sdk.openadsdk.dj.zb.sya().ycx(ycxVar2.f26714zb, this.f26730dy);
                }
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfYOhTvJLiR+0Ck7nIZEGrg==", "SOsjkQ==", 622);
            }
            com.bytedance.sdk.openadsdk.dj.ycx.zb.ycx(ycxVar2);
        }
    }

    public ycx(String str, JSONObject jSONObject) {
        this.f26709lt = "adiff";
        this.f26710ry = new AtomicBoolean(false);
        this.xkz = new JSONObject();
        this.ycx = str;
        this.f26714zb = jSONObject;
    }

    private void jc() throws JSONException {
        this.f26714zb.putOpt("app_log_url", this.oty);
        List<String> list = this.f26706hf;
        if (list != null && !list.isEmpty()) {
            try {
                this.f26714zb.putOpt("app_log_url_back", new JSONArray((Collection) this.f26706hf));
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfQ==", "WuoptgyxZMiOetZPjRyz", 341);
                htf.sya("AdEvent", th2.getMessage());
            }
        }
        this.f26714zb.putOpt("tag", this.syc);
        this.f26714zb.putOpt("label", this.f26705dy);
        this.f26714zb.putOpt("category", this.wie);
        if (!TextUtils.isEmpty(this.pmi)) {
            try {
                this.f26714zb.putOpt("value", Long.valueOf(Long.parseLong(this.pmi)));
            } catch (NumberFormatException e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfQ==", "WuoptgyxZMiOetZPjRyz", 351);
                this.f26714zb.putOpt("value", 0L);
            }
        }
        if (!TextUtils.isEmpty(this.htf)) {
            try {
                this.f26714zb.putOpt("ext_value", Long.valueOf(Long.parseLong(this.htf)));
            } catch (Exception e11) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e11, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfQ==", "WuoptgyxZMiOetZPjRyz", 359);
            }
        }
        if (!TextUtils.isEmpty(this.f26711tn)) {
            this.f26714zb.putOpt("log_extra", this.f26711tn);
        }
        if (!TextUtils.isEmpty(this.wwx)) {
            try {
                this.f26714zb.putOpt("ua_policy", Integer.valueOf(Integer.parseInt(this.wwx)));
            } catch (NumberFormatException e12) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e12, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfQ==", "WuoptgyxZMiOetZPjRyz", 371);
            }
        }
        ycx(this.f26714zb, this.f26705dy);
        try {
            if (!this.f26714zb.has("nt")) {
                this.f26714zb.putOpt("nt", Integer.valueOf(this.f26704dv));
            }
        } catch (Exception e13) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e13, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfQ==", "WuoptgyxZMiOetZPjRyz", 380);
        }
        Iterator<String> itKeys = this.xkz.keys();
        while (itKeys.hasNext()) {
            String next = itKeys.next();
            this.f26714zb.putOpt(next, this.xkz.opt(next));
        }
    }

    private void jw() {
        JSONObject jSONObject = this.xkz;
        if (jSONObject != null) {
            String strOptString = jSONObject.optString("value");
            String strOptString2 = this.xkz.optString("category");
            String strOptString3 = this.xkz.optString("log_extra");
            if (ycx(this.pmi, this.wie, this.f26711tn)) {
                if (!TextUtils.isEmpty(strOptString) && TextUtils.equals(strOptString, "0")) {
                    return;
                }
                if (!TextUtils.isEmpty(strOptString2) && !zb(strOptString2)) {
                    return;
                }
            } else {
                if ((TextUtils.isEmpty(strOptString) || TextUtils.equals(strOptString, "0")) && (TextUtils.isEmpty(this.pmi) || TextUtils.equals(this.pmi, "0"))) {
                    return;
                }
                if ((TextUtils.isEmpty(this.wie) || !zb(this.wie)) && (TextUtils.isEmpty(strOptString2) || !zb(strOptString2))) {
                    return;
                }
                if (TextUtils.isEmpty(this.f26711tn) && TextUtils.isEmpty(strOptString3)) {
                    return;
                }
            }
        } else if (!ycx(this.pmi, this.wie, this.f26711tn)) {
            return;
        }
        this.f26703dj = com.bytedance.sdk.openadsdk.dj.ycx.zb.sya.incrementAndGet();
    }

    private boolean ycx(String str, String str2, String str3) {
        if (TextUtils.isEmpty(str) || TextUtils.equals(str, "0") || TextUtils.isEmpty(str3)) {
            return false;
        }
        str2.getClass();
        switch (str2) {
        }
        return false;
    }

    private boolean zb(String str) {
        str.getClass();
        switch (str) {
            case "umeng":
            case "event_v1":
            case "event_v3":
            case "app_union":
                return true;
            default:
                return false;
        }
    }

    public JSONObject dj() {
        if (this.f26710ry.get()) {
            return this.f26714zb;
        }
        try {
            jc();
            if (this.f26714zb.has("ad_extra_data")) {
                Object objOpt = this.f26714zb.opt("ad_extra_data");
                if (objOpt != null) {
                    try {
                        if (objOpt instanceof JSONObject) {
                            this.f26714zb.put("ad_extra_data", ycx((JSONObject) objOpt).toString());
                        } else if (objOpt instanceof String) {
                            this.f26714zb.put("ad_extra_data", ycx(new JSONObject((String) objOpt)).toString());
                        }
                    } catch (JSONException e3) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfQ==", "XOs5sBW5Z9M=", 261);
                        htf.sya("AdEvent", "json error", e3.getMessage());
                    }
                }
            } else {
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put("adiff", this.ycx);
                    if (this.sya) {
                        jSONObject.put("interaction_method", this.f26713ul);
                        jSONObject.put("real_interaction_method", this.fby);
                        jSONObject.put("image_mode", this.f26708jw);
                    }
                    this.f26714zb.put("ad_extra_data", jSONObject.toString());
                } catch (JSONException e11) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e11, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfQ==", "XOs5sBW5Z9M=", 274);
                    htf.sya("AdEvent", "json error", e11.getMessage());
                }
            }
            this.f26710ry.set(true);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfQ==", "XOs5sBW5Z9M=", 281);
        }
        return this.f26714zb;
    }

    public boolean fby() {
        Set<String> setOk;
        if (this.f26714zb == null || (setOk = com.bytedance.sdk.openadsdk.core.pmi.dj().ok()) == null) {
            return false;
        }
        String strOptString = this.f26714zb.optString("label");
        if (!TextUtils.isEmpty(strOptString)) {
            return setOk.contains(strOptString);
        }
        if (TextUtils.isEmpty(this.f26705dy)) {
            return false;
        }
        return setOk.contains(this.f26705dy);
    }

    public String lt() {
        if (!TextUtils.isEmpty(this.f26705dy)) {
            return this.f26705dy;
        }
        JSONObject jSONObject = this.f26714zb;
        return jSONObject != null ? jSONObject.optString("label") : b.f42142b;
    }

    public JSONObject lud() {
        JSONObject jSONObjectDj = dj();
        try {
            JSONObject jSONObject = new JSONObject(jSONObjectDj.toString());
            JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject("params");
            if (jSONObjectOptJSONObject == null) {
                return jSONObject;
            }
            jSONObjectOptJSONObject.remove("app_log_url");
            jSONObjectOptJSONObject.remove("app_log_url_back");
            return jSONObject;
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfQ==", "XOs5sBW5Z9O3Q8NVowS0CUv+AZoEiXvL", 297);
            htf.sya("AdEvent", e3.getMessage());
            return jSONObjectDj;
        }
    }

    public int sya() {
        return this.f26707jc;
    }

    public String ul() {
        return this.ycx;
    }

    private void zb(JSONObject jSONObject) {
        if (jSONObject == null) {
            return;
        }
        for (String str : f26702ok.keySet()) {
            try {
                if (jSONObject.has(str)) {
                    Object objOpt = jSONObject.opt(str);
                    jSONObject.remove(str);
                    jSONObject.put(f26702ok.get(str), objOpt);
                }
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfQ==", "SesjlA65QsKZWQ==", Sdk.SDKError.Reason.PRIVACY_ICON_FALLBACK_ERROR_VALUE);
            }
        }
    }

    private JSONObject ycx(JSONObject jSONObject) {
        try {
            if (!jSONObject.has("adiff")) {
                jSONObject.put("adiff", this.ycx);
            }
            if (this.sya) {
                if (!jSONObject.has("interaction_method")) {
                    jSONObject.put("interaction_method", this.f26713ul);
                }
                if (!jSONObject.has("real_interaction_method")) {
                    jSONObject.put("real_interaction_method", this.fby);
                }
                if (!jSONObject.has("image_mode")) {
                    jSONObject.put("image_mode", this.f26708jw);
                }
            }
            zb(jSONObject);
            if (!jSONObject.has("pangle_client_unique_id")) {
                jSONObject.put("pangle_client_unique_id", "pangle-" + this.ycx + Identify.UNSET_VALUE + System.currentTimeMillis());
            }
            if (com.bytedance.sdk.openadsdk.dj.ycx.ycx.lt.zb()) {
                String strOptString = jSONObject.optString("pag_json_data");
                if (!TextUtils.isEmpty(strOptString)) {
                    this.f26707jc = new JSONObject(strOptString).optInt("_l_s_t");
                }
            }
            return jSONObject;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfQ==", "VP45lCK4TN+UWNZ5jQWh", Sdk.SDKError.Reason.AD_ALREADY_LOADED_VALUE);
            htf.sya("AdEvent", th2.getMessage() == null ? "error " : th2.getMessage());
            return jSONObject;
        }
    }

    public ycx(C0097ycx c0097ycx) throws JSONException {
        this.f26709lt = "adiff";
        this.f26710ry = new AtomicBoolean(false);
        this.xkz = new JSONObject();
        if (!TextUtils.isEmpty(c0097ycx.f26739zb)) {
            this.ycx = c0097ycx.f26739zb;
        } else {
            this.ycx = tru.ycx();
        }
        this.thx = c0097ycx.syc;
        this.f26711tn = c0097ycx.f26734lt;
        this.syc = c0097ycx.sya;
        this.f26705dy = c0097ycx.f26729dj;
        if (!TextUtils.isEmpty(c0097ycx.lud)) {
            this.wie = c0097ycx.lud;
        } else {
            this.wie = "app_union";
        }
        this.wwx = c0097ycx.f26731ea;
        this.pmi = c0097ycx.fby;
        this.htf = c0097ycx.f26733jw;
        this.f26712uh = c0097ycx.f26738ul;
        this.f26704dv = c0097ycx.f26735ok;
        this.oty = c0097ycx.f26736ry;
        this.xkz = c0097ycx.f26732jc = c0097ycx.f26732jc != null ? c0097ycx.f26732jc : new JSONObject();
        JSONObject jSONObject = new JSONObject();
        this.f26714zb = jSONObject;
        if (!TextUtils.isEmpty(c0097ycx.f26736ry)) {
            try {
                jSONObject.put("app_log_url", c0097ycx.f26736ry);
            } catch (JSONException e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfQ==", "B+cjnBfi", 454);
                htf.sya("AdEvent", e3.getMessage());
            }
        }
        this.f26706hf = c0097ycx.thx;
        if (c0097ycx.thx != null && !c0097ycx.thx.isEmpty()) {
            try {
                this.f26714zb.putOpt("app_log_url_back", new JSONArray((Collection) c0097ycx.thx));
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfQ==", "B+cjnBfi", 463);
                htf.sya("AdEvent", th2.getMessage());
            }
        }
        this.f26713ul = c0097ycx.wie;
        this.fby = c0097ycx.pmi;
        this.f26708jw = c0097ycx.ycx;
        this.sya = c0097ycx.f26737uh;
        this.lud = System.currentTimeMillis();
        jw();
    }

    @Override // com.bytedance.sdk.component.lt.ycx.dj.ycx.zb
    public long zb() {
        return this.f26703dj;
    }

    @Override // com.bytedance.sdk.component.lt.ycx.dj.ycx.zb
    public JSONObject ycx(String str) {
        return dj();
    }

    @Override // com.bytedance.sdk.component.lt.ycx.dj.ycx.zb
    public long ycx() {
        return this.lud;
    }

    private static void ycx(JSONObject jSONObject, String str) {
        try {
            Set<String> set = f26701ea;
            if (!set.contains(str) && !set.contains(jSONObject.get("label"))) {
                jSONObject.putOpt("is_ad_event", "1");
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoIgwayfQ==", "Uv0MkQedbeKWT9lJ", 695);
            htf.sya("AdEvent", th2);
        }
    }
}
