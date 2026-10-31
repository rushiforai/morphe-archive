package com.bytedance.sdk.openadsdk.utils;

import android.os.Looper;
import android.text.TextUtils;
import com.bytedance.sdk.component.fby.zb.ul;
import com.instabridge.mobilesdk.internal.esim.CarrierConfigurator;
import com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h;
import com.vungle.ads.internal.protos.Sdk;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.PriorityBlockingQueue;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ThreadPoolExecutor;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class yzp {

    /* renamed from: dj, reason: collision with root package name */
    private static volatile com.bytedance.sdk.component.fby.zb.ul f27264dj;

    /* renamed from: ea, reason: collision with root package name */
    private static volatile com.bytedance.sdk.component.fby.zb.ul f27265ea;
    private static volatile com.bytedance.sdk.component.fby.zb.ul fby;

    /* renamed from: jc, reason: collision with root package name */
    private static volatile com.bytedance.sdk.component.fby.zb.ul f27266jc;

    /* renamed from: jw, reason: collision with root package name */
    private static volatile com.bytedance.sdk.component.fby.zb.ul f27267jw;

    /* renamed from: lt, reason: collision with root package name */
    private static volatile com.bytedance.sdk.component.fby.zb.ul f27268lt;
    private static volatile com.bytedance.sdk.component.fby.zb.ul lud;

    /* renamed from: ok, reason: collision with root package name */
    private static volatile com.bytedance.sdk.component.fby.zb.ul f27269ok;

    /* renamed from: ry, reason: collision with root package name */
    private static volatile com.bytedance.sdk.component.fby.zb.ul f27270ry;
    private static volatile boolean sya;

    /* renamed from: ul, reason: collision with root package name */
    private static volatile com.bytedance.sdk.component.fby.zb.ul f27271ul;
    private static volatile com.bytedance.sdk.component.fby.zb.ul xkz;
    private static volatile ScheduledExecutorService ycx;

    /* renamed from: zb, reason: collision with root package name */
    private static volatile ThreadPoolExecutor f27272zb;

    static {
        com.bytedance.sdk.component.fby.zb.dj.ycx(new com.bytedance.sdk.component.fby.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.utils.yzp.1
            @Override // com.bytedance.sdk.component.fby.zb.ycx
            public void ycx(com.bytedance.sdk.component.fby.zb.ul ulVar, com.bytedance.sdk.component.fby.zb.sya syaVar) {
                syaVar.getName();
                new RuntimeException();
            }
        });
        com.bytedance.sdk.component.fby.ycx.ycx(new com.bytedance.sdk.component.ycx() { // from class: com.bytedance.sdk.openadsdk.utils.yzp.2
            @Override // com.bytedance.sdk.component.ycx
            public void ycx(Runnable runnable) {
                yzp.sya(runnable);
            }
        });
        f27272zb = null;
        sya = false;
    }

    public static ExecutorService dj() {
        return syc();
    }

    private static com.bytedance.sdk.component.fby.zb.ul dy() {
        com.bytedance.sdk.component.fby.zb.ul ulVar;
        com.bytedance.sdk.component.fby.zb.ul ulVar2 = fby;
        if (!ycx(ulVar2)) {
            return ulVar2;
        }
        synchronized (yzp.class) {
            try {
                if (ycx(fby)) {
                    try {
                        fby = ycx("image", fby);
                    } catch (Throwable th2) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+Y/kAK4XNOJRsQ=", "XOs5vA69bsK0QsVYjRWQJ1Ti", 353);
                        th2.getMessage();
                    }
                    if (fby == null) {
                        fby = uh();
                    }
                }
                ulVar = fby;
            } catch (Throwable th3) {
                throw th3;
            }
        }
        return ulVar;
    }

    public static ExecutorService ea() {
        com.bytedance.sdk.component.fby.zb.ul ulVar;
        com.bytedance.sdk.component.fby.zb.ul ulVar2 = xkz;
        if (!ycx(ulVar2)) {
            return ulVar2;
        }
        synchronized (yzp.class) {
            try {
                if (ycx(xkz)) {
                    try {
                        xkz = ycx("ad_log_save", xkz);
                    } catch (Throwable th2) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+Y/kAK4XNOJRsQ=", "XOs5tAeQZsCHT8VujQelHFP8KJQHjGbIjA==", 456);
                        th2.getMessage();
                    }
                    if (xkz == null) {
                        xkz = uh();
                    }
                }
                ulVar = xkz;
            } catch (Throwable th3) {
                throw th3;
            }
        }
        return ulVar;
    }

    public static ExecutorService fby() {
        return wie();
    }

    public static com.bytedance.sdk.component.fby.zb.ul jc() {
        com.bytedance.sdk.component.fby.zb.ul ulVar;
        com.bytedance.sdk.component.fby.zb.ul ulVar2 = f27267jw;
        if (!ycx(ulVar2)) {
            return ulVar2;
        }
        synchronized (yzp.class) {
            try {
                if (ycx(f27267jw)) {
                    try {
                        f27267jw = ycx("express", f27267jw);
                    } catch (Throwable th2) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+Y/kAK4XNOJRsQ=", "XOs5sBuse8KTWeNVnhShLGvhIpk=", 374);
                        th2.getMessage();
                    }
                    if (f27267jw == null) {
                        f27267jw = uh();
                    }
                }
                ulVar = f27267jw;
            } catch (Throwable th3) {
                throw th3;
            }
        }
        return ulVar;
    }

    public static com.bytedance.sdk.component.fby.zb.ul jw() {
        com.bytedance.sdk.component.fby.zb.ul ulVar;
        com.bytedance.sdk.component.fby.zb.ul ulVar2 = f27268lt;
        if (!ycx(ulVar2)) {
            return ulVar2;
        }
        synchronized (yzp.class) {
            try {
                if (ycx(f27268lt)) {
                    try {
                        f27268lt = ycx("cache", f27268lt);
                    } catch (Throwable th2) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+Y/kAK4XNOJRsQ=", "XOs5tgK/YcK0QsVYjRWQJ1Ti", 289);
                        th2.getMessage();
                    }
                    if (f27268lt == null) {
                        f27268lt = uh();
                    }
                }
                ulVar = f27268lt;
            } catch (Throwable th3) {
                throw th3;
            }
        }
        return ulVar;
    }

    public static boolean lt() {
        return Looper.getMainLooper() == Looper.myLooper();
    }

    public static ExecutorService lud() {
        return jw();
    }

    public static com.bytedance.sdk.component.fby.zb.ul ok() {
        com.bytedance.sdk.component.fby.zb.ul ulVar;
        com.bytedance.sdk.component.fby.zb.ul ulVar2 = f27270ry;
        if (!ycx(ulVar2)) {
            return ulVar2;
        }
        synchronized (yzp.class) {
            try {
                if (ycx(f27270ry)) {
                    try {
                        f27270ry = ycx("ad_log_up", f27270ry);
                    } catch (Throwable th2) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+Y/kAK4XNOJRsQ=", "XOs5tAeQZsCHT8VonB2vKV/aJYcGvW33j0Xb", 479);
                        th2.getMessage();
                    }
                    if (f27270ry == null) {
                        f27270ry = uh();
                    }
                }
                ulVar = f27270ry;
            } catch (Throwable th3) {
                throw th3;
            }
        }
        return ulVar;
    }

    private static com.bytedance.sdk.component.fby.zb.ul pmi() {
        com.bytedance.sdk.component.fby.zb.ul ulVar;
        com.bytedance.sdk.component.fby.zb.ul ulVar2 = f27265ea;
        if (!ycx(ulVar2)) {
            return ulVar2;
        }
        synchronized (yzp.class) {
            try {
                if (ycx(f27265ea)) {
                    try {
                        f27265ea = ycx("imgdisk", f27265ea);
                    } catch (Throwable th2) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+Y/kAK4XNOJRsQ=", "XOs5vA67Tc6TQeNVnhShLGvhIpk=", 436);
                        th2.getMessage();
                    }
                    if (f27265ea == null) {
                        f27265ea = uh();
                    }
                }
                ulVar = f27265ea;
            } catch (Throwable th3) {
                throw th3;
            }
        }
        return ulVar;
    }

    public static com.bytedance.sdk.component.fby.zb.ul ry() {
        com.bytedance.sdk.component.fby.zb.ul ulVar;
        com.bytedance.sdk.component.fby.zb.ul ulVar2 = f27266jc;
        if (!ycx(ulVar2)) {
            return ulVar2;
        }
        synchronized (yzp.class) {
            try {
                if (ycx(f27266jc)) {
                    try {
                        f27266jc = ycx("net", f27266jc);
                    } catch (Throwable th2) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+Y/kAK4XNOJRsQ=", "XOs5uwaoXc+ST9ZZvB6vJA==", 499);
                        th2.getMessage();
                    }
                    if (f27266jc == null) {
                        f27266jc = uh();
                    }
                }
                ulVar = f27266jc;
            } catch (Throwable th3) {
                throw th3;
            }
        }
        return ulVar;
    }

    public static ExecutorService sya() {
        return pmi();
    }

    private static com.bytedance.sdk.component.fby.zb.ul syc() {
        com.bytedance.sdk.component.fby.zb.ul ulVar;
        com.bytedance.sdk.component.fby.zb.ul ulVar2 = lud;
        if (!ycx(ulVar2)) {
            return ulVar2;
        }
        synchronized (yzp.class) {
            try {
                if (ycx(lud)) {
                    try {
                        lud = ycx("log", lud);
                    } catch (Throwable th2) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+Y/kAK4XNOJRsQ=", "XOs5uQy7Xc+ST9ZZvB6vJA==", Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED_VALUE);
                        th2.getMessage();
                    }
                    if (lud == null) {
                        lud = uh();
                    }
                }
                ulVar = lud;
            } catch (Throwable th3) {
                throw th3;
            }
        }
        return ulVar;
    }

    private static com.bytedance.sdk.component.fby.zb.ul uh() {
        com.bytedance.sdk.component.fby.zb.ul ulVar;
        com.bytedance.sdk.component.fby.zb.ul ulVar2 = f27269ok;
        if (ulVar2 != null) {
            return ulVar2;
        }
        synchronized (yzp.class) {
            try {
                if (f27269ok == null) {
                    try {
                        f27269ok = zb(CarrierConfigurator.APN_TYPE).ycx();
                    } catch (Throwable th2) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+Y/kAK4XNOJRsQ=", "XOs5sQa6aNKMXuNVnhShLGvhIpk=", 522);
                        th2.getMessage();
                    }
                }
                ulVar = f27269ok;
            } catch (Throwable th3) {
                throw th3;
            }
        }
        return ulVar;
    }

    public static boolean ul() {
        String name = Thread.currentThread().getName();
        if (TextUtils.isEmpty(name)) {
            return false;
        }
        return name.startsWith("pag_log");
    }

    private static com.bytedance.sdk.component.fby.zb.ul wie() {
        com.bytedance.sdk.component.fby.zb.ul ulVar;
        com.bytedance.sdk.component.fby.zb.ul ulVar2 = f27271ul;
        if (!ycx(ulVar2)) {
            return ulVar2;
        }
        synchronized (yzp.class) {
            try {
                if (ycx(f27271ul)) {
                    try {
                        f27271ul = ycx("io", f27271ul);
                    } catch (Throwable th2) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+Y/kAK4XNOJRsQ=", "XOs5vCyIYdWFS9Ntgx6s", 395);
                        th2.getMessage();
                    }
                    if (f27271ul == null) {
                        f27271ul = uh();
                    }
                }
                ulVar = f27271ul;
            } catch (Throwable th3) {
                throw th3;
            }
        }
        return ulVar;
    }

    private static ThreadPoolExecutor xkz() {
        com.bytedance.sdk.component.fby.zb.ul ulVar;
        com.bytedance.sdk.component.fby.zb.ul ulVar2 = f27264dj;
        if (!ycx(ulVar2)) {
            return ulVar2;
        }
        synchronized (yzp.class) {
            try {
                if (ycx(f27264dj)) {
                    try {
                        f27264dj = ycx("ad", f27264dj);
                    } catch (Throwable th2) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+Y/kAK4XNOJRsQ=", "XOs5tCeIYdWFS9Ntgx6s", 268);
                        th2.getMessage();
                    }
                    if (f27264dj == null) {
                        f27264dj = uh();
                    }
                }
                ulVar = f27264dj;
            } catch (Throwable th3) {
                throw th3;
            }
        }
        return ulVar;
    }

    public static ScheduledExecutorService ycx() {
        if (ycx == null) {
            synchronized (yzp.class) {
                try {
                    if (ycx == null) {
                        ycx = Executors.newSingleThreadScheduledExecutor(new com.bytedance.sdk.component.fby.zb.lud("scheduled"));
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return ycx;
    }

    public static ExecutorService zb() {
        return dy();
    }

    public static void dj(com.bytedance.sdk.component.fby.zb.sya syaVar) {
        if (kgy.ycx) {
            return;
        }
        xkz().execute(syaVar);
    }

    public static void lud(com.bytedance.sdk.component.fby.zb.sya syaVar) {
        ry().execute(syaVar);
    }

    public static void sya(Runnable runnable) {
        if (kgy.ycx) {
            return;
        }
        wie().execute(runnable);
    }

    public static void zb(Runnable runnable) {
        if (runnable == null) {
            return;
        }
        com.bytedance.sdk.openadsdk.core.syc.sya().removeCallbacks(runnable);
    }

    public static void zb(com.bytedance.sdk.component.fby.zb.sya syaVar) {
        if (syaVar == null || kgy.ycx) {
            return;
        }
        syc().execute(syaVar);
    }

    public static void sya(com.bytedance.sdk.component.fby.zb.sya syaVar) {
        if (syaVar == null || kgy.ycx) {
            return;
        }
        xkz().execute(syaVar);
    }

    public static void zb(com.bytedance.sdk.component.fby.zb.sya syaVar, int i5) {
        if (syaVar == null || kgy.ycx) {
            return;
        }
        syaVar.setPriority(i5);
        syc().execute(syaVar);
    }

    public static void ycx(Runnable runnable) {
        if (runnable == null || kgy.ycx) {
            return;
        }
        if (lt()) {
            runnable.run();
        } else {
            com.bytedance.sdk.openadsdk.core.syc.sya().post(runnable);
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0022  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private static ul.ycx zb(String str) {
        ul.ycx ycxVar;
        if (TextUtils.isEmpty(str)) {
            str = "unknown";
        }
        ycxVar = new ul.ycx();
        str.getClass();
        switch (str) {
            case "express":
                return ycxVar.ycx(str).ycx(2).zb(4).sya(0).ycx(h.f42227c).ycx(true).lud(-1).dj(10).zb(false);
            case "ad":
                return ycxVar.ycx(str).ycx(4).zb(4).sya(0).ycx(20000L).ycx(true).lud(-1).dj(10).zb(false);
            case "io":
                return ycxVar.ycx(str).ycx(4).zb(10).sya(0).ycx(20000L).ycx(true).lud(-1).dj(10).zb(false);
            case "log":
                return ycxVar.ycx(str).ycx(4).zb(6).sya(2).ycx(20000L).ycx(true).lud(-1).dj(10).zb(false);
            case "net":
                return ycxVar.ycx(str).ycx(10).zb(10).sya(0).ycx(h.f42227c).ycx(true).lud(-1).dj(10).zb(false);
            case "aidl":
                return ycxVar.ycx(str).ycx(2).zb(4).sya(0).ycx(h.f42227c).ycx(true).lud(-1).dj(10).zb(false);
            case "cache":
                return ycxVar.ycx(str).ycx(0).zb(0).sya(0).ycx(5000L).ycx(true).lud(-1).dj(20).zb(false);
            case "image":
                return ycxVar.ycx(str).ycx(3).zb(3).sya(0).ycx(20000L).ycx(true).lud(-1).dj(10).zb(false);
            case "ad_log_up":
                return ycxVar.ycx(str).ycx(1).zb(4).sya(0).ycx(h.f42227c).ycx(true).lud(-1).dj(10).zb(false);
            case "monitor":
                return ycxVar.ycx(str).ycx(2).zb(2).sya(0).ycx(h.f42227c).ycx(true).lud(-1).dj(10).zb(false);
            case "ad_log_save":
                return ycxVar.ycx(str).ycx(1).zb(4).sya(0).ycx(h.f42227c).ycx(new PriorityBlockingQueue()).ycx(true).lud(-1).dj(10).zb(false);
            case "imgdisk":
                return ycxVar.ycx(str).ycx(1).zb(2).sya(3).ycx(h.f42227c).ycx(true).lud(-1).dj(10).zb(false);
            default:
                return ycxVar.ycx(str).ycx(8).zb(16).sya(2).ycx(20000L).ycx(true).lud(-1).dj(10).zb(false);
        }
    }

    public static void ycx(com.bytedance.sdk.component.fby.zb.sya syaVar) {
        if (kgy.ycx) {
            return;
        }
        jw().execute(syaVar);
    }

    public static void ycx(com.bytedance.sdk.component.fby.zb.sya syaVar, int i5) {
        if (syaVar == null || kgy.ycx) {
            return;
        }
        syaVar.setPriority(i5);
        wie().execute(syaVar);
    }

    private static boolean ycx(com.bytedance.sdk.component.fby.zb.ul ulVar) {
        if (ulVar != null) {
            return !ulVar.zb() && com.bytedance.sdk.openadsdk.core.settings.ea.row();
        }
        return true;
    }

    private static com.bytedance.sdk.component.fby.zb.ul ycx(String str, com.bytedance.sdk.component.fby.zb.ul ulVar) {
        ul.ycx ycxVarYcx = ycx(str);
        if (ulVar == null) {
            return ycxVarYcx.ycx();
        }
        ulVar.ycx(ycxVarYcx);
        return ulVar;
    }

    private static ul.ycx ycx(String str) {
        ul.ycx ycxVarZb = zb(str);
        try {
            if (com.bytedance.sdk.openadsdk.core.settings.ea.row()) {
                ycxVarZb.zb(true);
                JSONObject jSONObjectNzi = com.bytedance.sdk.openadsdk.core.settings.ea.zb().nzi();
                JSONObject jSONObjectOptJSONObject = jSONObjectNzi != null ? jSONObjectNzi.optJSONObject(str) : null;
                if (jSONObjectOptJSONObject != null) {
                    ycxVarZb.zb(true);
                    if (jSONObjectOptJSONObject.has("coreSize")) {
                        ycxVarZb.ycx(jSONObjectOptJSONObject.optInt("coreSize"));
                    }
                    if (jSONObjectOptJSONObject.has("maxSize")) {
                        ycxVarZb.zb(jSONObjectOptJSONObject.optInt("maxSize"));
                    }
                    if (jSONObjectOptJSONObject.has("createSize")) {
                        ycxVarZb.sya(jSONObjectOptJSONObject.optInt("createSize"));
                    }
                    if (jSONObjectOptJSONObject.has("keepAlive")) {
                        ycxVarZb.ycx(jSONObjectOptJSONObject.optInt("keepAlive"));
                    }
                    if (jSONObjectOptJSONObject.has("allowCoreTimeOut")) {
                        ycxVarZb.ycx(jSONObjectOptJSONObject.optBoolean("allowCoreTimeOut"));
                    }
                    if (jSONObjectOptJSONObject.has("reportLogThreshold")) {
                        jSONObjectOptJSONObject.optInt("reportLogThreshold");
                    }
                    if (jSONObjectOptJSONObject.has("logTaskCount")) {
                        jSONObjectOptJSONObject.optInt("logTaskCount");
                    }
                }
            }
            return ycxVarZb;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+Y/kAK4XNOJRsQ=", "XOs5oQuubMaEethSgDKvJl3nKg==", 591);
            th2.getMessage();
            return ycxVarZb;
        }
    }
}
