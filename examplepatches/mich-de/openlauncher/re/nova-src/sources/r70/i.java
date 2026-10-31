package r70;

import h6.c1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class i extends h {
    public static final void q0(String input) {
        Intrinsics.g(input, "input");
        throw new NumberFormatException(c1.m('\'', "Invalid number format: '", input));
    }

    public static Double r0(String str) {
        Intrinsics.g(str, "<this>");
        try {
            if (e.f85612a.f(str)) {
                return Double.valueOf(Double.parseDouble(str));
            }
        } catch (NumberFormatException unused) {
        }
        return null;
    }

    public static Float s0(String str) {
        Intrinsics.g(str, "<this>");
        try {
            if (e.f85612a.f(str)) {
                return Float.valueOf(Float.parseFloat(str));
            }
        } catch (NumberFormatException unused) {
        }
        return null;
    }

    public static Integer t0(int i5, String str) {
        boolean z11;
        int i11;
        int i12;
        Intrinsics.g(str, "<this>");
        kotlin.text.a.a(i5);
        int length = str.length();
        if (length == 0) {
            return null;
        }
        int i13 = 0;
        char cCharAt = str.charAt(0);
        int i14 = -2147483647;
        if (Intrinsics.h(cCharAt, 48) < 0) {
            i11 = 1;
            if (length == 1) {
                return null;
            }
            if (cCharAt == '+') {
                z11 = false;
            } else {
                if (cCharAt != '-') {
                    return null;
                }
                i14 = Integer.MIN_VALUE;
                z11 = true;
            }
        } else {
            z11 = false;
            i11 = 0;
        }
        int i15 = -59652323;
        while (i11 < length) {
            int iDigit = Character.digit((int) str.charAt(i11), i5);
            if (iDigit < 0) {
                return null;
            }
            if ((i13 < i15 && (i15 != -59652323 || i13 < (i15 = i14 / i5))) || (i12 = i13 * i5) < i14 + iDigit) {
                return null;
            }
            i13 = i12 - iDigit;
            i11++;
        }
        return z11 ? Integer.valueOf(i13) : Integer.valueOf(-i13);
    }

    public static Integer u0(String str) {
        Intrinsics.g(str, "<this>");
        return t0(10, str);
    }

    public static Long v0(String str) {
        boolean z11;
        Intrinsics.g(str, "<this>");
        kotlin.text.a.a(10);
        int length = str.length();
        if (length == 0) {
            return null;
        }
        int i5 = 0;
        char cCharAt = str.charAt(0);
        long j11 = -9223372036854775807L;
        if (Intrinsics.h(cCharAt, 48) < 0) {
            z11 = true;
            if (length == 1) {
                return null;
            }
            if (cCharAt == '+') {
                z11 = false;
                i5 = 1;
            } else {
                if (cCharAt != '-') {
                    return null;
                }
                j11 = Long.MIN_VALUE;
                i5 = 1;
            }
        } else {
            z11 = false;
        }
        long j12 = 0;
        long j13 = -256204778801521550L;
        while (i5 < length) {
            int iDigit = Character.digit((int) str.charAt(i5), 10);
            if (iDigit < 0) {
                return null;
            }
            if (j12 < j13) {
                if (j13 != -256204778801521550L) {
                    return null;
                }
                j13 = j11 / 10;
                if (j12 < j13) {
                    return null;
                }
            }
            long j14 = j12 * 10;
            long j15 = iDigit;
            if (j14 < j11 + j15) {
                return null;
            }
            j12 = j14 - j15;
            i5++;
        }
        return z11 ? Long.valueOf(j12) : Long.valueOf(-j12);
    }
}
