package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzbpv extends zzbir {
    static final zzayc zza = zzayc.zza("io.grpc.internal.RetryingNameResolver.RESOLUTION_RESULT_LISTENER_KEY");
    private final zzbcv zzb;
    private final zzbpq zzc;
    private final zzbdw zzd;

    public zzbpv(zzbcv zzbcvVar, zzbpq zzbpqVar, zzbdw zzbdwVar) {
        super(zzbcvVar);
        this.zzb = zzbcvVar;
        this.zzc = zzbpqVar;
        this.zzd = zzbdwVar;
    }

    @Override // com.google.android.libraries.places.internal.zzbir, com.google.android.libraries.places.internal.zzbcv
    public final void zzc() {
        super.zzc();
        this.zzc.zzb();
    }

    @Override // com.google.android.libraries.places.internal.zzbir, com.google.android.libraries.places.internal.zzbcv
    public final void zzd(zzbcr zzbcrVar) {
        super.zzd(new zzbpu(this, zzbcrVar));
    }
}
