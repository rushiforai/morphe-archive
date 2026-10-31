package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
class zzbiq extends zzbbr {
    private final zzbbr zza;

    public zzbiq(zzbbr zzbbrVar) {
        this.zza = zzbbrVar;
    }

    public final String toString() {
        zzmm zzmmVarZzb = zzmn.zzb(this);
        zzmmVarZzb.zzd("delegate", this.zza);
        return zzmmVarZzb.toString();
    }

    @Override // com.google.android.libraries.places.internal.zzayk
    public final zzayo zza(zzbcl zzbclVar, zzayj zzayjVar) {
        return this.zza.zza(zzbclVar, zzayjVar);
    }

    @Override // com.google.android.libraries.places.internal.zzayk
    public final String zzb() {
        return this.zza.zzb();
    }
}
