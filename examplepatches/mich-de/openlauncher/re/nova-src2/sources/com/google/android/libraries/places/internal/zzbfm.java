package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzbfm extends zzbgi {
    final /* synthetic */ zzbvq zza;
    final /* synthetic */ zzbdo zzb;
    final /* synthetic */ zzbcf zzc;
    final /* synthetic */ zzbfo zzd;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zzbfm(zzbfo zzbfoVar, zzbvq zzbvqVar, zzbdo zzbdoVar, zzbcf zzbcfVar) {
        super(zzbfoVar.zza.zzi);
        this.zza = zzbvqVar;
        this.zzb = zzbdoVar;
        this.zzc = zzbcfVar;
        this.zzd = zzbfoVar;
    }

    @Override // com.google.android.libraries.places.internal.zzbgi
    public final void zza() {
        int i5 = zzbvr.zza;
        this.zzd.zza.zzj.zzd();
        zzbdo zzbdoVar = this.zzb;
        zzbcf zzbcfVar = this.zzc;
        zzbfo zzbfoVar = this.zzd;
        if (zzbfoVar.zzc != null) {
            zzbdoVar = zzbfoVar.zzc;
            zzbcfVar = new zzbcf();
        }
        try {
            this.zzd.zzb.zza(zzbdoVar, zzbcfVar);
        } finally {
            this.zzd.zza.zzh.zza(zzbdoVar.zzl());
        }
    }
}
