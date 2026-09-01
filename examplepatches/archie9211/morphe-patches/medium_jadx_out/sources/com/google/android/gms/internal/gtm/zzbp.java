package com.google.android.gms.internal.gtm;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import defpackage.qjg;
import defpackage.vp7;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zzbp extends zzbr {
    private final zzcj zza;

    public zzbp(zzbu zzbuVar, zzbv zzbvVar) {
        super(zzbuVar);
        vp7.p(zzbvVar);
        this.zza = new zzcj(zzbuVar, zzbvVar);
    }

    public final void zzc() {
        zzV();
        Context contextZzo = zzo();
        if (!zzev.zzb(contextZzo) || !zzfa.zzh(contextZzo)) {
            zze(null);
            return;
        }
        Intent intent = new Intent("com.google.android.gms.analytics.ANALYTICS_DISPATCH");
        intent.setComponent(new ComponentName(contextZzo, "com.google.android.gms.analytics.AnalyticsService"));
        contextZzo.startService(intent);
    }

    @Override // com.google.android.gms.internal.gtm.zzbr
    public final void zzd() {
        this.zza.zzW();
    }

    public final void zze(zzcy zzcyVar) {
        zzV();
        qjg qjgVarZzq = zzq();
        zzbn zzbnVar = new zzbn(this, zzcyVar);
        qjgVarZzq.getClass();
        qjgVarZzq.b.submit(zzbnVar);
    }

    public final void zzi() {
        qjg.a();
        this.zza.zzl();
    }

    public final void zzj() {
        qjg.a();
        this.zza.zzm();
    }

    public final void zzk() {
        zzV();
        qjg.a();
        qjg.a();
        zzcj zzcjVar = this.zza;
        zzcjVar.zzV();
        zzcjVar.zzN("Service disconnected");
    }

    public final void zzm() {
        this.zza.zzZ();
    }
}
