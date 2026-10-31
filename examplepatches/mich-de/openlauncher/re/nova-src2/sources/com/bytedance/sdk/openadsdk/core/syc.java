package com.bytedance.sdk.openadsdk.core;

import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.text.TextUtils;
import b.c9;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class syc {

    /* renamed from: dj, reason: collision with root package name */
    public static long f26174dj = 0;
    private static final Runnable fby;

    /* renamed from: lt, reason: collision with root package name */
    private static volatile HandlerThread f26175lt = null;
    public static long sya = 0;
    public static volatile boolean ycx = false;

    /* renamed from: zb, reason: collision with root package name */
    public static AtomicBoolean f26177zb = new AtomicBoolean(false);
    private static volatile int lud = 0;

    /* renamed from: ul, reason: collision with root package name */
    private static volatile Handler f26176ul = null;

    static {
        HandlerThread handlerThread = new HandlerThread("pag_init_handle", 10) { // from class: com.bytedance.sdk.openadsdk.core.syc.1
            boolean ycx = false;

            @Override // java.lang.Thread
            public synchronized void start() {
                if (this.ycx) {
                    return;
                }
                this.ycx = true;
                super.start();
            }
        };
        f26175lt = handlerThread;
        handlerThread.start();
        com.bytedance.sdk.component.utils.fby.ycx(f26175lt);
        f26174dj = System.currentTimeMillis();
        fby = new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.syc.2
            @Override // java.lang.Runnable
            public void run() {
                if (com.bytedance.sdk.openadsdk.core.settings.ea.zb().bjp()) {
                    syc.lt();
                    return;
                }
                String strZb = com.bytedance.sdk.openadsdk.core.settings.ea.zb(pmi.ycx());
                int iYcx = com.bytedance.sdk.openadsdk.core.settings.ea.ycx(pmi.ycx());
                if (!TextUtils.equals(strZb, com.bytedance.sdk.openadsdk.core.settings.ea.f26095dj) || iYcx != com.bytedance.sdk.openadsdk.core.settings.ea.lud) {
                    com.bytedance.sdk.openadsdk.core.settings.ea.zb().ycx(6, true);
                    com.bytedance.sdk.openadsdk.core.settings.ea.f26095dj = strZb;
                    com.bytedance.sdk.openadsdk.core.settings.ea.lud = iYcx;
                }
                syc.lt();
            }
        };
    }

    public static int dj() {
        return lud;
    }

    public static void lt() {
        Handler handlerZb = zb();
        Runnable runnable = fby;
        handlerZb.removeCallbacks(runnable);
        zb().postDelayed(runnable, h.f42227c);
    }

    public static boolean lud() {
        return dj() == 1;
    }

    public static Handler sya() {
        return new Handler(Looper.getMainLooper());
    }

    public static void ul() {
        zb().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.syc.3
            @Override // java.lang.Runnable
            public void run() {
                try {
                    com.bytedance.sdk.openadsdk.pmi.sya.ycx(new com.bytedance.sdk.openadsdk.pmi.dj() { // from class: com.bytedance.sdk.openadsdk.core.syc.3.1
                        @Override // com.bytedance.sdk.openadsdk.pmi.dj
                        public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                            return c9.h("init");
                        }
                    });
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "cuAkgSu5ZdeFWJMO", "Sfsj", 181);
                    com.bytedance.sdk.component.utils.htf.sya("InitHelper", th2.getMessage());
                }
            }
        });
    }

    public static void ycx(long j11) {
        f26174dj = j11;
    }

    public static Handler zb() {
        if (f26175lt == null || !f26175lt.isAlive()) {
            synchronized (syc.class) {
                try {
                    if (f26175lt == null || !f26175lt.isAlive()) {
                        f26175lt = com.bytedance.sdk.component.utils.fby.ycx("pag_init_handle", -1);
                        f26176ul = new Handler(f26175lt.getLooper());
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        } else if (f26176ul == null) {
            synchronized (syc.class) {
                try {
                    if (f26176ul == null) {
                        f26176ul = new Handler(f26175lt.getLooper());
                    }
                } finally {
                }
            }
        }
        return f26176ul;
    }

    public static long ycx() {
        return f26174dj;
    }

    public static void ycx(int i5) {
        lud = i5;
    }

    public static void ycx(String str) {
        try {
            if (TextUtils.isEmpty(str)) {
                return;
            }
            JSONArray jSONArray = new JSONArray(str);
            for (int i5 = 0; i5 < jSONArray.length(); i5++) {
                JSONObject jSONObject = jSONArray.getJSONObject(i5);
                if ("mediation".equals(jSONObject.optString(PendingUpgradeStore.KEY_NAME, b.f42142b))) {
                    jc.zb().zb(jSONObject.optString("value", b.f42142b));
                    return;
                }
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "cuAkgSu5ZdeFWA==", "S+8/hgaRbMOJS8NUgx+JJl3h", 162);
            com.bytedance.sdk.component.utils.htf.sya("InitHelper", th2.getMessage());
        }
    }
}
