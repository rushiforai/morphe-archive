package com.google.android.gms.internal.gtm;

import android.content.Context;
import android.database.sqlite.SQLiteException;
import defpackage.e9f;
import defpackage.n51;
import defpackage.qjg;
import defpackage.vp7;
import defpackage.y3b;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
final class zzcj extends zzbr {
    private boolean zza;
    private final zzcd zzb;
    private final zzer zzc;
    private final zzep zzd;
    private final zzcb zze;
    private long zzf;
    private final zzcv zzg;
    private final zzcv zzh;
    private final zzfb zzi;
    private long zzj;
    private boolean zzk;

    public zzcj(zzbu zzbuVar, zzbv zzbvVar) {
        super(zzbuVar);
        vp7.p(zzbvVar);
        this.zzf = Long.MIN_VALUE;
        this.zzd = new zzep(zzbuVar);
        this.zzb = new zzcd(zzbuVar);
        this.zzc = new zzer(zzbuVar);
        this.zze = new zzcb(zzbuVar);
        this.zzi = new zzfb(zzC());
        this.zzg = new zzcf(this, zzbuVar);
        this.zzh = new zzcg(this, zzbuVar);
    }

    private final void zzaf() {
        zzcx zzcxVarZzy = zzy();
        if (zzcxVarZzy.zze()) {
            zzcxVarZzy.zza();
        }
    }

    private final void zzag() {
        if (this.zzg.zzh()) {
            zzN("All hits dispatched or no network/service. Going to power save mode");
        }
        this.zzg.zzf();
    }

    private final void zzah() {
        long jZzc;
        zzcx zzcxVarZzy = zzy();
        if (zzcxVarZzy.zzc() && !zzcxVarZzy.zze()) {
            qjg.a();
            zzV();
            try {
                jZzc = this.zzb.zzc();
            } catch (SQLiteException e) {
                zzJ("Failed to get min/max hit times from local store", e);
                jZzc = 0;
            }
            if (jZzc != 0) {
                ((y3b) zzC()).getClass();
                long jAbs = Math.abs(System.currentTimeMillis() - jZzc);
                zzw();
                if (jAbs <= ((Long) zzeh.zzh.zzb()).longValue()) {
                    zzw();
                    zzO("Dispatch alarm scheduled (ms)", Long.valueOf(zzcs.zzd()));
                    zzcxVarZzy.zzb();
                }
            }
        }
    }

    private final boolean zzaj(String str) {
        return e9f.a(zzo()).a.checkCallingOrSelfPermission(str) == 0;
    }

    public static /* bridge */ /* synthetic */ void zzc(zzcj zzcjVar) {
        try {
            zzcjVar.zzb.zza();
            zzcjVar.zzad();
        } catch (SQLiteException e) {
            zzcjVar.zzR("Failed to delete stale hits", e);
        }
        zzcv zzcvVar = zzcjVar.zzh;
        zzcjVar.zzw();
        zzcvVar.zzg(86400000L);
    }

    public final void zzZ() {
        zzV();
        vp7.r("Analytics backend already started", !this.zza);
        this.zza = true;
        qjg qjgVarZzq = zzq();
        zzch zzchVar = new zzch(this);
        qjgVarZzq.getClass();
        qjgVarZzq.b.submit(zzchVar);
    }

    public final long zza() {
        long j = this.zzf;
        if (j != Long.MIN_VALUE) {
            return j;
        }
        zzw();
        long jLongValue = ((Long) zzeh.zze.zzb()).longValue();
        zzfg zzfgVarZzB = zzB();
        zzfgVarZzB.zzV();
        if (!zzfgVarZzB.zzc) {
            return jLongValue;
        }
        zzfg zzfgVarZzB2 = zzB();
        zzfgVarZzB2.zzV();
        return ((long) zzfgVarZzB2.zzd) * 1000;
    }

