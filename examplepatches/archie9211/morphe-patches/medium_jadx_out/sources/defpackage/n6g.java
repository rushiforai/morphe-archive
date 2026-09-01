package defpackage;

import java.nio.ByteBuffer;
import java.nio.charset.Charset;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class n6g {
    public static final byte[] a;

    static {
        Charset.forName("US-ASCII");
        Charset.forName("UTF-8");
        Charset.forName("ISO-8859-1");
        byte[] bArr = new byte[0];
        a = bArr;
        ByteBuffer.wrap(bArr);
    }
}
