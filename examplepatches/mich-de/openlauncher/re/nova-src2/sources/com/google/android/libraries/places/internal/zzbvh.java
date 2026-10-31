package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzbvh extends zzbvc {
    final /* synthetic */ zzbvi zza;

    public zzbvh(zzbvi zzbviVar) {
        this.zza = zzbviVar;
    }

    @Override // com.google.android.libraries.places.internal.zzbvc, com.google.android.libraries.places.internal.zzbbd
    public final void zze(zzaze zzazeVar, zzbbk zzbbkVar) {
        zzbvi zzbviVar = this.zza;
        if (zzbviVar.zza.zzj.containsKey(zzbviVar.zzb)) {
            this.zza.zzf = zzazeVar;
            this.zza.zzg = zzbbkVar;
            if (this.zza.zzh) {
                return;
            }
            zzbvi zzbviVar2 = this.zza;
            if (zzbviVar2.zza.zzf) {
                return;
            }
            if (zzazeVar == zzaze.IDLE) {
                zzbviVar2.zzd.zzg().zzd();
            }
            this.zza.zza.zzl();
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbvc
    public final zzbbd zzf() {
        return this.zza.zza.zzk;
    }
}
