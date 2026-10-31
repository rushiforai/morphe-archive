package ads_mobile_sdk;

import b.t2;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import ni.v;
import w70.n;

/* loaded from: classes.dex */
public final class go2 implements n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ n f4013a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ wo2 f4014b;

    public go2(n nVar, wo2 wo2Var) {
        this.f4013a = nVar;
        this.f4014b = wo2Var;
    }

    /* JADX WARN: Code restructure failed: missing block: B:37:0x00fb, code lost:
    
        if (r13.a(r4, r0) != r1) goto L39;
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x016d, code lost:
    
        if (r2.emit(r13, r0) == r1) goto L49;
     */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00cb  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x00e4 A[PHI: r2 r4 r12
      0x00e4: PHI (r2v5 w70.n) = (r2v4 w70.n), (r2v4 w70.n), (r2v15 w70.n) binds: [B:32:0x00c9, B:34:0x00e0, B:20:0x0059] A[DONT_GENERATE, DONT_INLINE]
      0x00e4: PHI (r4v7 ads_mobile_sdk.go2) = (r4v6 ads_mobile_sdk.go2), (r4v6 ads_mobile_sdk.go2), (r4v16 ads_mobile_sdk.go2) binds: [B:32:0x00c9, B:34:0x00e0, B:20:0x0059] A[DONT_GENERATE, DONT_INLINE]
      0x00e4: PHI (r12v12 b.a1) = (r12v11 b.a1), (r12v11 b.a1), (r12v21 b.a1) binds: [B:32:0x00c9, B:34:0x00e0, B:20:0x0059] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // w70.n
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object emit(Object obj, Continuation continuation) {
        fo2 fo2Var;
        b.a1 a1Var;
        ni.g0 g0Var;
        go2 go2Var;
        n nVar;
        go2 go2Var2;
        b.a1 a1Var2;
        n nVar2;
        Object yo2Var;
        if (continuation instanceof fo2) {
            fo2Var = (fo2) continuation;
            int i5 = fo2Var.f3445b;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                fo2Var.f3445b = i5 - Integer.MIN_VALUE;
            } else {
                fo2Var = new fo2(this, continuation);
            }
        }
        Object obj2 = fo2Var.f3444a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = fo2Var.f3445b;
        if (i11 == 0) {
            ResultKt.b(obj2);
            Pair pair = (Pair) obj;
            a1Var = (b.a1) pair.f71683a;
            g0Var = (ni.g0) pair.f71684b;
            boolean z11 = a1Var instanceof xu0;
            wo2 wo2Var = this.f4014b;
            n nVar3 = this.f4013a;
            if (z11) {
                xu0 xu0Var = (xu0) a1Var;
                if (!((b.ja) xu0Var.a()).b().f12416z0) {
                    wo2Var.f11342c.a(((b.ja) xu0Var.a()).a());
                }
                b.ja jaVar = (b.ja) xu0Var.a();
                fo2Var.f3446c = this;
                fo2Var.f3448e = nVar3;
                fo2Var.f3449f = a1Var;
                fo2Var.f3445b = 1;
                if (jaVar.a(fo2Var) != coroutineSingletons) {
                    go2Var2 = this;
                    a1Var2 = a1Var;
                    nVar2 = nVar3;
                    if (go2Var2.f4014b.f11348i) {
                    }
                }
            } else {
                if (!(a1Var instanceof pu0)) {
                    throw new NoWhenBranchMatchedException();
                }
                cz.b bVar = mu0.f7335a;
                mu0.b("Ad failed to load: " + a1Var, null);
                zi3.a((pu0) a1Var, true);
                fo2Var.f3446c = this;
                fo2Var.f3448e = nVar3;
                fo2Var.f3449f = a1Var;
                fo2Var.f3450g = g0Var;
                fo2Var.f3445b = 4;
                if (wo2Var.c(fo2Var) != coroutineSingletons) {
                    go2Var = this;
                    nVar = nVar3;
                    pu0 error = (pu0) a1Var;
                    go2Var.f4014b.getClass();
                    Intrinsics.g(error, "error");
                    yo2Var = new xo2(new v(error.a().a(), t2.y(error), g0Var));
                    nVar2 = nVar;
                }
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            a1Var2 = fo2Var.f3449f;
            nVar2 = (n) fo2Var.f3448e;
            go2Var2 = (go2) fo2Var.f3446c;
            ResultKt.b(obj2);
            if (go2Var2.f4014b.f11348i) {
                b.ja jaVar2 = (b.ja) ((xu0) a1Var2).a();
                fo2Var.f3446c = go2Var2;
                fo2Var.f3448e = nVar2;
                fo2Var.f3449f = a1Var2;
                fo2Var.f3445b = 2;
                if (jaVar2.a((ContinuationImpl) fo2Var) != coroutineSingletons) {
                    wo2 wo2Var2 = go2Var2.f4014b;
                    b.ja jaVar3 = (b.ja) ((xu0) a1Var2).a();
                    fo2Var.f3446c = nVar2;
                    fo2Var.f3448e = a1Var2;
                    fo2Var.f3449f = null;
                    fo2Var.f3445b = 3;
                }
                return coroutineSingletons;
            }
        } else if (i11 == 2) {
            a1Var2 = fo2Var.f3449f;
            nVar2 = (n) fo2Var.f3448e;
            go2Var2 = (go2) fo2Var.f3446c;
            ResultKt.b(obj2);
            wo2 wo2Var22 = go2Var2.f4014b;
            b.ja jaVar32 = (b.ja) ((xu0) a1Var2).a();
            fo2Var.f3446c = nVar2;
            fo2Var.f3448e = a1Var2;
            fo2Var.f3449f = null;
            fo2Var.f3445b = 3;
        } else if (i11 == 3) {
            a1Var2 = (b.a1) fo2Var.f3448e;
            nVar2 = fo2Var.f3446c;
            ResultKt.b(obj2);
            yo2Var = new yo2(((xu0) a1Var2).a());
        } else {
            if (i11 != 4) {
                if (i11 != 5) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj2);
                return Unit.f71706a;
            }
            g0Var = fo2Var.f3450g;
            a1Var = fo2Var.f3449f;
            nVar = (n) fo2Var.f3448e;
            go2Var = (go2) fo2Var.f3446c;
            ResultKt.b(obj2);
            pu0 error2 = (pu0) a1Var;
            go2Var.f4014b.getClass();
            Intrinsics.g(error2, "error");
            yo2Var = new xo2(new v(error2.a().a(), t2.y(error2), g0Var));
            nVar2 = nVar;
        }
        fo2Var.f3446c = null;
        fo2Var.f3448e = null;
        fo2Var.f3449f = null;
        fo2Var.f3450g = null;
        fo2Var.f3445b = 5;
    }
}
