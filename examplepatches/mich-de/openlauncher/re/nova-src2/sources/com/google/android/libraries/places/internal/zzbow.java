package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzbow extends zzayx {
    long zzb;
    final /* synthetic */ zzbpo zzc;
    private final zzbpm zzd;

    public zzbow(zzbpo zzbpoVar, zzbpm zzbpmVar) {
        this.zzc = zzbpoVar;
        this.zzd = zzbpmVar;
    }

    @Override // com.google.android.libraries.places.internal.zzbdr
    public final void zza(long j11) {
        if (this.zzc.zzs.zzf != null) {
            return;
        }
        synchronized (this.zzc.zzm) {
            try {
                if (this.zzc.zzs.zzf == null) {
                    zzbpm zzbpmVar = this.zzd;
                    if (!zzbpmVar.zzb) {
                        long j12 = this.zzb + j11;
                        this.zzb = j12;
                        zzbpo zzbpoVar = this.zzc;
                        if (j12 <= zzbpoVar.zzx) {
                            return;
                        }
                        if (j12 > zzbpoVar.zzo) {
                            zzbpmVar.zzc = true;
                        } else {
                            long jZza = zzbpoVar.zzn.zza(j12 - zzbpoVar.zzx);
                            this.zzc.zzx = this.zzb;
                            if (jZza > this.zzc.zzp) {
                                this.zzd.zzc = true;
                            }
                        }
                        zzbpm zzbpmVar2 = this.zzd;
                        Runnable runnableZzag = zzbpmVar2.zzc ? this.zzc.zzag(zzbpmVar2) : null;
                        if (runnableZzag != null) {
                            runnableZzag.run();
                        }
                    }
                }
            } finally {
            }
        }
    }
}
