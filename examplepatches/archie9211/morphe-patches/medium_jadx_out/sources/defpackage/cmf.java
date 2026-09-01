package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cmf {
    public final byte[] a;

    public cmf(byte[] bArr, int i) {
        byte[] bArr2 = new byte[i];
        this.a = bArr2;
        System.arraycopy(bArr, 0, bArr2, 0, i);
    }

    public static cmf a(byte[] bArr) {
        if (bArr == null) {
            z72.c("data must be non-null");
            return null;
        }
        int length = bArr.length;
        int length2 = bArr.length;
        if (length > length2) {
            length = length2;
        }
        return new cmf(bArr, length);
    }

    public final byte[] b() {
        byte[] bArr = this.a;
        int length = bArr.length;
        byte[] bArr2 = new byte[length];
        System.arraycopy(bArr, 0, bArr2, 0, length);
        return bArr2;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof cmf) {
            return Arrays.equals(((cmf) obj).a, this.a);
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(this.a);
    }

    public final String toString() {
        byte[] bArr = this.a;
        int length = bArr.length;
        StringBuilder sb = new StringBuilder(length + length);
        for (byte b : bArr) {
            sb.append("0123456789abcdef".charAt((b & 255) >> 4));
            sb.append("0123456789abcdef".charAt(b & 15));
        }
        String string = sb.toString();
        return y30.s(new StringBuilder(string.length() + 7), "Bytes(", string, ")");
    }
}
