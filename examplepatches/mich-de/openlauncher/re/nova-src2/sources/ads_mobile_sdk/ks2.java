package ads_mobile_sdk;

import b.x2;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import ti.d;

/* loaded from: classes.dex */
public final class ks2 implements x2 {

    /* renamed from: a, reason: collision with root package name */
    public final g9 f5952a;

    /* renamed from: b, reason: collision with root package name */
    public final ni.q f5953b;

    /* renamed from: c, reason: collision with root package name */
    public final xj f5954c;

    /* renamed from: d, reason: collision with root package name */
    public final d f5955d;

    public ks2(g9 adUnitStatsTracker, ni.q request, xj appState, d appStats) {
        Intrinsics.g(adUnitStatsTracker, "adUnitStatsTracker");
        Intrinsics.g(request, "request");
        Intrinsics.g(appState, "appState");
        Intrinsics.g(appStats, "appStats");
        this.f5952a = adUnitStatsTracker;
        this.f5953b = request;
        this.f5954c = appState;
        this.f5955d = appStats;
    }

    @Override // b.x2
    public final cw0 a() {
        return cw0.QUALITY;
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x0027  */
    /* JADX WARN: Removed duplicated region for block: B:14:0x0034  */
    @Override // b.x2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(Continuation continuation) {
        Integer num;
        String strL;
        long j11;
        ni.q qVar = this.f5953b;
        String strL2 = qVar.l();
        g9 g9Var = this.f5952a;
        if (strL2 != null) {
            num = (Integer) g9Var.f3675b.get(strL2);
            if (num == null) {
            }
            int iIntValue = num.intValue();
            strL = qVar.l();
            if (strL == null) {
                Duration duration = (Duration) g9Var.f3677d.get(strL);
                if (duration != null) {
                    j11 = duration.f72041a;
                }
                ti.b bVar = new ti.b(new Integer(iIntValue), new Long(Duration.h(j11)));
                return new xu0(new js2(this.f5955d, this.f5954c.f11737f.get(), bVar));
            }
            g9Var.getClass();
            j11 = g9.f3673e;
            ti.b bVar2 = new ti.b(new Integer(iIntValue), new Long(Duration.h(j11)));
            return new xu0(new js2(this.f5955d, this.f5954c.f11737f.get(), bVar2));
        }
        g9Var.getClass();
        num = 0;
        int iIntValue2 = num.intValue();
        strL = qVar.l();
        if (strL == null) {
        }
        j11 = g9.f3673e;
        ti.b bVar22 = new ti.b(new Integer(iIntValue2), new Long(Duration.h(j11)));
        return new xu0(new js2(this.f5955d, this.f5954c.f11737f.get(), bVar22));
    }
}
