package zk;

import b.c0;
import com.google.common.io.BaseEncoding$DecodingException;
import java.io.IOException;
import java.math.RoundingMode;
import java.util.Arrays;
import java.util.Objects;
import vk.b0;

/* loaded from: classes.dex */
public class d {

    /* renamed from: d, reason: collision with root package name */
    public static final c f98547d = new c("base64()", "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/");

    /* renamed from: e, reason: collision with root package name */
    public static final c f98548e = new c("base64Url()", "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_");

    /* renamed from: f, reason: collision with root package name */
    public static final b f98549f;

    /* renamed from: a, reason: collision with root package name */
    public final a f98550a;

    /* renamed from: b, reason: collision with root package name */
    public final Character f98551b;

    /* renamed from: c, reason: collision with root package name */
    public volatile d f98552c;

    static {
        new d("base32()", "ABCDEFGHIJKLMNOPQRSTUVWXYZ234567");
        new d("base32Hex()", "0123456789ABCDEFGHIJKLMNOPQRSTUV");
        f98549f = new b(new a("base16()", "0123456789ABCDEF".toCharArray()));
    }

    /* JADX WARN: Removed duplicated region for block: B:9:0x001a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public d(a aVar, Character ch) {
        boolean z11;
        aVar.getClass();
        this.f98550a = aVar;
        if (ch != null) {
            char cCharValue = ch.charValue();
            byte[] bArr = aVar.f98543g;
            z11 = cCharValue >= bArr.length || bArr[cCharValue] == -1;
        }
        b0.d(z11, "Padding character %s was already in alphabet", ch);
        this.f98551b = ch;
    }

    public final byte[] a(String str) {
        try {
            int length = (int) (((this.f98550a.f98540d * r6.length()) + 7) / 8);
            byte[] bArr = new byte[length];
            int iB = b(bArr, h(str));
            if (iB == length) {
                return bArr;
            }
            byte[] bArr2 = new byte[iB];
            System.arraycopy(bArr, 0, bArr2, 0, iB);
            return bArr2;
        } catch (BaseEncoding$DecodingException e3) {
            throw new IllegalArgumentException(e3);
        }
    }

    public int b(byte[] bArr, CharSequence charSequence) throws BaseEncoding$DecodingException {
        CharSequence charSequenceH = h(charSequence);
        int length = charSequenceH.length();
        a aVar = this.f98550a;
        boolean[] zArr = aVar.f98544h;
        int i5 = aVar.f98540d;
        int i11 = aVar.f98541e;
        if (!zArr[length % i11]) {
            throw new BaseEncoding$DecodingException("Invalid input length " + charSequenceH.length());
        }
        int i12 = 0;
        for (int i13 = 0; i13 < charSequenceH.length(); i13 += i11) {
            long jA = 0;
            int i14 = 0;
            for (int i15 = 0; i15 < i11; i15++) {
                jA <<= i5;
                if (i13 + i15 < charSequenceH.length()) {
                    jA |= aVar.a(charSequenceH.charAt(i14 + i13));
                    i14++;
                }
            }
            int i16 = aVar.f98542f;
            int i17 = (i16 * 8) - (i14 * i5);
            int i18 = (i16 - 1) * 8;
            while (i18 >= i17) {
                bArr[i12] = (byte) ((jA >>> i18) & 255);
                i18 -= 8;
                i12++;
            }
        }
        return i12;
    }

    public final String c(byte[] bArr) {
        int length = bArr.length;
        b0.i(0, length, bArr.length);
        a aVar = this.f98550a;
        int i5 = aVar.f98541e;
        int i11 = aVar.f98542f;
        RoundingMode roundingMode = RoundingMode.CEILING;
        StringBuilder sb2 = new StringBuilder(ul.b.x(length, i11) * i5);
        try {
            e(sb2, bArr, length);
            return sb2.toString();
        } catch (IOException e3) {
            throw new AssertionError(e3);
        }
    }

    public final void d(StringBuilder sb2, byte[] bArr, int i5, int i11) {
        b0.i(i5, i5 + i11, bArr.length);
        a aVar = this.f98550a;
        int i12 = aVar.f98542f;
        int i13 = aVar.f98540d;
        int i14 = 0;
        b0.c(i11 <= i12);
        long j11 = 0;
        for (int i15 = 0; i15 < i11; i15++) {
            j11 = (j11 | (bArr[i5 + i15] & 255)) << 8;
        }
        int i16 = ((i11 + 1) * 8) - i13;
        while (i14 < i11 * 8) {
            sb2.append(aVar.f98538b[((int) (j11 >>> (i16 - i14))) & aVar.f98539c]);
            i14 += i13;
        }
        Character ch = this.f98551b;
        if (ch != null) {
            while (i14 < aVar.f98542f * 8) {
                sb2.append(ch.charValue());
                i14 += i13;
            }
        }
    }

    public void e(StringBuilder sb2, byte[] bArr, int i5) {
        int i11 = 0;
        b0.i(0, i5, bArr.length);
        while (i11 < i5) {
            a aVar = this.f98550a;
            d(sb2, bArr, i11, Math.min(aVar.f98542f, i5 - i11));
            i11 += aVar.f98542f;
        }
    }

    public final boolean equals(Object obj) {
        if (obj instanceof d) {
            d dVar = (d) obj;
            if (this.f98550a.equals(dVar.f98550a) && Objects.equals(this.f98551b, dVar.f98551b)) {
                return true;
            }
        }
        return false;
    }

    /* JADX WARN: Removed duplicated region for block: B:46:0x00b6  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final d f() {
        boolean z11;
        d dVarG = this.f98552c;
        if (dVarG == null) {
            a aVar = this.f98550a;
            char[] cArr = aVar.f98538b;
            int length = cArr.length;
            int i5 = 0;
            while (true) {
                if (i5 >= length) {
                    break;
                }
                if (b0.o(cArr[i5])) {
                    int length2 = cArr.length;
                    int i11 = 0;
                    while (true) {
                        if (i11 >= length2) {
                            z11 = false;
                            break;
                        }
                        char c11 = cArr[i11];
                        if (c11 >= 'a' && c11 <= 'z') {
                            z11 = true;
                            break;
                        }
                        i11++;
                    }
                    b0.j("Cannot call lowerCase() on a mixed-case alphabet", !z11);
                    char[] cArr2 = new char[cArr.length];
                    for (int i12 = 0; i12 < cArr.length; i12++) {
                        char c12 = cArr[i12];
                        if (b0.o(c12)) {
                            c12 = (char) (c12 ^ ' ');
                        }
                        cArr2[i12] = c12;
                    }
                    a aVar2 = new a(c0.q(new StringBuilder(), aVar.f98537a, ".lowerCase()"), cArr2);
                    if (aVar.f98545i) {
                        byte[] bArr = aVar2.f98543g;
                        if (aVar2.f98545i) {
                            aVar = aVar2;
                        } else {
                            byte[] bArrCopyOf = Arrays.copyOf(bArr, bArr.length);
                            for (int i13 = 65; i13 <= 90; i13++) {
                                int i14 = i13 | 32;
                                byte b11 = bArr[i13];
                                byte b12 = bArr[i14];
                                if (b11 == -1) {
                                    bArrCopyOf[i13] = b12;
                                } else {
                                    char c13 = (char) i13;
                                    char c14 = (char) i14;
                                    if (!(b12 == -1)) {
                                        throw new IllegalStateException(b0.p("Can't ignoreCase() since '%s' and '%s' encode different values", Character.valueOf(c13), Character.valueOf(c14)));
                                    }
                                    bArrCopyOf[i14] = b11;
                                }
                            }
                            aVar = new a(c0.q(new StringBuilder(), aVar2.f98537a, ".ignoreCase()"), aVar2.f98538b, bArrCopyOf, true);
                        }
                    }
                } else {
                    i5++;
                }
            }
            dVarG = aVar == this.f98550a ? this : g(aVar, this.f98551b);
            this.f98552c = dVarG;
        }
        return dVarG;
    }

    public d g(a aVar, Character ch) {
        return new d(aVar, ch);
    }

    public final CharSequence h(CharSequence charSequence) {
        charSequence.getClass();
        Character ch = this.f98551b;
        if (ch == null) {
            return charSequence;
        }
        char cCharValue = ch.charValue();
        int length = charSequence.length() - 1;
        while (length >= 0 && charSequence.charAt(length) == cCharValue) {
            length--;
        }
        return charSequence.subSequence(0, length + 1);
    }

    public final int hashCode() {
        return this.f98550a.hashCode() ^ Objects.hashCode(this.f98551b);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("BaseEncoding.");
        a aVar = this.f98550a;
        sb2.append(aVar);
        if (8 % aVar.f98540d != 0) {
            Character ch = this.f98551b;
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

    public d(String str, String str2) {
        this(new a(str, str2.toCharArray()), (Character) '=');
    }
}
