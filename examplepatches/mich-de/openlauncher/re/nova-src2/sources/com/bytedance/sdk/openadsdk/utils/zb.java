package com.bytedance.sdk.openadsdk.utils;

import com.vungle.ads.internal.protos.Sdk;
import java.lang.ref.SoftReference;
import java.util.Objects;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class zb {

    /* renamed from: dj, reason: collision with root package name */
    private static Boolean f27273dj;
    private static volatile com.bytedance.sdk.component.ul.sya.lud fby;

    /* renamed from: lt, reason: collision with root package name */
    private static Boolean f27274lt;
    private static Boolean lud;
    private static Boolean sya;

    /* renamed from: ul, reason: collision with root package name */
    private static Boolean f27275ul;
    public static SoftReference<com.bytedance.sdk.openadsdk.core.model.tn> ycx;

    /* renamed from: zb, reason: collision with root package name */
    private static Boolean f27276zb;

    public static boolean dj() {
        try {
            if (lud == null) {
                lud = Boolean.valueOf(com.bytedance.sdk.openadsdk.dv.lud.ycx("lp_redirect_monitor", false));
            }
            return lud.booleanValue();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "euoYgQqweg==", "Uv0Amg21fciSb9lcjh2lLA==", 88);
            return false;
        }
    }

    public static com.bytedance.sdk.component.ul.sya.lud fby() {
        if (fby != null) {
            return fby;
        }
        com.bytedance.sdk.component.ul.sya.lud ludVar = new com.bytedance.sdk.component.ul.sya.lud();
        try {
            JSONObject jSONObject = (JSONObject) com.bytedance.sdk.openadsdk.dv.lud.ycx("net_multi_domain_config", (Object) null, com.bytedance.sdk.openadsdk.dv.zb.ycx);
            if (jSONObject != null) {
                ludVar.ycx = jSONObject.optInt("enable", 0) == 1;
                ludVar.f24065zb = jSONObject.optInt("fail_count", 10);
                ludVar.sya = jSONObject.optLong("interval", 1800000L);
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "euoYgQqweg==", "XOs5uwaoTciNS95Trx6uLlLp", 165);
            th2.getMessage();
        }
        fby = ludVar;
        Objects.toString(fby);
        return fby;
    }

    public static boolean lt() {
        try {
            if (f27275ul == null) {
                f27275ul = Boolean.valueOf(com.bytedance.sdk.openadsdk.dv.lud.ycx("progress_bar_fix", 0) == 1);
            }
            return f27275ul.booleanValue();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "euoYgQqweg==", "XuAslw+5WdWPTcVYnwKCKUnIJI0=", Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE);
            return true;
        }
    }

    public static boolean lud() {
        try {
            if (f27274lt == null) {
                f27274lt = Boolean.valueOf(com.bytedance.sdk.openadsdk.dv.lud.ycx("lp_optimize", false));
            }
            return f27274lt.booleanValue();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "euoYgQqweg==", "XuAslw+5R8KXZuc=", 105);
            return false;
        }
    }

    public static boolean sya() {
        try {
            if (f27273dj == null) {
                boolean z11 = true;
                if (com.bytedance.sdk.openadsdk.dv.lud.ycx("iv_rv_load_show_new", 0) != 1) {
                    z11 = false;
                }
                f27273dj = Boolean.valueOf(z11);
            }
            return f27273dj.booleanValue();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "euoYgQqweg==", "XuAslw+5RciBTvZZohS3", 73);
            return false;
        }
    }

    public static com.bytedance.sdk.openadsdk.core.model.tn ul() {
        SoftReference<com.bytedance.sdk.openadsdk.core.model.tn> softReference = ycx;
        if (softReference != null) {
            return softReference.get();
        }
        return null;
    }

    public static boolean ycx() {
        if (f27276zb == null) {
            try {
                f27276zb = Boolean.valueOf(com.bytedance.sdk.openadsdk.dv.lud.ycx("stability_sinking", 0) == 1);
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "euoYgQqweg==", "Uv0PgBCRZsmJXthPqR+hKlfrKQ==", 36);
                f27276zb = Boolean.FALSE;
            }
        }
        return f27276zb.booleanValue();
    }

    public static boolean zb() {
        try {
            if (sya == null) {
                boolean z11 = true;
                if (com.bytedance.sdk.openadsdk.dv.lud.ycx("net_opt_multiple_domain_retry", 0) != 1) {
                    z11 = false;
                }
                sya = Boolean.valueOf(z11);
            }
            return sya.booleanValue();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "euoYgQqweg==", "XuAslw+5RNKMXt5NgBSEJ1bvJJsxuX3VmQ==", 57);
            return false;
        }
    }

    public static void ycx(com.bytedance.sdk.openadsdk.core.model.tn tnVar) {
        if (tnVar == null) {
            return;
        }
        ycx = new SoftReference<>(tnVar);
    }
}
