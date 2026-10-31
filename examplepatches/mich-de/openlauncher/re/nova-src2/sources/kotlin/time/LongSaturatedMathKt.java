package kotlin.time;

import kotlin.Metadata;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.time.Duration;

@Metadata(d1 = {"\u0000\u0002\n\u0000¨\u0006\u0000"}, d2 = {"kotlin-stdlib"}, k = 2, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes5.dex */
public final class LongSaturatedMathKt {
    public static final long a(long j11) {
        if (j11 < 0) {
            Duration.f72038b.getClass();
            return Duration.f72040d;
        }
        Duration.f72038b.getClass();
        return Duration.f72039c;
    }

    public static final long b(long j11, long j12, DurationUnit durationUnit) {
        long j13 = j11 - j12;
        if (((j13 ^ j11) & (~(j13 ^ j12))) >= 0) {
            return DurationKt.h(j13, durationUnit);
        }
        DurationUnit durationUnit2 = DurationUnit.f72045d;
        if (durationUnit.compareTo(durationUnit2) >= 0) {
            return Duration.t(a(j13));
        }
        long jB = DurationUnitKt.b(1L, durationUnit2, durationUnit);
        long j14 = (j11 / jB) - (j12 / jB);
        long j15 = (j11 % jB) - (j12 % jB);
        Duration.Companion companion = Duration.f72038b;
        return Duration.m(DurationKt.h(j14, durationUnit2), DurationKt.h(j15, durationUnit));
    }
}
