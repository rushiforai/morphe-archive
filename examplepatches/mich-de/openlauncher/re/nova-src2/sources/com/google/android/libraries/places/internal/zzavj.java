package com.google.android.libraries.places.internal;

import java.io.IOException;
import java.util.Iterator;
import java.util.Map;

/* loaded from: classes3.dex */
final class zzavj implements zzavt {
    private final zzavf zza;
    private final zzawn zzb;
    private final boolean zzc;
    private final zzatg zzd;

    private zzavj(zzawn zzawnVar, zzatg zzatgVar, zzavf zzavfVar) {
        this.zzb = zzawnVar;
        this.zzc = zzatgVar.zzi(zzavfVar);
        this.zzd = zzatgVar;
        this.zza = zzavfVar;
    }

    public static zzavj zzi(zzawn zzawnVar, zzatg zzatgVar, zzavf zzavfVar) {
        return new zzavj(zzawnVar, zzatgVar, zzavfVar);
    }

    @Override // com.google.android.libraries.places.internal.zzavt
    public final int zza(Object obj) {
        zzawn zzawnVar = this.zzb;
        int iZzb = zzawnVar.zzb(zzawnVar.zzd(obj));
        return this.zzc ? iZzb + this.zzd.zzb(obj).zzc() : iZzb;
    }

    @Override // com.google.android.libraries.places.internal.zzavt
    public final int zzb(Object obj) {
        int iHashCode = this.zzb.zzd(obj).hashCode();
        return this.zzc ? (iHashCode * 53) + this.zzd.zzb(obj).zza.hashCode() : iHashCode;
    }

    @Override // com.google.android.libraries.places.internal.zzavt
    public final Object zzc() {
        zzavf zzavfVar = this.zza;
        return zzavfVar instanceof zzatu ? ((zzatu) zzavfVar).zzat() : zzavfVar.zzaI().zzu();
    }

    @Override // com.google.android.libraries.places.internal.zzavt
    public final void zzd(Object obj) {
        this.zzb.zzm(obj);
        this.zzd.zzf(obj);
    }

    @Override // com.google.android.libraries.places.internal.zzavt
    public final void zze(Object obj, Object obj2) {
        zzavv.zzr(this.zzb, obj, obj2);
        if (this.zzc) {
            zzavv.zzq(this.zzd, obj, obj2);
        }
    }

    @Override // com.google.android.libraries.places.internal.zzavt
    public final void zzf(Object obj, zzavs zzavsVar, zzatf zzatfVar) throws IOException {
        boolean zZzO;
        zzawn zzawnVar = this.zzb;
        Object objZzc = zzawnVar.zzc(obj);
        zzatg zzatgVar = this.zzd;
        zzatk zzatkVarZzc = zzatgVar.zzc(obj);
        while (zzavsVar.zzc() != Integer.MAX_VALUE) {
            try {
                int iZzd = zzavsVar.zzd();
                if (iZzd != 11) {
                    if ((iZzd & 7) == 2) {
                        Object objZzd = zzatgVar.zzd(zzatfVar, this.zza, iZzd >>> 3);
                        if (objZzd != null) {
                            zzatgVar.zzg(zzavsVar, objZzd, zzatfVar, zzatkVarZzc);
                        } else {
                            zZzO = zzawnVar.zzp(objZzc, zzavsVar);
                        }
                    } else {
                        zZzO = zzavsVar.zzO();
                    }
                    if (!zZzO) {
                        break;
                    }
                } else {
                    Object objZzd2 = null;
                    int iZzj = 0;
                    zzask zzaskVarZzp = null;
                    while (zzavsVar.zzc() != Integer.MAX_VALUE) {
                        int iZzd2 = zzavsVar.zzd();
                        if (iZzd2 == 16) {
                            iZzj = zzavsVar.zzj();
                            objZzd2 = zzatgVar.zzd(zzatfVar, this.zza, iZzj);
                        } else if (iZzd2 == 26) {
                            if (objZzd2 != null) {
                                zzatgVar.zzg(zzavsVar, objZzd2, zzatfVar, zzatkVarZzc);
                            } else {
                                zzaskVarZzp = zzavsVar.zzp();
                            }
                        } else if (!zzavsVar.zzO()) {
                            break;
                        }
                    }
                    if (zzavsVar.zzd() != 12) {
                        throw zzauf.zzb();
                    }
                    if (zzaskVarZzp != null) {
                        if (objZzd2 != null) {
                            zzatgVar.zzh(zzaskVarZzp, objZzd2, zzatfVar, zzatkVarZzc);
                        } else {
                            zzawnVar.zzk(objZzc, iZzj, zzaskVarZzp);
                        }
                    }
                }
            } finally {
                zzawnVar.zzn(obj, objZzc);
            }
        }
    }

    @Override // com.google.android.libraries.places.internal.zzavt
    public final boolean zzg(Object obj, Object obj2) {
        zzawn zzawnVar = this.zzb;
        if (!zzawnVar.zzd(obj).equals(zzawnVar.zzd(obj2))) {
            return false;
        }
        if (this.zzc) {
            return this.zzd.zzb(obj).equals(this.zzd.zzb(obj2));
        }
        return true;
    }

    @Override // com.google.android.libraries.places.internal.zzavt
    public final boolean zzh(Object obj) {
        return this.zzd.zzb(obj).zzj();
    }

    @Override // com.google.android.libraries.places.internal.zzavt
    public final void zzj(Object obj, zzasy zzasyVar) throws IOException {
        Iterator itZzf = this.zzd.zzb(obj).zzf();
        while (itZzf.hasNext()) {
            Map.Entry entry = (Map.Entry) itZzf.next();
            zzatj zzatjVar = (zzatj) entry.getKey();
            if (zzatjVar.zze() != zzaxe.MESSAGE || zzatjVar.zzg() || zzatjVar.zzf()) {
                throw new IllegalStateException("Found invalid MessageSet item.");
            }
            if (entry instanceof zzaui) {
                zzasyVar.zzw(zzatjVar.zza(), ((zzaui) entry).zza().zzb());
            } else {
                zzasyVar.zzw(zzatjVar.zza(), entry.getValue());
            }
        }
        zzawn zzawnVar = this.zzb;
        zzawnVar.zzr(zzawnVar.zzd(obj), zzasyVar);
    }
}
