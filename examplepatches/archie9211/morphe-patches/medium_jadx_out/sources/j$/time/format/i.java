package j$.time.format;

import com.squareup.wire.internal.MathMethodsKt;
import java.math.BigInteger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public class i implements f {
    public static final long[] f = {0, 10, 100, 1000, 10000, 100000, 1000000, 10000000, 100000000, MathMethodsKt.NANOS_PER_SECOND, 10000000000L};
    public final j$.time.temporal.n a;
    public final int b;
    public final int c;
    public final z d;
    public final int e;

    public i(j$.time.temporal.n nVar, int i, int i2, z zVar) {
        this.a = nVar;
        this.b = i;
        this.c = i2;
        this.d = zVar;
        this.e = 0;
    }

    public boolean a(q qVar) {
        int i = this.e;
        if (i != -1) {
            return i > 0 && this.b == this.c && this.d == z.NOT_NEGATIVE;
        }
        return true;
    }

    public i b() {
        if (this.e == -1) {
            return this;
        }
        return new i(this.a, this.b, this.c, this.d, -1);
    }

    public i c(int i) {
        return new i(this.a, this.b, this.c, this.d, this.e + i);
    }

    @Override // j$.time.format.f
    public boolean h(t tVar, StringBuilder sb) {
        j$.time.temporal.n nVar = this.a;
        Long lA = tVar.a(nVar);
        if (lA == null) {
            return false;
        }
        long jLongValue = lA.longValue();
        w wVar = tVar.b.c;
        String string = jLongValue == Long.MIN_VALUE ? "9223372036854775808" : Long.toString(Math.abs(jLongValue));
        int length = string.length();
        int i = this.c;
        if (length > i) {
            throw new j$.time.c("Field " + nVar + " cannot be printed as the value " + jLongValue + " exceeds the maximum print width of " + i);
        }
        wVar.getClass();
        int i2 = this.b;
        z zVar = this.d;
        if (jLongValue >= 0) {
            int i3 = c.a[zVar.ordinal()];
            if (i3 != 1) {
                if (i3 == 2) {
                    sb.append('+');
                }
            } else if (i2 < 19 && jLongValue >= f[i2]) {
                sb.append('+');
            }
        } else {
            int i4 = c.a[zVar.ordinal()];
            if (i4 == 1 || i4 == 2 || i4 == 3) {
                sb.append('-');
            } else if (i4 == 4) {
                throw new j$.time.c("Field " + nVar + " cannot be printed as the value " + jLongValue + " cannot be negative according to the SignStyle");
            }
        }
        for (int i5 = 0; i5 < i2 - string.length(); i5++) {
            sb.append('0');
        }
        sb.append(string);
        return true;
    }

    @Override // j$.time.format.f
    public int i(q qVar, CharSequence charSequence, int i) {
        int i2;
        boolean z;
        boolean z2;
        BigInteger bigIntegerAdd;
        boolean z3;
        boolean z4;
        int i3;
        long j;
        long j2;
        int i4;
        int i5;
        boolean z5;
        w wVar;
        int length = charSequence.length();
        if (i == length) {
            return ~i;
        }
        char cCharAt = charSequence.charAt(i);
        DateTimeFormatter dateTimeFormatter = qVar.a;
        w wVar2 = dateTimeFormatter.c;
        dateTimeFormatter.c.getClass();
        int i6 = this.c;
        z zVar = this.d;
        int i7 = this.b;
        int i8 = 0;
        boolean z6 = true;
        if (cCharAt == '+') {
            boolean z7 = qVar.c;
            boolean z8 = i7 == i6;
            int iOrdinal = zVar.ordinal();
            if (iOrdinal == 0 ? z7 : !(iOrdinal == 1 || iOrdinal == 4 || (!z7 && !z8))) {
                return ~i;
            }
            i2 = i + 1;
            z = false;
            z2 = true;
        } else {
            wVar2.getClass();
            if (cCharAt == '-') {
                boolean z9 = qVar.c;
                boolean z10 = i7 == i6;
                int iOrdinal2 = zVar.ordinal();
                if (iOrdinal2 != 0 && iOrdinal2 != 1 && iOrdinal2 != 4 && (z9 || z10)) {
                    return ~i;
                }
                i2 = i + 1;
                z2 = false;
                z = true;
            } else {
                if (zVar == z.ALWAYS && qVar.c) {
                    return ~i;
                }
                i2 = i;
                z = false;
                z2 = false;
            }
        }
        int i9 = (qVar.c || a(qVar)) ? i7 : 1;
        int i10 = i2 + i9;
        if (i10 > length) {
            return ~i2;
        }
        if (!qVar.c && !a(qVar)) {
            i6 = 9;
        }
        int i11 = this.e;
        int iMax = Math.max(i11, 0) + i6;
        while (true) {
            bigIntegerAdd = null;
            if (i8 >= 2) {
                z3 = z;
                z4 = z2;
                i3 = i2;
                j = 0;
                break;
            }
            int iMin = Math.min(i2 + iMax, length);
            boolean z11 = z6;
            j2 = 0;
            i4 = i2;
            while (true) {
                if (i4 >= iMin) {
                    z3 = z;
                    i5 = length;
                    break;
                }
                int i12 = i4 + 1;
                char cCharAt2 = charSequence.charAt(i4);
                wVar2.getClass();
                z3 = z;
                int i13 = cCharAt2 - '0';
                i5 = length;
                if (i13 < 0 || i13 > 9) {
                    i13 = -1;
                }
                if (i13 >= 0) {
                    if (i12 - i2 > 18) {
                        if (bigIntegerAdd == null) {
                            bigIntegerAdd = BigInteger.valueOf(j2);
                        }
                        z5 = z2;
                        wVar = wVar2;
                        bigIntegerAdd = bigIntegerAdd.multiply(BigInteger.TEN).add(BigInteger.valueOf(i13));
                    } else {
                        z5 = z2;
                        wVar = wVar2;
                        j2 = (j2 * 10) + ((long) i13);
                    }
                    i4 = i12;
                    length = i5;
                    z = z3;
                    wVar2 = wVar;
                    z2 = z5;
                } else if (i4 < i10) {
                    return ~i2;
                }
            }
            z4 = z2;
            w wVar3 = wVar2;
            if (i11 <= 0 || i8 != 0) {
                break;
            }
            int iMax2 = Math.max(i9, (i4 - i2) - i11);
            i8++;
            z6 = z11;
            length = i5;
            wVar2 = wVar3;
            z2 = z4;
            iMax = iMax2;
            z = z3;
        }
        i3 = i4;
        j = j2;
        BigInteger bigIntegerDivide = bigIntegerAdd;
        if (z3) {
            if (bigIntegerDivide != null) {
                if (bigIntegerDivide.equals(BigInteger.ZERO) && qVar.c) {
                    return ~(i2 - 1);
                }
                bigIntegerDivide = bigIntegerDivide.negate();
            } else {
                if (j == 0 && qVar.c) {
                    return ~(i2 - 1);
                }
                j = -j;
            }
        } else if (zVar == z.EXCEEDS_PAD && qVar.c) {
            int i14 = i3 - i2;
            if (z4) {
                if (i14 <= i7) {
                    return ~(i2 - 1);
                }
            } else if (i14 > i7) {
                return ~i2;
            }
        }
        if (bigIntegerDivide == null) {
            return qVar.f(this.a, j, i2, i3);
        }
        if (bigIntegerDivide.bitLength() > 63) {
            bigIntegerDivide = bigIntegerDivide.divide(BigInteger.TEN);
            i3--;
        }
        return qVar.f(this.a, bigIntegerDivide.longValue(), i2, i3);
    }

    public String toString() {
        int i = this.c;
        j$.time.temporal.n nVar = this.a;
        z zVar = this.d;
        int i2 = this.b;
        if (i2 == 1 && i == 19 && zVar == z.NORMAL) {
            return "Value(" + nVar + ")";
        }
        if (i2 == i && zVar == z.NOT_NEGATIVE) {
            return "Value(" + nVar + "," + i2 + ")";
        }
        return "Value(" + nVar + "," + i2 + "," + i + "," + zVar + ")";
    }

    public i(j$.time.temporal.n nVar, int i, int i2, z zVar, int i3) {
        this.a = nVar;
        this.b = i;
        this.c = i2;
        this.d = zVar;
        this.e = i3;
    }
}
