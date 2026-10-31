package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzbjp implements Runnable {
    final /* synthetic */ zzbdo zza;
    final /* synthetic */ zzbkd zzb;

    public zzbjp(zzbkd zzbkdVar, zzbdo zzbdoVar) {
        this.zza = zzbdoVar;
        this.zzb = zzbkdVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        zzaze zzazeVarZza = this.zzb.zzv.zza();
        zzaze zzazeVar = zzaze.SHUTDOWN;
        if (zzazeVarZza == zzazeVar) {
            return;
        }
        this.zzb.zzw = this.zza;
        zzbkd zzbkdVar = this.zzb;
        zzbml zzbmlVar = zzbkdVar.zzu;
        zzbgf zzbgfVar = zzbkdVar.zzt;
        zzbkdVar.zzu = null;
        this.zzb.zzt = null;
        zzbkd.zzA(this.zzb, zzazeVar);
        this.zzb.zzl.zzd();
        if (this.zzb.zzr.isEmpty()) {
            zzbkd.zzB(this.zzb);
        }
        zzbkd.zzz(this.zzb);
        zzbkd zzbkdVar2 = this.zzb;
        if (zzbkdVar2.zzp != null) {
            zzbkdVar2.zzp.zza();
            zzbkd zzbkdVar3 = this.zzb;
            zzbkdVar3.zzq.zzd(this.zza);
            this.zzb.zzp = null;
            this.zzb.zzq = null;
        }
        if (zzbmlVar != null) {
            zzbmlVar.zzd(this.zza);
        }
        if (zzbgfVar != null) {
            zzbgfVar.zzd(this.zza);
        }
    }
}
