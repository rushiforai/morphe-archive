package com.fyber.inneractive.sdk.protobuf;

import java.nio.ByteBuffer;

/* loaded from: classes3.dex */
public final class c4 extends z3 {
    public static int a(byte[] bArr, int i5, long j11, int i11) {
        if (i11 == 0) {
            z3 z3Var = d4.f30786a;
            if (i5 > -12) {
                return -1;
            }
            return i5;
        }
        if (i11 == 1) {
            return d4.a(i5, x3.f30955c.b(bArr, x3.f30958f + j11));
        }
        if (i11 != 2) {
            throw new AssertionError();
        }
        w3 w3Var = x3.f30955c;
        long j12 = x3.f30958f;
        return d4.a(i5, w3Var.b(bArr, j12 + j11), w3Var.b(bArr, j11 + 1 + j12));
    }

    @Override // com.fyber.inneractive.sdk.protobuf.z3
    public final String b(ByteBuffer byteBuffer, int i5, int i11) throws n1 {
        long j11;
        if ((i5 | i11 | ((byteBuffer.limit() - i5) - i11)) < 0) {
            throw new ArrayIndexOutOfBoundsException(String.format("buffer limit=%d, index=%d, limit=%d", Integer.valueOf(byteBuffer.limit()), Integer.valueOf(i5), Integer.valueOf(i11)));
        }
        long j12 = x3.f30955c.f30941a.getLong(byteBuffer, x3.f30959g) + i5;
        long j13 = i11 + j12;
        char[] cArr = new char[i11];
        int i12 = 0;
        while (true) {
            j11 = 1;
            if (j12 >= j13) {
                break;
            }
            byte bA = x3.f30955c.a(j12);
            if (!y3.a(bA)) {
                break;
            }
            j12++;
            cArr[i12] = (char) bA;
            i12++;
        }
        int i13 = i12;
        while (j12 < j13) {
            long j14 = j12 + j11;
            w3 w3Var = x3.f30955c;
            byte bA2 = w3Var.a(j12);
            if (y3.a(bA2)) {
                cArr[i13] = (char) bA2;
                i13++;
                j12 = j14;
                while (j12 < j13) {
                    byte bA3 = x3.f30955c.a(j12);
                    if (!y3.a(bA3)) {
                        break;
                    }
                    j12 += j11;
                    cArr[i13] = (char) bA3;
                    i13++;
                }
            } else if (bA2 < -32) {
                if (j14 >= j13) {
                    throw new n1("Protocol message had invalid UTF-8.");
                }
                j12 += 2;
                y3.a(bA2, w3Var.a(j14), cArr, i13);
                i13++;
            } else if (bA2 < -16) {
                if (j14 >= j13 - j11) {
                    throw new n1("Protocol message had invalid UTF-8.");
                }
                long j15 = j12 + 2;
                j12 += 3;
                y3.a(bA2, w3Var.a(j14), w3Var.a(j15), cArr, i13);
                i13++;
            } else {
                if (j14 >= j13 - 2) {
                    throw new n1("Protocol message had invalid UTF-8.");
                }
                byte bA4 = w3Var.a(j14);
                long j16 = j12 + 3;
                byte bA5 = w3Var.a(j12 + 2);
                j12 += 4;
                y3.a(bA2, bA4, bA5, w3Var.a(j16), cArr, i13);
                i13 += 2;
                j11 = 1;
            }
        }
        return new String(cArr, 0, i13);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.z3
    public final int c(byte[] bArr, int i5, int i11) {
        int i12;
        long j11;
        if ((i5 | i11 | (bArr.length - i11)) < 0) {
            throw new ArrayIndexOutOfBoundsException(String.format("Array length=%d, index=%d, limit=%d", Integer.valueOf(bArr.length), Integer.valueOf(i5), Integer.valueOf(i11)));
        }
        long j12 = i5;
        int i13 = (int) (i11 - j12);
        byte b11 = 0;
        long j13 = 1;
        if (i13 >= 16) {
            long j14 = j12;
            i12 = 0;
            while (true) {
                if (i12 >= i13) {
                    i12 = i13;
                    break;
                }
                long j15 = j14 + 1;
                if (x3.f30955c.b(bArr, x3.f30958f + j14) < 0) {
                    break;
                }
                i12++;
                j14 = j15;
            }
        } else {
            i12 = 0;
        }
        int i14 = i13 - i12;
        long j16 = j12 + i12;
        while (true) {
            byte b12 = b11;
            while (true) {
                if (i14 <= 0) {
                    break;
                }
                long j17 = j16 + j13;
                b12 = x3.f30955c.b(bArr, x3.f30958f + j16);
                if (b12 < 0) {
                    j16 = j17;
                    break;
                }
                i14--;
                j16 = j17;
            }
            if (i14 == 0) {
                return b11;
            }
            int i15 = i14 - 1;
            if (b12 >= -32) {
                if (b12 >= -16) {
                    j11 = j13;
                    if (i15 < 3) {
                        return a(bArr, b12, j16, i15);
                    }
                    i14 -= 4;
                    long j18 = j16 + j11;
                    w3 w3Var = x3.f30955c;
                    long j19 = x3.f30958f;
                    byte b13 = w3Var.b(bArr, j19 + j16);
                    if (b13 > -65) {
                        return -1;
                    }
                    if ((((b13 + 112) + (b12 << 28)) >> 30) != 0) {
                        return -1;
                    }
                    long j21 = 2 + j16;
                    if (w3Var.b(bArr, j18 + j19) > -65) {
                        return -1;
                    }
                    j16 += 3;
                    if (w3Var.b(bArr, j19 + j21) > -65) {
                        return -1;
                    }
                } else {
                    if (i15 < 2) {
                        return a(bArr, b12, j16, i15);
                    }
                    i14 -= 3;
                    long j22 = j16 + j13;
                    w3 w3Var2 = x3.f30955c;
                    long j23 = x3.f30958f;
                    j11 = j13;
                    byte b14 = w3Var2.b(bArr, j23 + j16);
                    if (b14 > -65) {
                        return -1;
                    }
                    if (b12 == -32 && b14 < -96) {
                        return -1;
                    }
                    if (b12 == -19 && b14 >= -96) {
                        return -1;
                    }
                    j16 += 2;
                    if (w3Var2.b(bArr, j23 + j22) > -65) {
                        return -1;
                    }
                }
                j13 = j11;
                b11 = 0;
            } else {
                if (i15 == 0) {
                    return b12;
                }
                i14 -= 2;
                if (b12 < -62) {
                    return -1;
                }
                long j24 = j16 + j13;
                if (x3.f30955c.b(bArr, x3.f30958f + j16) > -65) {
                    return -1;
                }
                j16 = j24;
            }
        }
    }

    @Override // com.fyber.inneractive.sdk.protobuf.z3
    public final String a(byte[] bArr, int i5, int i11) throws n1 {
        if ((i5 | i11 | ((bArr.length - i5) - i11)) >= 0) {
            int i12 = i5 + i11;
            char[] cArr = new char[i11];
            int i13 = i5;
            int i14 = 0;
            while (i13 < i12) {
                byte b11 = x3.f30955c.b(bArr, x3.f30958f + i13);
                if (!y3.a(b11)) {
                    break;
                }
                i13++;
                cArr[i14] = (char) b11;
                i14++;
            }
            int i15 = i14;
            while (i13 < i12) {
                int i16 = i13 + 1;
                w3 w3Var = x3.f30955c;
                long j11 = x3.f30958f;
                byte b12 = w3Var.b(bArr, i13 + j11);
                if (y3.a(b12)) {
                    cArr[i15] = (char) b12;
                    i15++;
                    i13 = i16;
                    while (i13 < i12) {
                        byte b13 = x3.f30955c.b(bArr, x3.f30958f + i13);
                        if (!y3.a(b13)) {
                            break;
                        }
                        i13++;
                        cArr[i15] = (char) b13;
                        i15++;
                    }
                } else if (b12 < -32) {
                    if (i16 < i12) {
                        i13 += 2;
                        y3.a(b12, w3Var.b(bArr, j11 + i16), cArr, i15);
                        i15++;
                    } else {
                        throw new n1("Protocol message had invalid UTF-8.");
                    }
                } else if (b12 < -16) {
                    if (i16 < i12 - 1) {
                        int i17 = i13 + 2;
                        i13 += 3;
                        y3.a(b12, w3Var.b(bArr, i16 + j11), w3Var.b(bArr, j11 + i17), cArr, i15);
                        i15++;
                    } else {
                        throw new n1("Protocol message had invalid UTF-8.");
                    }
                } else if (i16 < i12 - 2) {
                    y3.a(b12, w3Var.b(bArr, i16 + j11), w3Var.b(bArr, i13 + 2 + j11), w3Var.b(bArr, j11 + i13 + 3), cArr, i15);
                    i15 += 2;
                    i13 += 4;
                } else {
                    throw new n1("Protocol message had invalid UTF-8.");
                }
            }
            return new String(cArr, 0, i15);
        }
        throw new ArrayIndexOutOfBoundsException(String.format("buffer length=%d, index=%d, size=%d", Integer.valueOf(bArr.length), Integer.valueOf(i5), Integer.valueOf(i11)));
    }

    @Override // com.fyber.inneractive.sdk.protobuf.z3
    public final int a(CharSequence charSequence, byte[] bArr, int i5, int i11) {
        long j11;
        char c11;
        long j12;
        long j13;
        int i12;
        char c12;
        char cCharAt;
        long j14 = i5;
        long j15 = i11 + j14;
        int length = charSequence.length();
        if (length > i11 || bArr.length - i11 < i5) {
            throw new ArrayIndexOutOfBoundsException("Failed writing " + charSequence.charAt(length - 1) + " at index " + (i5 + i11));
        }
        int i13 = 0;
        while (true) {
            j11 = 1;
            c11 = 128;
            if (i13 >= length || (cCharAt = charSequence.charAt(i13)) >= 128) {
                break;
            }
            x3.f30955c.a((Object) bArr, x3.f30958f + j14, (byte) cCharAt);
            i13++;
            j14 = 1 + j14;
        }
        if (i13 == length) {
            return (int) j14;
        }
        while (i13 < length) {
            char cCharAt2 = charSequence.charAt(i13);
            if (cCharAt2 >= c11 || j14 >= j15) {
                j12 = j11;
                if (cCharAt2 >= 2048 || j14 > j15 - 2) {
                    long j16 = j14;
                    if ((cCharAt2 >= 55296 && 57343 >= cCharAt2) || j16 > j15 - 3) {
                        if (j16 <= j15 - 4) {
                            int i14 = i13 + 1;
                            if (i14 != length) {
                                char cCharAt3 = charSequence.charAt(i14);
                                if (Character.isSurrogatePair(cCharAt2, cCharAt3)) {
                                    int codePoint = Character.toCodePoint(cCharAt2, cCharAt3);
                                    w3 w3Var = x3.f30955c;
                                    long j17 = x3.f30958f;
                                    w3Var.a((Object) bArr, j17 + j16, (byte) ((codePoint >>> 18) | 240));
                                    c12 = 128;
                                    w3Var.a((Object) bArr, j17 + j16 + j12, (byte) (((codePoint >>> 12) & 63) | 128));
                                    w3Var.a((Object) bArr, j17 + j16 + 2, (byte) (((codePoint >>> 6) & 63) | 128));
                                    w3Var.a((Object) bArr, j17 + j16 + 3, (byte) ((codePoint & 63) | 128));
                                    i13 = i14;
                                    j14 = j16 + 4;
                                    i13++;
                                    j11 = j12;
                                    c11 = c12;
                                } else {
                                    i13 = i14;
                                }
                            }
                            throw new b4(i13 - 1, length);
                        }
                        if (55296 <= cCharAt2 && cCharAt2 <= 57343 && ((i12 = i13 + 1) == length || !Character.isSurrogatePair(cCharAt2, charSequence.charAt(i12)))) {
                            throw new b4(i13, length);
                        }
                        throw new ArrayIndexOutOfBoundsException("Failed writing " + cCharAt2 + " at index " + j16);
                    }
                    w3 w3Var2 = x3.f30955c;
                    long j18 = x3.f30958f;
                    w3Var2.a((Object) bArr, j18 + j16, (byte) ((cCharAt2 >>> '\f') | 480));
                    w3Var2.a((Object) bArr, j18 + j16 + j12, (byte) (((cCharAt2 >>> 6) & 63) | 128));
                    w3Var2.a((Object) bArr, j18 + j16 + 2, (byte) ((cCharAt2 & '?') | 128));
                    j13 = j16 + 3;
                } else {
                    long j19 = j14 + j12;
                    w3 w3Var3 = x3.f30955c;
                    long j21 = x3.f30958f;
                    long j22 = j14;
                    w3Var3.a((Object) bArr, j21 + j22, (byte) ((cCharAt2 >>> 6) | 960));
                    j14 = j22 + 2;
                    w3Var3.a((Object) bArr, j21 + j19, (byte) ((cCharAt2 & '?') | 128));
                    c12 = 128;
                    i13++;
                    j11 = j12;
                    c11 = c12;
                }
            } else {
                j13 = j14 + j11;
                j12 = j11;
                x3.f30955c.a((Object) bArr, x3.f30958f + j14, (byte) cCharAt2);
            }
            j14 = j13;
            c12 = 128;
            i13++;
            j11 = j12;
            c11 = c12;
        }
        return (int) j14;
    }
}
