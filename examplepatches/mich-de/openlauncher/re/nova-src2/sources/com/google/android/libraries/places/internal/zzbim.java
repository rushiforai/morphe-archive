package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzbim implements zzbfu {
    final zzbdo zza;
    private final zzbfs zzb;

    public zzbim(zzbdo zzbdoVar, zzbfs zzbfsVar) {
        zzmt.zzf(!zzbdoVar.zzl(), "error must not be OK");
        this.zza = zzbdoVar;
        this.zzb = zzbfsVar;
    }

    @Override // com.google.android.libraries.places.internal.zzbfu
    public final zzbfr zza(zzbcl zzbclVar, zzbcf zzbcfVar, zzayj zzayjVar, zzayx[] zzayxVarArr) {
        return new zzbil(this.zza, this.zzb, zzayxVarArr);
    }

    @Override // com.google.android.libraries.places.internal.zzbau
    public final zzbap zzc() {
        throw new UnsupportedOperationException("Not a real transport");
    }
}
