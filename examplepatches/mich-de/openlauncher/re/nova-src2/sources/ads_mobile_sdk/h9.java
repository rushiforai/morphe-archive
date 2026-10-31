package ads_mobile_sdk;

import android.os.SystemClock;
import b.o2;
import b.r0;
import java.util.concurrent.ConcurrentHashMap;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;

/* loaded from: classes2.dex */
public final class h9 implements r0 {

    /* renamed from: a, reason: collision with root package name */
    public final String f4242a;

    /* renamed from: b, reason: collision with root package name */
    public final ni.q f4243b;

    /* renamed from: c, reason: collision with root package name */
    public final g9 f4244c;

    /* renamed from: d, reason: collision with root package name */
    public final o2 f4245d;

    public h9(String requestId, ni.q baseRequest, g9 adUnitStatsTracker, o2 clock) {
        Intrinsics.g(requestId, "requestId");
        Intrinsics.g(baseRequest, "baseRequest");
        Intrinsics.g(adUnitStatsTracker, "adUnitStatsTracker");
        Intrinsics.g(clock, "clock");
        this.f4242a = requestId;
        this.f4243b = baseRequest;
        this.f4244c = adUnitStatsTracker;
        this.f4245d = clock;
    }

    @Override // b.r0
    public final Object a(d33 d33Var, z1 z1Var, ni.g0 g0Var, Continuation continuation) {
        String strL = this.f4243b.l();
        this.f4245d.getClass();
        long jElapsedRealtime = SystemClock.elapsedRealtime();
        g9 g9Var = this.f4244c;
        g9Var.getClass();
        String requestId = this.f4242a;
        Intrinsics.g(requestId, "requestId");
        Duration duration = (Duration) g9Var.f3676c.get(requestId);
        if (duration != null && strL != null) {
            ConcurrentHashMap concurrentHashMap = g9Var.f3677d;
            Duration.Companion companion = Duration.f72038b;
            concurrentHashMap.put(strL, new Duration(Duration.l(DurationKt.h(jElapsedRealtime, DurationUnit.f72045d), duration.f72041a)));
        }
        return Unit.f71706a;
    }
}
