package x80;

import java.nio.charset.Charset;
import java.util.regex.Pattern;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;

/* loaded from: classes.dex */
public final class j0 {
    public static i0 a(String str, a0 a0Var) {
        Intrinsics.g(str, "<this>");
        Charset charset = Charsets.f72000b;
        if (a0Var != null) {
            Pattern pattern = a0.f95396e;
            Charset charsetA = a0Var.a(null);
            if (charsetA == null) {
                a0Var = z.b(a0Var + "; charset=utf-8");
            } else {
                charset = charsetA;
            }
        }
        byte[] bytes = str.getBytes(charset);
        Intrinsics.f(bytes, "this as java.lang.String).getBytes(charset)");
        return b(a0Var, bytes, 0, bytes.length);
    }

    public static i0 b(a0 a0Var, byte[] bArr, int i5, int i11) {
        Intrinsics.g(bArr, "<this>");
        long length = bArr.length;
        long j11 = i5;
        long j12 = i11;
        byte[] bArr2 = y80.c.f96853a;
        if ((j11 | j12) < 0 || j11 > length || length - j11 < j12) {
            throw new ArrayIndexOutOfBoundsException();
        }
        return new i0(a0Var, bArr, i11, i5);
    }

    public static i0 c(j0 j0Var, a0 a0Var, byte[] bArr, int i5, int i11) {
        if ((i11 & 4) != 0) {
            i5 = 0;
        }
        int length = bArr.length;
        j0Var.getClass();
        return b(a0Var, bArr, i5, length);
    }

    public static /* synthetic */ i0 d(j0 j0Var, byte[] bArr, a0 a0Var, int i5, int i11) {
        if ((i11 & 1) != 0) {
            a0Var = null;
        }
        if ((i11 & 2) != 0) {
            i5 = 0;
        }
        int length = bArr.length;
        j0Var.getClass();
        return b(a0Var, bArr, i5, length);
    }
}
