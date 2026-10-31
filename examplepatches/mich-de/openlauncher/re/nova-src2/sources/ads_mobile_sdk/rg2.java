package ads_mobile_sdk;

import android.os.SystemClock;
import b.o2;
import c80.d;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;

/* loaded from: classes.dex */
public final class rg2 {

    /* renamed from: a, reason: collision with root package name */
    public final t70.j0 f9169a;

    /* renamed from: b, reason: collision with root package name */
    public final o2 f9170b;

    /* renamed from: c, reason: collision with root package name */
    public final jr0 f9171c;

    /* renamed from: d, reason: collision with root package name */
    public final ib1 f9172d;

    /* renamed from: e, reason: collision with root package name */
    public final kz2 f9173e;

    /* renamed from: f, reason: collision with root package name */
    public final d f9174f;

    /* renamed from: g, reason: collision with root package name */
    public long f9175g;

    /* renamed from: h, reason: collision with root package name */
    public c7 f9176h;

    /* renamed from: i, reason: collision with root package name */
    public t70.g2 f9177i;

    public rg2(t70.j0 backgroundScope, o2 clock, jr0 flags, ib1 prewarmManagerProvider, kz2 rootTraceCreator) {
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(clock, "clock");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(prewarmManagerProvider, "prewarmManagerProvider");
        Intrinsics.g(rootTraceCreator, "rootTraceCreator");
        this.f9169a = backgroundScope;
        this.f9170b = clock;
        this.f9171c = flags;
        this.f9172d = prewarmManagerProvider;
        this.f9173e = rootTraceCreator;
        this.f9174f = new d();
        this.f9175g = -1L;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(rg2 rg2Var, ContinuationImpl continuationImpl) {
        og2 og2Var;
        d dVar;
        k33 k33Var;
        if (continuationImpl instanceof og2) {
            og2Var = (og2) continuationImpl;
            int i5 = og2Var.f7929e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                og2Var.f7929e = i5 - Integer.MIN_VALUE;
            } else {
                og2Var = new og2(rg2Var, continuationImpl);
            }
        }
        Object obj = og2Var.f7927c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = og2Var.f7929e;
        if (i11 == 0) {
            ResultKt.b(obj);
            dVar = rg2Var.f9174f;
            og2Var.f7925a = rg2Var;
            og2Var.f7926b = dVar;
            og2Var.f7929e = 1;
            if (dVar.e(og2Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d dVar2 = og2Var.f7926b;
            rg2 rg2Var2 = og2Var.f7925a;
            ResultKt.b(obj);
            dVar = dVar2;
            rg2Var = rg2Var2;
        }
        try {
            rg2Var.f9170b.getClass();
            long jElapsedRealtime = SystemClock.elapsedRealtime() - rg2Var.f9175g;
            jr0 jr0Var = rg2Var.f9171c;
            jr0Var.getClass();
            Duration.Companion companion = Duration.f72038b;
            if (jElapsedRealtime > Duration.h(((Duration) jr0Var.a("gads:play_prewarm_manager_connection_duration", new Duration(DurationKt.g(180, DurationUnit.f72046e)), u.a$3)).f72041a)) {
                c7 c7Var = rg2Var.f9176h;
                if (c7Var != null && (k33Var = ((tl2) c7Var.f1694a).f9989a) != null) {
                    tl2.f9987c.a("detach", new Object[0]);
                    k33Var.getClass();
                    k33Var.b(new f33(k33Var, 0));
                }
                rg2Var.f9176h = null;
            }
            Unit unit = Unit.f71706a;
            dVar.g(null);
            return unit;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }
}