    public final void zzaa() {
        zzV();
        zzw();
        qjg.a();
        Context contextZza = zzt().zza();
        if (!zzev.zzb(contextZza)) {
            zzQ("AnalyticsReceiver is not registered or is disabled. Register the receiver for reliable dispatching on non-Google Play devices. See http://goo.gl/8Rd3yj for instructions.");
        } else if (!zzfa.zzh(contextZza)) {
            zzI("AnalyticsService is not registered or is disabled. Analytics service at risk of not starting. See http://goo.gl/8Rd3yj for instructions.");
        }
        if (!n51.zzb(contextZza)) {
            zzQ("CampaignTrackingReceiver is not registered, not exported or is disabled. Installation campaign tracking is not possible. See http://goo.gl/8Rd3yj for instructions.");
        }
        zzA().zza();
        if (!zzaj("android.permission.ACCESS_NETWORK_STATE")) {
            zzI("Missing required android.permission.ACCESS_NETWORK_STATE. Google Analytics disabled. See http://goo.gl/8Rd3yj for instructions");
            zzac();
        }
        if (!zzaj("android.permission.INTERNET")) {
            zzI("Missing required android.permission.INTERNET. Google Analytics disabled. See http://goo.gl/8Rd3yj for instructions");
            zzac();
        }
        if (zzfa.zzh(zzo())) {
            zzN("AnalyticsService registered in the app manifest and enabled");
        } else {
            zzw();
            zzQ("AnalyticsService not registered in the app manifest. Hits might not be delivered reliably. See http://goo.gl/8Rd3yj for instructions.");
        }
        if (!this.zzk) {
            zzw();
            if (!this.zzb.zzab()) {
                zzi();
            }
        }
        zzad();
    }

    public final void zzac() {
        zzV();
        qjg.a();
        this.zzk = true;
        this.zze.zzc();
        zzad();
    }

    public final void zzad() {
        long jMin;
        qjg.a();
        zzV();
        if (!this.zzk) {
            zzw();
            if (zza() > 0) {
                if (this.zzb.zzab()) {
                    this.zzd.zzc();
                    zzag();
                    zzaf();
                    return;
                }
                if (!((Boolean) zzeh.zzz.zzb()).booleanValue()) {
                    this.zzd.zza();
                    if (!this.zzd.zzd()) {
                        zzag();
                        zzaf();
                        zzah();
                        return;
                    }
                }
                zzah();
                long jZza = zza();
                long jZzb = zzA().zzb();
                if (jZzb != 0) {
                    ((y3b) zzC()).getClass();
                    jMin = jZza - Math.abs(System.currentTimeMillis() - jZzb);
                    if (jMin <= 0) {
                        zzw();
                        jMin = Math.min(zzcs.zze(), jZza);
                    }
                } else {
                    zzw();
                    jMin = Math.min(zzcs.zze(), jZza);
                }
                zzO("Dispatch scheduled (ms)", Long.valueOf(jMin));
                boolean zZzh = this.zzg.zzh();
                zzcv zzcvVar = this.zzg;
                if (!zZzh) {
                    zzcvVar.zzg(jMin);
                    return;
                } else {
                    this.zzg.zze(Math.max(1L, jMin + zzcvVar.zzb()));
                    return;
                }
            }
        }
        this.zzd.zzc();
        zzag();
        zzaf();
    }

