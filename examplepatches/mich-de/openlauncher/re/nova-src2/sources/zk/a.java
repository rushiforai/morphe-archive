package zk;

import com.google.common.io.BaseEncoding$DecodingException;
import java.math.RoundingMode;
import java.util.Arrays;
import vk.b0;

/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final String f98537a;

    /* renamed from: b, reason: collision with root package name */
    public final char[] f98538b;

    /* renamed from: c, reason: collision with root package name */
    public final int f98539c;

    /* renamed from: d, reason: collision with root package name */
    public final int f98540d;

    /* renamed from: e, reason: collision with root package name */
    public final int f98541e;

    /* renamed from: f, reason: collision with root package name */
    public final int f98542f;

    /* renamed from: g, reason: collision with root package name */
    public final byte[] f98543g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean[] f98544h;

    /* renamed from: i, reason: collision with root package name */
    public final boolean f98545i;

    public a(String str, char[] cArr, byte[] bArr, boolean z11) {
        str.getClass();
        this.f98537a = str;
        cArr.getClass();
        this.f98538b = cArr;
        try {
            int length = cArr.length;
            RoundingMode roundingMode = RoundingMode.UNNECESSARY;
            int iS = ul.b.S(length);
            this.f98540d = iS;
            int iNumberOfTrailingZeros = Integer.numberOfTrailingZeros(iS);
            int i5 = 1 << (3 - iNumberOfTrailingZeros);
            this.f98541e = i5;
            this.f98542f = iS >> iNumberOfTrailingZeros;
            this.f98539c = cArr.length - 1;
            this.f98543g = bArr;
            boolean[] zArr = new boolean[i5];
            for (int i11 = 0; i11 < this.f98542f; i11++) {
                int i12 = this.f98540d;
                RoundingMode roundingMode2 = RoundingMode.CEILING;
                zArr[ul.b.x(i11 * 8, i12)] = true;
            }
            this.f98544h = zArr;
            this.f98545i = z11;
        } catch (ArithmeticException e3) {
            throw new IllegalArgumentException("Illegal alphabet length " + cArr.length, e3);
        }
    }

    public final int a(char c11) throws BaseEncoding$DecodingException {
        if (c11 > 127) {
            throw new BaseEncoding$DecodingException("Unrecognized character: 0x" + Integer.toHexString(c11));
        }
        byte b11 = this.f98543g[c11];
        if (b11 != -1) {
            return b11;
        }
        if (c11 <= ' ' || c11 == 127) {
            throw new BaseEncoding$DecodingException("Unrecognized character: 0x" + Integer.toHexString(c11));
        }
        throw new BaseEncoding$DecodingException("Unrecognized character: " + c11);
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return this.f98545i == aVar.f98545i && Arrays.equals(this.f98538b, aVar.f98538b);
    }

    public final int hashCode() {
        return Arrays.hashCode(this.f98538b) + (this.f98545i ? 1231 : 1237);
    }

    public final String toString() {
        return this.f98537a;
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public a(String str, char[] cArr) {
        byte[] bArr = new byte[128];
        Arrays.fill(bArr, (byte) -1);
        for (int i5 = 0; i5 < cArr.length; i5++) {
            char c11 = cArr[i5];
            if (c11 < 128) {
                if (bArr[c11] == -1) {
                    bArr[c11] = (byte) i5;
                } else {
                    throw new IllegalArgumentException(b0.p("Duplicate character: %s", Character.valueOf(c11)));
                }
            } else {
                throw new IllegalArgumentException(b0.p("Non-ASCII character: %s", Character.valueOf(c11)));
            }
        }
        this(str, cArr, bArr, false);
    }
}
