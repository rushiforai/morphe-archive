package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzbgp implements Runnable {
    final /* synthetic */ Object zza;
    final /* synthetic */ zzbgz zzb;

    public zzbgp(zzbgz zzbgzVar, Object obj) {
        this.zza = obj;
        this.zzb = zzbgzVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.zzb.zzh.zzd(this.zza);
    }
}
