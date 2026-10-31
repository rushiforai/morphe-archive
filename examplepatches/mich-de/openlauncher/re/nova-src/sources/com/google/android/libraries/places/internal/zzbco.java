package com.google.android.libraries.places.internal;

import java.util.concurrent.Executor;
import java.util.concurrent.ScheduledExecutorService;

/* loaded from: classes3.dex */
public final class zzbco {
    private final int zza;
    private final zzbde zzb;
    private final zzbdw zzc;
    private final zzbcu zzd;
    private final ScheduledExecutorService zze;
    private final zzaym zzf;
    private final Executor zzg;

    public /* synthetic */ zzbco(Integer num, zzbde zzbdeVar, zzbdw zzbdwVar, zzbcu zzbcuVar, ScheduledExecutorService scheduledExecutorService, zzaym zzaymVar, Executor executor, String str, zzbcn zzbcnVar) {
        zzmt.zzc(num, "defaultPort not set");
        num.getClass();
        this.zza = 443;
        zzmt.zzc(zzbdeVar, "proxyDetector not set");
        this.zzb = zzbdeVar;
        zzmt.zzc(zzbdwVar, "syncContext not set");
        this.zzc = zzbdwVar;
        zzmt.zzc(zzbcuVar, "serviceConfigParser not set");
        this.zzd = zzbcuVar;
        this.zze = scheduledExecutorService;
        this.zzf = zzaymVar;
        this.zzg = executor;
    }

    public static zzbcm zzb() {
        return new zzbcm();
    }

    public final String toString() {
        zzmm zzmmVarZzb = zzmn.zzb(this);
        zzmmVarZzb.zzb("defaultPort", this.zza);
        zzmmVarZzb.zzd("proxyDetector", this.zzb);
        zzmmVarZzb.zzd("syncContext", this.zzc);
        zzmmVarZzb.zzd("serviceConfigParser", this.zzd);
        zzmmVarZzb.zzd("scheduledExecutorService", this.zze);
        zzmmVarZzb.zzd("channelLogger", this.zzf);
        zzmmVarZzb.zzd("executor", this.zzg);
        zzmmVarZzb.zzd("overrideAuthority", null);
        return zzmmVarZzb.toString();
    }

    public final int zza() {
        return this.zza;
    }

    public final zzbcu zzc() {
        return this.zzd;
    }

    public final zzbde zzd() {
        return this.zzb;
    }

    public final zzbdw zze() {
        return this.zzc;
    }

    public final Executor zzf() {
        return this.zzg;
    }

    public final ScheduledExecutorService zzg() {
        ScheduledExecutorService scheduledExecutorService = this.zze;
        if (scheduledExecutorService != null) {
            return scheduledExecutorService;
        }
        throw new IllegalStateException("ScheduledExecutorService not set in Builder");
    }
}
