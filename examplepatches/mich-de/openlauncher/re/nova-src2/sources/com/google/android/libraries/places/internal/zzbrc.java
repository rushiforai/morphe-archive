package com.google.android.libraries.places.internal;

import java.io.IOException;

/* loaded from: classes3.dex */
final class zzbrc extends zzbrh {
    final zzbvq zza;
    final /* synthetic */ zzbri zzb;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zzbrc(zzbri zzbriVar) {
        super(zzbriVar, null);
        this.zzb = zzbriVar;
        this.zza = zzbvr.zza();
    }

    @Override // com.google.android.libraries.places.internal.zzbrh
    public final void zza() throws IOException {
        int i5;
        zzbwb zzbwbVar = new zzbwb();
        int i11 = zzbvr.zza;
        synchronized (this.zzb.zza) {
            zzbri zzbriVar = this.zzb;
            zzbwbVar.zzn(zzbriVar.zzb, zzbriVar.zzb.zzf());
            this.zzb.zze = false;
            i5 = this.zzb.zzl;
        }
        this.zzb.zzh.zzn(zzbwbVar, zzbwbVar.zzg());
        synchronized (this.zzb.zza) {
            this.zzb.zzl -= i5;
        }
    }
}
