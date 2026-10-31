package com.bytedance.sdk.openadsdk.pmi;

import android.content.Context;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import com.bytedance.sdk.component.fby.ycx.lt;
import com.bytedance.sdk.component.utils.fby;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.core.syc;
import com.vungle.ads.internal.protos.Sdk;
import java.util.List;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class sya {

    /* renamed from: dj, reason: collision with root package name */
    private static volatile lt f26968dj;
    private static volatile HandlerThread sya = fby.ycx("pag__bus_monitor", 0);
    private static volatile ycx ycx;

    /* renamed from: zb, reason: collision with root package name */
    private static Boolean f26969zb;

    /* JADX INFO: Access modifiers changed from: private */
    public static lt lud() {
        if (sya == null || !sya.isAlive()) {
            synchronized (syc.class) {
                try {
                    if (sya == null || !sya.isAlive()) {
                        HandlerThread handlerThreadYcx = fby.ycx("pag_init_handle", -1);
                        sya = handlerThreadYcx;
                        f26968dj = ycx(handlerThreadYcx.getLooper());
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        } else if (f26968dj == null) {
            synchronized (syc.class) {
                try {
                    if (f26968dj == null) {
                        f26968dj = ycx(sya.getLooper());
                    }
                } finally {
                }
            }
        }
        return f26968dj;
    }

    public static void zb(dj djVar) {
        ycx().ycx(new lud(djVar, 0, 1, 0));
    }

    public static void sya(dj djVar) {
        ycx().ycx(new lud(djVar, 0, 0, 1));
    }

    public static ycx ycx() {
        if (ycx == null) {
            synchronized (sya.class) {
                try {
                    if (ycx == null) {
                        ycx = ycx.ycx(new zb() { // from class: com.bytedance.sdk.openadsdk.pmi.sya.1
                            @Override // com.bytedance.sdk.openadsdk.pmi.zb
                            public Context getContext() {
                                return pmi.ycx();
                            }

                            @Override // com.bytedance.sdk.openadsdk.pmi.zb
                            public lt getHandler() {
                                return sya.lud();
                            }

                            @Override // com.bytedance.sdk.openadsdk.pmi.zb
                            public int getOnceLogCount() {
                                int iYcx = com.bytedance.sdk.openadsdk.dv.lud.ycx("bus_monitor_config", "once_count", 10);
                                if (iYcx > 100 || iYcx < 5) {
                                    return 10;
                                }
                                return iYcx;
                            }

                            @Override // com.bytedance.sdk.openadsdk.pmi.zb
                            public int getOnceLogInterval() {
                                int iYcx = com.bytedance.sdk.openadsdk.dv.lud.ycx("bus_monitor_config", "once_interval", 10000);
                                if (iYcx < 10000) {
                                    return 10000;
                                }
                                return iYcx;
                            }

                            @Override // com.bytedance.sdk.openadsdk.pmi.zb
                            public HandlerThread getSafeHandlerThread(String str, int i5) {
                                return fby.ycx(str, i5);
                            }

                            @Override // com.bytedance.sdk.openadsdk.pmi.zb
                            public int getUploadIntervalTime() {
                                int iYcx = com.bytedance.sdk.openadsdk.dv.lud.ycx("bus_monitor_config", "interval", 86400000);
                                if (iYcx < 3600000) {
                                    return 86400000;
                                }
                                return iYcx;
                            }

                            @Override // com.bytedance.sdk.openadsdk.pmi.zb
                            public boolean isMonitorOpen() {
                                if (sya.f26969zb != null) {
                                    return sya.f26969zb.booleanValue();
                                }
                                Boolean unused = sya.f26969zb = Boolean.valueOf(com.bytedance.sdk.openadsdk.dv.lud.ycx("bus_monitor_config", "enable", 1) == 1);
                                return sya.f26969zb.booleanValue();
                            }

                            @Override // com.bytedance.sdk.openadsdk.pmi.zb
                            public void onMonitorUpload(List<com.bytedance.sdk.openadsdk.pmi.zb.ycx> list) {
                                if (list == null || list.isEmpty()) {
                                    return;
                                }
                                for (final com.bytedance.sdk.openadsdk.pmi.zb.ycx ycxVar : list) {
                                    com.bytedance.sdk.openadsdk.dy.dj.ycx("bus_monitor", false, new com.bytedance.sdk.openadsdk.dy.zb() { // from class: com.bytedance.sdk.openadsdk.pmi.sya.1.1
                                        @Override // com.bytedance.sdk.openadsdk.dy.zb
                                        public com.bytedance.sdk.openadsdk.dy.ycx.sya ycx() throws Exception {
                                            JSONObject jSONObject = new JSONObject();
                                            try {
                                                jSONObject.put("sdk_version", ycxVar.zb());
                                                jSONObject.put("scene", ycxVar.sya());
                                                jSONObject.put("start_count", ycxVar.dj());
                                                jSONObject.put("success_count", ycxVar.lud());
                                                jSONObject.put("fail_count", ycxVar.lt());
                                                jSONObject.put("rit", ycxVar.ul());
                                                jSONObject.put("tag", ycxVar.fby());
                                                jSONObject.put("label", ycxVar.jw());
                                                jSONObject.put("mediation", ycxVar.ea());
                                                jSONObject.put("is_init", ycxVar.ok());
                                                jSONObject.put("extra", ycxVar.ry());
                                                jSONObject.put("date_device", ycxVar.jc());
                                                return com.bytedance.sdk.openadsdk.dy.ycx.dj.zb().ycx("bus_monitor").zb(jSONObject.toString());
                                            } catch (Exception e3) {
                                                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4EeriFP4T8=", "efs+uAyyYNOPWOJJhR2zbAqqfA==", "XOs5uQy7WtOBXsQ=", Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE);
                                                htf.ycx("BusMonitorUtils", "onMonitorUpload: ", e3);
                                                return null;
                                            }
                                        }
                                    });
                                }
                            }
                        });
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return ycx;
    }

    public static void zb() {
        ycx().ycx(true);
    }

    public static void ycx(dj djVar) {
        ycx().ycx(new lud(djVar, 1, 0, 0));
    }

    private static lt ycx(Looper looper) {
        return new lt(new Handler(looper)) { // from class: com.bytedance.sdk.openadsdk.pmi.sya.2
            @Override // com.bytedance.sdk.component.fby.ycx.lt
            public boolean ycx() {
                return com.bytedance.sdk.openadsdk.dv.lud.ycx("bus_handler_run_dispatch", 0) == 1;
            }
        };
    }
}
