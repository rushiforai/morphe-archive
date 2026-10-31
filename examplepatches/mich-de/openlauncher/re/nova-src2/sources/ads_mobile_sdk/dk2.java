package ads_mobile_sdk;

import b.o2;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import mi.h;
import ni.a0;

/* loaded from: classes.dex */
public final class dk2 extends f5 {
    public final /* synthetic */ a0 K;
    public final /* synthetic */ fl2 L;
    public final /* synthetic */ mi.g M;

    /* JADX WARN: Illegal instructions before constructor call */
    public dk2(String str, a0 a0Var, ni.z zVar, fl2 fl2Var, boolean z11, boolean z12, mi.g gVar, t70.j0 j0Var, kz2 kz2Var, o2 o2Var, jr0 jr0Var, b.m6 m6Var, boolean z13) {
        qw2 qw2Var = qw2.f8861f;
        this.K = a0Var;
        this.L = fl2Var;
        this.M = gVar;
        super(zVar, a0Var, qw2Var, jr0Var, fl2Var, kz2Var, o2Var, m6Var, str, j0Var, z11, z12, z13);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // ads_mobile_sdk.f5
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(Continuation continuation) throws Throwable {
        ck2 ck2Var;
        dq2 dq2Var;
        if (continuation instanceof ck2) {
            ck2Var = (ck2) continuation;
            int i5 = ck2Var.f1927d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ck2Var.f1927d = i5 - Integer.MIN_VALUE;
            } else {
                ck2Var = new ck2(this, (ContinuationImpl) continuation);
            }
        }
        Object obj = ck2Var.f1925b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ck2Var.f1927d;
        if (i11 == 0) {
            ResultKt.b(obj);
            dd0 dd0Var = (dd0) ((dd0) ((dd0) this.L.f3412j.get()).b(false)).a(true);
            a0 a0Var = this.K;
            dd0 dd0Var2 = (dd0) ((dd0) ((dd0) dd0Var.a((ni.q) a0Var.b())).a(a0Var.b())).a(qw2.f8861f);
            mi.g gVar = this.M;
            dq2 dq2VarA = dd0Var2.a((h) gVar).a(gVar).a().a();
            ck2Var.f1924a = dq2VarA;
            ck2Var.f1927d = 1;
            dq2VarA.getClass();
            Object objA = wo2.a(dq2VarA, ck2Var);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
            dq2Var = dq2VarA;
            obj = objA;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dq2Var = ck2Var.f1924a;
            ResultKt.b(obj);
        }
        b.pd pdVar = (b.pd) obj;
        if (pdVar instanceof xo2) {
            return pdVar;
        }
        if (!(pdVar instanceof yo2)) {
            throw new NoWhenBranchMatchedException();
        }
        od1 od1Var = (od1) ((yo2) pdVar).f12228a;
        Intrinsics.e(dq2Var, "null cannot be cast to non-null type com.google.android.libraries.ads.mobile.sdk.internal.banner.PublisherBannerAdLoader<*>");
        return new yo2(new sl(od1Var, dq2Var));
    }
}
