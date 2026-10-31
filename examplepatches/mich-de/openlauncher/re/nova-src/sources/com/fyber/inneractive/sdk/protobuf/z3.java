package com.fyber.inneractive.sdk.protobuf;

import java.nio.ByteBuffer;

/* loaded from: classes.dex */
public abstract class z3 {
    public static String a(ByteBuffer byteBuffer, int i5, int i11) throws n1 {
        if ((i5 | i11 | ((byteBuffer.limit() - i5) - i11)) < 0) {
            throw new ArrayIndexOutOfBoundsException(String.format("buffer limit=%d, index=%d, limit=%d", Integer.valueOf(byteBuffer.limit()), Integer.valueOf(i5), Integer.valueOf(i11)));
        }
        int i12 = i5 + i11;
        char[] cArr = new char[i11];
        int i13 = 0;
        while (i5 < i12) {
            byte b11 = byteBuffer.get(i5);
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
            byte b12 = byteBuffer.get(i5);
            if (y3.a(b12)) {
                cArr[i14] = (char) b12;
                i14++;
                i5 = i15;
                while (i5 < i12) {
                    byte b13 = byteBuffer.get(i5);
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
                y3.a(b12, byteBuffer.get(i15), cArr, i14);
                i14++;
            } else if (b12 < -16) {
                if (i15 >= i12 - 1) {
                    throw new n1("Protocol message had invalid UTF-8.");
                }
                int i16 = i5 + 2;
                i5 += 3;
                y3.a(b12, byteBuffer.get(i15), byteBuffer.get(i16), cArr, i14);
                i14++;
            } else {
                if (i15 >= i12 - 2) {
                    throw new n1("Protocol message had invalid UTF-8.");
                }
                byte b14 = byteBuffer.get(i15);
                int i17 = i5 + 3;
                byte b15 = byteBuffer.get(i5 + 2);
                i5 += 4;
                y3.a(b12, b14, b15, byteBuffer.get(i17), cArr, i14);
                i14 += 2;
            }
        }
        return new String(cArr, 0, i14);
    }

    public abstract int a(CharSequence charSequence, byte[] bArr, int i5, int i11);

    public abstract String a(byte[] bArr, int i5, int i11);

    public abstract String b(ByteBuffer byteBuffer, int i5, int i11);

    public final boolean b(byte[] bArr, int i5, int i11) {
        return c(bArr, i5, i11) == 0;
    }

    public abstract int c(byte[] bArr, int i5, int i11);
}
