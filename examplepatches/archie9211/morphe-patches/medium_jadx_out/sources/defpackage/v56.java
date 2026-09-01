package defpackage;

import java.nio.ByteBuffer;
import java.nio.charset.Charset;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class v56 {
    public static final Charset a;
    public static final byte[] b;

    static {
        Charset.forName("US-ASCII");
        a = Charset.forName("UTF-8");
        Charset.forName("ISO-8859-1");
        byte[] bArr = new byte[0];
        b = bArr;
        ByteBuffer.wrap(bArr);
        sp1.g(bArr, 0, 0, false);
    }

    public static void a(String str, Object obj) {
        if (obj != null) {
            return;
        }
        z72.c(str);
    }

    public static int b(long j) {
        return (int) (j ^ (j >>> 32));
    }
}
