package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzbni {
    private final zzbbj zza;
    private zzaze zzb;
    private final zzbnc zzc;
    private boolean zzd = false;

    public zzbni(zzbbj zzbbjVar, zzaze zzazeVar, zzbnc zzbncVar) {
        this.zza = zzbbjVar;
        this.zzb = zzazeVar;
        this.zzc = zzbncVar;
    }

    public static /* bridge */ /* synthetic */ zzaze zzb(zzbni zzbniVar) {
        return zzbniVar.zzc.zzb.zza();
    }

    public static /* bridge */ /* synthetic */ void zzg(zzbni zzbniVar, zzaze zzazeVar) {
        boolean z11;
        zzbniVar.zzb = zzazeVar;
        if (zzazeVar == zzaze.READY || zzazeVar == zzaze.TRANSIENT_FAILURE) {
            z11 = true;
        } else if (zzazeVar != zzaze.IDLE) {
            return;
        } else {
            z11 = false;
        }
        zzbniVar.zzd = z11;
    }

    public final zzaze zzc() {
        return this.zzb;
    }

    public final zzbbj zze() {
        return this.zza;
    }

    public final boolean zzh() {
        return this.zzd;
    }
}
