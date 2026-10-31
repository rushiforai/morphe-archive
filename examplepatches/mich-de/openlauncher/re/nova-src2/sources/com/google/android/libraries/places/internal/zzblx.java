package com.google.android.libraries.places.internal;

import java.util.List;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/* loaded from: classes3.dex */
final class zzblx extends zzbek {
    final zzbba zza;
    final zzbap zzb;
    final zzbfh zzc;
    final zzbfi zzd;
    List zze;
    zzbkd zzf;
    boolean zzg;
    boolean zzh;
    zzbdv zzi;
    final /* synthetic */ zzbma zzj;

    public zzblx(zzbma zzbmaVar, zzbba zzbbaVar) {
        this.zzj = zzbmaVar;
        this.zze = zzbbaVar.zzc();
        this.zza = zzbbaVar;
        zzbap zzbapVarZzc = zzbap.zzc("Subchannel", zzbmaVar.zzb());
        this.zzb = zzbapVarZzc;
        zzbfi zzbfiVar = new zzbfi(zzbapVarZzc, 0, zzbmaVar.zzw.zza(), "Subchannel for ".concat(zzbbaVar.zzc().toString()));
        this.zzd = zzbfiVar;
        this.zzc = new zzbfh(zzbfiVar, zzbmaVar.zzw);
    }

    public final String toString() {
        return this.zzb.toString();
    }

    @Override // com.google.android.libraries.places.internal.zzbbj
    public final void zza() {
        this.zzj.zzf.zzd();
        zzmt.zzp(this.zzg, "not started");
        this.zzf.zzh();
    }

    @Override // com.google.android.libraries.places.internal.zzbbj
    public final void zzb() {
        zzbdv zzbdvVar;
        this.zzj.zzf.zzd();
        if (this.zzf == null) {
            this.zzh = true;
            return;
        }
        if (!this.zzh) {
            this.zzh = true;
        } else {
            if (!this.zzj.zzQ || (zzbdvVar = this.zzi) == null) {
                return;
            }
            zzbdvVar.zza();
            this.zzi = null;
        }
        zzbma zzbmaVar = this.zzj;
        if (zzbmaVar.zzQ) {
            this.zzf.zzF(zzbma.zzd);
            return;
        }
        this.zzi = zzbmaVar.zzf.zza(new zzbki(new zzblw(this)), 5L, TimeUnit.SECONDS, this.zzj.zzq.zzb());
    }

    @Override // com.google.android.libraries.places.internal.zzbbj
    public final void zzc(zzbbl zzbblVar) {
        this.zzj.zzf.zzd();
        zzmt.zzp(!this.zzg, "already started");
        zzmt.zzp(!this.zzh, "already shutdown");
        zzmt.zzp(!this.zzj.zzQ, "Channel is being terminated");
        this.zzg = true;
        zzbma zzbmaVar = this.zzj;
        List listZzc = this.zza.zzc();
        String strZzb = zzbmaVar.zzb();
        zzbij zzbijVar = zzbmaVar.zzan;
        zzbfw zzbfwVar = zzbmaVar.zzq;
        ScheduledExecutorService scheduledExecutorServiceZzb = zzbmaVar.zzq.zzb();
        zznc zzncVar = this.zzj.zzz;
        zzblv zzblvVar = new zzblv(this, zzbblVar);
        zzbma zzbmaVar2 = this.zzj;
        zzbah zzbahVar = zzbmaVar2.zzX;
        zzbfg zzbfgVarZza = zzbmaVar2.zzT.zza();
        zzbfi zzbfiVar = this.zzd;
        zzbap zzbapVar = this.zzb;
        zzbfh zzbfhVar = this.zzc;
        zzbma zzbmaVar3 = this.zzj;
        zzbkd zzbkdVar = new zzbkd(listZzc, strZzb, null, zzbijVar, zzbfwVar, scheduledExecutorServiceZzb, zzncVar, zzbmaVar3.zzf, zzblvVar, zzbahVar, zzbfgVarZza, zzbfiVar, zzbapVar, zzbfhVar, zzbmaVar3.zzD);
        zzbfi zzbfiVar2 = this.zzj.zzV;
        zzbab zzbabVar = new zzbab();
        zzbabVar.zza("Child Subchannel started");
        zzbabVar.zzb(zzbac.CT_INFO);
        zzbabVar.zzd(this.zzj.zzw.zza());
        zzbabVar.zzc(zzbkdVar);
        zzbfiVar2.zzc(zzbabVar.zze());
        this.zzf = zzbkdVar;
        this.zzj.zzX.zze(zzbkdVar);
        this.zzj.zzJ.add(zzbkdVar);
    }

    @Override // com.google.android.libraries.places.internal.zzbbj
    public final void zzd(List list) {
        this.zzj.zzf.zzd();
        this.zze = list;
        this.zzf.zzG(list);
    }
}
