package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzbgw implements Runnable {
    final /* synthetic */ zzbdo zza;
    final /* synthetic */ zzbcf zzb;
    final /* synthetic */ zzbgy zzc;

    public zzbgw(zzbgy zzbgyVar, zzbdo zzbdoVar, zzbcf zzbcfVar) {
        this.zza = zzbdoVar;
        this.zzb = zzbcfVar;
        this.zzc = zzbgyVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.zzc.zza.zza(this.zza, this.zzb);
    }
}
