package com.google.android.libraries.places.internal;

import androidx.compose.ui.node.LayoutNode;
import b.c0;
import java.io.IOException;

/* loaded from: classes3.dex */
public final class zzbsq {
    final /* synthetic */ zzbsu zza;
    private final int zzc;
    private int zzd;
    private int zze;
    private final zzbsp zzf;
    private final zzbwb zzb = new zzbwb();
    private boolean zzg = false;

    public zzbsq(zzbsu zzbsuVar, int i5, int i11, zzbsp zzbspVar) {
        this.zza = zzbsuVar;
        this.zzc = i5;
        this.zzd = i11;
        this.zzf = zzbspVar;
    }

    public final int zza() {
        return this.zze;
    }

    public final int zzb(int i5) {
        if (i5 > 0 && LayoutNode.NotPlacedPlaceOrder - i5 < this.zzd) {
            throw new IllegalArgumentException(c0.h(this.zzc, "Window size overflow for stream: "));
        }
        int i11 = this.zzd + i5;
        this.zzd = i11;
        return i11;
    }

    public final int zzc() {
        return Math.max(0, Math.min(this.zzd, (int) this.zzb.zzg())) - this.zze;
    }

    public final int zzd() {
        return this.zzd;
    }

    public final int zze() {
        return Math.min(this.zzd, this.zza.zzd.zzd);
    }

    public final int zzf(int i5, zzbst zzbstVar) {
        int iMin = Math.min(i5, zze());
        int iZzg = 0;
        while (zzk() && iMin > 0) {
            zzbwb zzbwbVar = this.zzb;
            if (iMin >= zzbwbVar.zzg()) {
                iZzg += (int) zzbwbVar.zzg();
                zzj(zzbwbVar, (int) zzbwbVar.zzg(), this.zzg);
            } else {
                iZzg += iMin;
                zzj(zzbwbVar, iMin, false);
            }
            zzbstVar.zza++;
            iMin = Math.min(i5 - iZzg, zze());
        }
        return iZzg;
    }

    public final void zzg(int i5) {
        this.zze += i5;
    }

    public final void zzh() {
        this.zze = 0;
    }

    public final void zzi(zzbwb zzbwbVar, int i5, boolean z11) {
        this.zzb.zzn(zzbwbVar, i5);
        this.zzg |= z11;
    }

    public final void zzj(zzbwb zzbwbVar, int i5, boolean z11) {
        do {
            int iMin = Math.min(i5, this.zza.zzb.zzd());
            int i11 = -iMin;
            this.zza.zzd.zzb(i11);
            zzb(i11);
            try {
                boolean z12 = false;
                if (zzbwbVar.zzg() == iMin && z11) {
                    z12 = true;
                }
                this.zza.zzb.zzf(z12, this.zzc, zzbwbVar, iMin);
                this.zzf.zzs(iMin);
                i5 -= iMin;
            } catch (IOException e3) {
                throw new RuntimeException(e3);
            }
        } while (i5 > 0);
    }

    public final boolean zzk() {
        return this.zzb.zzg() > 0;
    }
}
