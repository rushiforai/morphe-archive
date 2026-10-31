package com.google.android.gms.internal.measurement;

import java.nio.charset.StandardCharsets;

/* loaded from: classes3.dex */
public abstract class f3 {
    static {
        int i5 = p0.f32944a;
    }

    public static boolean a(int i5, int i11, byte[] bArr) {
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

    public static int b(String str) throws e3 {
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
                                    throw new e3(q0.c(length2, i11, (byte) 32, "Unpaired surrogate at index ", " of "));
                                }
                                i11++;
                            }
                        }
                        i11++;
                    }
                    i12 += i5;
                } catch (e3 unused) {
                    return str.getBytes(StandardCharsets.UTF_8).length;
                }
            }
        }
        if (i12 >= length) {
            return i12;
        }
        long j11 = i12 + 4294967296L;
        StringBuilder sb2 = new StringBuilder(String.valueOf(j11).length() + 34);
        sb2.append("UTF-8 length does not fit in int: ");
        sb2.append(j11);
        throw new IllegalArgumentException(sb2.toString());
    }

    public static int c(String str, byte[] bArr, int i5, int i11) {
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
                        byte[] bytes = str.getBytes(StandardCharsets.UTF_8);
                        length = bytes.length;
                        if (length - i5 > i11) {
                            throw new ArrayIndexOutOfBoundsException("Not enough space in output buffer to encode UTF-8 string");
                        }
                        System.arraycopy(bytes, 0, bArr, i5, length);
                    } else {
                        if (cCharAt2 < 55296 || cCharAt2 > 57343 || ((i13 = i15 + 1) != str.length() && Character.isSurrogatePair(cCharAt2, str.charAt(i13)))) {
                            throw new ArrayIndexOutOfBoundsException("Not enough space in output buffer to encode UTF-8 string");
                        }
                        byte[] bytes2 = str.getBytes(StandardCharsets.UTF_8);
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

    public static String d(byte[] bArr, int i5, int i11) throws zzaeh {
        if (i11 == 0) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        int length = bArr.length;
        if ((((length - i5) - i11) | i5 | i11) < 0) {
            throw new ArrayIndexOutOfBoundsException(String.format("buffer length=%d, index=%d, size=%d", Integer.valueOf(length), Integer.valueOf(i5), Integer.valueOf(i11)));
        }
        int i12 = i5 + i11;
        char[] cArr = new char[i11];
        int i13 = 0;
        while (i5 < i12) {
            byte b11 = bArr[i5];
            if (b11 < 0) {
                break;
            }
            i5++;
            cArr[i13] = (char) b11;
            i13++;
        }
        while (i5 < i12) {
            int i14 = i5 + 1;
            byte b12 = bArr[i5];
            if (b12 >= 0) {
                cArr[i13] = (char) b12;
                i13++;
                i5 = i14;
                while (i5 < i12) {
                    byte b13 = bArr[i5];
                    if (b13 >= 0) {
                        i5++;
                        cArr[i13] = (char) b13;
                        i13++;
                    }
                }
            } else {
                if (b12 >= -32) {
                    if (b12 >= -16) {
                        if (i14 >= i12 - 2) {
                            throw new zzaeh("Protocol message had invalid UTF-8.");
                        }
                        byte b14 = bArr[i14];
                        int i15 = i5 + 3;
                        byte b15 = bArr[i5 + 2];
                        i5 += 4;
                        byte b16 = bArr[i15];
                        if (!j1.e(b14)) {
                            if ((((b14 + 112) + (b12 << 28)) >> 30) == 0 && !j1.e(b15) && !j1.e(b16)) {
                                int i16 = ((b14 & 63) << 12) | ((b12 & 7) << 18) | ((b15 & 63) << 6) | (b16 & 63);
                                cArr[i13] = (char) ((i16 >>> 10) + 55232);
                                cArr[i13 + 1] = (char) ((i16 & 1023) + 56320);
                                i13 += 2;
                            }
                        }
                        throw new zzaeh("Protocol message had invalid UTF-8.");
                    }
                    if (i14 >= i12 - 1) {
                        throw new zzaeh("Protocol message had invalid UTF-8.");
                    }
                    int i17 = i13 + 1;
                    int i18 = i5 + 2;
                    byte b17 = bArr[i14];
                    i5 += 3;
                    byte b18 = bArr[i18];
                    if (!j1.e(b17)) {
                        if (b12 == -32) {
                            if (b17 >= -96) {
                                b12 = -32;
                            }
                        }
                        if (b12 == -19) {
                            if (b17 < -96) {
                                b12 = -19;
                            }
                        }
                        if (!j1.e(b18)) {
                            cArr[i13] = (char) (((b17 & 63) << 6) | ((b12 & 15) << 12) | (b18 & 63));
                            i13 = i17;
                        }
                    }
                    throw new zzaeh("Protocol message had invalid UTF-8.");
                }
                if (i14 >= i12) {
                    throw new zzaeh("Protocol message had invalid UTF-8.");
                }
                int i19 = i13 + 1;
                i5 += 2;
                byte b19 = bArr[i14];
                if (b12 < -62 || j1.e(b19)) {
                    throw new zzaeh("Protocol message had invalid UTF-8.");
                }
                cArr[i13] = (char) ((b19 & 63) | ((b12 & 31) << 6));
                i13 = i19;
            }
        }
        return new String(cArr, 0, i13);
    }
}
