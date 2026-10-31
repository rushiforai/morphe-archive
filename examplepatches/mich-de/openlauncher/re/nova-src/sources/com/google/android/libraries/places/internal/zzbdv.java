package com.google.android.libraries.places.internal;

import java.util.concurrent.ScheduledFuture;

/* loaded from: classes3.dex */
public final class zzbdv {
    private final zzbdt zza;
    private final ScheduledFuture zzb;

    public /* synthetic */ zzbdv(zzbdt zzbdtVar, ScheduledFuture scheduledFuture, zzbdu zzbduVar) {
        this.zza = zzbdtVar;
        zzmt.zzc(scheduledFuture, "future");
        this.zzb = scheduledFuture;
    }

    public final void zza() {
        this.zza.zzb = true;
        this.zzb.cancel(false);
    }

    public final boolean zzb() {
        zzbdt zzbdtVar = this.zza;
        return (zzbdtVar.zzc || zzbdtVar.zzb) ? false : true;
    }
}
