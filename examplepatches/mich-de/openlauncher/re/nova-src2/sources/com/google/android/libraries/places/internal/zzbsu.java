package com.google.android.libraries.places.internal;

import b.c0;
import com.amplitude.core.events.Plan;
import java.io.IOException;
import java.util.Arrays;
import java.util.Collections;

/* loaded from: classes3.dex */
final class zzbsu {
    private final zzbsr zza;
    private final zzbts zzb;
    private int zzc;
    private final zzbsq zzd;

    public zzbsu(zzbsr zzbsrVar, zzbts zzbtsVar) {
        this.zza = zzbsrVar;
        zzmt.zzc(zzbtsVar, "frameWriter");
        this.zzb = zzbtsVar;
        this.zzc = 65535;
        this.zzd = new zzbsq(this, 0, 65535, null);
    }

    public final int zza(zzbsq zzbsqVar, int i5) {
        if (zzbsqVar == null) {
            int iZzb = this.zzd.zzb(i5);
            zzg();
            return iZzb;
        }
        int iZzb2 = zzbsqVar.zzb(i5);
        zzbst zzbstVar = new zzbst(null);
        zzbsqVar.zzf(zzbsqVar.zze(), zzbstVar);
        if (!zzbstVar.zza()) {
            return iZzb2;
        }
        zzf();
        return iZzb2;
    }

    public final zzbsq zzc(zzbsp zzbspVar, int i5) {
        return new zzbsq(this, i5, this.zzc, zzbspVar);
    }

    public final void zze(boolean z11, zzbsq zzbsqVar, zzbwb zzbwbVar, boolean z12) {
        zzmt.zzc(zzbwbVar, Plan.AMP_PLAN_SOURCE);
        int iZze = zzbsqVar.zze();
        boolean zZzk = zzbsqVar.zzk();
        int iZzg = (int) zzbwbVar.zzg();
        if (zZzk || iZze < iZzg) {
            if (!zZzk && iZze > 0) {
                zzbsqVar.zzj(zzbwbVar, iZze, false);
            }
            zzbsqVar.zzi(zzbwbVar, (int) zzbwbVar.zzg(), z11);
        } else {
            zzbsqVar.zzj(zzbwbVar, iZzg, z11);
        }
        if (z12) {
            zzf();
        }
    }

    public final void zzf() {
        try {
            this.zzb.zzg();
        } catch (IOException e3) {
            throw new RuntimeException(e3);
        }
    }

    public final void zzg() {
        int i5;
        zzbsq[] zzbsqVarArrZzV = this.zza.zzV();
        Collections.shuffle(Arrays.asList(zzbsqVarArrZzV));
        int length = zzbsqVarArrZzV.length;
        int iZzd = this.zzd.zzd();
        while (true) {
            i5 = 0;
            if (length <= 0 || iZzd <= 0) {
                break;
            }
            int iCeil = (int) Math.ceil(iZzd / length);
            for (int i11 = 0; i11 < length && iZzd > 0; i11++) {
                zzbsq zzbsqVar = zzbsqVarArrZzV[i11];
                int iMin = Math.min(iZzd, Math.min(zzbsqVar.zzc(), iCeil));
                if (iMin > 0) {
                    zzbsqVar.zzg(iMin);
                    iZzd -= iMin;
                }
                if (zzbsqVar.zzc() > 0) {
                    zzbsqVarArrZzV[i5] = zzbsqVar;
                    i5++;
                }
            }
            length = i5;
        }
        zzbst zzbstVar = new zzbst(null);
        zzbsq[] zzbsqVarArrZzV2 = this.zza.zzV();
        int length2 = zzbsqVarArrZzV2.length;
        while (i5 < length2) {
            zzbsq zzbsqVar2 = zzbsqVarArrZzV2[i5];
            zzbsqVar2.zzf(zzbsqVar2.zza(), zzbstVar);
            zzbsqVar2.zzh();
            i5++;
        }
        if (zzbstVar.zza()) {
            zzf();
        }
    }

    public final boolean zzh(int i5) {
        if (i5 < 0) {
            throw new IllegalArgumentException(c0.h(i5, "Invalid initial window size: "));
        }
        int i11 = i5 - this.zzc;
        this.zzc = i5;
        for (zzbsq zzbsqVar : this.zza.zzV()) {
            zzbsqVar.zzb(i11);
        }
        return i11 > 0;
    }
}
