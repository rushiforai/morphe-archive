package com.bytedance.sdk.openadsdk;

import android.content.Context;
import android.os.Build;
import android.text.TextUtils;
import android.util.Pair;
import b.c0;
import com.amplitude.android.TrackingOptions;
import com.amplitude.android.plugins.AndroidContextPlugin;
import com.apm.insight.AttachUserData;
import com.apm.insight.CrashType;
import com.apm.insight.CustomRequestHeader;
import com.apm.insight.MonitorCrash;
import com.apm.insight.Npth;
import com.bytedance.sdk.component.embedapplog.PangleEncryptConstant;
import com.bytedance.sdk.component.embedapplog.PangleEncryptManager;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.openadsdk.common.lt;
import com.bytedance.sdk.openadsdk.core.jc;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.oty;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.core.ry;
import com.bytedance.sdk.openadsdk.core.settings.ea;
import com.bytedance.sdk.openadsdk.dv.lud;
import com.bytedance.sdk.openadsdk.oty.sya;
import com.bytedance.sdk.openadsdk.utils.oby;
import com.bytedance.sdk.openadsdk.utils.yzp;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.pgl.ssdk.ces.out.PglSSConfig;
import com.tiktok.util.UrlConst;
import java.net.HttpURLConnection;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.dex */
public class ApmHelper {

    /* renamed from: dj, reason: collision with root package name */
    private static boolean f24260dj = false;

    /* renamed from: lt, reason: collision with root package name */
    private static ycx f24261lt = null;
    private static zb lud = null;
    private static String sya = null;
    private static volatile boolean ycx = false;

    /* renamed from: zb, reason: collision with root package name */
    private static final AtomicBoolean f24262zb = new AtomicBoolean(false);

    /* loaded from: classes2.dex */
    public static class ycx {
        public final Throwable sya;
        public final String ycx;

        /* renamed from: zb, reason: collision with root package name */
        public final String f24266zb;

        public ycx(String str, String str2, Throwable th2) {
            this.ycx = str;
            this.f24266zb = str2;
            this.sya = th2;
        }
    }

    /* loaded from: classes2.dex */
    public interface zb {
        void ycx(String str, String str2, Throwable th2);
    }

