package com.google.android.gms.internal.gtm;

import android.content.ComponentName;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
final class zzbz implements Runnable {
    final /* synthetic */ ComponentName zza;
    final /* synthetic */ zzca zzb;

    public zzbz(zzca zzcaVar, ComponentName componentName) {
        this.zza = componentName;
        this.zzb = zzcaVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        zzcb.zzb(this.zzb.zza, this.zza);
    }
}
