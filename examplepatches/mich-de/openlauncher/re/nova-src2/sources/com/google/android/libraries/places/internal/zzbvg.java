package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzbvg extends zzbvb {
    static final zzbbk zzf = new zzbvf();
    private final zzbbm zzg;
    private final zzbbd zzh;
    private zzbbb zzi;
    private zzbbm zzj;
    private zzbbb zzk;
    private zzbbm zzl;
    private zzaze zzm;
    private zzbbk zzn;
    private boolean zzo;

    public zzbvg(zzbbd zzbbdVar) {
        zzbvd zzbvdVar = new zzbvd(this);
        this.zzg = zzbvdVar;
        this.zzj = zzbvdVar;
        this.zzl = zzbvdVar;
        this.zzh = zzbbdVar;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void zzr() {
        this.zzh.zze(this.zzm, this.zzn);
        this.zzj.zze();
        this.zzj = this.zzl;
        this.zzi = this.zzk;
        this.zzl = this.zzg;
        this.zzk = null;
    }

    @Override // com.google.android.libraries.places.internal.zzbvb, com.google.android.libraries.places.internal.zzbbm
    public final void zze() {
        this.zzl.zze();
        this.zzj.zze();
    }

    @Override // com.google.android.libraries.places.internal.zzbvb
    public final zzbbm zzg() {
        zzbbm zzbbmVar = this.zzl;
        return zzbbmVar == this.zzg ? this.zzj : zzbbmVar;
    }

    public final void zzp(zzbbb zzbbbVar) {
        if (zzbbbVar.equals(this.zzk)) {
            return;
        }
        this.zzl.zze();
        this.zzl = this.zzg;
        this.zzk = null;
        this.zzm = zzaze.CONNECTING;
        this.zzn = zzf;
        if (zzbbbVar.equals(this.zzi)) {
            return;
        }
        zzbve zzbveVar = new zzbve(this);
        zzbbm zzbbmVarZza = zzbbbVar.zza(zzbveVar);
        zzbveVar.zza = zzbbmVarZza;
        this.zzl = zzbbmVarZza;
        this.zzk = zzbbbVar;
        if (this.zzo) {
            return;
        }
        zzr();
    }
}
