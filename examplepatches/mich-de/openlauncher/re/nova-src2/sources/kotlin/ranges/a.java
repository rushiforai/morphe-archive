package kotlin.ranges;

import a2.c;
import b.c0;
import java.util.NoSuchElementException;
import kotlin.jvm.internal.Intrinsics;
import kotlin.random.Random;
import kotlin.random.RandomKt;
import kotlin.ranges.IntProgression;
import x7.f;

/* loaded from: classes.dex */
public abstract class a extends f {
    public static Comparable b0(y3.f fVar, y3.f fVar2) {
        return fVar.compareTo(fVar2) < 0 ? fVar2 : fVar;
    }

    public static double c0(double d5, double d11, double d12) {
        if (d11 <= d12) {
            return d5 < d11 ? d11 : d5 > d12 ? d12 : d5;
        }
        throw new IllegalArgumentException("Cannot coerce value to an empty range: maximum " + d12 + " is less than minimum " + d11 + '.');
    }

    public static float d0(float f11, float f12, float f13) {
        if (f12 <= f13) {
            return f11 < f12 ? f12 : f11 > f13 ? f13 : f11;
        }
        throw new IllegalArgumentException("Cannot coerce value to an empty range: maximum " + f13 + " is less than minimum " + f12 + '.');
    }

    public static int e0(int i5, int i11, int i12) {
        if (i11 <= i12) {
            return i5 < i11 ? i11 : i5 > i12 ? i12 : i5;
        }
        throw new IllegalArgumentException("Cannot coerce value to an empty range: maximum " + i12 + " is less than minimum " + i11 + '.');
    }

    public static int f0(int i5, ClosedRange range) {
        Intrinsics.g(range, "range");
        if (range instanceof ClosedFloatingPointRange) {
            return ((Number) i0(Integer.valueOf(i5), (ClosedFloatingPointRange) range)).intValue();
        }
        if (!range.isEmpty()) {
            return i5 < ((Number) range.c()).intValue() ? ((Number) range.c()).intValue() : i5 > ((Number) range.e()).intValue() ? ((Number) range.e()).intValue() : i5;
        }
        throw new IllegalArgumentException("Cannot coerce value to an empty range: " + range + '.');
    }

    public static long g0(long j11, long j12, long j13) {
        if (j12 <= j13) {
            return j11 < j12 ? j12 : j11 > j13 ? j13 : j11;
        }
        throw new IllegalArgumentException(c.n(c0.u(j13, "Cannot coerce value to an empty range: maximum ", " is less than minimum "), j12, '.'));
    }

    public static long h0(long j11, ClosedRange range) {
        Intrinsics.g(range, "range");
        if (range instanceof ClosedFloatingPointRange) {
            return ((Number) i0(Long.valueOf(j11), (ClosedFloatingPointRange) range)).longValue();
        }
        if (!range.isEmpty()) {
            return j11 < ((Number) range.c()).longValue() ? ((Number) range.c()).longValue() : j11 > ((Number) range.e()).longValue() ? ((Number) range.e()).longValue() : j11;
        }
        throw new IllegalArgumentException("Cannot coerce value to an empty range: " + range + '.');
    }

    public static Comparable i0(Comparable comparable, ClosedFloatingPointRange range) {
        Intrinsics.g(range, "range");
        if (!range.isEmpty()) {
            return (!range.b(comparable, range.c()) || range.b(range.c(), comparable)) ? (!range.b(range.e(), comparable) || range.b(comparable, range.e())) ? comparable : range.e() : range.c();
        }
        throw new IllegalArgumentException("Cannot coerce value to an empty range: " + range + '.');
    }

    public static IntProgression j0(int i5, int i11) {
        IntProgression.f71905d.getClass();
        return new IntProgression(i5, i11, -1);
    }

    public static int k0(Random random, IntRange intRange) {
        Intrinsics.g(intRange, "<this>");
        Intrinsics.g(random, "random");
        try {
            return RandomKt.g(random, intRange);
        } catch (IllegalArgumentException e3) {
            throw new NoSuchElementException(e3.getMessage());
        }
    }

    public static IntProgression l0(IntRange intRange, int i5) {
        Intrinsics.g(intRange, "<this>");
        boolean z11 = i5 > 0;
        Integer numValueOf = Integer.valueOf(i5);
        if (!z11) {
            throw new IllegalArgumentException("Step must be positive, was: " + numValueOf + '.');
        }
        IntProgression.Companion companion = IntProgression.f71905d;
        int i11 = intRange.f71906a;
        int i12 = intRange.f71907b;
        if (intRange.f71908c <= 0) {
            i5 = -i5;
        }
        companion.getClass();
        return new IntProgression(i11, i12, i5);
    }

    public static IntRange m0(int i5, int i11) {
        if (i11 > Integer.MIN_VALUE) {
            return new IntRange(i5, i11 - 1, 1);
        }
        IntRange.f71913e.getClass();
        return IntRange.f71914f;
    }
}
