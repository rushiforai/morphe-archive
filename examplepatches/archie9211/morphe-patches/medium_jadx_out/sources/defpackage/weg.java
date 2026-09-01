package defpackage;

import java.nio.charset.Charset;
import java.security.GeneralSecurityException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class weg {
    public static final byte[] a = b(1, 0);
    public static final byte[] b;
    public static final byte[] c;
    public static final byte[] d;
    public static final byte[] e;
    public static final byte[] f;
    public static final byte[] g;
    public static final byte[] h;
    public static final byte[] i;
    public static final byte[] j;
    public static final byte[] k;
    public static final byte[] l;
    public static final byte[] m;
    public static final byte[] n;
    public static final byte[] o;

    static {
        b(1, 2);
        b = b(2, 32);
        c = b(2, 16);
        d = b(2, 17);
        e = b(2, 18);
        f = b(2, 1);
        g = b(2, 2);
        h = b(2, 3);
        i = b(2, 1);
        j = b(2, 2);
        k = b(2, 3);
        l = new byte[0];
        Charset charset = ejg.a;
        m = "KEM".getBytes(charset);
        n = "HPKE".getBytes(charset);
        o = "HPKE-v1".getBytes(charset);
    }

    public static int a(rcg rcgVar) throws GeneralSecurityException {
        if (rcgVar == rcg.g || rcgVar == rcg.d) {
            return 32;
        }
        if (rcgVar == rcg.e) {
            return 48;
        }
        if (rcgVar == rcg.f) {
            return 66;
        }
        ygf.l("Unrecognized HPKE KEM identifier");
        return 0;
    }

    public static byte[] b(int i2, int i3) {
        if (i2 > 4 || i2 < 0) {
            ay0.e("capacity must be between 0 and 4");
            return null;
        }
        if (i3 < 0 || (i2 < 4 && i3 >= (1 << (i2 << 3)))) {
            ay0.e("value too large");
            return null;
        }
        byte[] bArr = new byte[i2];
        for (int i4 = 0; i4 < i2; i4++) {
            bArr[i4] = (byte) (i3 >> (((i2 - i4) - 1) * 8));
        }
        return bArr;
    }
}
