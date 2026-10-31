package com.google.android.libraries.places.internal;

import java.util.concurrent.ScheduledExecutorService;

/* loaded from: classes3.dex */
final class zzblg extends zzbbd {
    zzbeq zza;
    final /* synthetic */ zzbma zzb;

    public /* synthetic */ zzblg(zzbma zzbmaVar, zzblf zzblfVar) {
        this.zzb = zzbmaVar;
    }

    @Override // com.google.android.libraries.places.internal.zzbbd
    public final /* bridge */ /* synthetic */ zzbbj zza(zzbba zzbbaVar) {
        this.zzb.zzf.zzd();
        zzmt.zzp(!this.zzb.zzQ, "Channel is being terminated");
        return new zzblx(this.zzb, zzbbaVar);
    }

    @Override // com.google.android.libraries.places.internal.zzbbd
    public final zzbdw zzb() {
        return this.zzb.zzf;
    }

    @Override // com.google.android.libraries.places.internal.zzbbd
    public final ScheduledExecutorService zzc() {
        return this.zzb.zzs;
    }

    @Override // com.google.android.libraries.places.internal.zzbbd
    public final void zzd() {
        this.zzb.zzf.zzd();
        zzbld zzbldVar = new zzbld(this);
        zzbdw zzbdwVar = this.zzb.zzf;
        zzbdwVar.zzc(zzbldVar);
        zzbdwVar.zzb();
    }

    @Override // com.google.android.libraries.places.internal.zzbbd
    public final void zze(zzaze zzazeVar, zzbbk zzbbkVar) {
        this.zzb.zzf.zzd();
        zzmt.zzc(zzazeVar, "newState");
        zzble zzbleVar = new zzble(this, zzbbkVar, zzazeVar);
        zzbdw zzbdwVar = this.zzb.zzf;
        zzbdwVar.zzc(zzbleVar);
        zzbdwVar.zzb();
    }
}
