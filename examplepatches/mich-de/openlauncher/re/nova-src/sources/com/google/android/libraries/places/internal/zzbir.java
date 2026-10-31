package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
class zzbir extends zzbcv {
    private final zzbcv zza;

    public zzbir(zzbcv zzbcvVar) {
        this.zza = zzbcvVar;
    }

    public final String toString() {
        zzmm zzmmVarZzb = zzmn.zzb(this);
        zzmmVarZzb.zzd("delegate", this.zza);
        return zzmmVarZzb.toString();
    }

    @Override // com.google.android.libraries.places.internal.zzbcv
    public final String zza() {
        return this.zza.zza();
    }

    @Override // com.google.android.libraries.places.internal.zzbcv
    public final void zzb() {
        this.zza.zzb();
    }

    @Override // com.google.android.libraries.places.internal.zzbcv
    public void zzc() {
        this.zza.zzc();
    }

    @Override // com.google.android.libraries.places.internal.zzbcv
    public void zzd(zzbcr zzbcrVar) {
        this.zza.zzd(zzbcrVar);
    }
}