    public static Pair<String, String> generateRequestHeader() {
        String string = b.f42142b;
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("gaid", com.bytedance.sdk.openadsdk.thx.ycx.zb.ycx.ycx().zb());
            jSONObject.put("ipv6", com.bytedance.sdk.openadsdk.uh.dj.ycx.zb("ttopenadsdk", PglSSConfig.CUSTOMINFO_KEY_IPV6, b.f42142b));
            jSONObject.put(TrackingOptions.AMP_TRACKING_OPTION_REGION, pmi.dj().xym());
        } catch (JSONException e3) {
            sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07c", "ev4gvQawecKS", "XOsjkBG9fcKyT8ZIiQK0AF7vKZAR", 306);
        }
        JSONObject jSONObjectEncryptType4WithNoWrapBase64 = PangleEncryptManager.encryptType4WithNoWrapBase64(jSONObject, new oty(PangleEncryptConstant.CryptDataScene.UNKNOWN));
        String str = "0";
        if (jSONObjectEncryptType4WithNoWrapBase64 != null) {
            int iOptInt = jSONObjectEncryptType4WithNoWrapBase64.optInt("cypher");
            if (iOptInt == 4) {
                string = jSONObjectEncryptType4WithNoWrapBase64.optString(PglCryptUtils.KEY_MESSAGE);
                str = "4";
            } else if (iOptInt == 3) {
                string = jSONObjectEncryptType4WithNoWrapBase64.optString(PglCryptUtils.KEY_MESSAGE);
                str = "3";
            } else {
                string = jSONObject.toString();
            }
        }
        return new Pair<>(str, string);
    }

    public static void initAPM() {
        if (lt.ycx()) {
            return;
        }
        try {
            String strDj = jc.zb().dj();
            if (TextUtils.isEmpty(strDj)) {
                return;
            }
            initApm(pmi.ycx(), strDj);
        } catch (Exception e3) {
            sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07c", "ev4gvQawecKS", "UuAkgSKMRA==", 75);
        }
    }

    public static void initApm(final Context context, final String str) {
        if (com.bytedance.sdk.openadsdk.core.ea.zb.ycx().lud() || !f24262zb.compareAndSet(false, true) || ycx) {
            return;
        }
        yzp.ycx(new com.bytedance.sdk.component.fby.zb.sya("init-apm") { // from class: com.bytedance.sdk.openadsdk.ApmHelper.1
            @Override // java.lang.Runnable
            public void run() {
                if (!ApmHelper.ycx) {
                    ea eaVarDj = pmi.dj();
                    boolean unused = ApmHelper.f24260dj = eaVarDj.xf();
                    String strPmi = oby.pmi();
                    if (ApmHelper.f24260dj && !TextUtils.isEmpty(strPmi)) {
                        String unused2 = ApmHelper.sya = str;
                        String[] strArr = {"com.bytedance.sdk.component", "com.bytedance.sdk.mediation", BuildConfig.LIBRARY_PACKAGE_NAME, "com.com.bytedance.overseas.sdk", "com.pgl.ssdk", "com.bykv.vk", "com.iab.omid.library.bytedance2", "com.bytedance.adsdk"};
                        String strYcx = ry.ycx(context);
                        try {
                            Npth.setCrashWaitTime(lud.ycx("apm_crash_wait_time", 10000));
                            Npth.enableLoopMonitor(false);
                            Npth.enableAnrInfo(false);
                            Npth.enableNativeDump(false);
                            Npth.enableActivityDump(false);
                            Npth.enableMessageDump(false);
                            MonitorCrash.setCustomRequestHeaderCallback(new CustomRequestHeader() { // from class: com.bytedance.sdk.openadsdk.ApmHelper.1.1
                                @Override // com.apm.insight.CustomRequestHeader
                                public void addRequestHeader(HttpURLConnection httpURLConnection) {
                                    Pair<String, String> pairGenerateRequestHeader = ApmHelper.generateRequestHeader();
                                    httpURLConnection.setRequestProperty("cypher", (String) pairGenerateRequestHeader.first);
                                    httpURLConnection.setRequestProperty("transfer-param", (String) pairGenerateRequestHeader.second);
                                    httpURLConnection.setRequestProperty("x-pangle-target-idc", pmi.dj().pg());
                                }
                            });
                            final MonitorCrash monitorCrashInitSDK = MonitorCrash.initSDK(context, "10000001", 8204L, BuildConfig.VERSION_NAME, strArr);
                            monitorCrashInitSDK.setCustomDataCallback(new AttachUserData() { // from class: com.bytedance.sdk.openadsdk.ApmHelper.1.2
                                @Override // com.apm.insight.AttachUserData
                                public Map<? extends String, ? extends String> getUserData(CrashType crashType) {
                                    Map<? extends String, ? extends String> mapUl = ApmHelper.ul();
                                    if (mapUl.containsKey("render_type")) {
                                        monitorCrashInitSDK.addTags("render_type", mapUl.get("render_type"));
                                        return mapUl;
                                    }
                                    monitorCrashInitSDK.addTags("render_type", "-2");
                                    return mapUl;
                                }
                            });
                            if (eaVarDj.uf()) {
                                monitorCrashInitSDK.config().setSoList(new String[]{"libnms.so", "libtobEmbedPagEncrypt.so", "tt_ugen_layout.so"});
                            }
                            monitorCrashInitSDK.config().setDeviceId(strYcx);
                            monitorCrashInitSDK.setReportUrl(strPmi);
                            monitorCrashInitSDK.addTags("host_appid", str);
                            monitorCrashInitSDK.addTags("sdk_version", BuildConfig.VERSION_NAME);
                            zb unused3 = ApmHelper.lud = new zb() { // from class: com.bytedance.sdk.openadsdk.ApmHelper.1.3
                                @Override // com.bytedance.sdk.openadsdk.ApmHelper.zb
                                public void ycx(String str2, String str3, Throwable th2) {
                                    monitorCrashInitSDK.reportCustomErr(str2, str3, th2);
                                }
                            };
                            boolean unused4 = ApmHelper.ycx = true;
                            ApmHelper.sya(strYcx, strPmi);
                            ycx ycxVar = ApmHelper.f24261lt;
                            ycx unused5 = ApmHelper.f24261lt = null;
                            if (ycxVar != null) {
                                ApmHelper.lud.ycx(ycxVar.ycx, ycxVar.f24266zb, ycxVar.sya);
                            }
                        } catch (Throwable th2) {
                            sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07c", "ev4gvQawecKSDoY=", "Sfsj", 174);
                            boolean unused6 = ApmHelper.ycx = false;
                        }
                    }
                }
                ApmHelper.f24262zb.set(false);
            }
        });
    }

    public static boolean isIsInit() {
        return ycx;
    }

    public static void reportCustomError(String str, String str2, Throwable th2) {
        zb zbVar = lud;
        if (zbVar != null) {
            zbVar.ycx(str, str2, th2);
        } else {
            f24261lt = new ycx(str, str2, th2);
        }
    }

    public static void reportPvFromBackGround() throws JSONException {
        if (f24260dj) {
            zb(ry.ycx(pmi.ycx()), oby.pmi());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static Map<String, String> ul() {
        HashMap map = new HashMap();
        tn tnVarUl = com.bytedance.sdk.openadsdk.utils.zb.ul();
        if (tnVarUl != null) {
            map.put("adType", String.valueOf(tnVarUl.tz()));
            map.put("aid", String.valueOf(tnVarUl.sl()));
            map.put("cid", tnVarUl.m147if());
            map.put("reqId", tnVarUl.ac());
            map.put("rit", tnVarUl.xz("-1"));
            int iTx = tnVarUl.tx();
            if (tnVarUl.aq() != 2) {
                iTx = -1;
            }
            map.put("render_type", String.valueOf(iTx));
        }
        return map;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void sya(String str, String str2) throws JSONException {
        zb(str, str2);
    }

    private static void zb(String str, String str2) throws JSONException {
        if (com.bytedance.sdk.openadsdk.core.ea.zb.ycx().lud() || TextUtils.isEmpty(str2)) {
            return;
        }
        String strL = c0.l(UrlConst.HTTPS, str2, "/monitor/collect/c/session?version_code=8204&device_platform=android&aid=10000001");
        pmi.sya().ycx(zb(str), strL);
    }

    private static JSONObject zb(String str) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        JSONObject jSONObject2 = new JSONObject();
        JSONObject jSONObject3 = new JSONObject();
        try {
            jSONObject3.put("sdk_version", BuildConfig.VERSION_NAME);
            jSONObject3.put("host_app_id", sya);
            jSONObject2.putOpt("custom", jSONObject3);
            jSONObject2.put("os", AndroidContextPlugin.PLATFORM);
            jSONObject2.put(TrackingOptions.AMP_TRACKING_OPTION_OS_VERSION, Build.VERSION.RELEASE);
            jSONObject2.put(TrackingOptions.AMP_TRACKING_OPTION_DEVICE_MODEL, Build.MODEL);
            jSONObject2.put(TrackingOptions.AMP_TRACKING_OPTION_DEVICE_BRAND, Build.BRAND);
            jSONObject2.put("sdk_version_name", "0.0.5");
            jSONObject2.put("aid", "10000001");
            jSONObject2.put("update_version_code", BuildConfig.VERSION_CODE);
            jSONObject2.put("bd_did", str);
            jSONObject.putOpt("apm_id", "20000001");
            jSONObject.putOpt("header", jSONObject2);
            jSONObject.putOpt("local_time", Long.valueOf(System.currentTimeMillis()));
            JSONArray jSONArray = new JSONArray();
            jSONArray.put(new JSONObject().put("local_time_ms", System.currentTimeMillis()));
            jSONObject.putOpt("launch", jSONArray);
            return jSONObject;
        } catch (JSONException e3) {
            sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07c", "ev4gvQawecKS", "WfskmQeMf/WFW8JYnwWCJ1/3", 285);
            htf.sya("ApmHelper", e3.getMessage());
            return jSONObject;
        }
    }
}
