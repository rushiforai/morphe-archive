package com.google.android.gms.internal.gtm;

import android.content.Context;
import android.os.SystemClock;
import defpackage.cp1;
import defpackage.qjg;
import defpackage.vp7;
import defpackage.xd5;
import defpackage.y3b;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zzbu {
    private static volatile zzbu zza;
    private final Context zzb;
    private final Context zzc;
    private final cp1 zzd;
    private final zzcs zze;
    private final zzeo zzf;
    private final qjg zzg;
    private final zzbp zzh;
    private final zzcx zzi;
    private final zzfg zzj;
    private final zzeu zzk;
    private final xd5 zzl;
    private final zzcm zzm;
    private final zzbh zzn;
    private final zzce zzo;
    private final zzcw zzp;

    public zzbu(zzbv zzbvVar) {
        Context contextZza = zzbvVar.zza();
        vp7.q("Application context can't be null", contextZza);
        Context contextZzb = zzbvVar.zzb();
        vp7.p(contextZzb);
        this.zzb = contextZza;
        this.zzc = contextZzb;
        this.zzd = y3b.e;
        this.zze = new zzcs(this);
        zzeo zzeoVar = new zzeo(this);
        zzeoVar.zzW();
        this.zzf = zzeoVar;
        zzm().zzL("Google Analytics " + zzbs.zza + " is starting up. To enable debug logging on a device run:\n  adb shell setprop log.tag.GAv4 DEBUG\n  adb logcat -s GAv4");
        zzeu zzeuVar = new zzeu(this);
        zzeuVar.zzW();
        this.zzk = zzeuVar;
        zzfg zzfgVar = new zzfg(this);
        zzfgVar.zzW();
        this.zzj = zzfgVar;
        zzbp zzbpVar = new zzbp(this, zzbvVar);
        zzcm zzcmVar = new zzcm(this);
        zzbh zzbhVar = new zzbh(this);
        zzce zzceVar = new zzce(this);
        zzcw zzcwVar = new zzcw(this);
        if (qjg.e == null) {
            synchronized (qjg.class) {
                try {
                    if (qjg.e == null) {
                        qjg.e = new qjg(contextZza);
                    }
                } finally {
                }
            }
        }
        qjg qjgVar = qjg.e;
        qjgVar.d = new zzbt(this);
        this.zzg = qjgVar;
        xd5 xd5Var = new xd5(this);
        zzcmVar.zzW();
        this.zzm = zzcmVar;
        zzbhVar.zzW();
        this.zzn = zzbhVar;
        zzceVar.zzW();
        this.zzo = zzceVar;
        zzcwVar.zzW();
        this.zzp = zzcwVar;
        zzcx zzcxVar = new zzcx(this);
        zzcxVar.zzW();
        this.zzi = zzcxVar;
        zzbpVar.zzW();
        this.zzh = zzbpVar;
        zzfg zzfgVarZzq = xd5Var.a.zzq();
        zzfgVarZzq.zzf();
        if (zzfgVarZzq.zze()) {
            zzfgVarZzq.zzc();
        }
        zzfgVarZzq.zzf();
        this.zzl = xd5Var;
        zzbpVar.zzm();
    }

    public static zzbu zzg(Context context) {
        vp7.p(context);
        if (zza == null) {
            synchronized (zzbu.class) {
                try {
                    if (zza == null) {
                        long jElapsedRealtime = SystemClock.elapsedRealtime();
                        zzbu zzbuVar = new zzbu(new zzbv(context));
                        zza = zzbuVar;
                        xd5.a();
                        long jElapsedRealtime2 = SystemClock.elapsedRealtime() - jElapsedRealtime;
                        Long l = (Long) zzeh.zzE.zzb();
                        if (jElapsedRealtime2 > l.longValue()) {
                            zzbuVar.zzm().zzS("Slow initialization (ms)", Long.valueOf(jElapsedRealtime2), l);
                        }
                    }
                } finally {
                }
            }
        }
        return zza;
    }

    private static final void zzs(zzbr zzbrVar) {
        vp7.q("Analytics service not created/initialized", zzbrVar);
        vp7.k("Analytics service not initialized", zzbrVar.zzX());
    }

    public final Context zza() {
        return this.zzb;
    }

    public final Context zzb() {
        return this.zzc;
    }

    public final qjg zzd() {
        vp7.p(this.zzg);
        return this.zzg;
    }

    public final zzbp zzf() {
        zzs(this.zzh);
        return this.zzh;
    }

    public final zzcs zzj() {
        return this.zze;
    }

    public final zzcx zzl() {
        zzs(this.zzi);
        return this.zzi;
    }

    public final zzeo zzm() {
        zzs(this.zzf);
        return this.zzf;
    }

    public final zzeo zzn() {
        return this.zzf;
    }

    public final zzeu zzo() {
        zzs(this.zzk);
        return this.zzk;
    }

    public final zzeu zzp() {
        zzeu zzeuVar = this.zzk;
        if (zzeuVar == null || !zzeuVar.zzX()) {
            return null;
        }
        return zzeuVar;
    }

    public final zzfg zzq() {
        zzs(this.zzj);
        return this.zzj;
    }

    public final cp1 zzr() {
        return this.zzd;
    }
}
