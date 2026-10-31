package com.google.android.libraries.places.internal;

import b.c0;

/* loaded from: classes3.dex */
final class zzasd extends zzash {
    private final int zzc;

    public zzasd(byte[] bArr, int i5, int i11) {
        super(bArr);
        zzask.zzj(0, i11, bArr.length);
        this.zzc = i11;
    }

    @Override // com.google.android.libraries.places.internal.zzash, com.google.android.libraries.places.internal.zzask
    public final byte zza(int i5) {
        int i11 = this.zzc;
        if (((i11 - (i5 + 1)) | i5) >= 0) {
            return this.zza[i5];
        }
        if (i5 < 0) {
            throw new ArrayIndexOutOfBoundsException(c0.h(i5, "Index < 0: "));
        }
        throw new ArrayIndexOutOfBoundsException(c0.g(i5, i11, "Index > length: ", ", "));
    }

    @Override // com.google.android.libraries.places.internal.zzash, com.google.android.libraries.places.internal.zzask
    public final byte zzb(int i5) {
        return this.zza[i5];
    }

    @Override // com.google.android.libraries.places.internal.zzash
    public final int zzc() {
        return 0;
    }

    @Override // com.google.android.libraries.places.internal.zzash, com.google.android.libraries.places.internal.zzask
    public final int zzd() {
        return this.zzc;
    }
}
