package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
abstract class zzbip implements zzbgf {
    public final String toString() {
        zzmm zzmmVarZzb = zzmn.zzb(this);
        zzmmVarZzb.zzd("delegate", zzb());
        return zzmmVarZzb.toString();
    }

    @Override // com.google.android.libraries.places.internal.zzbfu
    public zzbfr zza(zzbcl zzbclVar, zzbcf zzbcfVar, zzayj zzayjVar, zzayx[] zzayxVarArr) {
        throw null;
    }

    public abstract zzbgf zzb();

    @Override // com.google.android.libraries.places.internal.zzbau
    public final zzbap zzc() {
        return zzb().zzc();
    }

    @Override // com.google.android.libraries.places.internal.zzbml
    public void zzd(zzbdo zzbdoVar) {
        zzb().zzd(zzbdoVar);
    }

    @Override // com.google.android.libraries.places.internal.zzbgf
    public final zzaye zze() {
        return zzb().zze();
    }

    @Override // com.google.android.libraries.places.internal.zzbml
    public final Runnable zzj(zzbmk zzbmkVar) {
        zzb().zzj(zzbmkVar);
        return null;
    }
}
