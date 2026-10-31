package androidx.datastore.preferences.protobuf;

import java.nio.ByteBuffer;
import java.nio.charset.Charset;

/* loaded from: classes.dex */
public abstract class b0 {

    /* renamed from: a, reason: collision with root package name */
    public static final Charset f14278a;

    /* renamed from: b, reason: collision with root package name */
    public static final byte[] f14279b;

    static {
        Charset.forName("US-ASCII");
        f14278a = Charset.forName("UTF-8");
        Charset.forName("ISO-8859-1");
        byte[] bArr = new byte[0];
        f14279b = bArr;
        ByteBuffer.wrap(bArr);
        try {
            new j(bArr, 0, 0, false).i(0);
        } catch (InvalidProtocolBufferException e3) {
            throw new IllegalArgumentException(e3);
        }
    }

    public static void a(Object obj, String str) {
        if (obj == null) {
            throw new NullPointerException(str);
        }
    }

    public static int b(long j11) {
        return (int) (j11 ^ (j11 >>> 32));
    }
}
