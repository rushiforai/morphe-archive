package x80;

import b.u4;
import java.nio.charset.Charset;
import java.util.regex.Pattern;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;

/* loaded from: classes.dex */
public final class o0 {
    public static c90.g a(String string, a0 a0Var) {
        Intrinsics.g(string, "<this>");
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
        m90.g gVar = new m90.g();
        Intrinsics.g(charset, "charset");
        int length = string.length();
        Intrinsics.g(string, "string");
        if (length < 0) {
            throw new IllegalArgumentException(b.c0.g(length, 0, "endIndex < beginIndex: ", " < ").toString());
        }
        if (length > string.length()) {
            StringBuilder sbJ = u4.j(length, "endIndex > string.length: ", " > ");
            sbJ.append(string.length());
            throw new IllegalArgumentException(sbJ.toString().toString());
        }
        if (charset.equals(Charsets.f72000b)) {
            gVar.l0(0, length, string);
        } else {
            String strSubstring = string.substring(0, length);
            Intrinsics.f(strSubstring, "this as java.lang.String…ing(startIndex, endIndex)");
            byte[] bytes = strSubstring.getBytes(charset);
            Intrinsics.f(bytes, "this as java.lang.String).getBytes(charset)");
            gVar.write(bytes, 0, bytes.length);
        }
        return b(gVar, a0Var, gVar.f76126b);
    }

    public static c90.g b(m90.i iVar, a0 a0Var, long j11) {
        Intrinsics.g(iVar, "<this>");
        return new c90.g(a0Var, j11, iVar, 1);
    }

    public static c90.g c(byte[] bArr, a0 a0Var) {
        Intrinsics.g(bArr, "<this>");
        m90.g gVar = new m90.g();
        gVar.write(bArr, 0, bArr.length);
        return b(gVar, a0Var, bArr.length);
    }
}
