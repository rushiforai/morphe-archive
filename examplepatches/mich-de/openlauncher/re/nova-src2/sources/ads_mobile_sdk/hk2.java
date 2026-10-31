package ads_mobile_sdk;

import b.o2;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import ni.a0;

/* loaded from: classes.dex */
public final class hk2 extends f5 {
    public final /* synthetic */ a0 K;
    public final /* synthetic */ fl2 L;

    /* JADX WARN: Illegal instructions before constructor call */
    public hk2(ni.z zVar, a0 a0Var, jr0 jr0Var, fl2 fl2Var, kz2 kz2Var, o2 o2Var, b.m6 m6Var, String str, t70.j0 j0Var, boolean z11, boolean z12, boolean z13) {
        qw2 qw2Var = qw2.f8863h;
        this.K = a0Var;
        this.L = fl2Var;
        super(zVar, a0Var, qw2Var, jr0Var, fl2Var, kz2Var, o2Var, m6Var, str, j0Var, z11, z12, z13);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // ads_mobile_sdk.f5
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(Continuation continuation) throws Throwable {
        gk2 gk2Var;
        if (continuation instanceof gk2) {
            gk2Var = (gk2) continuation;
            int i5 = gk2Var.f3982c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                gk2Var.f3982c = i5 - Integer.MIN_VALUE;
            } else {
                gk2Var = new gk2(this, (ContinuationImpl) continuation);
            }
        }
        Object objA = gk2Var.f3980a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = gk2Var.f3982c;
        if (i11 == 0) {
            ResultKt.b(objA);
            ad0 ad0Var = (ad0) this.L.f3413k.get();
            ad0Var.f928e = Boolean.FALSE;
            ad0Var.f929f = Boolean.TRUE;
            a0 a0Var = this.K;
            ni.k kVarB = a0Var.b();
            kVarB.getClass();
            ad0Var.f926c = kVarB;
            ni.k kVarB2 = a0Var.b();
            kVarB2.getClass();
            ad0Var.f925b = kVarB2;
            ad0Var.f927d = qw2.f8863h;
            rq2 rq2Var = (rq2) ad0Var.b().f5685i.get();
            gk2Var.f3982c = 1;
            rq2Var.getClass();
            objA = wo2.a(rq2Var, gk2Var);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objA);
        }
        b.pd pdVar = (b.pd) objA;
        if (pdVar instanceof xo2) {
            return pdVar;
        }
        if (pdVar instanceof yo2) {
            return new yo2(new jl2((b.ja) ((yo2) pdVar).f12228a));
        }
        throw new NoWhenBranchMatchedException();
    }
}
