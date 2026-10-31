package com.google.android.libraries.places.internal;

import java.util.concurrent.TimeUnit;

/* loaded from: classes3.dex */
final class zzboz implements Runnable {
    final /* synthetic */ zzbpm zza;
    final /* synthetic */ zzbpa zzb;

    public zzboz(zzbpa zzbpaVar, zzbpm zzbpmVar) {
        this.zza = zzbpmVar;
        this.zzb = zzbpaVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x005b A[Catch: all -> 0x0047, TryCatch #0 {all -> 0x0047, blocks: (B:4:0x0009, B:19:0x0072, B:7:0x0014, B:9:0x0032, B:11:0x003c, B:16:0x0049, B:18:0x005b), top: B:29:0x0009 }] */
    @Override // java.lang.Runnable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void run() {
        zzboy zzboyVar;
        boolean z11;
        synchronized (this.zzb.zzb.zzm) {
            try {
                zzbpa zzbpaVar = this.zzb;
                zzboyVar = null;
                if (zzbpaVar.zza.zzc) {
                    z11 = true;
                } else {
                    zzbpo zzbpoVar = zzbpaVar.zzb;
                    zzbpoVar.zzs = zzbpoVar.zzs.zza(this.zza);
                    zzbpo zzbpoVar2 = this.zzb.zzb;
                    if (zzbpoVar2.zzal(zzbpoVar2.zzs)) {
                        zzbpo zzbpoVar3 = this.zzb.zzb;
                        if (zzbpoVar3.zzq == null || zzbpoVar3.zzq.zza()) {
                            zzbpo zzbpoVar4 = this.zzb.zzb;
                            zzboyVar = new zzboy(zzbpoVar4.zzm);
                            zzbpoVar4.zzA = zzboyVar;
                        } else {
                            zzbpo zzbpoVar5 = this.zzb.zzb;
                            zzbpoVar5.zzs = zzbpoVar5.zzs.zzb();
                            this.zzb.zzb.zzA = null;
                        }
                        z11 = false;
                    }
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        if (z11) {
            zzbpm zzbpmVar = this.zza;
            zzbpmVar.zza.zzo(new zzbpl(this.zzb.zzb, zzbpmVar));
            this.zza.zza.zzh(zzbdo.zzb.zzg("Unneeded hedging"));
            return;
        }
        if (zzboyVar != null) {
            zzbpo zzbpoVar6 = this.zzb.zzb;
            zzboyVar.zzb(zzbpoVar6.zzf.schedule(new zzbpa(zzbpoVar6, zzboyVar), zzbpoVar6.zzk.zzb, TimeUnit.NANOSECONDS));
        }
        this.zzb.zzb.zzai(this.zza);
    }
}
