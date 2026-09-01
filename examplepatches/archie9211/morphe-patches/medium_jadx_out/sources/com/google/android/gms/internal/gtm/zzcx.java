package com.google.android.gms.internal.gtm;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.app.job.JobInfo;
import android.app.job.JobScheduler;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.PersistableBundle;
import android.os.SystemClock;
import defpackage.vp7;
import defpackage.y3b;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zzcx extends zzbr {
    private boolean zza;
    private boolean zzb;
    private final AlarmManager zzc;
    private Integer zzd;

    public zzcx(zzbu zzbuVar) {
        super(zzbuVar);
        this.zzc = (AlarmManager) zzo().getSystemService("alarm");
    }

    private final int zzf() {
        Integer numValueOf = this.zzd;
        if (numValueOf == null) {
            numValueOf = Integer.valueOf("analytics".concat(String.valueOf(zzo().getPackageName())).hashCode());
            this.zzd = numValueOf;
        }
        return numValueOf.intValue();
    }

    private final PendingIntent zzg() {
        Context contextZzo = zzo();
        return PendingIntent.getBroadcast(contextZzo, 0, new Intent("com.google.android.gms.analytics.ANALYTICS_DISPATCH").setComponent(new ComponentName(contextZzo, "com.google.android.gms.analytics.AnalyticsReceiver")), zzfs.zza);
    }

    public final void zza() {
        this.zzb = false;
        try {
            this.zzc.cancel(zzg());
        } catch (NullPointerException unused) {
        }
        if (Build.VERSION.SDK_INT >= 24) {
            JobScheduler jobScheduler = (JobScheduler) zzo().getSystemService("jobscheduler");
            int iZzf = zzf();
            zzO("Cancelling job. JobID", Integer.valueOf(iZzf));
            jobScheduler.cancel(iZzf);
        }
    }

    public final void zzb() {
        zzV();
        vp7.r("Receiver not registered", this.zza);
        zzw();
        long jZzd = zzcs.zzd();
        if (jZzd > 0) {
            zza();
            ((y3b) zzC()).getClass();
            long jElapsedRealtime = SystemClock.elapsedRealtime() + jZzd;
            this.zzb = true;
            ((Boolean) zzeh.zzF.zzb()).getClass();
            if (Build.VERSION.SDK_INT < 24) {
                zzN("Scheduling upload with AlarmManager");
                this.zzc.setInexactRepeating(2, jElapsedRealtime, jZzd, zzg());
                return;
            }
            zzN("Scheduling upload with JobScheduler");
            Context contextZzo = zzo();
            ComponentName componentName = new ComponentName(contextZzo, "com.google.android.gms.analytics.AnalyticsJobService");
            int iZzf = zzf();
            PersistableBundle persistableBundle = new PersistableBundle();
            persistableBundle.putString("action", "com.google.android.gms.analytics.ANALYTICS_DISPATCH");
            JobInfo jobInfoBuild = new JobInfo.Builder(iZzf, componentName).setMinimumLatency(jZzd).setOverrideDeadline(jZzd + jZzd).setExtras(persistableBundle).build();
            zzO("Scheduling job. JobID", Integer.valueOf(iZzf));
            zzft.zza(contextZzo, jobInfoBuild, "com.google.android.gms", "DispatchAlarm");
        }
    }

    public final boolean zzc() {
        return this.zza;
    }

    @Override // com.google.android.gms.internal.gtm.zzbr
    public final void zzd() {
        try {
            zza();
            zzw();
            if (zzcs.zzd() > 0) {
                Context contextZzo = zzo();
                ActivityInfo receiverInfo = contextZzo.getPackageManager().getReceiverInfo(new ComponentName(contextZzo, "com.google.android.gms.analytics.AnalyticsReceiver"), 0);
                if (receiverInfo == null || !receiverInfo.enabled) {
                    return;
                }
                zzN("Receiver registered for local dispatch.");
                this.zza = true;
            }
        } catch (PackageManager.NameNotFoundException unused) {
        }
    }

    public final boolean zze() {
        return this.zzb;
    }
}
