package ads_mobile_sdk;

import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class j9 implements b.va {

    /* renamed from: a, reason: collision with root package name */
    public final g9 f5162a;

    /* renamed from: b, reason: collision with root package name */
    public final ni.q f5163b;

    public j9(g9 adUnitStatsTracker, ni.q baseRequest) {
        Intrinsics.g(adUnitStatsTracker, "adUnitStatsTracker");
        Intrinsics.g(baseRequest, "baseRequest");
        this.f5162a = adUnitStatsTracker;
        this.f5163b = baseRequest;
    }

    @Override // b.va
    public final Object n(Continuation continuation) {
        g9 g9Var = this.f5162a;
        String strL = this.f5163b.l();
        if (strL != null) {
            synchronized (g9Var.f3674a) {
                try {
                    Integer num = (Integer) g9Var.f3675b.get(strL);
                    if (num == null) {
                        num = 0;
                    }
                    g9Var.f3675b.put(strL, Integer.valueOf(num.intValue() + 1));
                    Unit unit = Unit.f71706a;
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        } else {
            g9Var.getClass();
        }
        return Unit.f71706a;
    }
}
