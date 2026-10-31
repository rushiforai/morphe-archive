package com.bytedance.adsdk.zb;

import android.content.Context;
import android.os.Trace;
import b.c0;
import b.u4;
import java.io.File;

/* loaded from: classes2.dex */
public class lud {

    /* renamed from: dj, reason: collision with root package name */
    private static boolean f22924dj = true;

    /* renamed from: ea, reason: collision with root package name */
    private static volatile com.bytedance.adsdk.zb.dj.fby f22925ea = null;
    private static int fby = 0;

    /* renamed from: jc, reason: collision with root package name */
    private static com.bytedance.adsdk.zb.dj.lud f22926jc = null;

    /* renamed from: jw, reason: collision with root package name */
    private static com.bytedance.adsdk.zb.dj.lt f22927jw = null;

    /* renamed from: lt, reason: collision with root package name */
    private static long[] f22928lt = null;
    private static String[] lud = null;

    /* renamed from: ok, reason: collision with root package name */
    private static volatile com.bytedance.adsdk.zb.dj.ul f22929ok = null;
    private static boolean sya = true;

    /* renamed from: ul, reason: collision with root package name */
    private static int f22930ul = 0;
    public static boolean ycx = false;

    /* renamed from: zb, reason: collision with root package name */
    private static boolean f22931zb = false;

    public static void ycx(String str) {
        if (f22931zb) {
            int i5 = f22930ul;
            if (i5 == 20) {
                fby++;
                return;
            }
            lud[i5] = str;
            f22928lt[i5] = System.nanoTime();
            Trace.beginSection(str);
            f22930ul++;
        }
    }

    public static float zb(String str) {
        int i5 = fby;
        if (i5 > 0) {
            fby = i5 - 1;
            return 0.0f;
        }
        if (!f22931zb) {
            return 0.0f;
        }
        int i11 = f22930ul - 1;
        f22930ul = i11;
        if (i11 == -1) {
            throw new IllegalStateException("Can't end trace section. There are none.");
        }
        if (!str.equals(lud[i11])) {
            throw new IllegalStateException(c0.q(u4.k("Unbalanced trace call ", str, ". Expected "), lud[f22930ul], "."));
        }
        Trace.endSection();
        return (System.nanoTime() - f22928lt[f22930ul]) / 1000000.0f;
    }

    public static com.bytedance.adsdk.zb.dj.fby ycx(Context context) {
        com.bytedance.adsdk.zb.dj.fby fbyVar;
        com.bytedance.adsdk.zb.dj.fby fbyVar2 = f22925ea;
        if (fbyVar2 != null) {
            return fbyVar2;
        }
        synchronized (com.bytedance.adsdk.zb.dj.fby.class) {
            try {
                fbyVar = f22925ea;
                if (fbyVar == null) {
                    com.bytedance.adsdk.zb.dj.ul ulVarZb = zb(context);
                    com.bytedance.adsdk.zb.dj.lt zbVar = f22927jw;
                    if (zbVar == null) {
                        zbVar = new com.bytedance.adsdk.zb.dj.zb();
                    }
                    fbyVar = new com.bytedance.adsdk.zb.dj.fby(ulVarZb, zbVar);
                    f22925ea = fbyVar;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return fbyVar;
    }

    public static boolean ycx() {
        return f22924dj;
    }

    public static com.bytedance.adsdk.zb.dj.ul zb(Context context) {
        com.bytedance.adsdk.zb.dj.ul ulVar;
        if (!sya) {
            return null;
        }
        final Context applicationContext = context.getApplicationContext();
        com.bytedance.adsdk.zb.dj.ul ulVar2 = f22929ok;
        if (ulVar2 != null) {
            return ulVar2;
        }
        synchronized (com.bytedance.adsdk.zb.dj.ul.class) {
            try {
                ulVar = f22929ok;
                if (ulVar == null) {
                    com.bytedance.adsdk.zb.dj.lud ludVar = f22926jc;
                    if (ludVar == null) {
                        ludVar = new com.bytedance.adsdk.zb.dj.lud() { // from class: com.bytedance.adsdk.zb.lud.1
                            @Override // com.bytedance.adsdk.zb.dj.lud
                            public File ycx() {
                                return new File(applicationContext.getCacheDir(), "lottie_network_cache");
                            }
                        };
                    }
                    ulVar = new com.bytedance.adsdk.zb.dj.ul(ludVar);
                    f22929ok = ulVar;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return ulVar;
    }
}
