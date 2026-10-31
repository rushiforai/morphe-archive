package com.google.android.libraries.places.internal;

import java.io.IOException;
import java.util.Collections;
import java.util.logging.Level;
import java.util.logging.Logger;

/* loaded from: classes3.dex */
final class zzbie implements Runnable {
    final /* synthetic */ zzbih zza;
    private final zzbcr zzb;

    public zzbie(zzbih zzbihVar, zzbcr zzbcrVar) {
        this.zza = zzbihVar;
        zzmt.zzc(zzbcrVar, "savedListener");
        this.zzb = zzbcrVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        boolean z11;
        zzbid zzbidVar;
        zzbdw zzbdwVar;
        zzazs zzazsVarZzg;
        zzbcs zzbcsVarZzc;
        Logger logger = zzbih.zzg;
        Level level = Level.FINER;
        if (logger.isLoggable(level)) {
            zzbih.zzg.logp(level, "io.grpc.internal.DnsNameResolver$Resolve", "run", "Attempting DNS resolution of ".concat(String.valueOf(this.zza.zzq)));
        }
        zzbib zzbibVarZzi = null;
        try {
            try {
                zzazsVarZzg = zzbih.zzg(this.zza);
                zzbcsVarZzc = zzbct.zzc();
            } catch (IOException e3) {
                this.zzb.zza(zzbdo.zzp.zzg("Unable to resolve host " + this.zza.zzq).zzf(e3));
            }
            if (zzazsVarZzg != null) {
                if (zzbih.zzg.isLoggable(level)) {
                    zzbih.zzg.logp(level, "io.grpc.internal.DnsNameResolver$Resolve", "run", "Using proxy address " + zzazsVarZzg.toString());
                }
                zzbcsVarZzc.zza(Collections.singletonList(zzazsVarZzg));
            } else {
                zzbibVarZzi = this.zza.zzi(false);
                if (zzbibVarZzi.zza != null) {
                    this.zzb.zza(zzbibVarZzi.zza);
                    z11 = zzbibVarZzi.zza == null;
                    zzbdwVar = this.zza.zzu;
                    zzbidVar = new zzbid(this, z11);
                    zzbdwVar.zzc(zzbidVar);
                    zzbdwVar.zzb();
                }
                if (zzbibVarZzi.zzb != null) {
                    zzbcsVarZzc.zza(zzbibVarZzi.zzb);
                }
                if (zzbibVarZzi.zzc != null) {
                    zzbcsVarZzc.zzc(zzbibVarZzi.zzc);
                }
            }
            this.zzb.zzb(zzbcsVarZzc.zzd());
            z11 = zzbibVarZzi != null && zzbibVarZzi.zza == null;
            zzbdwVar = this.zza.zzu;
            zzbidVar = new zzbid(this, z11);
            zzbdwVar.zzc(zzbidVar);
            zzbdwVar.zzb();
        } catch (Throwable th2) {
            z11 = 0 != 0 && null.zza == null;
            zzbdw zzbdwVar2 = this.zza.zzu;
            zzbdwVar2.zzc(new zzbid(this, z11));
            zzbdwVar2.zzb();
            throw th2;
        }
    }
}
