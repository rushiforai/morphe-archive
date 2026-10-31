package ads_mobile_sdk;

import java.nio.ByteBuffer;

/* loaded from: classes2.dex */
public abstract class rb1 {

    /* renamed from: a, reason: collision with root package name */
    public static final byte[] f9048a;

    static {
        byte[] bArr = new byte[0];
        f9048a = bArr;
        ByteBuffer.wrap(bArr);
    }

    public static void a(Object obj, String str) {
        if (obj == null) {
            throw new NullPointerException(str);
        }
    }

    public static void a(Iterable iterable) {
        iterable.getClass();
    }
}
