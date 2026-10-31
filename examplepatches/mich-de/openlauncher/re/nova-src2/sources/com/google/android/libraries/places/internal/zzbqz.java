package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzbqz {
    private static final zzbqw zza = new zzbqw(zzbqt.zza);
    private final zzbqt zzb;
    private long zzc;
    private long zzd;
    private long zze;
    private zzbqx zzf;
    private long zzg;
    private final zzbkj zzh;
    private volatile long zzi;

    public zzbqz() {
        this.zzh = zzbkk.zza();
        this.zzb = zzbqt.zza;
    }

    public static zzbqw zza() {
        return zza;
    }

    public final void zzb() {
        this.zzc++;
        this.zzb.zza();
    }

    public final void zzc() {
        this.zzh.zza(1L);
        this.zzi = this.zzb.zza();
    }

    public final void zzd(int i5) {
        if (i5 == 0) {
            return;
        }
        this.zzg += i5;
        this.zzb.zza();
    }

    public final void zze(boolean z11) {
        if (z11) {
            this.zzd++;
        } else {
            this.zze++;
        }
    }

    public final void zzf(zzbqx zzbqxVar) {
        this.zzf = zzbqxVar;
    }

    public /* synthetic */ zzbqz(zzbqt zzbqtVar, zzbqy zzbqyVar) {
        this.zzh = zzbkk.zza();
        this.zzb = zzbqtVar;
    }
}
