package com.google.android.libraries.places.internal;

import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;

/* loaded from: classes3.dex */
final class zzbfa implements zzbpq {
    private static final Logger zza = Logger.getLogger(zzbfa.class.getName());
    private final ScheduledExecutorService zzb;
    private final zzbdw zzc;
    private zzbdv zzd;
    private final zzbij zze;
    private zzbik zzf;

    public zzbfa(zzbij zzbijVar, ScheduledExecutorService scheduledExecutorService, zzbdw zzbdwVar) {
        this.zze = zzbijVar;
        this.zzb = scheduledExecutorService;
        this.zzc = zzbdwVar;
    }

    public final /* synthetic */ void zza() {
        zzbdv zzbdvVar = this.zzd;
        if (zzbdvVar != null && zzbdvVar.zzb()) {
            zzbdvVar.zza();
        }
        this.zzf = null;
    }

    @Override // com.google.android.libraries.places.internal.zzbpq
    public final void zzb() {
        this.zzc.zzd();
        Runnable runnable = new Runnable() { // from class: com.google.android.libraries.places.internal.zzbez
            @Override // java.lang.Runnable
            public final void run() {
                this.zza.zza();
            }
        };
        zzbdw zzbdwVar = this.zzc;
        zzbdwVar.zzc(runnable);
        zzbdwVar.zzb();
    }

    @Override // com.google.android.libraries.places.internal.zzbpq
    public final void zzc(Runnable runnable) {
        this.zzc.zzd();
        if (this.zzf == null) {
            this.zzf = new zzbik();
        }
        zzbdv zzbdvVar = this.zzd;
        if (zzbdvVar == null || !zzbdvVar.zzb()) {
            long jZza = this.zzf.zza();
            this.zzd = this.zzc.zza(runnable, jZza, TimeUnit.NANOSECONDS, this.zzb);
            zza.logp(Level.FINE, "io.grpc.internal.BackoffPolicyRetryScheduler", "schedule", "Scheduling DNS resolution backoff for {0}ns", Long.valueOf(jZza));
        }
    }
}
