package i9;

import b.c0;
import java.io.IOException;
import java.io.InputStream;
import mc0.b;
import mc0.d;

/* loaded from: classes2.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final long[] f61459a = new long[256];

    static {
        for (int i5 = 0; i5 < 256; i5++) {
            long j11 = i5;
            for (int i11 = 0; i11 < 8; i11++) {
                j11 = (j11 >> 1) ^ ((((int) j11) & 1) != 0 ? -7661587058870466123L : 0L);
            }
            f61459a[i5] = j11;
        }
    }

    public static void a(InputStream inputStream) throws IOException {
        if (inputStream == null) {
            return;
        }
        try {
            inputStream.close();
        } catch (IOException e3) {
            b bVar = d.f76206a;
            bVar.r("Utils");
            bVar.p(e3, "close fail ", new Object[0]);
        }
    }

    public static int b(int i5) {
        if (i5 <= 0 || i5 > 1073741824) {
            throw new IllegalArgumentException(c0.h(i5, "n is invalid: "));
        }
        int i11 = i5 - 1;
        int i12 = i11 | (i11 >> 16);
        int i13 = i12 | (i12 >> 8);
        int i14 = i13 | (i13 >> 4);
        int i15 = i14 | (i14 >> 2);
        return (i15 | (i15 >> 1)) + 1;
    }
}
