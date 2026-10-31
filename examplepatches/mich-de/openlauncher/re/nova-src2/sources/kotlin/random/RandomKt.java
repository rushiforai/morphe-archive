package kotlin.random;

import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.ranges.IntRange;

@Metadata(d1 = {"\u0000\u0002\n\u0000¨\u0006\u0000"}, d2 = {"kotlin-stdlib"}, k = 2, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class RandomKt {
    public static final XorWowRandom a(long j11) {
        int i5 = (int) j11;
        int i11 = (int) (j11 >> 32);
        int i12 = ~i5;
        XorWowRandom xorWowRandom = new XorWowRandom();
        xorWowRandom.f71892c = i5;
        xorWowRandom.f71893d = i11;
        xorWowRandom.f71894e = 0;
        xorWowRandom.f71895f = 0;
        xorWowRandom.f71896g = i12;
        xorWowRandom.f71897h = (i5 << 10) ^ (i11 >>> 4);
        if ((i11 | i5 | i12) == 0) {
            throw new IllegalArgumentException("Initial state must have at least one non-zero element.");
        }
        for (int i13 = 0; i13 < 64; i13++) {
            xorWowRandom.e();
        }
        return xorWowRandom;
    }

    public static final String b(Number number, Number number2) {
        return "Random range is empty: [" + number + ", " + number2 + ").";
    }

    public static final void c(double d5) {
        if (d5 <= 0.0d) {
            throw new IllegalArgumentException(b(Double.valueOf(0.0d), Double.valueOf(d5)).toString());
        }
    }

    public static final void d(int i5, int i11) {
        if (i11 <= i5) {
            throw new IllegalArgumentException(b(Integer.valueOf(i5), Integer.valueOf(i11)).toString());
        }
    }

    public static final void e(long j11, long j12) {
        if (j12 <= j11) {
            throw new IllegalArgumentException(b(Long.valueOf(j11), Long.valueOf(j12)).toString());
        }
    }

    public static final int f(int i5) {
        return 31 - Integer.numberOfLeadingZeros(i5);
    }

    public static final int g(Random random, IntRange range) {
        Intrinsics.g(random, "<this>");
        Intrinsics.g(range, "range");
        int i5 = range.f71906a;
        if (!range.isEmpty()) {
            int i11 = range.f71907b;
            return i11 < Integer.MAX_VALUE ? random.g(i5, i11 + 1) : i5 > Integer.MIN_VALUE ? random.g(i5 - 1, i11) + 1 : random.e();
        }
        throw new IllegalArgumentException("Cannot get random in empty range: " + range);
    }

    public static final int h(int i5, int i11) {
        return (i5 >>> (32 - i11)) & ((-i11) >> 31);
    }
}
