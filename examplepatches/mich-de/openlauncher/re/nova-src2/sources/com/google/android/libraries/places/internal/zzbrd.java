package com.google.android.libraries.places.internal;

import java.io.IOException;

/* loaded from: classes3.dex */
final class zzbrd extends zzbrh {
    final zzbvq zza;
    final /* synthetic */ zzbri zzb;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zzbrd(zzbri zzbriVar) {
        super(zzbriVar, null);
        this.zzb = zzbriVar;
        this.zza = zzbvr.zza();
    }

    @Override // com.google.android.libraries.places.internal.zzbrh
    public final void zza() throws IOException {
        zzbwb zzbwbVar = new zzbwb();
        int i5 = zzbvr.zza;
        synchronized (this.zzb.zza) {
            zzbri zzbriVar = this.zzb;
            zzbwbVar.zzn(zzbriVar.zzb, zzbriVar.zzb.zzg());
            this.zzb.zzf = false;
        }
        this.zzb.zzh.zzn(zzbwbVar, zzbwbVar.zzg());
        this.zzb.zzh.flush();
    }
}
