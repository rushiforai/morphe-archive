package com.google.android.libraries.places.internal;

import java.util.logging.Level;

/* loaded from: classes3.dex */
final class zzbnc implements zzbbl {
    final /* synthetic */ zzbnj zza;
    private zzazf zzb = zzazf.zzb(zzaze.IDLE);
    private zzbni zzc;

    public /* synthetic */ zzbnc(zzbnj zzbnjVar, zzbnb zzbnbVar) {
        this.zza = zzbnjVar;
    }

    @Override // com.google.android.libraries.places.internal.zzbbl
    public final void zza(zzazf zzazfVar) {
        zzbnj.zzf.logp(Level.FINE, "io.grpc.internal.PickFirstLeafLoadBalancer$HealthListener", "onSubchannelState", "Received health status {0} for subchannel {1}", new Object[]{zzazfVar, this.zzc.zza});
        this.zzb = zzazfVar;
        try {
            zzbnj zzbnjVar = this.zza;
            zzbni zzbniVar = (zzbni) zzbnjVar.zzh.get(zzbnjVar.zzi.zzc());
            if (zzbniVar == null || zzbniVar.zzc != this) {
                return;
            }
            this.zza.zzq(this.zzc);
        } catch (IllegalStateException unused) {
            zzbnj.zzf.logp(Level.FINE, "io.grpc.internal.PickFirstLeafLoadBalancer$HealthListener", "onSubchannelState", "Health listener received state change after subchannel was removed");
        }
    }
}
