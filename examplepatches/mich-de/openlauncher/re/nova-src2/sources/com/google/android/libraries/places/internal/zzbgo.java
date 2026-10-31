package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzbgo implements Runnable {
    final /* synthetic */ zzbdo zza;
    final /* synthetic */ zzbgz zzb;

    public zzbgo(zzbgz zzbgzVar, zzbdo zzbdoVar) {
        this.zza = zzbdoVar;
        this.zzb = zzbgzVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        zzbdo zzbdoVar = this.zza;
        this.zzb.zzh.zza(zzbdoVar.zzi(), zzbdoVar.zzj());
    }
}
