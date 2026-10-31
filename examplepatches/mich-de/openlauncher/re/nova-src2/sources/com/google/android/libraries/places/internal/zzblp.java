package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzblp implements Runnable {
    final /* synthetic */ zzblq zza;

    public zzblp(zzblq zzblqVar) {
        this.zza = zzblqVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        zzblq zzblqVar = this.zza;
        zzbma zzbmaVar = zzblqVar.zzd.zza;
        if (zzbmaVar.zzK != null) {
            zzbmaVar.zzK.remove(zzblqVar);
            if (this.zza.zzd.zza.zzK.isEmpty()) {
                zzbma zzbmaVar2 = this.zza.zzd.zza;
                zzbmaVar2.zzg.zzc(zzbmaVar2.zzL, false);
                this.zza.zzd.zza.zzK = null;
                if (this.zza.zzd.zza.zzP.get()) {
                    zzblz zzblzVar = this.zza.zzd.zza.zzO;
                    Object obj = zzblzVar.zza;
                    zzbdo zzbdoVar = zzbma.zzd;
                    synchronized (obj) {
                        try {
                            if (zzblzVar.zzc != null) {
                                return;
                            }
                            zzblzVar.zzc = zzbdoVar;
                            boolean zIsEmpty = zzblzVar.zzb.isEmpty();
                            if (zIsEmpty) {
                                zzblzVar.zzd.zzN.zzd(zzbdoVar);
                            }
                        } catch (Throwable th2) {
                            throw th2;
                        }
                    }
                }
            }
        }
    }
}
