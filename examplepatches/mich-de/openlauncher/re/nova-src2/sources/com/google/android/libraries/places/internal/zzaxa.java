package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzaxa extends zzawz {
    @Override // com.google.android.libraries.places.internal.zzawz
    public final int zza(int i5, byte[] bArr, int i11, int i12) {
        int i13 = 0;
        while (i13 < i12 && bArr[i13] >= 0) {
            i13++;
        }
        if (i13 >= i12) {
            return 0;
        }
        while (i13 < i12) {
            int i14 = i13 + 1;
            byte b11 = bArr[i13];
            if (b11 >= 0) {
                i13 = i14;
            } else {
                if (b11 < -32) {
                    if (i14 >= i12) {
                        return b11;
                    }
                    if (b11 >= -62) {
                        i13 += 2;
                        if (bArr[i14] > -65) {
                        }
                    }
                    return -1;
                }
                if (b11 >= -16) {
                    if (i14 >= i12 - 2) {
                        return zzaxc.zza(bArr, i14, i12);
                    }
                    int i15 = i13 + 2;
                    byte b12 = bArr[i14];
                    if (b12 <= -65) {
                        if ((((b12 + 112) + (b11 << 28)) >> 30) == 0) {
                            int i16 = i13 + 3;
                            if (bArr[i15] <= -65) {
                                i13 += 4;
                                if (bArr[i16] > -65) {
                                }
                            }
                        }
                    }
                    return -1;
                }
                if (i14 >= i12 - 1) {
                    return zzaxc.zza(bArr, i14, i12);
                }
                int i17 = i13 + 2;
                byte b13 = bArr[i14];
                if (b13 > -65 || (b11 == -32 && b13 < -96)) {
                    return -1;
                }
                if (b11 == -19 && b13 >= -96) {
                    return -1;
                }
                i13 += 3;
                if (bArr[i17] > -65) {
                    return -1;
                }
            }
        }
        return 0;
    }
}
