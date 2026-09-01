package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class i4g {
    public static final char[] a = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};

    public final boolean equals(Object obj) {
        boolean z;
        if (obj instanceof i4g) {
            byte[] bArr = ((g4g) this).b;
            int length = bArr.length * 8;
            byte[] bArr2 = ((g4g) ((i4g) obj)).b;
            if (length == bArr2.length * 8) {
                if (bArr.length == bArr2.length) {
                    z = true;
                    for (int i = 0; i < bArr.length; i++) {
                        z &= bArr[i] == bArr2[i];
                    }
                } else {
                    z = false;
                }
                if (z) {
                    return true;
                }
            }
        }
        return false;
    }

    public final int hashCode() {
        byte[] bArr = ((g4g) this).b;
        if (bArr.length * 8 < 32) {
            int i = bArr[0] & 255;
            for (int i2 = 1; i2 < bArr.length; i2++) {
                i |= (bArr[i2] & 255) << (i2 * 8);
            }
            return i;
        }
        int length = bArr.length;
        if (length < 4) {
            ygf.f(qq7.H("HashCode#asInt() requires >= 4 bytes (it only has %s bytes).", Integer.valueOf(length)));
            return 0;
        }
        return ((bArr[3] & 255) << 24) | (bArr[0] & 255) | ((bArr[1] & 255) << 8) | ((bArr[2] & 255) << 16);
    }

    public final String toString() {
        byte[] bArr = ((g4g) this).b;
        int length = bArr.length;
        StringBuilder sb = new StringBuilder(length + length);
        for (byte b : bArr) {
            char[] cArr = a;
            sb.append(cArr[(b >> 4) & 15]);
            sb.append(cArr[b & 15]);
        }
        return sb.toString();
    }
}
