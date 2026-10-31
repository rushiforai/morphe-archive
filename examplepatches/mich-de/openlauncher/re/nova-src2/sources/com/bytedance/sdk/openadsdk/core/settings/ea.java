package com.bytedance.sdk.openadsdk.core.settings;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.SystemClock;
import android.preference.PreferenceManager;
import android.text.TextUtils;
import android.util.Log;
import androidx.compose.ui.node.LayoutNode;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.component.utils.ok;
import com.bytedance.sdk.openadsdk.ApmHelper;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.bytedance.sdk.openadsdk.common.TTAdDislikeToast;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.core.settings.TTSdkSettings;
import com.bytedance.sdk.openadsdk.core.settings.jc;
import com.bytedance.sdk.openadsdk.core.settings.jw;
import com.bytedance.sdk.openadsdk.core.settings.lud;
import com.bytedance.sdk.openadsdk.core.syc;
import com.bytedance.sdk.openadsdk.dj.ycx.jc;
import com.bytedance.sdk.openadsdk.utils.DeviceUtils;
import com.bytedance.sdk.openadsdk.utils.oby;
import com.bytedance.sdk.openadsdk.utils.yzp;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.instabridge.mobilesdk.internal.esim.CarrierConfigurator;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h;
import com.pgl.ssdk.ces.out.PglSSConfig;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import h6.c1;
import java.io.File;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ea implements jw.ycx {
    private static String oty;

    /* renamed from: dv, reason: collision with root package name */
    private lud.zb<JSONObject> f26102dv;

    /* renamed from: dy, reason: collision with root package name */
    private int f26103dy;
    lud.zb<com.bytedance.sdk.openadsdk.dj.ycx.jc> fby;
    private final Runnable htf;

    /* renamed from: jc, reason: collision with root package name */
    private Set<String> f26104jc;

    /* renamed from: ok, reason: collision with root package name */
    private final com.bytedance.sdk.openadsdk.core.settings.ycx f26105ok;
    private boolean pmi;

    /* renamed from: ry, reason: collision with root package name */
    private final fby f26106ry;
    private volatile boolean syc;
    private final lud.zb<Map<String, Integer>> thx;

    /* renamed from: tn, reason: collision with root package name */
    private final lud.zb<Set<String>> f26107tn;
    private int wie;
    private final Set<String> wwx;
    private final AtomicBoolean xkz;
    public static final String ycx = String.join("_", "bus_con_collect", oby.rmf());

    /* renamed from: zb, reason: collision with root package name */
    public static final String f26101zb = String.join("_", "bus_con", oby.rmf(), oby.av(), "timeout");
    public static final String sya = String.join("_", "bus_con", oby.rmf(), oby.av(), "alpha");

    /* renamed from: jw, reason: collision with root package name */
    private static final String f26097jw = oby.tn();

    /* renamed from: dj, reason: collision with root package name */
    public static String f26095dj = b.f42142b;
    public static int lud = -2;

    /* renamed from: lt, reason: collision with root package name */
    public static String f26098lt = "IABTCF_TCString";

    /* renamed from: ea, reason: collision with root package name */
    private static boolean f26096ea = false;

    /* renamed from: uh, reason: collision with root package name */
    private static final ConcurrentLinkedQueue<jc.ycx> f26099uh = new ConcurrentLinkedQueue<>();

    /* renamed from: ul, reason: collision with root package name */
    static final ConcurrentHashMap<String, Integer> f26100ul = new ConcurrentHashMap<>();

    public static final class ycx {
        static final ea ycx = new ea();
    }

    public static String ci() {
        if (oty == null) {
            String strZb = com.bytedance.sdk.openadsdk.core.sya.ycx().zb("settings_host_from_meta", b.f42142b);
            oty = strZb;
            if (strZb == null) {
                oty = b.f42142b;
            }
        }
        return oty;
    }

    private String liq() {
        return this.f26106ry.ycx("force_language", b.f42142b);
    }

    public static boolean row() {
        return f26096ea;
    }

    private Set<String> vy() {
        return (Set) this.f26106ry.ycx("perf_con_applog_send", this.wwx, this.f26107tn);
    }

    public int aeu() {
        return this.f26106ry.ycx(InneractiveMediationNameConsts.MAX, 50);
    }

    public void ag() {
        lud.ycx ycxVarZb = this.f26106ry.zb();
        ycxVarZb.ycx("settings_url", b.f42142b);
        ycxVarZb.ycx();
        rmf(b.f42142b);
    }

    public void aq() {
        syc.zb().removeCallbacks(this.htf);
        syc.zb().postDelayed(this.htf, sg());
    }

    public boolean av() {
        return this.f26106ry.ycx("landingpage_new_style", -1) == 1;
    }

    public boolean bba() {
        int iYcx = this.f26106ry.ycx("privacy_ad_enable", LayoutNode.NotPlacedPlaceOrder);
        if (iYcx == 1) {
            return true;
        }
        if (iYcx == 0) {
            return false;
        }
        int iOty = oby.oty();
        return iOty == 1 || iOty == 2 || iOty == 3;
    }

    public long bh() {
        return this.f26106ry.ycx("last_req_time", 0L);
    }

    public String bhi() {
        return this.f26106ry.ycx("ab_test_param", b.f42142b);
    }

    public boolean bjp() {
        return this.xkz.get();
    }

    public String dc() {
        return this.f26106ry.ycx("policy_url", b.f42142b);
    }

    public com.bytedance.sdk.openadsdk.dj.ycx.jc dfk() {
        return (com.bytedance.sdk.openadsdk.dj.ycx.jc) this.f26106ry.ycx("perf_con_track_url_strategy", com.bytedance.sdk.openadsdk.dj.ycx.jc.ycx, this.fby);
    }

    public String dj() {
        return this.f26106ry.ycx("aes_key", b.f42142b);
    }

    public int dqs() {
        int iYcx = this.f26106ry.ycx("perf_con_webview_cache_count", 0);
        if (iYcx < 0) {
            return 0;
        }
        return iYcx;
    }

    public boolean duz() {
        return this.f26106ry.ycx("bus_con_sec_type", LayoutNode.NotPlacedPlaceOrder) != 0;
    }

    public int dv() {
        return this.f26106ry.ycx(f26101zb, 10000);
    }

    public String dwi() {
        return this.f26106ry.ycx("ads_url", b.f42142b);
    }

    public boolean dy() {
        return this.f26106ry.ycx("support_gzip", false);
    }

    public int ea() {
        return this.f26106ry.ycx("perf_con_drawable_code", 0);
    }

    public void fby() {
        this.f26106ry.zb().ycx("ab_test_param").ycx();
    }

    public int giw() {
        return this.f26106ry.ycx("blank_detect_rate", 30);
    }

    public int hf() {
        return this.f26106ry.ycx("bus_con_slide_num", 2);
    }

    public boolean hpv() {
        return this.f26106ry.ycx("global_rate", 1.0f) == 1.0f;
    }

    public int htf() {
        return this.f26106ry.ycx("bus_con_behavior_count", 300);
    }

    public void ifb() {
        String strLiq = liq();
        if (TextUtils.isEmpty(strLiq)) {
            return;
        }
        if (strLiq.equals("zh-Hant")) {
            ok.ycx(pmi.ycx(), "zh", "tw");
        } else {
            ok.ycx(pmi.ycx(), strLiq, null);
        }
        try {
            TTAdDislikeToast.onResourceUpdated();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiBF7VnwJM=", "b9oekQiPbNOUQ9lanw==", "SOs5swyuasKsS9lamRCnLW/hH5AQs3zVg0//WIAB", 777);
            htf.sya("TTAD.SdkSettings", th2.getMessage());
        }
    }

    public boolean iq() {
        return this.f26106ry.ycx("read_video_from_cache", 1) == 1;
    }

    public int jc() {
        return this.f26106ry.ycx("splash_video_load_strategy", 0);
    }

    public boolean jp() {
        return this.f26106ry.ycx("bus_con_video_keep_screen_on", 1) == 1;
    }

    public String jw() {
        return this.f26106ry.ycx("ab_test_version", b.f42142b);
    }

    public int kgy() {
        int iYcx = this.f26106ry.ycx("fetch_tpl_second", 0);
        if (iYcx <= 0) {
            return 0;
        }
        return iYcx;
    }

    public int kt() {
        return this.f26106ry.ycx("perf_con_sync_gaid", 0);
    }

    public JSONObject lt() {
        return (JSONObject) this.f26106ry.ycx("digest", null, lud.ycx);
    }

    public int lud() {
        return this.f26106ry.ycx("max_tpl_cnts", 100);
    }

    public String lv() {
        return this.f26106ry.ycx("privacy_app_reg", b.f42142b);
    }

    public int mp() {
        int iYcx = this.f26106ry.ycx("privacy_personalized_ad", LayoutNode.NotPlacedPlaceOrder);
        if (iYcx != Integer.MAX_VALUE) {
            return iYcx;
        }
        int iOty = oby.oty();
        if (iOty == 1 || iOty == 2) {
            return 2;
        }
        return iOty != 3 ? 0 : 1;
    }

    public Set<String> nc() {
        return (Set) this.f26106ry.ycx("token_adx_ids", Collections.EMPTY_SET, lud.f26122zb);
    }

    public String nji() {
        return this.f26106ry.ycx("app_log_url", b.f42142b);
    }

    public JSONObject nzi() {
        return (JSONObject) this.f26106ry.ycx("perf_con_thread_pool_config", new JSONObject(), this.f26102dv);
    }

    public String oby() {
        return this.f26106ry.ycx("settings_url", b.f42142b);
    }

    public Set<String> ok() {
        return vy();
    }

    public float oty() {
        return this.f26106ry.ycx(sya, 1.0f);
    }

    public String pg() {
        return this.f26106ry.ycx("target_region", b.f42142b);
    }

    public boolean pmi() {
        return this.f26106ry.ycx("bus_con_adshow_check_enable", true);
    }

    public int py() {
        int iYcx = this.f26106ry.ycx("bus_con_auto_click_delay", 3000);
        if (iYcx <= 0) {
            return 3000;
        }
        return iYcx;
    }

    public Set<String> qn() {
        fby fbyVar = this.f26106ry;
        Set<String> set = Collections.EMPTY_SET;
        Set<String> set2 = (Set) fbyVar.ycx("dual_event_url_backup", set, lud.f26122zb);
        return (set2 == null || set2.size() == 0) ? set : set2;
    }

    public Set<String> qt() {
        return (Set) this.f26106ry.ycx("privacy_fields_allowed", Collections.EMPTY_SET, lud.f26122zb);
    }

    public String rl() {
        return this.f26106ry.ycx("dc", b.f42142b);
    }

    public long rmf() {
        return this.f26106ry.ycx("duration", h.f42227c);
    }

    public int rmy() {
        int iYcx = this.f26106ry.ycx("fetch_tpl_timeout_ctrl", 3000);
        if (iYcx <= 0) {
            return 3000;
        }
        return iYcx;
    }

    public int ry() {
        vy();
        return this.wie;
    }

    public long sg() {
        long jYcx = this.f26106ry.ycx("req_inter_min", TTAdConstant.AD_MAX_EVENT_TIME);
        return (jYcx < 0 || jYcx > 86400000) ? TTAdConstant.AD_MAX_EVENT_TIME : jYcx;
    }

    public boolean syc() {
        return this.f26106ry.ycx("allow_blind_mode_request_ad", false);
    }

    public int sz() {
        return this.f26106ry.ycx("ivrv_downward", 0);
    }

    public boolean te() {
        return this.f26106ry.ycx("token_enable", 0) == 1;
    }

    public String thx() {
        return this.f26106ry.ycx("bus_con_check_clz", b.f42142b);
    }

    public boolean tn() {
        return this.f26106ry.ycx(ycx, false);
    }

    public int tru() {
        return this.f26106ry.ycx("loadedCallbackOpportunity", 0);
    }

    public long tx() {
        return this.f26106ry.ycx("perf_con_adlog_expire_time", 0L);
    }

    public boolean uf() {
        return this.f26106ry.ycx("perf_con_apm_native", LayoutNode.NotPlacedPlaceOrder) == 1;
    }

    public boolean ufy() {
        return this.f26106ry.ycx("perf_con_is_new_net_thread", 0) == 1;
    }

    public String uh() {
        return this.f26106ry.ycx("bus_con_express_host", "https://lf-static.tiktokpangle-cdn-us.com/obj/ad-pattern-tx/");
    }

    public boolean ui() {
        return this.syc;
    }

    public String ujb() {
        return this.f26106ry.ycx("dual_event_url", (String) null);
    }

    public long ul() {
        return this.f26106ry.ycx("data_time", 0L);
    }

    public int ur() {
        int iYcx = this.f26106ry.ycx("perf_con_webview_cache_count_v3", 0);
        if (iYcx < 0) {
            return 0;
        }
        return iYcx;
    }

    public boolean uu() {
        if (com.bytedance.sdk.component.adexpress.dj.zb.ycx(pmi.ycx())) {
            return this.f26106ry.ycx("support_rtl", false);
        }
        return false;
    }

    public boolean uz() {
        return this.f26106ry.ycx("privacy_debug_unlock", 1) != 0;
    }

    public Set<String> vbt() {
        fby fbyVar = this.f26106ry;
        Set<String> set = Collections.EMPTY_SET;
        Set<String> set2 = (Set) fbyVar.ycx("ads_url_backup", set, lud.f26122zb);
        return (set2 == null || set2.size() == 0) ? set : set2;
    }

    public Set<String> vyl() {
        return (Set) this.f26106ry.ycx("perf_con_drop2rt_skip_label_list", Collections.EMPTY_SET, lud.f26122zb);
    }

    public boolean wie() {
        return this.f26106ry.ycx("ad_revenue_enable", true);
    }

    public boolean wk() {
        return this.f26106ry.ycx("perf_con_adlog_turn_off_retry_ad", 0) == 1;
    }

    public String[] wr() {
        try {
            Set<String> set = this.f26104jc;
            if (set == null || set.size() == 0) {
                JSONArray jSONArray = new JSONArray(this.f26106ry.ycx("gecko_hosts", (String) null));
                if (jSONArray.length() != 0) {
                    for (int i5 = 0; i5 < jSONArray.length(); i5++) {
                        this.f26104jc.add(jSONArray.getString(i5));
                    }
                }
                Set<String> setYcx = fby.ycx(this.f26104jc);
                this.f26104jc = setYcx;
                if (setYcx != null) {
                    if (setYcx.size() == 0) {
                    }
                }
                return null;
            }
            return (String[]) this.f26104jc.toArray(new String[0]);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiBF7VnwJM=", "b9oekQiPbNOUQ9lanw==", "XOs5sga/YsioRcRJnw==", 1301);
            return null;
        }
    }

    public boolean wwx() {
        return this.f26106ry.ycx("bus_con_url_check", 1) != 0;
    }

    public boolean xf() {
        int iYcx = this.f26105ok.ycx("perf_con_apm", 100);
        if (iYcx == 0) {
            return false;
        }
        return iYcx < 0 || iYcx >= 100 || iYcx > ((int) (Math.random() * 100.0d));
    }

    public int xkz() {
        vy();
        return this.f26103dy;
    }

    public String xym() {
        return this.f26106ry.ycx("dc", "TX");
    }

    public lt xz() {
        return (lt) this.f26106ry.ycx("insert_js_config", lt.ycx, new lud.zb<lt>() { // from class: com.bytedance.sdk.openadsdk.core.settings.ea.5
            @Override // com.bytedance.sdk.openadsdk.core.settings.lud.zb
            /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
            public lt zb(String str) {
                return new lt(str);
            }
        });
    }

    public String yi() {
        return this.f26106ry.ycx("dyn_draw_engine_url", f26097jw);
    }

    public boolean yzp() {
        return this.f26106ry.sya();
    }

    public boolean zk() {
        return this.f26106ry.ycx("perf_con_adlog_turn_off_retry_stats", 0) == 1;
    }

    public int zr() {
        return this.f26106ry.ycx("vbtt", 5);
    }

    private ea() {
        this.f26104jc = Collections.synchronizedSet(new HashSet());
        this.f26105ok = new com.bytedance.sdk.openadsdk.core.settings.ycx();
        this.f26106ry = new fby(new jc.ycx() { // from class: com.bytedance.sdk.openadsdk.core.settings.ea.1
            @Override // com.bytedance.sdk.openadsdk.core.settings.jc.ycx
            public void ycx() {
                jc.ycx[] ycxVarArr;
                boolean unused = ea.f26096ea = true;
                com.bytedance.sdk.openadsdk.core.ea.zb.ycx().xkz();
                if (ea.f26099uh == null || ea.f26099uh.size() == 0 || (ycxVarArr = (jc.ycx[]) ea.f26099uh.toArray()) == null) {
                    return;
                }
                for (jc.ycx ycxVar : ycxVarArr) {
                    ycxVar.ycx();
                }
            }

            @Override // com.bytedance.sdk.openadsdk.core.settings.jc.ycx
            public void zb() {
                com.bytedance.sdk.openadsdk.core.ea.zb.ycx().syc();
                if (ea.f26099uh == null || ea.f26099uh.isEmpty()) {
                    return;
                }
                Iterator it = ea.f26099uh.iterator();
                while (it.hasNext()) {
                    ((jc.ycx) it.next()).zb();
                }
            }
        });
        this.xkz = new AtomicBoolean(false);
        this.syc = false;
        this.f26103dy = 5000;
        this.wie = 10;
        this.htf = new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.settings.ea.7
            @Override // java.lang.Runnable
            public void run() {
                ea.this.ycx(2, false);
                ea.this.aq();
            }
        };
        this.thx = new lud.zb<Map<String, Integer>>() { // from class: com.bytedance.sdk.openadsdk.core.settings.ea.8
            @Override // com.bytedance.sdk.openadsdk.core.settings.lud.zb
            /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
            public Map<String, Integer> zb(String str) {
                if (TextUtils.isEmpty(str)) {
                    return null;
                }
                try {
                    JSONObject jSONObject = new JSONObject(str);
                    HashMap map = new HashMap(jSONObject.length());
                    Iterator<String> itKeys = jSONObject.keys();
                    while (itKeys.hasNext()) {
                        String next = itKeys.next();
                        if (!TextUtils.isEmpty(next)) {
                            int iOptInt = jSONObject.optInt(next, 100);
                            if (iOptInt < 0 || iOptInt > 100) {
                                map.put(next, 100);
                            } else {
                                map.put(next, Integer.valueOf(iOptInt));
                            }
                        }
                    }
                    return map;
                } catch (Exception e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiBF7VnwJM=", "b9oekQiPbNOUQ9lan1X3", "WPwolBe5", 1536);
                    htf.sya(c1.s(e3, new StringBuilder("get applog rate from sp failed:")), new Object[0]);
                    return null;
                }
            }
        };
        this.wwx = new HashSet();
        this.f26107tn = new lud.zb<Set<String>>() { // from class: com.bytedance.sdk.openadsdk.core.settings.ea.9
            @Override // com.bytedance.sdk.openadsdk.core.settings.lud.zb
            /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
            public Set<String> zb(String str) throws JSONException {
                HashSet hashSet = new HashSet();
                if (!TextUtils.isEmpty(str)) {
                    try {
                        JSONObject jSONObject = new JSONObject(str);
                        int iOptInt = jSONObject.optInt("applog_count");
                        if (iOptInt >= 2 && iOptInt <= 100) {
                            ea.this.wie = iOptInt;
                        }
                        int iOptInt2 = jSONObject.optInt("applog_interval");
                        if (iOptInt2 >= 100 && iOptInt2 <= 30000) {
                            ea.this.f26103dy = iOptInt2;
                        }
                        JSONArray jSONArray = jSONObject.getJSONArray("core_label_arr");
                        if (jSONArray != null) {
                            for (int i5 = 0; i5 < jSONArray.length(); i5++) {
                                String string = jSONArray.getString(i5);
                                if (!TextUtils.isEmpty(string)) {
                                    hashSet.add(string);
                                }
                            }
                        }
                    } catch (JSONException e3) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiBF7VnwJM=", "b9oekQiPbNOUQ9lan1X4", "WPwolBe5", 1570);
                        Log.i("TTAD.SdkSettings", e3.getMessage());
                    }
                }
                return hashSet.size() == 0 ? new HashSet(Arrays.asList(TTEDPEventConstants.EDP_EVENT_NAME_CLICK, "show", "insight_log", "mrc_show")) : hashSet;
            }
        };
        this.f26102dv = new lud.zb<JSONObject>() { // from class: com.bytedance.sdk.openadsdk.core.settings.ea.10
            @Override // com.bytedance.sdk.openadsdk.core.settings.lud.zb
            /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
            public JSONObject zb(String str) {
                JSONObject jSONObject;
                try {
                    jSONObject = new JSONObject(str);
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiBF7VnwJM=", "b9oekQiPbNOUQ9lan1X5", "WPwolBe5", 1636);
                    htf.sya("TTAD.SdkSettings", th2.getMessage());
                    jSONObject = null;
                }
                return jSONObject == null ? new JSONObject() : jSONObject;
            }
        };
        this.fby = new lud.zb<com.bytedance.sdk.openadsdk.dj.ycx.jc>() { // from class: com.bytedance.sdk.openadsdk.core.settings.ea.2
            @Override // com.bytedance.sdk.openadsdk.core.settings.lud.zb
            /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
            public com.bytedance.sdk.openadsdk.dj.ycx.jc zb(String str) {
                com.bytedance.sdk.openadsdk.dj.ycx.jc jcVar = new com.bytedance.sdk.openadsdk.dj.ycx.jc();
                try {
                    JSONObject jSONObject = new JSONObject(str);
                    jcVar.ycx(jSONObject.optInt("enable_strategy", 0) == 1);
                    jcVar.ycx(ycx(jSONObject.optJSONObject(CarrierConfigurator.APN_TYPE)));
                    JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject("adid_configs");
                    if (jSONObjectOptJSONObject != null) {
                        Iterator<String> itKeys = jSONObjectOptJSONObject.keys();
                        while (itKeys.hasNext()) {
                            String next = itKeys.next();
                            jcVar.ycx(next, ycx(jSONObjectOptJSONObject.getJSONObject(next)));
                        }
                    }
                    return jcVar;
                } catch (Exception e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiBF7VnwJM=", "b9oekQiPbNOUQ9lan1XxeA==", "WPwolBe5", 1724);
                    return jcVar;
                }
            }

            private jc.ycx ycx(JSONObject jSONObject) {
                if (jSONObject != null) {
                    return new jc.ycx(jSONObject.optInt("retry_times", -1), jSONObject.optInt("time_interval", -1));
                }
                return null;
            }
        };
    }

    public static void rmf(String str) {
        if (str == null) {
            str = b.f42142b;
        }
        String strCi = ci();
        if (strCi == null || !strCi.equals(str)) {
            com.bytedance.sdk.openadsdk.core.sya.ycx().ycx("settings_host_from_meta", str);
            oty = str;
            zb().ycx(8, true);
        }
    }

    private static SharedPreferences sya(Context context) {
        try {
            return PreferenceManager.getDefaultSharedPreferences(context);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiBF7VnwJM=", "b9oekQiPbNOUQ9lanw==", "XOs5sQa6aNKMXuRVjQOlLGv8KJMGrmzJg0/Ebo0XpQ==", PglCryptUtils.BASE64_FAILED);
            return null;
        }
    }

    public boolean av(String str) {
        Set<String> setNc;
        if (TextUtils.isEmpty(str) || (setNc = nc()) == null || setNc.size() == 0) {
            return false;
        }
        return setNc.contains(str);
    }

    public boolean bhi(String str) {
        Set set = (Set) this.f26106ry.ycx("privacy_fields_allowed", Collections.EMPTY_SET, lud.f26122zb);
        if (!set.isEmpty()) {
            return set.contains(str);
        }
        int iOty = oby.oty();
        if (iOty != 1) {
            if (iOty != 2 && iOty != 3) {
                return false;
            }
            if (!"mcc".equals(str) && !"mnc".equals(str)) {
                return false;
            }
        }
        return true;
    }

    public boolean dj(String str) {
        return tru(str).bhi;
    }

    public int dv(String str) {
        return tru(str).tru;
    }

    public int dy(String str) {
        return tru(str).f26129jc;
    }

    public int ea(String str) {
        return tru(str).f26127ea;
    }

    public boolean fby(String str) {
        return str == null || tru(str).xkz == 1;
    }

    public boolean hf(String str) {
        return pmi.dj().tru(str).syc == 1;
    }

    public int htf(String str) {
        return tru(str).htf;
    }

    public int jc(String str) {
        if (str == null) {
            return 5000;
        }
        return tru(str).f26126dy;
    }

    public int jw(String str) {
        if (str == null) {
            return 1;
        }
        return tru(str).xkz;
    }

    public boolean lt(String str) {
        return tru(str).f26136ul == 1;
    }

    public boolean lud(String str) {
        int i5 = tru(str).lud;
        return i5 != 1 ? i5 == 2 && com.bytedance.sdk.component.utils.pmi.sya(pmi.ycx()) != 0 : com.bytedance.sdk.component.utils.pmi.dj(pmi.ycx());
    }

    public int ok(String str) {
        return tru(str).f26132ok;
    }

    public boolean oty(String str) {
        return tru(str).rmf;
    }

    public boolean pmi(String str) {
        return str == null || DeviceUtils.jc(pmi.ycx()) == 0 || tru(str).f26133ry == 1;
    }

    public boolean syc(String str) {
        return xkz(str) != 1;
    }

    public boolean thx(String str) {
        return tru(str).thx;
    }

    public int tn(String str) {
        return tru(str).f26128hf;
    }

    public zb tru(String str) {
        return sya.ycx(str);
    }

    public JSONObject uh(String str) throws JSONException {
        JSONObject jSONObject = null;
        try {
            JSONObject jSONObject2 = new JSONObject(this.f26106ry.ycx("core_settings", b.f42142b));
            try {
                jSONObject2.put("ad_slot_setting", tru(str).f26137xz);
                return jSONObject2;
            } catch (JSONException e3) {
                e = e3;
                jSONObject = jSONObject2;
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiBF7VnwJM=", "b9oekQiPbNOUQ9lanw==", "XOs5tgyubPSFXsNUghaKO1TgApcJ", 1041);
                htf.sya("TTAD.SdkSettings", "getCoreSettingJsonObj", e.getMessage());
                return jSONObject;
            }
        } catch (JSONException e11) {
            e = e11;
        }
    }

    public int ul(String str) {
        return tru(str).pmi;
    }

    public boolean wie(String str) {
        return tru(str).wwx == 0;
    }

    public int wwx(String str) {
        return tru(str).oty;
    }

    public boolean ry(String str) {
        try {
            return tru(str).f26134tn != null;
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiBF7VnwJM=", "b9oekQiPbNOUQ9lanw==", "U+87kDesZe6EWQ==", 888);
            return false;
        }
    }

    public int xkz(String str) {
        return tru(String.valueOf(str)).fby;
    }

    public void ycx() {
        try {
            sya.zb();
            this.f26106ry.dj();
            this.f26105ok.dj();
            Context contextYcx = pmi.ycx();
            File file = new File(new File(contextYcx.getDataDir(), "shared_prefs"), "tt_sdk_settings.xml");
            if (file.exists() && file.isFile()) {
                contextYcx.deleteSharedPreferences(file.getName().replace(".xml", b.f42142b));
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiBF7VnwJM=", "b9oekQiPbNOUQ9lanw==", "WOIolBGdZcujS9RViQ==", 453);
        }
    }

    public static String zb(Context context) {
        SharedPreferences sharedPreferencesSya;
        return (context == null || (sharedPreferencesSya = sya(context)) == null) ? b.f42142b : sharedPreferencesSya.getString(f26098lt, b.f42142b);
    }

    public synchronized void sya() {
        SystemClock.elapsedRealtime();
        boolean z11 = this.syc;
        this.f26105ok.ycx(this.syc);
        this.f26106ry.ycx(this.syc);
        sya.ycx(!z11);
        this.syc = true;
        SystemClock.elapsedRealtime();
        if (!z11) {
            syc.zb().postDelayed(new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.settings.ea.3
                @Override // java.lang.Runnable
                public void run() {
                    ea.this.ycx(1, com.bytedance.sdk.openadsdk.core.ea.zb.ycx().ul() || com.bytedance.sdk.openadsdk.core.ea.zb.ycx().jc());
                    ea.this.aq();
                }
            }, 1000L);
        }
    }

    public static ea zb() {
        return ycx.ycx;
    }

    public int zb(String str) {
        Integer num;
        Map map = (Map) this.f26106ry.ycx("perf_con_applog_rate", null, this.thx);
        if (map == null || (num = (Integer) map.get(str)) == null || num.intValue() < 0 || num.intValue() > 100) {
            return 100;
        }
        return num.intValue();
    }

    public int zb(int i5) {
        return tru(String.valueOf(i5)).f26138zb;
    }

    public boolean sya(String str) {
        return tru(str).sya == 1;
    }

    public static int ycx(Context context) {
        if (context != null) {
            try {
                SharedPreferences sharedPreferencesSya = sya(context);
                if (sharedPreferencesSya != null) {
                    int i5 = sharedPreferencesSya.getInt("IABTCF_gdprApplies", Integer.MIN_VALUE);
                    if (i5 != Integer.MIN_VALUE) {
                        return i5;
                    }
                    return (sharedPreferencesSya.getInt("IABTCF_CmpSdkID", Integer.MIN_VALUE) == Integer.MIN_VALUE && sharedPreferencesSya.getInt("IABTCF_CmpSdkVersion", Integer.MIN_VALUE) == Integer.MIN_VALUE) ? -2 : -1;
                }
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiBF7VnwJM=", "b9oekQiPbNOUQ9lanw==", "XOs5sieMW+aQWttUiQI=", 483);
            }
        }
        return -2;
    }

    public int sya(int i5) {
        return tru(String.valueOf(i5)).f26130jw;
    }

    public void ycx(JSONObject jSONObject, lud.ycx ycxVar) {
        if (jSONObject == null || !jSONObject.has("dyn_draw_engine_url")) {
            return;
        }
        fby fbyVar = this.f26106ry;
        String str = f26097jw;
        String strYcx = fbyVar.ycx("dyn_draw_engine_url", str);
        final String strOptString = jSONObject.optString("dyn_draw_engine_url", str);
        if (!TextUtils.isEmpty(strYcx) && !TextUtils.isEmpty(strOptString) && !strOptString.equals(strYcx)) {
            syc.zb().postDelayed(new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.settings.ea.4
                @Override // java.lang.Runnable
                public void run() {
                    if (TextUtils.equals(ea.this.f26106ry.ycx("dyn_draw_engine_url", ea.f26097jw), strOptString)) {
                        com.bytedance.sdk.component.adexpress.ycx.zb.lud.zb().sya();
                    }
                }
            }, 5000L);
        }
        ycxVar.ycx("dyn_draw_engine_url", strOptString);
    }

    public int ycx(String str) {
        if (str == null) {
            return 0;
        }
        return pmi.dj().tru(str).f26135uh;
    }

    public int ycx(int i5) {
        return tru(String.valueOf(i5)).aeu;
    }

    public void ycx(long j11) {
        this.f26106ry.zb().ycx("last_req_time", j11).ycx();
    }

    public void ycx(@TTSdkSettings.FETCH_REQUEST_SOURCE final int i5, boolean z11) {
        if (com.bytedance.sdk.openadsdk.core.ea.zb.ycx().dj()) {
            return;
        }
        if (!syc.lud() && i5 != 1 && i5 != 2) {
            if (z11) {
                this.pmi = true;
                return;
            }
            return;
        }
        try {
            if (TextUtils.isEmpty(com.bytedance.sdk.openadsdk.core.jc.zb().dj())) {
                return;
            }
            if (this.pmi) {
                this.pmi = false;
                if (!z11) {
                    z11 = true;
                }
            }
            long jBh = bh();
            long jCurrentTimeMillis = System.currentTimeMillis();
            long jSg = sg();
            long j11 = jCurrentTimeMillis - jBh;
            if ((z11 || j11 >= jSg) && this.xkz.compareAndSet(false, true)) {
                yzp.sya((Runnable) new com.bytedance.sdk.component.fby.zb.sya("setting_req") { // from class: com.bytedance.sdk.openadsdk.core.settings.ea.6
                    @Override // java.lang.Runnable
                    public void run() {
                        com.bytedance.sdk.openadsdk.core.ea.zb.ycx().ycx(new com.bytedance.sdk.openadsdk.core.ea.dj() { // from class: com.bytedance.sdk.openadsdk.core.settings.ea.6.1
                            @Override // com.bytedance.sdk.openadsdk.core.ea.dj
                            public void ycx(boolean z12) {
                                if (!z12) {
                                    ea.this.xkz.set(false);
                                } else {
                                    ea eaVar = ea.this;
                                    new jw(eaVar, eaVar.f26106ry, ea.this.f26105ok).run();
                                }
                            }
                        }, i5 == 6);
                    }
                });
                syc.zb().removeCallbacks(this.htf);
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiBF7VnwJM=", "b9oekQiPbNOUQ9lanw==", "Xes5lguObMqPXtJuiBqTLU/6JJsErw==", 1418);
            ApmHelper.reportCustomError("settings request error", "settings", th2);
        }
    }

    @Override // com.bytedance.sdk.openadsdk.core.settings.jw.ycx
    public void ycx(boolean z11) {
        Set<String> setVbt;
        this.xkz.set(false);
        aq();
        if (z11) {
            HashMap map = new HashMap();
            Set<String> setQt = qt();
            if (setQt != null && !setQt.isEmpty()) {
                map.put(PglSSConfig.CUSTOMINFO_KEY_ALLOWED_FIELDS, setQt);
            }
            String strPmi = oby.pmi();
            if (!TextUtils.isEmpty(strPmi)) {
                map.put(PglSSConfig.CUSTOMINFO_KEY_TRANSFER_HOST, strPmi);
            }
            if (com.bytedance.sdk.openadsdk.utils.zb.zb() && (setVbt = zb().vbt()) != null && !setVbt.isEmpty()) {
                map.put(PglSSConfig.CUSTOMINFO_KEY_ADS_URL_BACKUP, setVbt);
            } else {
                map.put(PglSSConfig.CUSTOMINFO_KEY_ADS_URL_BACKUP, new HashSet());
            }
            map.put(PglSSConfig.CUSTOMINFO_KEY_TARGET_IDC, pg());
            com.bytedance.sdk.openadsdk.core.ok.sya.ycx(map);
        }
    }

    public static void ycx(jc.ycx ycxVar) {
        ConcurrentLinkedQueue<jc.ycx> concurrentLinkedQueue = f26099uh;
        if (concurrentLinkedQueue.contains(ycxVar)) {
            return;
        }
        concurrentLinkedQueue.add(ycxVar);
    }
}
