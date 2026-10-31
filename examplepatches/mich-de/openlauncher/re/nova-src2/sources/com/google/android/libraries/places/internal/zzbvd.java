package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzbvd extends zzbbm {
    final /* synthetic */ zzbvg zzf;

    public zzbvd(zzbvg zzbvgVar) {
        this.zzf = zzbvgVar;
    }

    @Override // com.google.android.libraries.places.internal.zzbbm
    public final void zzb(zzbdo zzbdoVar) {
        this.zzf.zzh.zze(zzaze.TRANSIENT_FAILURE, new zzbbc(zzbbe.zzb(zzbdoVar)));
    }

    @Override // com.google.android.libraries.places.internal.zzbbm
    public final void zzc(zzbbi zzbbiVar) {
        throw new IllegalStateException("GracefulSwitchLoadBalancer must switch to a load balancing policy before handling ResolvedAddresses");
    }

    @Override // com.google.android.libraries.places.internal.zzbbm
    public final void zze() {
    }
}
