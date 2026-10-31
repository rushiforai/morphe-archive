package com.bytedance.sdk.component.utils;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.SystemClock;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: classes2.dex */
public class hf {
    private static final Object ycx = new Object();

    /* renamed from: zb, reason: collision with root package name */
    private static final Map<ycx, Object> f24108zb = new ConcurrentHashMap();
    private static final AtomicInteger sya = new AtomicInteger();

    /* renamed from: dj, reason: collision with root package name */
    private static AtomicBoolean f24104dj = new AtomicBoolean(false);
    private static volatile int lud = -1;

    /* renamed from: lt, reason: collision with root package name */
    private static volatile long f24106lt = 0;

    /* renamed from: ul, reason: collision with root package name */
    private static volatile int f24107ul = 60000;
    private static uh fby = null;

    /* renamed from: jw, reason: collision with root package name */
    private static final AtomicBoolean f24105jw = new AtomicBoolean(false);

    public interface ycx {
        void ycx(Context context, Intent intent, boolean z11, int i5);
    }

    public static class zb extends BroadcastReceiver {
        private zb() {
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            try {
                hf.zb(context, intent, hf.sya.get() > 0, false);
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "b9oDkBerZtWLf8NUgALkBl76OpoRt1vCg0/eS4kD", "VOAfkAC5YNGF", 268);
            }
        }
    }

    private static int sya(Context context) {
        try {
            NetworkInfo activeNetworkInfo = ((ConnectivityManager) context.getSystemService("connectivity")).getActiveNetworkInfo();
            if (activeNetworkInfo != null && activeNetworkInfo.isAvailable()) {
                int type = activeNetworkInfo.getType();
                if (type != 0) {
                    return type != 1 ? 1 : 4;
                }
                TelephonyManager telephonyManager = (TelephonyManager) context.getSystemService("phone");
                switch (activeNetworkInfo.getSubtype()) {
                    case 1:
                    case 2:
                    case 4:
                    case 7:
                    case 11:
                    case 16:
                        return 2;
                    case 3:
                    case 5:
                    case 6:
                    case 8:
                    case 9:
                    case 10:
                    case 12:
                    case 14:
                    case 15:
                    case 17:
                        return 3;
                    case 13:
                    case 18:
                    case 19:
                        uh uhVar = fby;
                        return (uhVar == null || !uhVar.ycx(context, telephonyManager)) ? 5 : 6;
                    case 20:
                        return 6;
                    default:
                        String subtypeName = activeNetworkInfo.getSubtypeName();
                        return (TextUtils.isEmpty(subtypeName) || !(subtypeName.equalsIgnoreCase("TD-SCDMA") || subtypeName.equalsIgnoreCase("WCDMA") || subtypeName.equalsIgnoreCase("CDMA2000"))) ? 1 : 3;
                }
            }
            return 0;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "b9oDkBerZtWLf8NUgAI=", "XOs5uwaofsiSQeNEnBQ=", Sdk.SDKError.Reason.PLACEMENT_SLEEP_VALUE);
            return 1;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void zb(final Context context, final Intent intent, final boolean z11, final boolean z12) {
        if (!z11 && z12) {
            lud = 0;
        } else if (f24105jw.compareAndSet(false, true)) {
            com.bytedance.sdk.component.fby.ycx.ycx(new Runnable() { // from class: com.bytedance.sdk.component.utils.hf.1
                @Override // java.lang.Runnable
                public void run() {
                    int unused = hf.lud = z12 ? 0 : hf.zb(context);
                    hf.f24105jw.set(false);
                    boolean z13 = hf.lud == 0;
                    boolean z14 = z11;
                    if ((z14 || !z13) && z14) {
                        hf.zb(context, intent, hf.lud, z12);
                    }
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void zb(Context context, Intent intent, int i5, boolean z11) {
        Map<ycx, Object> map = f24108zb;
        if (map == null || map.size() <= 0) {
            return;
        }
        for (ycx ycxVar : map.keySet()) {
            if (ycxVar != null) {
                try {
                    ycxVar.ycx(context, intent, !z11, i5);
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "b9oDkBerZtWLf8NUgAI=", "X+EOlA+wS8aDQQ==", 128);
                }
            }
        }
    }

    public static int ycx(Context context, long j11) {
        long jElapsedRealtime = SystemClock.elapsedRealtime();
        if (f24106lt + j11 <= jElapsedRealtime) {
            return zb(context);
        }
        if (lud == -1) {
            return zb(context);
        }
        if (jElapsedRealtime - f24106lt >= f24107ul) {
            zb(context, (Intent) null, false, false);
        }
        return lud;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static int zb(Context context) {
        lud = sya(context);
        f24106lt = SystemClock.elapsedRealtime();
        return lud;
    }

    public static void ycx(ycx ycxVar, Context context) {
        if (ycxVar == null) {
            return;
        }
        if (!f24104dj.get()) {
            try {
                context.registerReceiver(new zb(), new IntentFilter("android.net.conn.CONNECTIVITY_CHANGE"));
                f24104dj.set(true);
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "b9oDkBerZtWLf8NUgAI=", "SesqnBCobNWuT8NKgwOrBVTgJIEMrg==", 231);
            }
        }
        Map<ycx, Object> map = f24108zb;
        map.put(ycxVar, ycx);
        sya.set(map.size());
    }

    public static void ycx(ycx ycxVar) {
        if (ycxVar == null) {
            return;
        }
        Map<ycx, Object> map = f24108zb;
        map.remove(ycxVar);
        sya.set(map.size());
    }
}
