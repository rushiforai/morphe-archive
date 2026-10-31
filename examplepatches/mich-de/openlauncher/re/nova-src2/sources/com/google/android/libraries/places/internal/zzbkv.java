package com.google.android.libraries.places.internal;

import java.util.concurrent.Executor;

/* loaded from: classes3.dex */
final class zzbkv extends zzazv {
    private final zzbam zza;
    private final zzayk zzb;
    private final Executor zzc;
    private final zzbcl zzd;
    private final zzazj zze;
    private zzayj zzf;
    private zzayo zzg;

    public zzbkv(zzbam zzbamVar, zzayk zzaykVar, Executor executor, zzbcl zzbclVar, zzayj zzayjVar) {
        this.zza = zzbamVar;
        this.zzb = zzaykVar;
        this.zzd = zzbclVar;
        executor = zzayjVar.zzn() != null ? zzayjVar.zzn() : executor;
        this.zzc = executor;
        this.zzf = zzayjVar.zzb(executor);
        this.zze = zzazj.zzb();
    }

    @Override // com.google.android.libraries.places.internal.zzbdc, com.google.android.libraries.places.internal.zzayo
    public final void zza(String str, Throwable th2) {
        zzayo zzayoVar = this.zzg;
        if (zzayoVar != null) {
            zzayoVar.zza(str, th2);
        }
    }

    @Override // com.google.android.libraries.places.internal.zzazv, com.google.android.libraries.places.internal.zzayo
    public final void zze(zzayn zzaynVar, zzbcf zzbcfVar) {
        zzbal zzbalVarZza = this.zza.zza(new zzbnr(this.zzd, zzbcfVar, this.zzf));
        zzbdo zzbdoVarZzb = zzbalVarZza.zzb();
        if (!zzbdoVarZzb.zzl()) {
            this.zzc.execute(new zzbku(this, zzaynVar, zzbjd.zzb(zzbdoVarZzb)));
            this.zzg = zzbma.zzj;
            return;
        }
        zzbmg zzbmgVarZzb = ((zzbmj) zzbalVarZza.zzc()).zzb(this.zzd);
        if (zzbmgVarZzb != null) {
            this.zzf = this.zzf.zze(zzbmg.zza, zzbmgVarZzb);
        }
        zzayo zzayoVarZza = this.zzb.zza(this.zzd, this.zzf);
        this.zzg = zzayoVarZza;
        zzayoVarZza.zze(zzaynVar, zzbcfVar);
    }

    @Override // com.google.android.libraries.places.internal.zzazv, com.google.android.libraries.places.internal.zzbdc
    public final zzayo zzf() {
        return this.zzg;
    }
}
