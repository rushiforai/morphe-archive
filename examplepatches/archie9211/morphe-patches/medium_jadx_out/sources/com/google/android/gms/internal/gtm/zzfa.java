package com.google.android.gms.internal.gtm;

import android.app.job.JobParameters;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ServiceInfo;
import android.os.Handler;
import defpackage.vp7;
import defpackage.zwe;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zzfa {
    private static Boolean zza;
    private final Handler zzb;
    private final Context zzc;

    public zzfa(Context context) {
        vp7.p(context);
        this.zzc = context;
        this.zzb = new zzfy();
    }

    public static boolean zzh(Context context) {
        vp7.p(context);
        Boolean bool = zza;
        if (bool != null) {
            return bool.booleanValue();
        }
        boolean z = false;
        try {
            ServiceInfo serviceInfo = context.getPackageManager().getServiceInfo(new ComponentName(context, "com.google.android.gms.analytics.AnalyticsService"), 0);
            if (serviceInfo != null) {
                if (serviceInfo.enabled) {
                    z = true;
                }
            }
        } catch (PackageManager.NameNotFoundException unused) {
        }
        zza = Boolean.valueOf(z);
        return z;
    }

    public final int zza(Intent intent, int i, final int i2) {
        try {
            synchronized (zzev.zza) {
                try {
                    zwe zweVar = zzev.zzb;
                    if (zweVar != null && zweVar.b()) {
                        zweVar.c();
                    }
                } finally {
                }
            }
        } catch (SecurityException unused) {
        }
        zzbu zzbuVarZzg = zzbu.zzg(this.zzc);
        final zzeo zzeoVarZzm = zzbuVarZzg.zzm();
        if (intent == null) {
            zzeoVarZzm.zzQ("AnalyticsService started with null intent");
            return 2;
        }
        String action = intent.getAction();
        zzbuVarZzg.zzj();
        zzeoVarZzm.zzP("Local AnalyticsService called. startId, action", Integer.valueOf(i2), action);
        if ("com.google.android.gms.analytics.ANALYTICS_DISPATCH".equals(action)) {
            zzg(new Runnable() { // from class: com.google.android.gms.internal.gtm.zzew
                @Override // java.lang.Runnable
                public final void run() {
                    this.zza.zzc(i2, zzeoVarZzm);
                }
            });
        }
        return 2;
    }

    public final /* synthetic */ void zzc(int i, zzeo zzeoVar) {
        if (((zzez) this.zzc).callServiceStopSelfResult(i)) {
            zzeoVar.zzN("Local AnalyticsService processed last dispatch request");
        }
    }

    public final /* synthetic */ void zzd(zzeo zzeoVar, JobParameters jobParameters) {
        zzeoVar.zzN("AnalyticsJobService processed last dispatch request");
        ((zzez) this.zzc).zza(jobParameters, false);
    }

    public final void zze() {
        zzbu zzbuVarZzg = zzbu.zzg(this.zzc);
        zzeo zzeoVarZzm = zzbuVarZzg.zzm();
        zzbuVarZzg.zzj();
        zzeoVarZzm.zzN("Local AnalyticsService is starting up");
    }

    public final void zzf() {
        zzbu zzbuVarZzg = zzbu.zzg(this.zzc);
        zzeo zzeoVarZzm = zzbuVarZzg.zzm();
        zzbuVarZzg.zzj();
        zzeoVarZzm.zzN("Local AnalyticsService is shutting down");
    }

    public final void zzg(Runnable runnable) {
        zzbu.zzg(this.zzc).zzf().zze(new zzey(this, runnable));
    }

    public final boolean zzi(final JobParameters jobParameters) {
        zzbu zzbuVarZzg = zzbu.zzg(this.zzc);
        final zzeo zzeoVarZzm = zzbuVarZzg.zzm();
        String string = jobParameters.getExtras().getString("action");
        zzbuVarZzg.zzj();
        zzeoVarZzm.zzO("Local AnalyticsJobService called. action", string);
        if (!"com.google.android.gms.analytics.ANALYTICS_DISPATCH".equals(string)) {
            return true;
        }
        zzg(new Runnable() { // from class: com.google.android.gms.internal.gtm.zzex
            @Override // java.lang.Runnable
            public final void run() {
                this.zza.zzd(zzeoVarZzm, jobParameters);
            }
        });
        return true;
    }
}
