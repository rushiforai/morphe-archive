package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzaxc {
    private static final zzawz zza;

    static {
        if (zzawx.zzx() && zzawx.zzy()) {
            int i5 = zzarx.zza;
        }
        zza = new zzaxa();
    }

    public static /* bridge */ /* synthetic */ int zza(byte[] bArr, int i5, int i11) {
        int i12 = i11 - i5;
        byte b11 = bArr[i5 - 1];
        if (i12 == 0) {
            if (b11 <= -12) {
                return b11;
            }
            return -1;
        }
        if (i12 == 1) {
            byte b12 = bArr[i5];
            if (b11 > -12 || b12 > -65) {
                return -1;
            }
            return (b12 << 8) ^ b11;
        }
        if (i12 != 2) {
            throw new AssertionError();
        }
        byte b13 = bArr[i5];
        byte b14 = bArr[i5 + 1];
        if (b11 > -12 || b13 > -65 || b14 > -65) {
            return -1;
        }
        return (b14 << 16) ^ ((b13 << 8) ^ b11);
    }

    public static int zzb(String str, byte[] bArr, int i5, int i11) {
        int i12;
        int i13;
        int i14;
        char cCharAt;
        int length = str.length();
        int i15 = 0;
        while (true) {
            i12 = i5 + i11;
            if (i15 >= length || (i14 = i15 + i5) >= i12 || (cCharAt = str.charAt(i15)) >= 128) {
                break;
            }
            bArr[i14] = (byte) cCharAt;
            i15++;
        }
        if (i15 == length) {
            return i5 + length;
        }
        int i16 = i5 + i15;
        while (i15 < length) {
            char cCharAt2 = str.charAt(i15);
            if (cCharAt2 < 128 && i16 < i12) {
                bArr[i16] = (byte) cCharAt2;
                i16++;
            } else if (cCharAt2 < 2048 && i16 <= i12 - 2) {
                bArr[i16] = (byte) ((cCharAt2 >>> 6) | 960);
                bArr[i16 + 1] = (byte) ((cCharAt2 & '?') | 128);
                i16 += 2;
            } else {
                if ((cCharAt2 >= 55296 && cCharAt2 <= 57343) || i16 > i12 - 3) {
                    if (i16 > i12 - 4) {
                        if (cCharAt2 >= 55296 && cCharAt2 <= 57343 && ((i13 = i15 + 1) == str.length() || !Character.isSurrogatePair(cCharAt2, str.charAt(i13)))) {
                            throw new zzaxb(i15, length);
                        }
                        throw new ArrayIndexOutOfBoundsException("Failed writing " + cCharAt2 + " at index " + i16);
                    }
                    int i17 = i15 + 1;
                    if (i17 != str.length()) {
                        char cCharAt3 = str.charAt(i17);
                        if (Character.isSurrogatePair(cCharAt2, cCharAt3)) {
                            int i18 = i16 + 3;
                            int codePoint = Character.toCodePoint(cCharAt2, cCharAt3);
                            bArr[i16] = (byte) ((codePoint >>> 18) | 240);
                            bArr[i16 + 1] = (byte) (((codePoint >>> 12) & 63) | 128);
                            bArr[i16 + 2] = (byte) (((codePoint >>> 6) & 63) | 128);
                            i16 += 4;
                            bArr[i18] = (byte) ((codePoint & 63) | 128);
                            i15 = i17;
                        } else {
                            i15 = i17;
                        }
                    }
                    throw new zzaxb(i15 - 1, length);
                }
                bArr[i16] = (byte) ((cCharAt2 >>> '\f') | 480);
                bArr[i16 + 1] = (byte) (((cCharAt2 >>> 6) & 63) | 128);
                bArr[i16 + 2] = (byte) ((cCharAt2 & '?') | 128);
                i16 += 3;
            }
            i15++;
        }
        return i16;
    }

    public static int zzc(String str) {
        int length = str.length();
        int i5 = 0;
        int i11 = 0;
        while (i11 < length && str.charAt(i11) < 128) {
            i11++;
        }
        int i12 = length;
        while (true) {
            if (i11 >= length) {
                break;
            }
            char cCharAt = str.charAt(i11);
            if (cCharAt < 2048) {
                i12 += (127 - cCharAt) >>> 31;
                i11++;
            } else {
                int length2 = str.length();
                while (i11 < length2) {
                    char cCharAt2 = str.charAt(i11);
                    if (cCharAt2 < 2048) {
                        i5 += (127 - cCharAt2) >>> 31;
                    } else {
                        i5 += 2;
                        if (cCharAt2 >= 55296 && cCharAt2 <= 57343) {
                            if (Character.codePointAt(str, i11) < 65536) {
                                throw new zzaxb(i11, length2);
                            }
                            i11++;
                        }
                    }
                    i11++;
                }
                i12 += i5;
            }
        }
        if (i12 >= length) {
            return i12;
        }
        throw new IllegalArgumentException("UTF-8 length does not fit in int: " + (i12 + 4294967296L));
    }

    public static String zzd(byte[] bArr, int i5, int i11) throws zzauf {
        int i12;
        int length = bArr.length;
        if ((((length - i5) - i11) | i5 | i11) < 0) {
            throw new ArrayIndexOutOfBoundsException(String.format("buffer length=%d, index=%d, size=%d", Integer.valueOf(length), Integer.valueOf(i5), Integer.valueOf(i11)));
        }
        int i13 = i5 + i11;
        char[] cArr = new char[i11];
        int i14 = 0;
        while (i5 < i13) {
            byte b11 = bArr[i5];
            if (!zzawy.zzd(b11)) {
                break;
            }
            i5++;
            cArr[i14] = (char) b11;
            i14++;
        }
        int i15 = i14;
        while (i5 < i13) {
            int i16 = i5 + 1;
            byte b12 = bArr[i5];
            if (zzawy.zzd(b12)) {
                cArr[i15] = (char) b12;
                i15++;
                i5 = i16;
                while (i5 < i13) {
                    byte b13 = bArr[i5];
                    if (zzawy.zzd(b13)) {
                        i5++;
                        cArr[i15] = (char) b13;
                        i15++;
                    }
                }
            } else {
                if (b12 < -32) {
                    if (i16 >= i13) {
                        throw zzauf.zzd();
                    }
                    i12 = i15 + 1;
                    i5 += 2;
                    zzawy.zzc(b12, bArr[i16], cArr, i15);
                } else if (b12 < -16) {
                    if (i16 >= i13 - 1) {
                        throw zzauf.zzd();
                    }
                    i12 = i15 + 1;
                    int i17 = i5 + 2;
                    i5 += 3;
                    zzawy.zzb(b12, bArr[i16], bArr[i17], cArr, i15);
                } else {
                    if (i16 >= i13 - 2) {
                        throw zzauf.zzd();
                    }
                    byte b14 = bArr[i16];
                    int i18 = i5 + 3;
                    byte b15 = bArr[i5 + 2];
                    i5 += 4;
                    zzawy.zza(b12, b14, b15, bArr[i18], cArr, i15);
                    i15 += 2;
                }
                i15 = i12;
            }
        }
        return new String(cArr, 0, i15);
    }

    public static boolean zze(byte[] bArr) {
        return zza.zzb(bArr, 0, bArr.length);
    }

    public static boolean zzf(byte[] bArr, int i5, int i11) {
        return zza.zzb(bArr, 0, i11);
    }
}
