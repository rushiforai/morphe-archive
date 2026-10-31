package com.bytedance.sdk.openadsdk.dv;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.HandlerThread;
import android.text.TextUtils;
import b.c9;
import b.u4;
import com.bytedance.sdk.component.embedapplog.PangleEncryptConstant;
import com.bytedance.sdk.component.embedapplog.PangleEncryptManager;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.bytedance.sdk.component.utils.fby;
import com.bytedance.sdk.component.utils.hf;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.component.utils.thx;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.bytedance.sdk.openadsdk.core.dv;
import com.bytedance.sdk.openadsdk.core.jc;
import com.bytedance.sdk.openadsdk.core.model.av;
import com.bytedance.sdk.openadsdk.core.oty;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.core.settings.ea;
import com.bytedance.sdk.openadsdk.core.settings.jw;
import com.bytedance.sdk.openadsdk.core.syc;
import com.bytedance.sdk.openadsdk.dv.zb;
import com.bytedance.sdk.openadsdk.utils.oby;
import com.bytedance.sdk.openadsdk.utils.tn;
import com.bytedance.sdk.openadsdk.utils.yzp;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.pgl.ssdk.ces.out.PglSSConfig;
import com.vungle.ads.internal.protos.Sdk;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class lud {

    /* renamed from: dj, reason: collision with root package name */
    private static volatile dj f26776dj;
    private static final AtomicBoolean sya = new AtomicBoolean(false);
    public static final ConcurrentHashMap<String, Object> ycx = new ConcurrentHashMap<>();

    /* renamed from: zb, reason: collision with root package name */
    public static String f26777zb;

    public static boolean dj() {
        return sya() && ycx("ad_load_and_render_opt", "thread_switch_opt", 0) == 1;
    }

    public static boolean ea() {
        return ycx("iv_rv_top_bar_listen_new", 0) == 1;
    }

    public static boolean fby() {
        return ycx("jsb_opt_enable", 0) == 1;
    }

    public static boolean jc() {
        return ycx("iv_rv_listen_new_arch", 0) == 1;
    }

    public static boolean jw() {
        return ycx("no_call_close", 0) == 1;
    }

    public static int lt() {
        if (sya()) {
            return ycx("ad_load_and_render_opt", "webview_preload_cache", 0);
        }
        return 0;
    }

    public static boolean lud() {
        return sya() && ycx("ad_load_and_render_opt", "sync_barrier_switch_opt", 0) == 1;
    }

    private static dj ok() {
        return ycx(pmi.ycx(), jc.zb().dj());
    }

    public static boolean sya() {
        return ycx("ad_load_and_render_opt", "enable", 0) == 1;
    }

    public static int ul() {
        if (sya()) {
            return ycx("ad_load_and_render_opt", "webview_preload_cache_v3", 0);
        }
        return 0;
    }

    public static dj ycx(final Context context, final String str) {
        if (f26776dj == null) {
            synchronized (lud.class) {
                try {
                    if (f26776dj == null) {
                        try {
                            dj djVar = new dj(new lt() { // from class: com.bytedance.sdk.openadsdk.dv.lud.1
                                @Override // com.bytedance.sdk.openadsdk.dv.lt
                                public Handler dj() {
                                    return syc.zb();
                                }

                                @Override // com.bytedance.sdk.openadsdk.dv.lt
                                public boolean fby() {
                                    return com.bytedance.sdk.openadsdk.core.ea.zb.ycx().lud();
                                }

                                @Override // com.bytedance.sdk.openadsdk.dv.lt
                                public JSONObject lt() {
                                    try {
                                        JSONObject jSONObjectYcx = jw.ycx(hf.ycx(pmi.ycx(), 0L));
                                        if (!jSONObjectYcx.has("app_id")) {
                                            if (!TextUtils.isEmpty(str)) {
                                                jSONObjectYcx.put("app_id", str);
                                            } else {
                                                if (TextUtils.isEmpty(jc.zb().dj())) {
                                                    return null;
                                                }
                                                jSONObjectYcx.put("app_id", jc.zb().dj());
                                            }
                                        }
                                        return dv.ycx(PangleEncryptConstant.CryptDataScene.STRATEGY, jSONObjectYcx);
                                    } catch (Throwable th2) {
                                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE58FsilP6yqM", "aPo/lBe5bt6jT9lJiQOVPFLiPtFS", "XOs5pwatfMKTXvVSiAg=", Sdk.SDKError.Reason.EMPTY_TPAT_ERROR_VALUE);
                                        htf.sya("StrategyUtils", th2.getMessage());
                                        return null;
                                    }
                                }

                                @Override // com.bytedance.sdk.openadsdk.dv.lt
                                public String lud() {
                                    String strYcx = oby.ycx("/api/ad/union/sdk/strategies/adn", false, true);
                                    lud.f26777zb = strYcx;
                                    return strYcx;
                                }

                                @Override // com.bytedance.sdk.openadsdk.dv.lt
                                public String sya() {
                                    if (thx.ycx(zb())) {
                                        return "pag_adn_strategy_center";
                                    }
                                    return "pag_adn_strategy_center_" + thx.sya(zb());
                                }

                                @Override // com.bytedance.sdk.openadsdk.dv.lt
                                public Map<String, String> ul() throws JSONException {
                                    HashMap map = new HashMap();
                                    map.put("User-Agent", oby.dj());
                                    String strZb = com.bytedance.sdk.openadsdk.uh.dj.ycx.zb("ttopenadsdk", PglSSConfig.CUSTOMINFO_KEY_IPV6, b.f42142b);
                                    if (!strZb.isEmpty()) {
                                        JSONObject jSONObject = new JSONObject();
                                        try {
                                            jSONObject.put("ipv6", strZb);
                                        } catch (JSONException e3) {
                                            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE58FsilP6yqM", "aPo/lBe5bt6jT9lJiQOVPFLiPtFS", "XOs5vQa9bcKSWQ==", 144);
                                        }
                                        JSONObject jSONObjectEncryptType4 = PangleEncryptManager.encryptType4(jSONObject, new oty(PangleEncryptConstant.CryptDataScene.UNKNOWN));
                                        if (jSONObjectEncryptType4 != null) {
                                            map.put("transfer-param", jSONObjectEncryptType4.optString(PglCryptUtils.KEY_MESSAGE));
                                            if (jSONObjectEncryptType4.optInt("cypher") == 4) {
                                                map.put("cypher", "4");
                                            } else {
                                                map.put("cypher", "3");
                                            }
                                        }
                                    }
                                    try {
                                        map.put("x-pangle-target-idc", ea.zb().pg());
                                    } catch (Throwable th2) {
                                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE58FsilP6yqM", "aPo/lBe5bt6jT9lJiQOVPFLiPtFS", "XOs5vQa9bcKSWQ==", 160);
                                    }
                                    return map;
                                }

                                @Override // com.bytedance.sdk.openadsdk.dv.lt
                                public ExecutorService ycx() {
                                    return yzp.lud();
                                }

                                @Override // com.bytedance.sdk.openadsdk.dv.lt
                                public Context zb() {
                                    Context context2 = context;
                                    return context2 != null ? context2 : pmi.ycx();
                                }

                                @Override // com.bytedance.sdk.openadsdk.dv.lt
                                public JSONObject ycx(JSONObject jSONObject) {
                                    String strYcx = dv.ycx(jSONObject.optInt("cypher", -1), jSONObject.optString(PglCryptUtils.KEY_MESSAGE));
                                    if (!TextUtils.isEmpty(strYcx)) {
                                        try {
                                            return new JSONObject(strYcx);
                                        } catch (Throwable th2) {
                                            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE58FsilP6yqM", "aPo/lBe5bt6jT9lJiQOVPFLiPtFS", "X+sumge5", 175);
                                        }
                                    }
                                    return jSONObject;
                                }

                                @Override // com.bytedance.sdk.openadsdk.dv.lt
                                public HandlerThread ycx(String str2, int i5) {
                                    return fby.ycx(str2, i5);
                                }
                            });
                            f26776dj = djVar;
                            djVar.ycx(new ycx() { // from class: com.bytedance.sdk.openadsdk.dv.lud.2
                                @Override // com.bytedance.sdk.openadsdk.dv.ycx
                                public void ycx() {
                                    com.bytedance.sdk.openadsdk.pmi.sya.ycx(new com.bytedance.sdk.openadsdk.pmi.dj() { // from class: com.bytedance.sdk.openadsdk.dv.lud.2.1
                                        @Override // com.bytedance.sdk.openadsdk.pmi.dj
                                        public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                                            return c9.h("strategy_fetch");
                                        }
                                    });
                                }

                                @Override // com.bytedance.sdk.openadsdk.dv.ycx
                                public void zb() {
                                    com.bytedance.sdk.openadsdk.pmi.sya.zb(new com.bytedance.sdk.openadsdk.pmi.dj() { // from class: com.bytedance.sdk.openadsdk.dv.lud.2.2
                                        @Override // com.bytedance.sdk.openadsdk.pmi.dj
                                        public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                                            return c9.h("strategy_fetch");
                                        }
                                    });
                                    com.bytedance.sdk.openadsdk.lt.ycx.ycx().zb();
                                    com.bytedance.sdk.openadsdk.wwx.ycx.sya.ycx().zb();
                                    tn.zb();
                                    HashMap map = new HashMap();
                                    String strYcx = lud.ycx(PglSSConfig.CUSTOMINFO_KEY_SEC_CONFIG_STR, b.f42142b);
                                    if (!TextUtils.isEmpty(strYcx)) {
                                        map.put(PglSSConfig.CUSTOMINFO_KEY_SEC_CONFIG_STR, strYcx);
                                    }
                                    com.bytedance.sdk.openadsdk.core.ok.sya.ycx(map);
                                }

                                @Override // com.bytedance.sdk.openadsdk.dv.ycx
                                public void ycx(int i5, String str2) {
                                    com.bytedance.sdk.openadsdk.pmi.sya.sya(new com.bytedance.sdk.openadsdk.pmi.dj() { // from class: com.bytedance.sdk.openadsdk.dv.lud.2.3
                                        @Override // com.bytedance.sdk.openadsdk.pmi.dj
                                        public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                                            return c9.h("strategy_fetch");
                                        }
                                    });
                                    tn.ycx(lud.f26777zb);
                                }
                            });
                        } catch (Throwable th2) {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE58FsilP6yqM", "aPo/lBe5bt6jT9lJiQOVPFLiPg==", "UuAkgTCoe8aUT9BErxSuPF78", 243);
                            th2.getMessage();
                        }
                    }
                } catch (Throwable th3) {
                    throw th3;
                }
            }
        }
        return f26776dj;
    }

    public static void zb() {
        dj djVarOk;
        if (com.bytedance.sdk.openadsdk.core.ea.zb.ycx().lud() || (djVarOk = ok()) == null || sya.getAndSet(true)) {
            return;
        }
        djVarOk.ycx();
    }

    public static String ycx() {
        sya syaVarZb;
        SharedPreferences sharedPreferencesYcx;
        try {
            dj djVarOk = ok();
            if (djVarOk == null || (syaVarZb = djVarOk.zb()) == null || (sharedPreferencesYcx = syaVarZb.ycx()) == null) {
                return null;
            }
            return new JSONObject(sharedPreferencesYcx.getAll()).toString();
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE58FsilP6yqM", "aPo/lBe5bt6jT9lJiQOVPFLiPg==", "XOs5pheuaNOFTc5+gx+mIVw=", 274);
            htf.ycx("StrategyUtils", "getStrategyConfig error", e3);
            return null;
        }
    }

    public static int ycx(String str, int i5) {
        dj djVarOk = ok();
        return djVarOk != null ? djVarOk.ycx(str, i5) : i5;
    }

    public static boolean ycx(String str, boolean z11) {
        dj djVarOk = ok();
        return djVarOk != null ? djVarOk.ycx(str, z11) : z11;
    }

    public static String ycx(String str, String str2) {
        dj djVarOk = ok();
        return djVarOk != null ? djVarOk.ycx(str, str2) : str2;
    }

    public static <T> T ycx(String str, T t6, zb.ycx<T> ycxVar) {
        dj djVarOk = ok();
        return djVarOk != null ? (T) djVarOk.ycx(str, t6, ycxVar) : t6;
    }

    public static int ycx(String str, String str2, int i5) {
        if (!TextUtils.isEmpty(str) && !TextUtils.isEmpty(str2)) {
            String strM = u4.m(str, "_", str2);
            ConcurrentHashMap<String, Object> concurrentHashMap = ycx;
            Object obj = concurrentHashMap.get(strM);
            if (obj != null && (obj instanceof Integer)) {
                return ((Integer) obj).intValue();
            }
            try {
                String strYcx = ok().ycx(str, b.f42142b);
                if (!TextUtils.isEmpty(strYcx)) {
                    int iOptInt = new JSONObject(strYcx).optInt(str2, i5);
                    concurrentHashMap.put(strM, Integer.valueOf(iOptInt));
                    return iOptInt;
                }
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE58FsilP6yqM", "aPo/lBe5bt6jT9lJiQOVPFLiPg==", "XOs5vA2oS96jRdlbhRaKO1Tg", 385);
                htf.sya("StrategyUtils", th2.getMessage());
            }
        }
        return i5;
    }

    public static String ycx(String str, String str2, String str3) {
        if (!TextUtils.isEmpty(str) && !TextUtils.isEmpty(str2)) {
            String strM = u4.m(str, "_", str2);
            ConcurrentHashMap<String, Object> concurrentHashMap = ycx;
            Object obj = concurrentHashMap.get(strM);
            if (obj != null && (obj instanceof String)) {
                return (String) obj;
            }
            try {
                String strYcx = ok().ycx(str, b.f42142b);
                if (!TextUtils.isEmpty(strYcx)) {
                    String strOptString = new JSONObject(strYcx).optString(str2, str3);
                    concurrentHashMap.put(strM, strOptString);
                    return strOptString;
                }
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE58FsilP6yqM", "aPo/lBe5bt6jT9lJiQOVPFLiPg==", "XOs5pheuYMmHaM5+gx+mIVzEPpoN", TTAdConstant.IMAGE_CODE);
                htf.sya("StrategyUtils", th2.getMessage());
            }
        }
        return str3;
    }

    private static int ycx(String str) throws JSONException {
        JSONObject jSONObject = (JSONObject) ycx("rviv_close_button_backup", (Object) null, zb.ycx);
        if (TextUtils.isEmpty(str) || jSONObject == null) {
            return -1;
        }
        try {
            Object obj = jSONObject.get(str);
            if (obj instanceof Number) {
                return ((Number) obj).intValue();
            }
            return -1;
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE58FsilP6yqM", "aPo/lBe5bt6jT9lJiQOVPFLiPg==", "XOs5tg+zesKiS9RWmQGELVfvNA==", 532);
            e3.getMessage();
            return -1;
        }
    }

    public static int ycx(com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar) {
        if (zbVar == null) {
            return -1;
        }
        if (zbVar.f25188sg) {
            com.bytedance.sdk.openadsdk.activity.single.fby fbyVar = zbVar.f25196uu;
            if (fbyVar instanceof com.bytedance.sdk.openadsdk.activity.single.lud) {
                if (((com.bytedance.sdk.openadsdk.activity.single.lud) fbyVar).ycx) {
                    return ycx("one_more_mutlti_endcard");
                }
                com.bytedance.sdk.openadsdk.component.reward.ycx.pmi pmiVar = zbVar.rmf;
                if (pmiVar != null && pmiVar.htf()) {
                    return ycx("one_more_mutlti_double_endcard");
                }
            }
            return -1;
        }
        if (av.zb(zbVar.f25203zb)) {
            if (av.fby(zbVar.f25203zb)) {
                return ycx("playable_link_endcard");
            }
            if (av.lt(zbVar.f25203zb)) {
                return ycx("pure_playable");
            }
            return ycx("playable");
        }
        com.bytedance.sdk.openadsdk.component.reward.ycx.pmi pmiVar2 = zbVar.rmf;
        if (pmiVar2 != null && pmiVar2.htf()) {
            return ycx("double_endcard");
        }
        if (!com.bytedance.sdk.openadsdk.core.model.htf.dj(zbVar.f25203zb) && !com.bytedance.sdk.openadsdk.core.model.htf.zb(zbVar.f25203zb) && !com.bytedance.sdk.openadsdk.core.model.htf.fby(zbVar.f25203zb)) {
            return ycx("endcard");
        }
        return ycx("direct_landingpage");
    }
}
