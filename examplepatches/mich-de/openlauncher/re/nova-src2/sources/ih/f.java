package ih;

import android.util.Base64;
import java.security.SecureRandom;

/* loaded from: classes3.dex */
public abstract class f {

    /* renamed from: a, reason: collision with root package name */
    public static final SecureRandom f61600a = new SecureRandom();

    public static String a() {
        byte[] bArr = new byte[16];
        f61600a.nextBytes(bArr);
        return Base64.encodeToString(bArr, 11);
    }
}
