package com.google.android.libraries.places.internal;

import java.util.Iterator;

/* loaded from: classes3.dex */
final class zzbkb implements zzbmk {
    final zzbgf zza;
    boolean zzb = false;
    final /* synthetic */ zzbkd zzc;

    public zzbkb(zzbkd zzbkdVar, zzbgf zzbgfVar) {
        this.zzc = zzbkdVar;
        this.zza = zzbgfVar;
    }

    @Override // com.google.android.libraries.places.internal.zzbmk
    public final zzaye zza(zzaye zzayeVar) {
        Iterator it = this.zzc.zzj.iterator();
        if (!it.hasNext()) {
            return zzayeVar;
        }
        throw null;
    }

    @Override // com.google.android.libraries.places.internal.zzbmk
    public final void zzb(boolean z11) {
        zzbkd.zzC(this.zzc, this.zza, z11);
    }

    @Override // com.google.android.libraries.places.internal.zzbmk
    public final void zzc() {
        this.zzc.zzi.zza(2, "READY");
        zzbdw zzbdwVar = this.zzc.zzk;
        zzbdwVar.zzc(new zzbjy(this));
        zzbdwVar.zzb();
    }

    @Override // com.google.android.libraries.places.internal.zzbmk
    public final void zzd(zzbdo zzbdoVar) {
        zzaym zzaymVar = this.zzc.zzi;
        zzbap zzbapVarZzc = this.zza.zzc();
        zzbkd zzbkdVar = this.zzc;
        zzaymVar.zzb(2, "{0} SHUTDOWN with {1}", zzbapVarZzc, zzbkd.zzK(zzbdoVar));
        this.zzb = true;
        zzbdw zzbdwVar = this.zzc.zzk;
        zzbdwVar.zzc(new zzbjz(this, zzbdoVar));
        zzbdwVar.zzb();
    }

    @Override // com.google.android.libraries.places.internal.zzbmk
    public final void zze() {
        zzmt.zzp(this.zzb, "transportShutdown() must be called before transportTerminated().");
        this.zzc.zzi.zzb(2, "{0} Terminated", this.zza.zzc());
        this.zzc.zzf.zzf(this.zza);
        zzbkd.zzC(this.zzc, this.zza, false);
        Iterator it = this.zzc.zzj.iterator();
        if (it.hasNext()) {
            this.zza.zze();
            throw null;
        }
        zzbdw zzbdwVar = this.zzc.zzk;
        zzbdwVar.zzc(new zzbka(this));
        zzbdwVar.zzb();
    }
}
