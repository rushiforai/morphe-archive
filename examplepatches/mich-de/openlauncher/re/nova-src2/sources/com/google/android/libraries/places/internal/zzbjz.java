package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzbjz implements Runnable {
    final /* synthetic */ zzbdo zza;
    final /* synthetic */ zzbkb zzb;

    public zzbjz(zzbkb zzbkbVar, zzbdo zzbdoVar) {
        this.zza = zzbdoVar;
        this.zzb = zzbkbVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        if (this.zzb.zzc.zzv.zza() == zzaze.SHUTDOWN) {
            return;
        }
        zzbkb zzbkbVar = this.zzb;
        if (zzbkbVar.zzc.zzu == zzbkbVar.zza) {
            this.zzb.zzc.zzu = null;
            this.zzb.zzc.zzl.zzd();
            zzbkd.zzA(this.zzb.zzc, zzaze.IDLE);
            return;
        }
        zzbkb zzbkbVar2 = this.zzb;
        zzbkd zzbkdVar = zzbkbVar2.zzc;
        if (zzbkdVar.zzt == zzbkbVar2.zza) {
            zzmt.zzr(zzbkdVar.zzv.zza() == zzaze.CONNECTING, "Expected state is CONNECTING, actual state is %s", this.zzb.zzc.zzv.zza());
            this.zzb.zzc.zzl.zzc();
            if (this.zzb.zzc.zzl.zzg()) {
                zzbkd.zzE(this.zzb.zzc);
                return;
            }
            this.zzb.zzc.zzt = null;
            this.zzb.zzc.zzl.zzd();
            zzbkd.zzD(this.zzb.zzc, this.zza);
        }
    }
}
