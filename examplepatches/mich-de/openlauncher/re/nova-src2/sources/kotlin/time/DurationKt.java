package kotlin.time;

import java.util.Collection;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.math.MathKt;
import kotlin.ranges.IntProgressionIterator;
import kotlin.ranges.IntRange;
import kotlin.ranges.a;
import kotlin.time.Duration;
import r70.j;
import r70.k;
import r70.l;

@Metadata(d1 = {"\u0000\u0002\n\u0000¨\u0006\u0000"}, d2 = {"kotlin-stdlib"}, k = 2, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class DurationKt {
    public static final long a(String str) {
        DurationUnit durationUnit;
        char cCharAt;
        int length = str.length();
        if (length == 0) {
            throw new IllegalArgumentException("The string is empty");
        }
        Duration.f72038b.getClass();
        char cCharAt2 = str.charAt(0);
        int i5 = (cCharAt2 == '+' || cCharAt2 == '-') ? 1 : 0;
        boolean z11 = i5 > 0 && k.k1(str, '-');
        if (length <= i5) {
            throw new IllegalArgumentException("No components");
        }
        if (str.charAt(i5) != 'P') {
            throw new IllegalArgumentException();
        }
        int i11 = i5 + 1;
        if (i11 == length) {
            throw new IllegalArgumentException();
        }
        DurationUnit durationUnit2 = null;
        long jM = 0;
        boolean z12 = false;
        while (i11 < length) {
            if (str.charAt(i11) != 'T') {
                int i12 = i11;
                while (i12 < str.length() && (('0' <= (cCharAt = str.charAt(i12)) && cCharAt < ':') || k.L0("+-.", cCharAt))) {
                    i12++;
                }
                String strSubstring = str.substring(i11, i12);
                Intrinsics.f(strSubstring, "substring(...)");
                if (strSubstring.length() == 0) {
                    throw new IllegalArgumentException();
                }
                int length2 = strSubstring.length() + i11;
                if (length2 < 0 || length2 >= str.length()) {
                    throw new IllegalArgumentException("Missing unit for value ".concat(strSubstring));
                }
                char cCharAt3 = str.charAt(length2);
                int i13 = length2 + 1;
                if (z12) {
                    if (cCharAt3 == 'H') {
                        durationUnit = DurationUnit.f72048g;
                    } else if (cCharAt3 == 'M') {
                        durationUnit = DurationUnit.f72047f;
                    } else {
                        if (cCharAt3 != 'S') {
                            throw new IllegalArgumentException("Invalid duration ISO time unit: " + cCharAt3);
                        }
                        durationUnit = DurationUnit.f72046e;
                    }
                } else {
                    if (cCharAt3 != 'D') {
                        throw new IllegalArgumentException("Invalid or unsupported duration ISO non-time unit: " + cCharAt3);
                    }
                    durationUnit = DurationUnit.f72049h;
                }
                if (durationUnit2 != null && durationUnit2.compareTo(durationUnit) <= 0) {
                    throw new IllegalArgumentException("Unexpected order of duration components");
                }
                int iR0 = k.R0('.', 0, 6, strSubstring);
                if (durationUnit != DurationUnit.f72046e || iR0 <= 0) {
                    jM = Duration.m(jM, h(e(strSubstring), durationUnit));
                } else {
                    String strSubstring2 = strSubstring.substring(0, iR0);
                    Intrinsics.f(strSubstring2, "substring(...)");
                    long jM2 = Duration.m(jM, h(e(strSubstring2), durationUnit));
                    String strSubstring3 = strSubstring.substring(iR0);
                    Intrinsics.f(strSubstring3, "substring(...)");
                    jM = Duration.m(jM2, f(Double.parseDouble(strSubstring3), durationUnit));
                }
                durationUnit2 = durationUnit;
                i11 = i13;
            } else {
                if (z12 || (i11 = i11 + 1) == length) {
                    throw new IllegalArgumentException();
                }
                z12 = true;
            }
        }
        return z11 ? Duration.t(jM) : jM;
    }

    public static final long b(long j11) {
        long j12 = (j11 << 1) + 1;
        Duration.Companion companion = Duration.f72038b;
        int i5 = DurationJvmKt.f72042a;
        return j12;
    }

    public static final long c(long j11) {
        return (-4611686018426L > j11 || j11 >= 4611686018427L) ? b(a.g0(j11, -4611686018427387903L, 4611686018427387903L)) : d(j11 * 1000000);
    }

    public static final long d(long j11) {
        long j12 = j11 << 1;
        Duration.Companion companion = Duration.f72038b;
        int i5 = DurationJvmKt.f72042a;
        return j12;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static final long e(String str) {
        int length = str.length();
        int i5 = (length <= 0 || !k.L0("+-", str.charAt(0))) ? 0 : 1;
        if (length - i5 > 16) {
            IntRange intRange = new IntRange(i5, k.O0(str), 1);
            if (!(intRange instanceof Collection) || !((Collection) intRange).isEmpty()) {
                IntProgressionIterator intProgressionIteratorF = intRange.iterator();
                while (intProgressionIteratorF.f71911c) {
                    char cCharAt = str.charAt(intProgressionIteratorF.nextInt());
                    if ('0' > cCharAt || cCharAt >= ':') {
                    }
                }
            }
            return str.charAt(0) == '-' ? Long.MIN_VALUE : Long.MAX_VALUE;
        }
        return j.I0(str, "+", false) ? Long.parseLong(l.B1(1, str)) : Long.parseLong(str);
    }

    public static final long f(double d5, DurationUnit unit) {
        Intrinsics.g(unit, "unit");
        double dA = DurationUnitKt.a(d5, unit, DurationUnit.f72043b);
        if (Double.isNaN(dA)) {
            throw new IllegalArgumentException("Duration value cannot be NaN.");
        }
        long jC = MathKt.c(dA);
        return (-4611686018426999999L > jC || jC >= 4611686018427000000L) ? c(MathKt.c(DurationUnitKt.a(d5, unit, DurationUnit.f72045d))) : d(jC);
    }

    public static final long g(int i5, DurationUnit unit) {
        Intrinsics.g(unit, "unit");
        return unit.compareTo(DurationUnit.f72046e) <= 0 ? d(DurationUnitKt.c(i5, unit, DurationUnit.f72043b)) : h(i5, unit);
    }

    public static final long h(long j11, DurationUnit unit) {
        Intrinsics.g(unit, "unit");
        DurationUnit durationUnit = DurationUnit.f72043b;
        long jC = DurationUnitKt.c(4611686018426999999L, durationUnit, unit);
        return ((-jC) > j11 || j11 > jC) ? b(a.g0(DurationUnitKt.b(j11, unit, DurationUnit.f72045d), -4611686018427387903L, 4611686018427387903L)) : d(DurationUnitKt.c(j11, unit, durationUnit));
    }
}
