package defpackage;

import j$.util.Objects;
import java.io.IOException;
import java.math.RoundingMode;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class yig {
    public static final vig c = new vig("base64()", "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/");
    public static final vig d = new vig("base64Url()", "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_");
    public final oig a;
    public final Character b;

    static {
        new yig("base32()", "ABCDEFGHIJKLMNOPQRSTUVWXYZ234567");
        new yig("base32Hex()", "0123456789ABCDEFGHIJKLMNOPQRSTUV");
        int i = pig.a;
        oig oigVar = new oig("base16()", new char[]{'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'});
        new yig(oigVar, (Character) null);
        char[] cArr = oigVar.b;
        char[] cArr2 = new char[512];
        if (!(cArr.length == 16)) {
            lg8.r();
            return;
        }
        for (int i2 = 0; i2 < 256; i2++) {
            cArr2[i2] = cArr[i2 >>> 4];
            cArr2[i2 | 256] = cArr[i2 & 15];
        }
    }

    public yig(oig oigVar, Character ch) {
        this.a = oigVar;
        if (ch == null || oigVar.g[61] == -1) {
            this.b = ch;
        } else {
            ay0.e(mq7.H("Padding character %s was already in alphabet", ch));
            throw null;
        }
    }

    public void a(StringBuilder sb, byte[] bArr, int i) {
        int i2 = 0;
        jq7.D(0, i, bArr.length);
        while (i2 < i) {
            int i3 = this.a.f;
            b(i2, Math.min(i3, i - i2), sb, bArr);
            i2 += i3;
        }
    }

    public final void b(int i, int i2, StringBuilder sb, byte[] bArr) {
        jq7.D(i, i + i2, bArr.length);
        oig oigVar = this.a;
        int i3 = oigVar.f;
        if (i2 > i3) {
            lg8.r();
            return;
        }
        int i4 = 0;
        long j = 0;
        for (int i5 = 0; i5 < i2; i5++) {
            j = (j | ((long) (bArr[i + i5] & 255))) << 8;
        }
        int i6 = (i2 + 1) * 8;
        int i7 = oigVar.d;
        while (i4 < i2 * 8) {
            sb.append(oigVar.b[oigVar.c & ((int) (j >>> ((i6 - i7) - i4)))]);
            i4 += i7;
        }
        if (this.b != null) {
            while (i4 < i3 * 8) {
                sb.append('=');
                i4 += i7;
            }
        }
    }

    public final CharSequence c(CharSequence charSequence) {
        if (this.b == null) {
            return charSequence;
        }
        int length = charSequence.length();
        do {
            length--;
            if (length < 0) {
                break;
            }
        } while (charSequence.charAt(length) == '=');
        return charSequence.subSequence(0, length + 1);
    }

    public final String d(int i, byte[] bArr) {
        jq7.D(0, i, bArr.length);
        oig oigVar = this.a;
        int i2 = oigVar.f;
        RoundingMode roundingMode = RoundingMode.CEILING;
        StringBuilder sb = new StringBuilder(oigVar.e * tr7.D(i, i2));
        try {
            a(sb, bArr, i);
            return sb.toString();
        } catch (IOException e) {
            ay0.d(e);
            return null;
        }
    }

    public final boolean equals(Object obj) {
        if (obj instanceof yig) {
            yig yigVar = (yig) obj;
            if (this.a.equals(yigVar.a) && Objects.equals(this.b, yigVar.b)) {
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
        oig oigVar = this.a;
        sb.append(oigVar);
        if (8 % oigVar.d != 0) {
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

    public yig(String str, String str2) {
        this(new oig(str, str2.toCharArray()), (Character) '=');
    }
}
