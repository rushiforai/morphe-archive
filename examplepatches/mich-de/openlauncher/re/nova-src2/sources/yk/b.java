package yk;

import vk.b0;

/* loaded from: classes3.dex */
public abstract class b {

    /* renamed from: a, reason: collision with root package name */
    public static final char[] f97367a = "0123456789abcdef".toCharArray();

    public final boolean equals(Object obj) {
        boolean z11;
        if (obj instanceof b) {
            byte[] bArr = ((a) this).f97366b;
            int length = bArr.length * 8;
            byte[] bArr2 = ((a) ((b) obj)).f97366b;
            if (length == bArr2.length * 8) {
                if (bArr.length != bArr2.length) {
                    z11 = false;
                } else {
                    z11 = true;
                    for (int i5 = 0; i5 < bArr.length; i5++) {
                        z11 &= bArr[i5] == bArr2[i5];
                    }
                }
                if (z11) {
                    return true;
                }
            }
        }
        return false;
    }

    public final int hashCode() {
        byte[] bArr = ((a) this).f97366b;
        if (bArr.length * 8 >= 32) {
            boolean z11 = bArr.length >= 4;
            int length = bArr.length;
            if (z11) {
                return ((bArr[3] & 255) << 24) | (bArr[0] & 255) | ((bArr[1] & 255) << 8) | ((bArr[2] & 255) << 16);
            }
            throw new IllegalStateException(b0.p("HashCode#asInt() requires >= 4 bytes (it only has %s bytes).", Integer.valueOf(length)));
        }
        int i5 = bArr[0] & 255;
        for (int i11 = 1; i11 < bArr.length; i11++) {
            i5 |= (bArr[i11] & 255) << (i11 * 8);
        }
        return i5;
    }

    public final String toString() {
        byte[] bArr = ((a) this).f97366b;
        StringBuilder sb2 = new StringBuilder(bArr.length * 2);
        for (byte b11 : bArr) {
            char[] cArr = f97367a;
            sb2.append(cArr[(b11 >> 4) & 15]);
            sb2.append(cArr[b11 & 15]);
        }
        return sb2.toString();
    }
}
