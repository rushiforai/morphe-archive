package com.google.android.gms.internal.play_billing;

/* loaded from: classes3.dex */
public abstract class l4 {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ int f33449a = 0;

    static {
        try {
            if (System.getenv("PROTOBUF_DISABLE_UNSAFE_UTF8_PROCESSOR_FOR_TESTING") != null) {
                return;
            }
        } catch (SecurityException unused) {
        }
        if (j4.f33430e && j4.f33429d) {
            int i5 = i2.f33421a;
        }
    }

    public static int a(String str, byte[] bArr, int i5, int i11) {
        int i12;
        int i13;
        int length;
        int i14;
        char cCharAt;
        int length2 = str.length();
        int i15 = 0;
        while (true) {
            i12 = i5 + i11;
            if (i15 >= length2 || (i14 = i15 + i5) >= i12 || (cCharAt = str.charAt(i15)) >= 128) {
                break;
            }
            bArr[i14] = (byte) cCharAt;
            i15++;
        }
        if (i15 == length2) {
            return i5 + length2;
        }
        int i16 = i5 + i15;
        while (i15 < length2) {
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
                    if (i16 <= i12 - 4) {
                        i15++;
                        if (i15 != str.length()) {
                            char cCharAt3 = str.charAt(i15);
                            if (Character.isSurrogatePair(cCharAt2, cCharAt3)) {
                                int i17 = i16 + 3;
                                int codePoint = Character.toCodePoint(cCharAt2, cCharAt3);
                                bArr[i16] = (byte) ((codePoint >>> 18) | 240);
                                bArr[i16 + 1] = (byte) (((codePoint >>> 12) & 63) | 128);
                                bArr[i16 + 2] = (byte) (((codePoint >>> 6) & 63) | 128);
                                i16 += 4;
                                bArr[i17] = (byte) ((codePoint & 63) | 128);
                            }
                        }
                        byte[] bytes = str.getBytes(e3.f33385a);
                        length = bytes.length;
                        if (length - i5 > i11) {
                            throw new ArrayIndexOutOfBoundsException("Not enough space in output buffer to encode UTF-8 string");
                        }
                        System.arraycopy(bytes, 0, bArr, i5, length);
                    } else {
                        if (cCharAt2 < 55296 || cCharAt2 > 57343 || ((i13 = i15 + 1) != str.length() && Character.isSurrogatePair(cCharAt2, str.charAt(i13)))) {
                            throw new ArrayIndexOutOfBoundsException("Not enough space in output buffer to encode UTF-8 string");
                        }
                        byte[] bytes2 = str.getBytes(e3.f33385a);
                        length = bytes2.length;
                        if (length - i5 > i11) {
                            throw new ArrayIndexOutOfBoundsException("Not enough space in output buffer to encode UTF-8 string");
                        }
                        System.arraycopy(bytes2, 0, bArr, i5, length);
                    }
                    return i5 + length;
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

    public static int b(String str) throws k4 {
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
                try {
                    int length2 = str.length();
                    while (i11 < length2) {
                        char cCharAt2 = str.charAt(i11);
                        if (cCharAt2 < 2048) {
                            i5 += (127 - cCharAt2) >>> 31;
                        } else {
                            i5 += 2;
                            if (cCharAt2 >= 55296 && cCharAt2 <= 57343) {
                                if (Character.codePointAt(str, i11) < 65536) {
                                    throw new k4("Unpaired surrogate at index " + i11 + " of " + length2);
                                }
                                i11++;
                            }
                        }
                        i11++;
                    }
                    i12 += i5;
                } catch (k4 unused) {
                    return str.getBytes(e3.f33385a).length;
                }
            }
        }
        if (i12 >= length) {
            return i12;
        }
        throw new IllegalArgumentException("UTF-8 length does not fit in int: " + (i12 + 4294967296L));
    }

    public static boolean c(int i5, int i11, byte[] bArr) {
        while (i5 < i11 && bArr[i5] >= 0) {
            i5++;
        }
        if (i5 >= i11) {
            return true;
        }
        while (i5 < i11) {
            int i12 = i5 + 1;
            byte b11 = bArr[i5];
            if (b11 >= 0) {
                i5 = i12;
            } else {
                if (b11 < -32) {
                    if (i12 < i11 && b11 >= -62) {
                        i5 += 2;
                        if (bArr[i12] > -65) {
                        }
                    }
                    return false;
                }
                if (b11 >= -16) {
                    if (i12 >= i11 - 2) {
                        return false;
                    }
                    int i13 = i5 + 2;
                    byte b12 = bArr[i12];
                    if (b12 <= -65) {
                        if ((((b12 + 112) + (b11 << 28)) >> 30) == 0) {
                            int i14 = i5 + 3;
                            if (bArr[i13] <= -65) {
                                i5 += 4;
                                if (bArr[i14] > -65) {
                                }
                            }
                        }
                    }
                    return false;
                }
                if (i12 >= i11 - 1) {
                    return false;
                }
                int i15 = i5 + 2;
                byte b13 = bArr[i12];
                if (b13 > -65 || (b11 == -32 && b13 < -96)) {
                    return false;
                }
                if (b11 == -19 && b13 >= -96) {
                    return false;
                }
                i5 += 3;
                if (bArr[i15] > -65) {
                    return false;
                }
            }
        }
        return true;
    }
}
