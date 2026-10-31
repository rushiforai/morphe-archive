package com.google.android.libraries.places.internal;

import java.util.LinkedHashSet;

/* loaded from: classes3.dex */
final class zzbln implements Runnable {
    final /* synthetic */ zzblq zza;
    final /* synthetic */ zzbls zzb;

    public zzbln(zzbls zzblsVar, zzblq zzblqVar) {
        this.zza = zzblqVar;
        this.zzb = zzblsVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        if (this.zzb.zzb.get() != zzbma.zzi) {
            this.zza.zzl();
            return;
        }
        zzbls zzblsVar = this.zzb;
        if (zzblsVar.zza.zzK == null) {
            zzblsVar.zza.zzK = new LinkedHashSet();
            zzbma zzbmaVar = this.zzb.zza;
            zzbmaVar.zzg.zzc(zzbmaVar.zzL, true);
        }
        zzbls zzblsVar2 = this.zzb;
        zzblsVar2.zza.zzK.add(this.zza);
    }
}
