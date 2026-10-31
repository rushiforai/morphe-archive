package mh;

import java.math.RoundingMode;
import java.util.Arrays;

/* loaded from: classes3.dex */
public final class b0 {

    /* renamed from: a, reason: collision with root package name */
    public final String f76314a;

    /* renamed from: b, reason: collision with root package name */
    public final char[] f76315b;

    /* renamed from: c, reason: collision with root package name */
    public final int f76316c;

    /* renamed from: d, reason: collision with root package name */
    public final int f76317d;

    /* renamed from: e, reason: collision with root package name */
    public final int f76318e;

    /* renamed from: f, reason: collision with root package name */
    public final int f76319f;

    /* renamed from: g, reason: collision with root package name */
    public final byte[] f76320g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f76321h;

    /* JADX WARN: Illegal instructions before constructor call */
    public b0(String str, char[] cArr) {
        byte[] bArr = new byte[128];
        Arrays.fill(bArr, (byte) -1);
        for (int i5 = 0; i5 < cArr.length; i5++) {
            char c11 = cArr[i5];
            if (!(c11 < 128)) {
                throw new IllegalArgumentException(a.c("Non-ASCII character: %s", Character.valueOf(c11)));
            }
            if (!(bArr[c11] == -1)) {
                throw new IllegalArgumentException(a.c("Duplicate character: %s", Character.valueOf(c11)));
            }
            bArr[c11] = (byte) i5;
        }
        this(str, cArr, bArr, false);
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof b0)) {
            return false;
        }
        b0 b0Var = (b0) obj;
        return this.f76321h == b0Var.f76321h && Arrays.equals(this.f76315b, b0Var.f76315b);
    }

    public final int hashCode() {
        return Arrays.hashCode(this.f76315b) + (true != this.f76321h ? 1237 : 1231);
    }

    public final String toString() {
        return this.f76314a;
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x0061 A[LOOP:0: B:16:0x005d->B:18:0x0061, LOOP_END] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public b0(String str, char[] cArr, byte[] bArr, boolean z11) {
        int iNumberOfLeadingZeros;
        int i5;
        this.f76314a = str;
        cArr.getClass();
        this.f76315b = cArr;
        try {
            int length = cArr.length;
            RoundingMode roundingMode = RoundingMode.UNNECESSARY;
            if (length > 0) {
                switch (f0.f76334a[roundingMode.ordinal()]) {
                    case 1:
                        if (((length - 1) & length) != 0) {
                            throw new ArithmeticException("mode was UNNECESSARY, but rounding was necessary");
                        }
                    case 2:
                    case 3:
                        iNumberOfLeadingZeros = 31 - Integer.numberOfLeadingZeros(length);
                        this.f76317d = iNumberOfLeadingZeros;
                        int iNumberOfTrailingZeros = Integer.numberOfTrailingZeros(iNumberOfLeadingZeros);
                        int i11 = 1 << (3 - iNumberOfTrailingZeros);
                        this.f76318e = i11;
                        this.f76319f = iNumberOfLeadingZeros >> iNumberOfTrailingZeros;
                        this.f76316c = length - 1;
                        this.f76320g = bArr;
                        boolean[] zArr = new boolean[i11];
                        for (i5 = 0; i5 < this.f76319f; i5++) {
                            int i12 = this.f76317d;
                            RoundingMode roundingMode2 = RoundingMode.CEILING;
                            zArr[a.a(i5 * 8, i12)] = true;
                        }
                        this.f76321h = z11;
                        return;
                    case 4:
                    case 5:
                        iNumberOfLeadingZeros = 32 - Integer.numberOfLeadingZeros(length - 1);
                        this.f76317d = iNumberOfLeadingZeros;
                        int iNumberOfTrailingZeros2 = Integer.numberOfTrailingZeros(iNumberOfLeadingZeros);
                        int i112 = 1 << (3 - iNumberOfTrailingZeros2);
                        this.f76318e = i112;
                        this.f76319f = iNumberOfLeadingZeros >> iNumberOfTrailingZeros2;
                        this.f76316c = length - 1;
                        this.f76320g = bArr;
                        boolean[] zArr2 = new boolean[i112];
                        while (i5 < this.f76319f) {
                        }
                        this.f76321h = z11;
                        return;
                    case 6:
                    case 7:
                    case 8:
                        int iNumberOfLeadingZeros2 = Integer.numberOfLeadingZeros(length);
                        iNumberOfLeadingZeros = (31 - iNumberOfLeadingZeros2) + ((((-1257966797) >>> iNumberOfLeadingZeros2) - length) >>> 31);
                        this.f76317d = iNumberOfLeadingZeros;
                        int iNumberOfTrailingZeros22 = Integer.numberOfTrailingZeros(iNumberOfLeadingZeros);
                        int i1122 = 1 << (3 - iNumberOfTrailingZeros22);
                        this.f76318e = i1122;
                        this.f76319f = iNumberOfLeadingZeros >> iNumberOfTrailingZeros22;
                        this.f76316c = length - 1;
                        this.f76320g = bArr;
                        boolean[] zArr22 = new boolean[i1122];
                        while (i5 < this.f76319f) {
                        }
                        this.f76321h = z11;
                        return;
                    default:
                        throw new AssertionError();
                }
            } else {
                throw new IllegalArgumentException("x (0) must be > 0");
            }
        } catch (ArithmeticException e3) {
            throw new IllegalArgumentException(b.c0.h(cArr.length, "Illegal alphabet length "), e3);
        }
    }
}
