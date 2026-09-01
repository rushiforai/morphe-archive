package defpackage;

import j$.util.Objects;
import java.io.IOException;
import java.math.RoundingMode;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class f5g {
    public static final z4g d;
    public final x4g a;
    public final Character b;
    public volatile f5g c;

    static {
        new c5g("base64()", "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/");
        new c5g("base64Url()", "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_");
        new f5g("base32()", "ABCDEFGHIJKLMNOPQRSTUVWXYZ234567");
        new f5g("base32Hex()", "0123456789ABCDEFGHIJKLMNOPQRSTUV");
        d = new z4g(new x4g("base16()", new char[]{'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'}));
    }

    public f5g(x4g x4gVar, Character ch) {
        this.a = x4gVar;
        if (ch != null) {
            byte[] bArr = x4gVar.g;
            if (bArr.length > 61 && bArr[61] != -1) {
                ay0.e(qq7.H("Padding character %s was already in alphabet", ch));
                throw null;
            }
        }
        this.b = ch;
    }

    public void a(StringBuilder sb, byte[] bArr, int i) {
        int i2 = 0;
        jq7.A(0, i, bArr.length);
        while (i2 < i) {
            x4g x4gVar = this.a;
            b(i2, Math.min(x4gVar.f, i - i2), sb, bArr);
            i2 += x4gVar.f;
        }
    }

    public final void b(int i, int i2, StringBuilder sb, byte[] bArr) {
        jq7.A(i, i + i2, bArr.length);
        x4g x4gVar = this.a;
        int i3 = x4gVar.f;
        int i4 = x4gVar.d;
        if (i2 > i3) {
            lg8.r();
            return;
        }
        int i5 = 0;
        long j = 0;
        for (int i6 = 0; i6 < i2; i6++) {
            j = (j | ((long) (bArr[i + i6] & 255))) << 8;
        }
        int i7 = (i2 + 1) * 8;
        while (i5 < i2 * 8) {
            sb.append(x4gVar.b[((int) (j >>> ((i7 - i4) - i5))) & x4gVar.c]);
            i5 += i4;
        }
        if (this.b != null) {
            while (i5 < x4gVar.f * 8) {
                sb.append('=');
                i5 += i4;
            }
        }
    }

    public final String c(int i, byte[] bArr) {
        jq7.A(0, i, bArr.length);
        x4g x4gVar = this.a;
        int i2 = x4gVar.f;
        RoundingMode roundingMode = RoundingMode.CEILING;
        StringBuilder sb = new StringBuilder(x4gVar.e * qo7.F(i, i2));
        try {
            a(sb, bArr, i);
            return sb.toString();
        } catch (IOException e) {
            ay0.d(e);
            return null;
        }
    }

    public final boolean equals(Object obj) {
        if (obj instanceof f5g) {
            f5g f5gVar = (f5g) obj;
            if (this.a.equals(f5gVar.a) && Objects.equals(this.b, f5gVar.b)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return Objects.hashCode(this.b) ^ this.a.hashCode();
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("BaseEncoding.");
        x4g x4gVar = this.a;
        sb.append(x4gVar);
        if (8 % x4gVar.d != 0) {
            Character ch = this.b;
            if (ch == null) {
                sb.append(".omitPadding()");
            } else {
                sb.append(".withPadChar('");
                sb.append(ch);
                sb.append("')");
            }
        }
        return sb.toString();
    }

    public f5g(String str, String str2) {
        this(new x4g(str, str2.toCharArray()), (Character) '=');
    }
}
