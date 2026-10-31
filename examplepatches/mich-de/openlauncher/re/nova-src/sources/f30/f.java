package f30;

import android.os.Build;
import java.io.Closeable;

/* loaded from: classes4.dex */
public abstract class f {

    /* renamed from: a, reason: collision with root package name */
    public static final long[] f54304a = new long[256];

    static {
        String str = Build.TYPE;
        if (!str.equals("eng")) {
            str.equals("userdebug");
        }
        for (int i5 = 0; i5 < 256; i5++) {
            long j11 = i5;
            for (int i11 = 0; i11 < 8; i11++) {
                j11 = (j11 >> 1) ^ ((((int) j11) & 1) != 0 ? -7661587058870466123L : 0L);
            }
            f54304a[i5] = j11;
        }
    }

    public static void a(boolean z11) {
        if (!z11) {
            throw new AssertionError();
        }
    }

    public static float b(float f11, float f12, float f13) {
        return f11 > f13 ? f13 : f11 < f12 ? f12 : f11;
    }

    public static void c(Closeable closeable) {
        if (closeable == null) {
            return;
        }
        try {
            closeable.close();
        } catch (Throwable th2) {
            mc0.b bVar = mc0.d.f76206a;
            bVar.r("Utils");
            bVar.p(th2, "close fail", new Object[0]);
        }
    }

    public static final long d(String str) {
        if (str == null || str.length() == 0) {
            return 0L;
        }
        int length = str.length() * 2;
        byte[] bArr = new byte[length];
        int i5 = 0;
        for (char c11 : str.toCharArray()) {
            int i11 = i5 + 1;
            bArr[i5] = (byte) (c11 & 255);
            i5 += 2;
            bArr[i11] = (byte) (c11 >> '\b');
        }
        long j11 = -1;
        for (int i12 = 0; i12 < length; i12++) {
            j11 = (j11 >> 8) ^ f54304a[(((int) j11) ^ bArr[i12]) & 255];
        }
        return j11;
    }

    public static int e(int i5) {
        if (i5 <= 0 || i5 > 1073741824) {
            throw new IllegalArgumentException();
        }
        int i11 = i5 - 1;
        int i12 = i11 | (i11 >> 16);
        int i13 = i12 | (i12 >> 8);
        int i14 = i13 | (i13 >> 4);
        int i15 = i14 | (i14 >> 2);
        return (i15 | (i15 >> 1)) + 1;
    }
}
