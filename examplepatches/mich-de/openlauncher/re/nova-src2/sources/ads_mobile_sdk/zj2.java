package ads_mobile_sdk;

import b.ed;
import b.k9;
import b.l8;
import b.o2;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import ni.a0;

/* loaded from: classes.dex */
public final class zj2 extends f5 {
    public final /* synthetic */ a0 K;
    public final /* synthetic */ fl2 L;

    /* JADX WARN: Illegal instructions before constructor call */
    public zj2(ni.z zVar, a0 a0Var, jr0 jr0Var, fl2 fl2Var, kz2 kz2Var, o2 o2Var, b.m6 m6Var, String str, t70.j0 j0Var, boolean z11, boolean z12, boolean z13) {
        qw2 qw2Var = qw2.f8860e;
        this.K = a0Var;
        this.L = fl2Var;
        super(zVar, a0Var, qw2Var, jr0Var, fl2Var, kz2Var, o2Var, m6Var, str, j0Var, z11, z12, z13);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    @Override // ads_mobile_sdk.f5
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(Continuation continuation) throws Throwable {
        yj2 yj2Var;
        if (continuation instanceof yj2) {
            yj2Var = (yj2) continuation;
            int i5 = yj2Var.f12041c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                yj2Var.f12041c = i5 - Integer.MIN_VALUE;
            } else {
                yj2Var = new yj2(this, (ContinuationImpl) continuation);
            }
        }
        Object objA = yj2Var.f12039a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = yj2Var.f12041c;
        if (i11 == 0) {
            ResultKt.b(objA);
            ad0 ad0Var = (ad0) this.L.f3411i.get();
            ad0Var.f928e = Boolean.FALSE;
            ad0Var.f929f = Boolean.TRUE;
            a0 a0Var = this.K;
            ni.k kVarB = a0Var.b();
            kVarB.getClass();
            ad0Var.f926c = kVarB;
            ni.k kVarB2 = a0Var.b();
            kVarB2.getClass();
            ad0Var.f925b = kVarB2;
            ad0Var.f927d = qw2.f8860e;
            k9.A(ni.q.class, ad0Var.f926c);
            k9.A(qw2.class, ad0Var.f927d);
            k9.A(Boolean.class, ad0Var.f928e);
            k9.A(Boolean.class, ad0Var.f929f);
            db0 db0Var = ad0Var.f924a;
            ni.k kVar = ad0Var.f925b;
            ni.k kVar2 = ad0Var.f926c;
            qw2 qw2Var = ad0Var.f927d;
            Boolean bool = ad0Var.f928e;
            Boolean bool2 = ad0Var.f929f;
            hb1 hb1Var = l8.f15937a;
            gj0 gj0Var = new gj0(new ki(hb1Var, (b.bb) hb1Var, (b.m5) hb1Var, 4));
            gj0 gj0Var2 = new gj0(new rh(db0Var.f2349u0, 8));
            hb1 hb1VarA = hb1.a(qw2Var);
            hb1 hb1VarA2 = hb1.a(bool2);
            p80 p80Var = new p80(hb1.a(kVar2));
            gj0 gj0Var3 = new gj0(new e71(db0Var.M0, hb1.a(bool), hb1VarA, p80Var, gj0Var2, hb1Var, db0Var.f2284h, db0Var.f2343t));
            hb1 hb1VarA3 = hb1.a(kVar);
            gj0 gj0Var4 = new gj0(ed.f15827m);
            rg0 rg0Var = db0Var.f2348u;
            gp2 gp2Var = (gp2) new gj0(new jm(db0Var.S3, rg0Var, (b.m5) gj0Var, db0Var.f2343t, db0Var.G, (b.m5) gj0Var2, (b.m5) hb1VarA, db0Var.f2265d, (b.m5) hb1VarA2, (b.m5) gj0Var3, hb1VarA3, db0Var.h1, (b.m5) new gj0(new nv(rg0Var, gj0Var4, 3)), db0Var.f2257b0)).get();
            yj2Var.f12041c = 1;
            gp2Var.getClass();
            objA = wo2.a(gp2Var, yj2Var);
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
