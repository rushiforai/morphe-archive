package kotlin.time;

import kotlin.Metadata;
import kotlin.SinceKotlin;
import kotlin.time.TimeSource;

@SinceKotlin
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\bÁ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lkotlin/time/MonotonicTimeSource;", "Lkotlin/time/TimeSource$WithComparableMarks;", "<init>", "()V", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes5.dex */
public final class MonotonicTimeSource implements TimeSource.WithComparableMarks {

    /* renamed from: a, reason: collision with root package name */
    public static final MonotonicTimeSource f72052a = new MonotonicTimeSource();

    /* renamed from: b, reason: collision with root package name */
    public static final long f72053b = System.nanoTime();

    private MonotonicTimeSource() {
    }

    public static long a() {
        return System.nanoTime() - f72053b;
    }

    public final String toString() {
        return "TimeSource(System.nanoTime())";
    }
}
