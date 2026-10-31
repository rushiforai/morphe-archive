package kotlin.time;

import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"kotlin/time/DurationUnitKt", "kotlin/time/DurationUnitKt"}, d2 = {}, k = 4, mv = {2, 1, 0}, xi = 49)
/* loaded from: classes.dex */
public final class DurationUnitKt {
    private DurationUnitKt() {
    }

    public static final double a(double d5, DurationUnit sourceUnit, DurationUnit targetUnit) {
        Intrinsics.g(sourceUnit, "sourceUnit");
        Intrinsics.g(targetUnit, "targetUnit");
        long jConvert = targetUnit.f72051a.convert(1L, sourceUnit.f72051a);
        return jConvert > 0 ? d5 * jConvert : d5 / r8.convert(1L, r9);
    }

    public static final long b(long j11, DurationUnit sourceUnit, DurationUnit targetUnit) {
        Intrinsics.g(sourceUnit, "sourceUnit");
        Intrinsics.g(targetUnit, "targetUnit");
        return targetUnit.f72051a.convert(j11, sourceUnit.f72051a);
    }

    public static final long c(long j11, DurationUnit sourceUnit, DurationUnit targetUnit) {
        Intrinsics.g(sourceUnit, "sourceUnit");
        Intrinsics.g(targetUnit, "targetUnit");
        return targetUnit.f72051a.convert(j11, sourceUnit.f72051a);
    }
}