    /* JADX WARN: Code restructure failed: missing block: B:16:0x0059, code lost:
    
        zzN("Store is empty, nothing to dispatch");
        zzag();
        zzaf();
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x00b0, code lost:
    
        if (r11.zze.zzg() == false) goto L41;
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x00b2, code lost:
    
        zzw();
        zzN("Service connected, sending hits to the service");
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x00be, code lost:
    
        if (r6.isEmpty() != false) goto L78;
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x00c0, code lost:
    
        r7 = (com.google.android.gms.internal.gtm.zzek) r6.get(0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x00cc, code lost:
    
        if (r11.zze.zzh(r7) != false) goto L36;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x00cf, code lost:
    
        r4 = java.lang.Math.max(r4, r7.zzb());
        r6.remove(r7);
        zzF("Hit sent do device AnalyticsService for delivery", r7);
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x00df, code lost:
    
        r11.zzb.zzn(r7.zzb());
        r0.add(java.lang.Long.valueOf(r7.zzb()));
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x00f4, code lost:
    
        r0 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x00f5, code lost:
    
        zzJ("Failed to remove hit that was send for delivery", r0);
        zzag();
        zzaf();
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x0107, code lost:
    
        if (r11.zzc.zze() == false) goto L52;
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x0109, code lost:
    
        r6 = r11.zzc.zzc(r6);
        r7 = r6.iterator();
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x0117, code lost:
    
        if (r7.hasNext() == false) goto L71;
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x0119, code lost:
    
        r4 = java.lang.Math.max(r4, ((java.lang.Long) r7.next()).longValue());
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x0128, code lost:
    
        r11.zzb.zzY(r6);
        r0.addAll(r6);
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x0131, code lost:
    
        r0 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:51:0x0132, code lost:
    
        zzJ("Failed to remove successfully uploaded hits", r0);
        zzag();
        zzaf();
     */
    /* JADX WARN: Code restructure failed: missing block: B:53:0x0142, code lost:
    
        if (r0.isEmpty() != false) goto L75;
     */
    /* JADX WARN: Code restructure failed: missing block: B:56:0x0150, code lost:
    
        r0 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:63:0x0173, code lost:
    
        zzJ("Failed to commit local dispatch transaction", r0);
        zzag();
        zzaf();
     */
    /* JADX WARN: Code restructure failed: missing block: B:64:0x017e, code lost:
    
        return false;
     */
    /* JADX WARN: Type inference fix 'apply assigned field type' failed
    java.lang.UnsupportedOperationException: ArgType.getObject(), call class: class jadx.core.dex.instructions.args.ArgType$UnknownArg
    	at jadx.core.dex.instructions.args.ArgType.getObject(ArgType.java:593)
    	at jadx.core.dex.attributes.nodes.ClassTypeVarsAttr.getTypeVarsMapFor(ClassTypeVarsAttr.java:35)
    	at jadx.core.dex.nodes.utils.TypeUtils.replaceClassGenerics(TypeUtils.java:177)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.insertExplicitUseCast(FixTypesVisitor.java:397)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryFieldTypeWithNewCasts(FixTypesVisitor.java:359)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.applyFieldType(FixTypesVisitor.java:309)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:94)
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean zzae() {
        /*
            Method dump skipped, instruction units count: 383
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.gtm.zzcj.zzae():boolean");
    }

    @Override // com.google.android.gms.internal.gtm.zzbr
    public final void zzd() {
        this.zzb.zzW();
        this.zzc.zzW();
        this.zze.zzW();
    }

    public final void zzf(zzcy zzcyVar) {
        zzg(zzcyVar, this.zzj);
    }

    public final void zzg(zzcy zzcyVar, long j) {
        long jAbs;
        qjg.a();
        zzV();
        long jZzb = zzA().zzb();
        if (jZzb != 0) {
            ((y3b) zzC()).getClass();
            jAbs = Math.abs(System.currentTimeMillis() - jZzb);
        } else {
            jAbs = -1;
        }
        zzF("Dispatching local hits. Elapsed time since last dispatch (ms)", Long.valueOf(jAbs));
        zzw();
        zzi();
        try {
            zzae();
            zzA().zzi();
            zzad();
            if (zzcyVar != null) {
                zzcyVar.zza(null);
            }
            if (this.zzj != j) {
                this.zzd.zzb();
            }
        } catch (Exception e) {
            zzJ("Local dispatch failed", e);
            zzA().zzi();
            zzad();
            if (zzcyVar != null) {
                zzcyVar.zza(e);
            }
        }
    }

    public final void zzi() {
        if (this.zzk) {
            return;
        }
        zzw();
        if (!zzcs.zzl() || this.zze.zzg()) {
            return;
        }
        zzw();
        if (this.zzi.zzc(((Long) zzeh.zzC.zzb()).longValue())) {
            this.zzi.zzb();
            zzN("Connecting to service");
            if (this.zze.zzf()) {
                zzN("Connected to service");
                this.zzi.zza();
                zzm();
            }
        }
    }

    public final void zzl() {
        qjg.a();
        ((y3b) zzC()).getClass();
        this.zzj = System.currentTimeMillis();
    }

    public final void zzm() {
        qjg.a();
        zzw();
        qjg.a();
        zzV();
        zzw();
        zzw();
        if (!zzcs.zzl()) {
            zzQ("Service client disabled. Can't dispatch local hits to device AnalyticsService");
        }
        if (!this.zze.zzg()) {
            zzN("Service not connected");
            return;
        }
        if (this.zzb.zzab()) {
            return;
        }
        zzN("Dispatching local hits to device AnalyticsService");
        while (true) {
            try {
                zzcd zzcdVar = this.zzb;
                zzw();
                List listZzj = zzcdVar.zzj(zzcs.zzh());
                if (listZzj.isEmpty()) {
                    zzad();
                    return;
                }
                while (!listZzj.isEmpty()) {
                    zzek zzekVar = (zzek) listZzj.get(0);
                    if (!this.zze.zzh(zzekVar)) {
                        zzad();
                        return;
                    }
                    listZzj.remove(zzekVar);
                    try {
                        this.zzb.zzn(zzekVar.zzb());
                    } catch (SQLiteException e) {
                        zzJ("Failed to remove hit that was send for delivery", e);
                        zzag();
                        zzaf();
                        return;
                    }
                }
            } catch (SQLiteException e2) {
                zzJ("Failed to read hits from store", e2);
                zzag();
                zzaf();
                return;
            }
        }
    }
}
