package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzbfo implements zzbft {
    final /* synthetic */ zzbfq zza;
    private final zzayn zzb;
    private zzbdo zzc;

    public zzbfo(zzbfq zzbfqVar, zzayn zzaynVar) {
        this.zza = zzbfqVar;
        this.zzb = zzaynVar;
    }

    public static /* bridge */ /* synthetic */ void zzc(zzbfo zzbfoVar, zzbdo zzbdoVar) {
        zzbfoVar.zzc = zzbdoVar;
        zzbfoVar.zza.zzm.zzh(zzbdoVar);
    }

    @Override // com.google.android.libraries.places.internal.zzbft
    public final void zzd(zzbdo zzbdoVar, zzbfs zzbfsVar, zzbcf zzbcfVar) {
        int i5 = zzbvr.zza;
        zzazn zzaznVarZzr = this.zza.zzr();
        if (zzbdoVar.zza() == zzbdj.CANCELLED && zzaznVarZzr != null && zzaznVarZzr.zze()) {
            zzbdoVar = this.zza.zzj.zzb();
            zzbcfVar = new zzbcf();
        }
        this.zza.zzf.execute(new zzbfm(this, zzbvr.zza(), zzbdoVar, zzbcfVar));
    }

    @Override // com.google.android.libraries.places.internal.zzbft
    public final void zze(zzbcf zzbcfVar) {
        this.zza.zzf.execute(new zzbfk(this, zzbvr.zza(), zzbcfVar));
    }

    @Override // com.google.android.libraries.places.internal.zzbqr
    public final void zzf(zzbqq zzbqqVar) {
        this.zza.zzf.execute(new zzbfl(this, zzbvr.zza(), zzbqqVar));
    }

    @Override // com.google.android.libraries.places.internal.zzbqr
    public final void zzg() {
        zzbcj zzbcjVarZzb = this.zza.zzd.zzb();
        if (zzbcjVarZzb == zzbcj.UNARY || zzbcjVarZzb == zzbcj.SERVER_STREAMING) {
            return;
        }
        this.zza.zzf.execute(new zzbfn(this, zzbvr.zza()));
    }
}
