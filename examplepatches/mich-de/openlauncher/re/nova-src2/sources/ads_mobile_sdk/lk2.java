package ads_mobile_sdk;

import b.o2;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import ni.a0;
import ui.o;

/* loaded from: classes.dex */
public final class lk2 extends f5 {
    public final /* synthetic */ a0 K;
    public final /* synthetic */ fl2 L;
    public final /* synthetic */ o M;

    /* JADX WARN: Illegal instructions before constructor call */
    public lk2(String str, a0 a0Var, ni.z zVar, fl2 fl2Var, boolean z11, boolean z12, o oVar, t70.j0 j0Var, kz2 kz2Var, o2 o2Var, jr0 jr0Var, b.m6 m6Var, boolean z13) {
        qw2 qw2Var = qw2.f8864i;
        this.K = a0Var;
        this.L = fl2Var;
        this.M = oVar;
        super(zVar, a0Var, qw2Var, jr0Var, fl2Var, kz2Var, o2Var, m6Var, str, j0Var, z11, z12, z13);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // ads_mobile_sdk.f5
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(Continuation continuation) throws Throwable {
        kk2 kk2Var;
        if (continuation instanceof kk2) {
            kk2Var = (kk2) continuation;
            int i5 = kk2Var.f5758c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                kk2Var.f5758c = i5 - Integer.MIN_VALUE;
            } else {
                kk2Var = new kk2(this, (ContinuationImpl) continuation);
            }
        }
        Object objA = kk2Var.f5756a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = kk2Var.f5758c;
        if (i11 == 0) {
            ResultKt.b(objA);
            b.y0 y0Var = (b.y0) ((b.y0) ((b.y0) this.L.f3414l.get()).b(false)).a(true);
            a0 a0Var = this.K;
            b.y0 y0Var2 = (b.y0) ((b.y0) ((b.y0) y0Var.a((ni.q) a0Var.b())).a(a0Var.b())).a(qw2.f8864i);
            o oVar = this.M;
            wo2 wo2VarA = y0Var2.a((ui.q) oVar).a(oVar).mo2a().a().a();
            kk2Var.f5758c = 1;
            wo2VarA.getClass();
            objA = wo2.a(wo2VarA, kk2Var);
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
