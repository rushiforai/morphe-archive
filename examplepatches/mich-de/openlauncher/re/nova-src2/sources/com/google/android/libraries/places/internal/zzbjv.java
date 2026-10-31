package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzbjv extends zzbip {
    private final zzbgf zza;
    private final zzbfg zzb;

    public /* synthetic */ zzbjv(zzbgf zzbgfVar, zzbfg zzbfgVar, zzbju zzbjuVar) {
        this.zza = zzbgfVar;
        this.zzb = zzbfgVar;
    }

    @Override // com.google.android.libraries.places.internal.zzbip, com.google.android.libraries.places.internal.zzbfu
    public final zzbfr zza(zzbcl zzbclVar, zzbcf zzbcfVar, zzayj zzayjVar, zzayx[] zzayxVarArr) {
        return new zzbjt(this, this.zza.zza(zzbclVar, zzbcfVar, zzayjVar, zzayxVarArr));
    }

    @Override // com.google.android.libraries.places.internal.zzbip
    public final zzbgf zzb() {
        return this.zza;
    }
}
