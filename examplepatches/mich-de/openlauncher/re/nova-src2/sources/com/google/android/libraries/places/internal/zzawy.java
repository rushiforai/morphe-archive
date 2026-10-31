package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzawy {
    public static /* bridge */ /* synthetic */ void zza(byte b11, byte b12, byte b13, byte b14, char[] cArr, int i5) throws zzauf {
        if (!zze(b12)) {
            if ((((b12 + 112) + (b11 << 28)) >> 30) == 0 && !zze(b13) && !zze(b14)) {
                int i11 = ((b11 & 7) << 18) | ((b12 & 63) << 12) | ((b13 & 63) << 6) | (b14 & 63);
                cArr[i5] = (char) ((i11 >>> 10) + 55232);
                cArr[i5 + 1] = (char) ((i11 & 1023) + 56320);
                return;
            }
        }
        throw zzauf.zzd();
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0013  */
    /* JADX WARN: Removed duplicated region for block: B:12:0x0016 A[PHI: r2
      0x0016: PHI (r2v3 byte) = (r2v2 byte), (r2v9 byte) binds: [B:9:0x0011, B:11:0x0015] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:14:0x001c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static /* bridge */ /* synthetic */ void zzb(byte b11, byte b12, byte b13, char[] cArr, int i5) throws zzauf {
        if (!zze(b12)) {
            if (b11 != -32) {
                if (b11 != -19) {
                    if (!zze(b13)) {
                        cArr[i5] = (char) (((b11 & 15) << 12) | ((b12 & 63) << 6) | (b13 & 63));
                        return;
                    }
                } else if (b12 < -96) {
                    b11 = -19;
                    if (!zze(b13)) {
                    }
                }
            } else if (b12 >= -96) {
                b11 = -32;
                if (b11 != -19) {
                }
            }
        }
        throw zzauf.zzd();
    }

    public static /* bridge */ /* synthetic */ void zzc(byte b11, byte b12, char[] cArr, int i5) throws zzauf {
        if (b11 < -62 || zze(b12)) {
            throw zzauf.zzd();
        }
        cArr[i5] = (char) (((b11 & 31) << 6) | (b12 & 63));
    }

    public static /* bridge */ /* synthetic */ boolean zzd(byte b11) {
        return b11 >= 0;
    }

    private static boolean zze(byte b11) {
        return b11 > -65;
    }
}
