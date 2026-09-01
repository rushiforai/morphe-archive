package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qvg {
    public final byte[] a;

    public qvg(byte[] bArr, int i) {
        byte[] bArr2 = new byte[i];
        this.a = bArr2;
        System.arraycopy(bArr, 0, bArr2, 0, i);
    }

    public static qvg a(byte[] bArr) {
        if (bArr == null) {
            z72.c("data must be non-null");
            return null;
        }
        int length = bArr.length;
        if (length > bArr.length) {
            length = bArr.length;
        }
        return new qvg(bArr, length);
    }

    public final byte[] b() {
        byte[] bArr = this.a;
        byte[] bArr2 = new byte[bArr.length];
        System.arraycopy(bArr, 0, bArr2, 0, bArr.length);
        return bArr2;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof qvg) {
            return Arrays.equals(((qvg) obj).a, this.a);
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(this.a);
    }

    public final String toString() {
        return ev6.x("Bytes(", vn7.p0(this.a), ")");
    }
}
