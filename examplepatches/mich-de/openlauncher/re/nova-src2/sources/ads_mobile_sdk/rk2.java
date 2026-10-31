package ads_mobile_sdk;

import b.o2;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import ni.a0;

/* loaded from: classes2.dex */
public final class rk2 extends f5 {
    public final /* synthetic */ a0 K;
    public final /* synthetic */ fl2 L;

    /* JADX WARN: Illegal instructions before constructor call */
    public rk2(ni.z zVar, a0 a0Var, jr0 jr0Var, fl2 fl2Var, kz2 kz2Var, o2 o2Var, b.m6 m6Var, String str, t70.j0 j0Var, boolean z11, boolean z12, boolean z13) {
        qw2 qw2Var = qw2.f8866k;
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
        qk2 qk2Var;
        if (continuation instanceof qk2) {
            qk2Var = (qk2) continuation;
            int i5 = qk2Var.f8716c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                qk2Var.f8716c = i5 - Integer.MIN_VALUE;
            } else {
                qk2Var = new qk2(this, (ContinuationImpl) continuation);
            }
        }
        Object objA = qk2Var.f8714a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = qk2Var.f8716c;
        if (i11 == 0) {
            ResultKt.b(objA);
            rd0 rd0Var = (rd0) ((b.rd) this.L.f3415m.get());
            rd0Var.f9119e = Boolean.FALSE;
            rd0Var.f9120f = Boolean.TRUE;
            ni.k kVar = this.K.f78242a;
            rd0Var.f9117c = kVar;
            rd0Var.f9116b = kVar;
            rd0Var.f9118d = qw2.f8866k;
            vr2 vr2Var = (vr2) ((b.m5) rd0Var.b().f18177g).get();
            qk2Var.f8716c = 1;
            vr2Var.getClass();
            objA = wo2.a(vr2Var, qk2Var);
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
