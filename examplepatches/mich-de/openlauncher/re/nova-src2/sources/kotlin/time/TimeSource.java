package kotlin.time;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.SinceKotlin;
import kotlin.WasExperimental;
import kotlin.jvm.JvmInline;
import kotlin.jvm.internal.Intrinsics;

@SinceKotlin
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0004\bg\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lkotlin/time/TimeSource;", b.f42142b, "WithComparableMarks", "Monotonic", k.O, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
@WasExperimental
/* loaded from: classes5.dex */
public interface TimeSource {

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lkotlin/time/TimeSource$Companion;", b.f42142b, "<init>", "()V", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        static {
            new Companion();
        }

        private Companion() {
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\bÆ\u0002\u0018\u00002\u00020\u0001:\u0001\u0004B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0005"}, d2 = {"Lkotlin/time/TimeSource$Monotonic;", "Lkotlin/time/TimeSource$WithComparableMarks;", "<init>", "()V", "ValueTimeMark", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Monotonic implements WithComparableMarks {

        /* renamed from: a, reason: collision with root package name */
        public static final Monotonic f72054a = new Monotonic();

        @SinceKotlin
        @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0018\u0002\n\u0000\b\u0087@\u0018\u00002\u00020\u0001\u0088\u0001\u0002\u0092\u0001\u00060\u0003j\u0002`\u0004¨\u0006\u0005"}, d2 = {"Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;", "Lkotlin/time/ComparableTimeMark;", "reading", b.f42142b, "Lkotlin/time/ValueTimeMarkReading;", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
        @JvmInline
        @WasExperimental
        public static final class ValueTimeMark implements ComparableTimeMark {
            @Override // java.lang.Comparable
            public final int compareTo(ComparableTimeMark comparableTimeMark) {
                ComparableTimeMark other = comparableTimeMark;
                Intrinsics.g(other, "other");
                Intrinsics.g(other, "other");
                if (!(other instanceof ValueTimeMark)) {
                    throw new IllegalArgumentException("Subtracting or comparing time marks from different time sources is not possible: ValueTimeMark(reading=0) and " + other);
                }
                MonotonicTimeSource.f72052a.getClass();
                DurationUnit unit = DurationUnit.f72043b;
                Intrinsics.g(unit, "unit");
                long jB = LongSaturatedMathKt.b(0L, 0L, unit);
                Duration.f72038b.getClass();
                return Duration.c(jB, 0L);
            }

            public final boolean equals(Object obj) {
                return obj instanceof ValueTimeMark;
            }

            public final int hashCode() {
                return Long.hashCode(0L);
            }

            public final String toString() {
                return "ValueTimeMark(reading=0)";
            }
        }

        private Monotonic() {
        }

        public final String toString() {
            MonotonicTimeSource.f72052a.getClass();
            return "TimeSource(System.nanoTime())";
        }
    }

    @SinceKotlin
    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bg\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lkotlin/time/TimeSource$WithComparableMarks;", "Lkotlin/time/TimeSource;", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @WasExperimental
    public interface WithComparableMarks extends TimeSource {
    }
}
