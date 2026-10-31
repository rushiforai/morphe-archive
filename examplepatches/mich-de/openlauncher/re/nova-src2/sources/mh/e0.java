package mh;

import java.io.IOException;
import java.math.RoundingMode;
import java.util.Objects;

/* loaded from: classes3.dex */
public class e0 {

    /* renamed from: d, reason: collision with root package name */
    public static final c0 f76329d;

    /* renamed from: a, reason: collision with root package name */
    public final b0 f76330a;

    /* renamed from: b, reason: collision with root package name */
    public final Character f76331b;

    /* renamed from: c, reason: collision with root package name */
    public volatile e0 f76332c;

    static {
        new d0("base64()", "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/");
        new d0("base64Url()", "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_");
        new e0("base32()", "ABCDEFGHIJKLMNOPQRSTUVWXYZ234567");
        new e0("base32Hex()", "0123456789ABCDEFGHIJKLMNOPQRSTUV");
        f76329d = new c0(new b0("base16()", "0123456789ABCDEF".toCharArray()));
    }

    public e0(b0 b0Var, Character ch) {
        this.f76330a = b0Var;
        if (ch != null) {
            byte[] bArr = b0Var.f76320g;
            if (bArr.length > 61 && bArr[61] != -1) {
                throw new IllegalArgumentException(a.c("Padding character %s was already in alphabet", ch));
            }
        }
        this.f76331b = ch;
    }

    public void a(StringBuilder sb2, byte[] bArr, int i5) {
        int i11 = 0;
        a.m(0, i5, bArr.length);
        while (i11 < i5) {
            b0 b0Var = this.f76330a;
            b(sb2, bArr, i11, Math.min(b0Var.f76319f, i5 - i11));
            i11 += b0Var.f76319f;
        }
    }

    public final void b(StringBuilder sb2, byte[] bArr, int i5, int i11) {
        a.m(i5, i5 + i11, bArr.length);
        b0 b0Var = this.f76330a;
        int i12 = b0Var.f76319f;
        int i13 = b0Var.f76317d;
        if (i11 > i12) {
            throw new IllegalArgumentException();
        }
        int i14 = 0;
        long j11 = 0;
        for (int i15 = 0; i15 < i11; i15++) {
            j11 = (j11 | (bArr[i5 + i15] & 255)) << 8;
        }
        int i16 = (i11 + 1) * 8;
        while (i14 < i11 * 8) {
            sb2.append(b0Var.f76315b[((int) (j11 >>> ((i16 - i13) - i14))) & b0Var.f76316c]);
            i14 += i13;
        }
        if (this.f76331b != null) {
            while (i14 < b0Var.f76319f * 8) {
                sb2.append('=');
                i14 += i13;
            }
        }
    }

    public final String c(int i5, byte[] bArr) {
        a.m(0, i5, bArr.length);
        b0 b0Var = this.f76330a;
        int i11 = b0Var.f76319f;
        RoundingMode roundingMode = RoundingMode.CEILING;
        StringBuilder sb2 = new StringBuilder(b0Var.f76318e * a.a(i5, i11));
        try {
            a(sb2, bArr, i5);
            return sb2.toString();
        } catch (IOException e3) {
            throw new AssertionError(e3);
        }
    }

    public final boolean equals(Object obj) {
        if (obj instanceof e0) {
            e0 e0Var = (e0) obj;
            if (this.f76330a.equals(e0Var.f76330a) && Objects.equals(this.f76331b, e0Var.f76331b)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return this.f76330a.hashCode() ^ Objects.hashCode(this.f76331b);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("BaseEncoding.");
        b0 b0Var = this.f76330a;
        sb2.append(b0Var);
        if (8 % b0Var.f76317d != 0) {
            Character ch = this.f76331b;
            if (ch == null) {
                sb2.append(".omitPadding()");
            } else {
                sb2.append(".withPadChar('");
                sb2.append(ch);
                sb2.append("')");
            }
        }
        return sb2.toString();
    }

    public e0(String str, String str2) {
        this(new b0(str, str2.toCharArray()), (Character) '=');
    }
}
