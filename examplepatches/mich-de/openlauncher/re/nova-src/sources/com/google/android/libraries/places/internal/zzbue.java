package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzbue {
    private int zza;
    private final int[] zzb = new int[10];

    public final int zza(int i5) {
        return this.zzb[i5];
    }

    public final int zzb() {
        if ((this.zza & 2) != 0) {
            return this.zzb[1];
        }
        return -1;
    }

    public final int zzc(int i5) {
        return (this.zza & 32) != 0 ? this.zzb[5] : i5;
    }

    public final int zzd() {
        return Integer.bitCount(this.zza);
    }

    public final zzbue zze(int i5, int i11, int i12) {
        if (i5 >= 10) {
            return this;
        }
        this.zza = (1 << i5) | this.zza;
        this.zzb[i5] = i12;
        return this;
    }

    public final boolean zzf(int i5) {
        return ((1 << i5) & this.zza) != 0;
    }
}
