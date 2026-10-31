package ads_mobile_sdk;

import java.util.concurrent.ConcurrentHashMap;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;

/* loaded from: classes2.dex */
public final class dc3 implements b.ka {

    /* renamed from: a, reason: collision with root package name */
    public final g9 f2437a;

    /* renamed from: b, reason: collision with root package name */
    public final String f2438b;

    /* renamed from: c, reason: collision with root package name */
    public final long f2439c;

    public dc3(g9 adUnitStatsTracker, ck appStatsTracker, String requestId, long j11) {
        Intrinsics.g(adUnitStatsTracker, "adUnitStatsTracker");
        Intrinsics.g(appStatsTracker, "appStatsTracker");
        Intrinsics.g(requestId, "requestId");
        this.f2437a = adUnitStatsTracker;
        this.f2438b = requestId;
        this.f2439c = j11;
    }

    @Override // b.ka
    public final Object b(Continuation continuation) {
        g9 g9Var = this.f2437a;
        g9Var.getClass();
        String requestId = this.f2438b;
        Intrinsics.g(requestId, "requestId");
        ConcurrentHashMap concurrentHashMap = g9Var.f3676c;
        Duration.Companion companion = Duration.f72038b;
        concurrentHashMap.put(requestId, new Duration(DurationKt.h(this.f2439c, DurationUnit.f72045d)));
        return Unit.f71706a;
    }
}
