package ads_mobile_sdk;

import b.o2;
import com.google.android.gms.ads.identifier.AdvertisingIdClient;
import e1.e1;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import t70.m0;
import t70.q0;

/* loaded from: classes2.dex */
public final class d3 extends dr {

    /* renamed from: l, reason: collision with root package name */
    public final fz f2163l;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d3(fz consentManager, jr0 flags, g0 activityTracker, kz2 rootTraceCreator, o2 clock, t70.j0 backgroundScope) {
        super(clock, backgroundScope, rootTraceCreator, flags, activityTracker);
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(consentManager, "consentManager");
        Intrinsics.g(clock, "clock");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(rootTraceCreator, "rootTraceCreator");
        Intrinsics.g(activityTracker, "activityTracker");
        this.f2163l = consentManager;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(d3 d3Var, ContinuationImpl continuationImpl) {
        b3 b3Var;
        if (continuationImpl instanceof b3) {
            b3Var = (b3) continuationImpl;
            int i5 = b3Var.f1237c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                b3Var.f1237c = i5 - Integer.MIN_VALUE;
            } else {
                b3Var = new b3(d3Var, continuationImpl);
            }
        }
        Object objY = b3Var.f1235a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = b3Var.f1237c;
        AdvertisingIdClient.Info info = null;
        Object[] objArr = 0;
        if (i11 == 0) {
            ResultKt.b(objY);
            t70.j0 j0Var = d3Var.f2599d;
            c0.g0 g0Var = new c0.g0(d3Var, objArr == true ? 1 : 0, 1);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            q0 q0VarE = m0.e(j0Var, context, new e1(g0Var, null, 2), 2);
            b3Var.f1237c = 1;
            objY = q0VarE.y(b3Var);
            if (objY == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objY);
        }
        b.a1 a1Var = (b.a1) objY;
        if (a1Var != null) {
            if (a1Var instanceof pu0) {
                return (pu0) a1Var;
            }
            info = (AdvertisingIdClient.Info) ((xu0) a1Var).f11834b;
        }
        return new xu0(new a3(info));
    }

    @Override // b.x2
    public final Object d(Continuation continuation) {
        return a(this, (ContinuationImpl) continuation);
    }

    @Override // ads_mobile_sdk.dr, ads_mobile_sdk.c61
    public final Object h(Continuation continuation) {
        jr0 jr0Var = this.f2601f;
        jr0Var.getClass();
        return ((Boolean) jr0Var.a("gads:ad_id_init_from_signal_source_enabled", Boolean.FALSE, jn.a$10)).booleanValue() ? dr.c(this, (ContinuationImpl) continuation) : new xu0(Unit.f71706a);
    }

    @Override // b.x2
    public final cw0 a() {
        return cw0.AD_ID_INFO;
    }
}
