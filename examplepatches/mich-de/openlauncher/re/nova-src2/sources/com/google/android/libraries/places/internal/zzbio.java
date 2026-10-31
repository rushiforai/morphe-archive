package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
abstract class zzbio implements zzbft {
    public final String toString() {
        zzmm zzmmVarZzb = zzmn.zzb(this);
        zzmmVarZzb.zzd("delegate", zza());
        return zzmmVarZzb.toString();
    }

    public abstract zzbft zza();

    @Override // com.google.android.libraries.places.internal.zzbft
    public void zzd(zzbdo zzbdoVar, zzbfs zzbfsVar, zzbcf zzbcfVar) {
        throw null;
    }

    @Override // com.google.android.libraries.places.internal.zzbft
    public final void zze(zzbcf zzbcfVar) {
        zza().zze(zzbcfVar);
    }

    @Override // com.google.android.libraries.places.internal.zzbqr
    public final void zzf(zzbqq zzbqqVar) {
        zza().zzf(zzbqqVar);
    }

    @Override // com.google.android.libraries.places.internal.zzbqr
    public final void zzg() {
        zza().zzg();
    }
}
