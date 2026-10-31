package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzbus extends zzajp {
    private final zzayo zzc;

    public zzbus(zzayo zzayoVar) {
        this.zzc = zzayoVar;
    }

    @Override // com.google.android.libraries.places.internal.zzajp
    public final String zze() {
        zzmm zzmmVarZzb = zzmn.zzb(this);
        zzmmVarZzb.zzd("clientCall", this.zzc);
        return zzmmVarZzb.toString();
    }

    @Override // com.google.android.libraries.places.internal.zzajp
    public final void zzk() {
        this.zzc.zza("GrpcFuture was cancelled", null);
    }

    @Override // com.google.android.libraries.places.internal.zzajp
    public final boolean zzl(Object obj) {
        return super.zzl(obj);
    }

    @Override // com.google.android.libraries.places.internal.zzajp
    public final boolean zzm(Throwable th2) {
        return super.zzm(th2);
    }
}
