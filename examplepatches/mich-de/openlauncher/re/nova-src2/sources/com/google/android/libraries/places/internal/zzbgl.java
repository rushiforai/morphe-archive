package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzbgl implements Runnable {
    final /* synthetic */ StringBuilder zza;
    final /* synthetic */ zzbgz zzb;

    public zzbgl(zzbgz zzbgzVar, StringBuilder sb2) {
        this.zza = sb2;
        this.zzb = zzbgzVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.zzb.zzl(zzbdo.zze.zzg(this.zza.toString()), true);
    }
}
