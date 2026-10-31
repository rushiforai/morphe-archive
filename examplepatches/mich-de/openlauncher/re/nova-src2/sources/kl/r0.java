package kl;

import b.a3;
import java.security.SecureRandom;

/* loaded from: classes3.dex */
public abstract class r0 {

    /* renamed from: a, reason: collision with root package name */
    public static final a3 f71633a = new a3(10);

    public static byte[] a(int i5) {
        byte[] bArr = new byte[i5];
        ((SecureRandom) f71633a.get()).nextBytes(bArr);
        return bArr;
    }
}
