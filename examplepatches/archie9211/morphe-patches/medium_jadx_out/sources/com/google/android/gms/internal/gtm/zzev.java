package com.google.android.gms.internal.gtm;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import androidx.work.impl.yX.VrhD;
import defpackage.vp7;
import defpackage.zwe;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class zzev {
    static final Object zza = new Object();
    static zwe zzb;
    static Boolean zzc;

    public static boolean zzb(Context context) {
        vp7.p(context);
        Boolean bool = zzc;
        if (bool != null) {
            return bool.booleanValue();
        }
        boolean zZzi = zzff.zzi(context, "com.google.android.gms.analytics.AnalyticsReceiver", false);
        zzc = Boolean.valueOf(zZzi);
        return zZzi;
    }

    public final void zza(Context context, Intent intent) {
        zzbu zzbuVarZzg = zzbu.zzg(context);
        zzeo zzeoVarZzm = zzbuVarZzg.zzm();
        if (intent == null) {
            zzeoVarZzm.zzQ("AnalyticsReceiver called with null intent");
            return;
        }
        String action = intent.getAction();
        zzbuVarZzg.zzj();
        zzeoVarZzm.zzO("Local AnalyticsReceiver got", action);
        if ("com.google.android.gms.analytics.ANALYTICS_DISPATCH".equals(action)) {
            boolean zZzh = zzfa.zzh(context);
            Intent intent2 = new Intent("com.google.android.gms.analytics.ANALYTICS_DISPATCH");
            intent2.setComponent(new ComponentName(context, "com.google.android.gms.analytics.AnalyticsService"));
            intent2.setAction(VrhD.XdjvxKwBAriCfNt);
            synchronized (zza) {
                context.startService(intent2);
                if (!zZzh) {
                    return;
                }
                try {
                    if (zzb == null) {
                        zwe zweVar = new zwe(context, "Analytics WakeLock");
                        zzb = zweVar;
                        zweVar.d(false);
                    }
                    zzb.a(1000L);
                } catch (SecurityException unused) {
                    zzeoVarZzm.zzQ("Analytics service at risk of not starting. For more reliable analytics, add the WAKE_LOCK permission to your manifest. See http://goo.gl/8Rd3yj for instructions.");
                }
            }
        }
    }
}
