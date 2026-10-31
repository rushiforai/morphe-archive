package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzbed implements Runnable {
    final /* synthetic */ zzbdo zza;
    final /* synthetic */ zzbfs zzb;
    final /* synthetic */ zzbcf zzc;
    final /* synthetic */ zzbee zzd;

    public zzbed(zzbee zzbeeVar, zzbdo zzbdoVar, zzbfs zzbfsVar, zzbcf zzbcfVar) {
        this.zza = zzbdoVar;
        this.zzb = zzbfsVar;
        this.zzc = zzbcfVar;
        this.zzd = zzbeeVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.zzd.zzA(this.zza, this.zzb, this.zzc);
    }
}
