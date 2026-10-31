package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzblj extends zzbcr {
    final zzblg zza;
    final zzbcv zzb;
    final /* synthetic */ zzbma zzc;

    public zzblj(zzbma zzbmaVar, zzblg zzblgVar, zzbcv zzbcvVar) {
        this.zzc = zzbmaVar;
        this.zza = zzblgVar;
        zzmt.zzc(zzbcvVar, "resolver");
        this.zzb = zzbcvVar;
    }

    @Override // com.google.android.libraries.places.internal.zzbcr
    public final void zza(zzbdo zzbdoVar) {
        zzmt.zzf(!zzbdoVar.zzl(), "the error status must not be OK");
        zzblh zzblhVar = new zzblh(this, zzbdoVar);
        zzbdw zzbdwVar = this.zzc.zzf;
        zzbdwVar.zzc(zzblhVar);
        zzbdwVar.zzb();
    }

    @Override // com.google.android.libraries.places.internal.zzbcr
    public final void zzb(zzbct zzbctVar) {
        throw null;
    }
}
