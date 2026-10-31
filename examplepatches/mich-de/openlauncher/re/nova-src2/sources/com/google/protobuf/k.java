package com.google.protobuf;

import java.nio.ByteBuffer;

/* loaded from: classes.dex */
public final class k {
    public static String b(ByteBuffer byteBuffer, int i5, int i11) throws InvalidProtocolBufferException {
        if ((i5 | i11 | ((byteBuffer.limit() - i5) - i11)) < 0) {
            throw new ArrayIndexOutOfBoundsException(String.format("buffer limit=%d, index=%d, limit=%d", Integer.valueOf(byteBuffer.limit()), Integer.valueOf(i5), Integer.valueOf(i11)));
        }
        int i12 = i5 + i11;
        char[] cArr = new char[i11];
        int i13 = 0;
        while (i5 < i12) {
            byte b11 = byteBuffer.get(i5);
            if (b11 < 0) {
                break;
            }
            i5++;
            cArr[i13] = (char) b11;
            i13++;
        }
        int i14 = i13;
        while (i5 < i12) {
            int i15 = i5 + 1;
            byte b12 = byteBuffer.get(i5);
            if (b12 >= 0) {
                int i16 = i14 + 1;
                cArr[i14] = (char) b12;
                int i17 = i15;
                while (i17 < i12) {
                    byte b13 = byteBuffer.get(i17);
                    if (b13 < 0) {
                        break;
                    }
                    i17++;
                    cArr[i16] = (char) b13;
                    i16++;
                }
                i14 = i16;
                i5 = i17;
            } else if (b12 < -32) {
                if (i15 >= i12) {
                    throw InvalidProtocolBufferException.b();
                }
                i5 += 2;
                g.b(b12, byteBuffer.get(i15), cArr, i14);
                i14++;
            } else if (b12 < -16) {
                if (i15 >= i12 - 1) {
                    throw InvalidProtocolBufferException.b();
                }
                int i18 = i5 + 2;
                i5 += 3;
                g.c(b12, byteBuffer.get(i15), byteBuffer.get(i18), cArr, i14);
                i14++;
            } else {
                if (i15 >= i12 - 2) {
                    throw InvalidProtocolBufferException.b();
                }
                byte b14 = byteBuffer.get(i15);
                int i19 = i5 + 3;
                byte b15 = byteBuffer.get(i5 + 2);
                i5 += 4;
                g.a(b12, b14, b15, byteBuffer.get(i19), cArr, i14);
                i14 += 2;
            }
        }
        return new String(cArr, 0, i14);
    }

    public String a(int i5, int i11, byte[] bArr) throws InvalidProtocolBufferException {
        if ((i5 | i11 | ((bArr.length - i5) - i11)) < 0) {
            throw new ArrayIndexOutOfBoundsException(String.format("buffer length=%d, index=%d, size=%d", Integer.valueOf(bArr.length), Integer.valueOf(i5), Integer.valueOf(i11)));
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
        int i14 = i13;
        while (i5 < i12) {
            int i15 = i5 + 1;
            byte b12 = bArr[i5];
            if (b12 >= 0) {
                int i16 = i14 + 1;
                cArr[i14] = (char) b12;
                int i17 = i15;
                while (i17 < i12) {
                    byte b13 = bArr[i17];
                    if (b13 < 0) {
                        break;
                    }
                    i17++;
                    cArr[i16] = (char) b13;
                    i16++;
                }
                i14 = i16;
                i5 = i17;
            } else if (b12 < -32) {
                if (i15 >= i12) {
                    throw InvalidProtocolBufferException.b();
                }
                i5 += 2;
                g.b(b12, bArr[i15], cArr, i14);
                i14++;
            } else if (b12 < -16) {
                if (i15 >= i12 - 1) {
                    throw InvalidProtocolBufferException.b();
                }
                int i18 = i5 + 2;
                i5 += 3;
                g.c(b12, bArr[i15], bArr[i18], cArr, i14);
                i14++;
            } else {
                if (i15 >= i12 - 2) {
                    throw InvalidProtocolBufferException.b();
                }
                byte b14 = bArr[i15];
                int i19 = i5 + 3;
                byte b15 = bArr[i5 + 2];
                i5 += 4;
                g.a(b12, b14, b15, bArr[i19], cArr, i14);
                i14 += 2;
            }
        }
        return new String(cArr, 0, i14);
    }

    public int c(byte[] bArr, int i5, int i11) {
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
            } else if (b11 < -32) {
                if (i12 >= i11) {
                    return b11;
                }
                if (b11 < -62) {
                    return -1;
                }
                i5 += 2;
                if (bArr[i12] > -65) {
                    return -1;
                }
            } else if (b11 < -16) {
                if (i12 >= i11 - 1) {
                    return o2.a(i12, i11, bArr);
                }
                int i13 = i5 + 2;
                byte b12 = bArr[i12];
                if (b12 > -65) {
                    return -1;
                }
                if (b11 == -32 && b12 < -96) {
                    return -1;
                }
                if (b11 == -19 && b12 >= -96) {
                    return -1;
                }
                i5 += 3;
                if (bArr[i13] > -65) {
                    return -1;
                }
            } else {
                if (i12 >= i11 - 2) {
                    return o2.a(i12, i11, bArr);
                }
                int i14 = i5 + 2;
                byte b13 = bArr[i12];
                if (b13 > -65) {
                    return -1;
                }
                if ((((b13 + 112) + (b11 << 28)) >> 30) != 0) {
                    return -1;
                }
                int i15 = i5 + 3;
                if (bArr[i14] > -65) {
                    return -1;
                }
                i5 += 4;
                if (bArr[i15] > -65) {
                    return -1;
                }
            }
        }
        return 0;
    }
}
