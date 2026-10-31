package com.google.android.libraries.places.internal;

import java.util.logging.Level;
import java.util.logging.Logger;

/* loaded from: classes3.dex */
final class zzblh implements Runnable {
    final /* synthetic */ zzbdo zza;
    final /* synthetic */ zzblj zzb;

    public zzblh(zzblj zzbljVar, zzbdo zzbdoVar) {
        this.zza = zzbdoVar;
        this.zzb = zzbljVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        Logger logger = zzbma.zza;
        Level level = Level.WARNING;
        zzblj zzbljVar = this.zzb;
        zzbap zzbapVarZzc = zzbljVar.zzc.zzc();
        zzbdo zzbdoVar = this.zza;
        logger.logp(level, "io.grpc.internal.ManagedChannelImpl$NameResolverListener", "handleErrorInSyncContext", "[{0}] Failed to resolve name. status={1}", new Object[]{zzbapVarZzc, zzbdoVar});
        zzbljVar.zzc.zzY.zzf();
        zzbma zzbmaVar = zzbljVar.zzc;
        if (zzbmaVar.zzak != 3) {
            zzbmaVar.zzW.zzb(3, "Failed to resolve name: {0}", zzbdoVar);
            zzbljVar.zzc.zzak = 3;
        }
        zzblg zzblgVar = zzbljVar.zza;
        if (zzblgVar != zzbljVar.zzc.zzG) {
            return;
        }
        zzblgVar.zza.zza().zzb(zzbdoVar);
    }
}
