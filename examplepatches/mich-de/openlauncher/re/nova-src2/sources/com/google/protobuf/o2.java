package com.google.protobuf;

/* loaded from: classes.dex */
public abstract class o2 {

    /* renamed from: a, reason: collision with root package name */
    public static final k f34936a;

    static {
        if (m2.f34913e && m2.f34912d) {
            Class cls = e.f34844a;
        }
        f34936a = new k();
    }

    public static int a(int i5, int i11, byte[] bArr) {
        byte b11 = bArr[i5 - 1];
        int i12 = i11 - i5;
        if (i12 == 0) {
            if (b11 > -12) {
                return -1;
            }
            return b11;
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

    public static int b(String str, byte[] bArr, int i5, int i11) {
        int i12;
        int i13;
        char cCharAt;
        f34936a.getClass();
        int length = str.length();
        int i14 = i11 + i5;
        int i15 = 0;
        while (i15 < length && (i13 = i15 + i5) < i14 && (cCharAt = str.charAt(i15)) < 128) {
            bArr[i13] = (byte) cCharAt;
            i15++;
        }
        if (i15 == length) {
            return i5 + length;
        }
        int i16 = i5 + i15;
        while (i15 < length) {
            char cCharAt2 = str.charAt(i15);
            if (cCharAt2 < 128 && i16 < i14) {
                bArr[i16] = (byte) cCharAt2;
                i16++;
            } else if (cCharAt2 < 2048 && i16 <= i14 - 2) {
                int i17 = i16 + 1;
                bArr[i16] = (byte) ((cCharAt2 >>> 6) | 960);
                i16 += 2;
                bArr[i17] = (byte) ((cCharAt2 & '?') | 128);
            } else {
                if ((cCharAt2 >= 55296 && 57343 >= cCharAt2) || i16 > i14 - 3) {
                    if (i16 > i14 - 4) {
                        if (55296 <= cCharAt2 && cCharAt2 <= 57343 && ((i12 = i15 + 1) == str.length() || !Character.isSurrogatePair(cCharAt2, str.charAt(i12)))) {
                            throw new n2(i15, length);
                        }
                        throw new ArrayIndexOutOfBoundsException("Failed writing " + cCharAt2 + " at index " + i16);
                    }
                    int i18 = i15 + 1;
                    if (i18 != str.length()) {
                        char cCharAt3 = str.charAt(i18);
                        if (Character.isSurrogatePair(cCharAt2, cCharAt3)) {
                            int codePoint = Character.toCodePoint(cCharAt2, cCharAt3);
                            bArr[i16] = (byte) ((codePoint >>> 18) | 240);
                            bArr[i16 + 1] = (byte) (((codePoint >>> 12) & 63) | 128);
                            int i19 = i16 + 3;
                            bArr[i16 + 2] = (byte) (((codePoint >>> 6) & 63) | 128);
                            i16 += 4;
                            bArr[i19] = (byte) ((codePoint & 63) | 128);
                            i15 = i18;
                        } else {
                            i15 = i18;
                        }
                    }
                    throw new n2(i15 - 1, length);
                }
                bArr[i16] = (byte) ((cCharAt2 >>> '\f') | 480);
                int i21 = i16 + 2;
                bArr[i16 + 1] = (byte) (((cCharAt2 >>> 6) & 63) | 128);
                i16 += 3;
                bArr[i21] = (byte) ((cCharAt2 & '?') | 128);
            }
            i15++;
        }
        return i16;
    }

    public static int c(String str) {
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
                        if (55296 <= cCharAt2 && cCharAt2 <= 57343) {
                            if (Character.codePointAt(str, i11) < 65536) {
                                throw new n2(i11, length2);
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
}
