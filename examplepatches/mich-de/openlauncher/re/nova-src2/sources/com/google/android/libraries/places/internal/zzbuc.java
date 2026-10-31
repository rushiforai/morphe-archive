package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzbuc {
    private final zzbuc[] zza;
    private final int zzb;
    private final int zzc;

    public zzbuc() {
        this.zza = new zzbuc[256];
        this.zzb = 0;
        this.zzc = 0;
    }

    public zzbuc(int i5, int i11) {
        this.zza = null;
        this.zzb = i5;
        int i12 = i11 & 7;
        this.zzc = i12 == 0 ? 8 : i12;
    }
}
