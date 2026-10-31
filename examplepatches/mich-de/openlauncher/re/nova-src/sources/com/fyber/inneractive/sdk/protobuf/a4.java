package com.fyber.inneractive.sdk.protobuf;

import java.nio.ByteBuffer;

/* loaded from: classes.dex */
public final class a4 extends z3 {
    @Override // com.fyber.inneractive.sdk.protobuf.z3
    public final String a(byte[] bArr, int i5, int i11) throws n1 {
        if ((i5 | i11 | ((bArr.length - i5) - i11)) < 0) {
            throw new ArrayIndexOutOfBoundsException(String.format("buffer length=%d, index=%d, size=%d", Integer.valueOf(bArr.length), Integer.valueOf(i5), Integer.valueOf(i11)));
        }
        int i12 = i5 + i11;
        char[] cArr = new char[i11];
        int i13 = 0;
        while (i5 < i12) {
            byte b11 = bArr[i5];
            if (!y3.a(b11)) {
                break;
            }
            i5++;
            cArr[i13] = (char) b11;
            i13++;
        }
        int i14 = i13;
        while (i5 < i12) {
            int i15 = i5 + 1;
            byte b12 = bArr[i5];
            if (y3.a(b12)) {
                cArr[i14] = (char) b12;
                i14++;
                i5 = i15;
                while (i5 < i12) {
                    byte b13 = bArr[i5];
                    if (!y3.a(b13)) {
                        break;
                    }
                    i5++;
                    cArr[i14] = (char) b13;
                    i14++;
                }
            } else if (b12 < -32) {
                if (i15 >= i12) {
                    throw new n1("Protocol message had invalid UTF-8.");
                }
                i5 += 2;
                y3.a(b12, bArr[i15], cArr, i14);
                i14++;
            } else if (b12 < -16) {
                if (i15 >= i12 - 1) {
                    throw new n1("Protocol message had invalid UTF-8.");
                }
                int i16 = i5 + 2;
                i5 += 3;
                y3.a(b12, bArr[i15], bArr[i16], cArr, i14);
                i14++;
            } else {
                if (i15 >= i12 - 2) {
                    throw new n1("Protocol message had invalid UTF-8.");
                }
                byte b14 = bArr[i15];
                int i17 = i5 + 3;
                byte b15 = bArr[i5 + 2];
                i5 += 4;
                y3.a(b12, b14, b15, bArr[i17], cArr, i14);
                i14 += 2;
            }
        }
        return new String(cArr, 0, i14);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.z3
    public final String b(ByteBuffer byteBuffer, int i5, int i11) {
        return z3.a(byteBuffer, i5, i11);
    }

    /* JADX WARN: Removed duplicated region for block: B:62:0x0097 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:63:0x0098 A[RETURN] */
    @Override // com.fyber.inneractive.sdk.protobuf.z3
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int c(byte[] bArr, int i5, int i11) {
        while (i5 < i11 && bArr[i5] >= 0) {
            i5++;
        }
        if (i5 >= i11) {
            return 0;
        }
        while (i5 < i11) {
            int i12 = i5 + 1;
            byte b11 = bArr[i5];
            if (b11 >= 0) {
                i5 = i12;
            } else {
                if (b11 < -32) {
                    if (i12 >= i11) {
                        return b11;
                    }
                    if (b11 >= -62) {
                        i5 += 2;
                        if (bArr[i12] > -65) {
                        }
                    }
                    return -1;
                }
                if (b11 < -16) {
                    if (i12 >= i11 - 1) {
                        int i13 = i11 - i12;
                        if (i13 == 0) {
                            if (b11 > -12) {
                                return -1;
                            }
                            return b11;
                        }
                        if (i13 == 1) {
                            return d4.a(b11, bArr[i12]);
                        }
                        if (i13 == 2) {
                            return d4.a(b11, bArr[i12], bArr[i5 + 2]);
                        }
                        throw new AssertionError();
                    }
                    int i14 = i5 + 2;
                    byte b12 = bArr[i12];
                    if (b12 <= -65 && ((b11 != -32 || b12 >= -96) && (b11 != -19 || b12 < -96))) {
                        i5 += 3;
                        if (bArr[i14] > -65) {
                        }
                    }
                    return -1;
                }
                if (i12 < i11 - 2) {
                    int i15 = i5 + 2;
                    byte b13 = bArr[i12];
                    if (b13 <= -65) {
                        if ((((b13 + 112) + (b11 << 28)) >> 30) == 0) {
                            int i16 = i5 + 3;
                            if (bArr[i15] <= -65) {
                                i5 += 4;
                                if (bArr[i16] > -65) {
                                }
                            }
                        }
                    }
                    return -1;
                }
                int i17 = i11 - i12;
                if (i17 != 0) {
                    if (i17 == 1) {
                        return d4.a(b11, bArr[i12]);
                    }
                    if (i17 == 2) {
                        return d4.a(b11, bArr[i12], bArr[i5 + 2]);
                    }
                    throw new AssertionError();
                }
                if (b11 > -12) {
                }
            }
        }
        return 0;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.z3
    public final int a(CharSequence charSequence, byte[] bArr, int i5, int i11) {
        int i12;
        int i13;
        char cCharAt;
        int length = charSequence.length();
        int i14 = i11 + i5;
        int i15 = 0;
        while (i15 < length && (i13 = i15 + i5) < i14 && (cCharAt = charSequence.charAt(i15)) < 128) {
            bArr[i13] = (byte) cCharAt;
            i15++;
        }
        if (i15 == length) {
            return i5 + length;
        }
        int i16 = i5 + i15;
        while (i15 < length) {
            char cCharAt2 = charSequence.charAt(i15);
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
                    if (i16 <= i14 - 4) {
                        int i18 = i15 + 1;
                        if (i18 != charSequence.length()) {
                            char cCharAt3 = charSequence.charAt(i18);
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
                        throw new b4(i15 - 1, length);
                    }
                    if (55296 <= cCharAt2 && cCharAt2 <= 57343 && ((i12 = i15 + 1) == charSequence.length() || !Character.isSurrogatePair(cCharAt2, charSequence.charAt(i12)))) {
                        throw new b4(i15, length);
                    }
                    throw new ArrayIndexOutOfBoundsException("Failed writing " + cCharAt2 + " at index " + i16);
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
}
