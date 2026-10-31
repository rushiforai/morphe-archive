package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzavr implements zzavc {
    private final zzavf zza;
    private final String zzb;
    private final Object[] zzc;
    private final int zzd;

    public zzavr(zzavf zzavfVar, String str, Object[] objArr) {
        this.zza = zzavfVar;
        this.zzb = str;
        this.zzc = objArr;
        char cCharAt = str.charAt(0);
        if (cCharAt < 55296) {
            this.zzd = cCharAt;
            return;
        }
        int i5 = cCharAt & 8191;
        int i11 = 1;
        int i12 = 13;
        while (true) {
            int i13 = i11 + 1;
            char cCharAt2 = str.charAt(i11);
            if (cCharAt2 < 55296) {
                this.zzd = i5 | (cCharAt2 << i12);
                return;
            } else {
                i5 |= (cCharAt2 & 8191) << i12;
                i12 += 13;
                i11 = i13;
            }
        }
    }

    @Override // com.google.android.libraries.places.internal.zzavc
    public final zzavf zza() {
        return this.zza;
    }

    @Override // com.google.android.libraries.places.internal.zzavc
    public final boolean zzb() {
        return (this.zzd & 2) == 2;
    }

    @Override // com.google.android.libraries.places.internal.zzavc
    public final int zzc() {
        int i5 = this.zzd;
        if ((i5 & 1) != 0) {
            return 1;
        }
        return (i5 & 4) == 4 ? 3 : 2;
    }

    public final String zzd() {
        return this.zzb;
    }

    public final Object[] zze() {
        return this.zzc;
    }
}
