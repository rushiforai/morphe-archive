package ou;

import com.stripe.android.link.LinkConfiguration;
import com.stripe.android.paymentsheet.state.LinkState;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import w70.i2;

/* loaded from: classes4.dex */
public final class q {

    /* renamed from: a, reason: collision with root package name */
    public final es.n f80957a;

    /* renamed from: b, reason: collision with root package name */
    public final i2 f80958b;

    /* renamed from: c, reason: collision with root package name */
    public final i2 f80959c;

    /* renamed from: d, reason: collision with root package name */
    public final i2 f80960d;

    /* renamed from: e, reason: collision with root package name */
    public final w70.o1 f80961e;

    public q(es.n linkConfigurationCoordinator) {
        Intrinsics.g(linkConfigurationCoordinator, "linkConfigurationCoordinator");
        this.f80957a = linkConfigurationCoordinator;
        i2 i2VarC = w70.u1.c(null);
        this.f80958b = i2VarC;
        this.f80959c = i2VarC;
        i2 i2VarC2 = w70.u1.c(null);
        this.f80960d = i2VarC2;
        this.f80961e = new w70.o1(i2VarC2);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(LinkConfiguration configuration, ContinuationImpl continuationImpl) {
        p pVar;
        hs.b bVar;
        if (continuationImpl instanceof p) {
            pVar = (p) continuationImpl;
            int i5 = pVar.f80953v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                pVar.f80953v = i5 - Integer.MIN_VALUE;
            } else {
                pVar = new p(this, continuationImpl);
            }
        }
        Object objY = pVar.f80951t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = pVar.f80953v;
        hs.f fVar = hs.f.f60050a;
        boolean z11 = true;
        if (i11 == 0) {
            ResultKt.b(objY);
            com.stripe.android.link.f0 f0Var = (com.stripe.android.link.f0) this.f80957a;
            f0Var.getClass();
            Intrinsics.g(configuration, "configuration");
            bu.f fVarB = f0Var.b(configuration);
            switch (fVarB.f18530a) {
                case 0:
                    bVar = (hs.b) fVarB.f18535f.get();
                    break;
                case 1:
                    bVar = (hs.b) fVarB.f18535f.get();
                    break;
                default:
                    bVar = (hs.b) fVarB.f18535f.get();
                    break;
            }
            pVar.f80953v = 1;
            objY = !bVar.f60041a.a() ? fVar : t70.m0.y(bVar.f60046f, new hs.a(bVar, null), pVar);
            if (objY == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objY);
        }
        hs.g gVar = (hs.g) objY;
        if ((gVar instanceof hs.c) || (gVar instanceof hs.d) || (gVar instanceof hs.e)) {
            z11 = false;
        } else if (!Intrinsics.b(gVar, fVar)) {
            throw new NoWhenBranchMatchedException();
        }
        return Boolean.valueOf(z11);
    }

    public final void b(LinkState linkState) {
        h6.c1.B(linkState != null, this.f80958b, null);
        if (linkState == null) {
            return;
        }
        LinkConfiguration configuration = linkState.f44962a;
        this.f80960d.j(configuration);
        com.stripe.android.link.f0 f0Var = (com.stripe.android.link.f0) this.f80957a;
        f0Var.getClass();
        Intrinsics.g(configuration, "configuration");
        f0Var.b(configuration);
    }
}
