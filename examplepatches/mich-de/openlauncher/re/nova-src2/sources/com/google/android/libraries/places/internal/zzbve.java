package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzbve extends zzbvc {
    zzbbm zza;
    final /* synthetic */ zzbvg zzb;

    public zzbve(zzbvg zzbvgVar) {
        this.zzb = zzbvgVar;
    }

    @Override // com.google.android.libraries.places.internal.zzbvc, com.google.android.libraries.places.internal.zzbbd
    public final void zze(zzaze zzazeVar, zzbbk zzbbkVar) {
        zzbvg zzbvgVar = this.zzb;
        zzbbm zzbbmVar = this.zza;
        if (zzbbmVar == zzbvgVar.zzl) {
            zzmt.zzp(zzbvgVar.zzo, "there's pending lb while current lb has been out of READY");
            this.zzb.zzm = zzazeVar;
            this.zzb.zzn = zzbbkVar;
            if (zzazeVar == zzaze.READY) {
                this.zzb.zzr();
                return;
            }
            return;
        }
        if (zzbbmVar == zzbvgVar.zzj) {
            zzbvgVar.zzo = zzazeVar == zzaze.READY;
            zzbvg zzbvgVar2 = this.zzb;
            if (zzbvgVar2.zzo || zzbvgVar2.zzl == zzbvgVar2.zzg) {
                zzbvgVar2.zzh.zze(zzazeVar, zzbbkVar);
            } else {
                zzbvgVar2.zzr();
            }
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbvc
    public final zzbbd zzf() {
        return this.zzb.zzh;
    }
}
