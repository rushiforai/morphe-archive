package ads_mobile_sdk;

import b.ed;
import c80.d;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationUnit;
import t70.m0;
import t80.f;

/* loaded from: classes2.dex */
public final class ni2 implements b.va {

    /* renamed from: a, reason: collision with root package name */
    public final fl2 f7575a;

    /* renamed from: b, reason: collision with root package name */
    public final t70.j0 f7576b;

    /* renamed from: c, reason: collision with root package name */
    public final qw2 f7577c;

    /* renamed from: d, reason: collision with root package name */
    public final jr0 f7578d;

    /* renamed from: e, reason: collision with root package name */
    public final AtomicBoolean f7579e;

    /* renamed from: f, reason: collision with root package name */
    public final d f7580f;

    /* renamed from: g, reason: collision with root package name */
    public t70.g2 f7581g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f7582h;

    public ni2(fl2 adCloseManager, t70.j0 backgroundScope, qw2 requestType, jr0 flags, kz2 rootTraceCreator) {
        Intrinsics.g(adCloseManager, "adCloseManager");
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(requestType, "requestType");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(rootTraceCreator, "rootTraceCreator");
        this.f7575a = adCloseManager;
        this.f7576b = backgroundScope;
        this.f7577c = requestType;
        this.f7578d = flags;
        boolean z11 = false;
        this.f7579e = new AtomicBoolean(false);
        this.f7580f = new d();
        if (((Boolean) flags.a("gads:ad_close_listener:enabled", Boolean.FALSE, jn.a$10)).booleanValue() && kotlin.collections.c.f1(new qw2[]{qw2.f8863h, qw2.f8865j, qw2.f8866k, qw2.f8860e}).contains(requestType)) {
            z11 = true;
        }
        this.f7582h = z11;
    }

    @Override // b.va
    public final Unit e() {
        long j11;
        u uVar = u.a$1;
        if (!this.f7582h) {
            return Unit.f71706a;
        }
        int iOrdinal = this.f7577c.ordinal();
        jr0 jr0Var = this.f7578d;
        if (iOrdinal == 1) {
            jr0Var.getClass();
            Duration.Companion companion = Duration.f72038b;
            j11 = ((Duration) jr0Var.a("gads:app_open_ad_close_timeout", ed.k(3, DurationUnit.f72047f, "gads:app_open_ad_close_timeout"), uVar)).f72041a;
        } else if (iOrdinal == 4) {
            jr0Var.getClass();
            Duration.Companion companion2 = Duration.f72038b;
            j11 = ((Duration) jr0Var.a("gads:interstitial_ad_close_timeout", ed.k(3, DurationUnit.f72047f, "gads:interstitial_ad_close_timeout"), uVar)).f72041a;
        } else if (iOrdinal == 6) {
            jr0Var.getClass();
            Duration.Companion companion3 = Duration.f72038b;
            j11 = ((Duration) jr0Var.a("gads:rewarded_ad_close_timeout", ed.k(3, DurationUnit.f72047f, "gads:rewarded_ad_close_timeout"), uVar)).f72041a;
        } else if (iOrdinal != 7) {
            Duration.f72038b.getClass();
            j11 = 0;
        } else {
            jr0Var.getClass();
            Duration.Companion companion4 = Duration.f72038b;
            j11 = ((Duration) jr0Var.a("gads:rewarded_interstitial_ad_close_timeout", ed.k(3, DurationUnit.f72047f, "gads:rewarded_interstitial_ad_close_timeout"), uVar)).f72041a;
        }
        if (j11 > 0) {
            f fVar = new f(j11, this, null);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            t70.j0 j0Var = this.f7576b;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            m0.t(j0Var, context, null, new ar.a(fVar, null), 2);
        }
        return Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // b.va
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object g(Continuation continuation) {
        ji2 ji2Var;
        ni2 ni2Var;
        d dVar;
        Continuation continuation2;
        if (continuation instanceof ji2) {
            ji2Var = (ji2) continuation;
            int i5 = ji2Var.f5252e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ji2Var.f5252e = i5 - Integer.MIN_VALUE;
            } else {
                ji2Var = new ji2(this, (ContinuationImpl) continuation);
            }
        }
        Object obj = ji2Var.f5250c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ji2Var.f5252e;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                if (!this.f7582h) {
                    return Unit.f71706a;
                }
                if (this.f7579e.compareAndSet(false, true)) {
                    ji2Var.f5248a = this;
                    d dVar2 = this.f7580f;
                    ji2Var.f5249b = dVar2;
                    ji2Var.f5252e = 1;
                    if (dVar2.e(ji2Var) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    ni2Var = this;
                    dVar = dVar2;
                }
                return Unit.f71706a;
            }
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar = ji2Var.f5249b;
            ni2Var = ji2Var.f5248a;
            ResultKt.b(obj);
            t70.g2 g2Var = ni2Var.f7581g;
            if (g2Var != null) {
                g2Var.c(null);
            }
            ni2Var.f7581g = null;
            Unit unit = Unit.f71706a;
            dVar.g(null);
            t70.j0 j0Var = ni2Var.f7576b;
            a60.a aVar = new a60.a(ni2Var, continuation2, 10);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            m0.t(j0Var, context, null, new ar.a(aVar, null), 2);
            return Unit.f71706a;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
        continuation2 = null;
    }
}
