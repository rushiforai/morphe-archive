package com.google.android.gms.internal.gtm;

import android.content.ComponentName;
import android.os.RemoteException;
import defpackage.l42;
import defpackage.qjg;
import defpackage.vp7;
import java.util.Collections;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zzcb extends zzbr {
    private final zzca zza;
    private final zzcv zzb;
    private final zzfb zzc;
    private zzel zzd;

    public zzcb(zzbu zzbuVar) {
        super(zzbuVar);
        this.zzc = new zzfb(zzbuVar.zzr());
        this.zza = new zzca(this);
        this.zzb = new zzbx(this, zzbuVar);
    }

    public static /* synthetic */ void zzb(zzcb zzcbVar, ComponentName componentName) {
        qjg.a();
        if (zzcbVar.zzd != null) {
            zzcbVar.zzd = null;
            zzcbVar.zzO("Disconnected from device AnalyticsService", componentName);
            zzcbVar.zzs().zzk();
        }
    }

    public static /* synthetic */ void zzi(zzcb zzcbVar, zzel zzelVar) {
        qjg.a();
        zzcbVar.zzd = zzelVar;
        zzcbVar.zzj();
        zzcbVar.zzs().zzj();
    }

    private final void zzj() {
        this.zzc.zzb();
        zzw();
        this.zzb.zzg(((Long) zzeh.zzA.zzb()).longValue());
    }

    public final void zzc() {
        qjg.a();
        zzV();
        try {
            l42.a().b(zzo(), this.zza);
        } catch (IllegalArgumentException | IllegalStateException unused) {
        }
        if (this.zzd != null) {
            this.zzd = null;
            zzs().zzk();
        }
    }

    public final boolean zzf() {
        qjg.a();
        zzV();
        if (this.zzd != null) {
            return true;
        }
        zzel zzelVarZza = this.zza.zza();
        if (zzelVarZza == null) {
            return false;
        }
        this.zzd = zzelVarZza;
        zzj();
        return true;
    }

    public final boolean zzg() {
        qjg.a();
        zzV();
        return this.zzd != null;
    }

    public final boolean zzh(zzek zzekVar) {
        String strZzk;
        vp7.p(zzekVar);
        qjg.a();
        zzV();
        zzel zzelVar = this.zzd;
        if (zzelVar == null) {
            return false;
        }
        if (zzekVar.zzh()) {
            zzw();
            strZzk = zzcs.zzi();
        } else {
            zzw();
            strZzk = zzcs.zzk();
        }
        try {
            zzelVar.zzf(zzekVar.zzg(), zzekVar.zzd(), strZzk, Collections.EMPTY_LIST);
            zzj();
            return true;
        } catch (RemoteException unused) {
            zzN("Failed to send hits to AnalyticsService");
            return false;
        }
    }

    @Override // com.google.android.gms.internal.gtm.zzbr
    public final void zzd() {
    }
}
