package fr;

import android.content.Context;
import com.stripe.android.core.networking.SendAnalyticsRequestV2Worker;
import java.util.LinkedHashSet;
import java.util.concurrent.ExecutionException;
import kotlin.Pair;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class r {

    /* renamed from: a, reason: collision with root package name */
    public final Context f55690a;

    /* renamed from: b, reason: collision with root package name */
    public final cw.r f55691b;

    /* renamed from: c, reason: collision with root package name */
    public final xq.c f55692c;

    /* renamed from: d, reason: collision with root package name */
    public final fl.l f55693d;

    public r(Context context, cw.r rVar, xq.c logger, fl.l lVar) {
        Intrinsics.g(context, "context");
        Intrinsics.g(logger, "logger");
        this.f55690a = context;
        this.f55691b = rVar;
        this.f55692c = logger;
        this.f55693d = lVar;
    }

    /* JADX WARN: Code restructure failed: missing block: B:25:0x0066, code lost:
    
        if (r8 == r1) goto L34;
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x0080, code lost:
    
        if (r2.c(r7, r0) == r1) goto L34;
     */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0075  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x0086  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(g gVar, ContinuationImpl continuationImpl) throws Throwable {
        m mVar;
        r rVar;
        boolean z11;
        if (continuationImpl instanceof m) {
            mVar = (m) continuationImpl;
            int i5 = mVar.f55663x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                mVar.f55663x = i5 - Integer.MIN_VALUE;
            } else {
                mVar = new m(this, continuationImpl);
            }
        }
        Object objB = mVar.f55661v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = mVar.f55663x;
        if (i11 == 0) {
            ResultKt.b(objB);
            mVar.f55659t = this;
            mVar.f55660u = gVar;
            mVar.f55663x = 1;
            objB = Boolean.FALSE;
            if (objB != coroutineSingletons) {
                rVar = this;
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            gVar = mVar.f55660u;
            rVar = mVar.f55659t;
            ResultKt.b(objB);
        } else {
            if (i11 != 2) {
                if (i11 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(objB);
                return Unit.f71706a;
            }
            gVar = mVar.f55660u;
            rVar = mVar.f55659t;
            ResultKt.b(objB);
            z11 = ((Boolean) objB).booleanValue();
            if (!z11) {
                return Unit.f71706a;
            }
            mVar.f55659t = null;
            mVar.f55660u = null;
            mVar.f55663x = 3;
        }
        if (((Boolean) objB).booleanValue()) {
            mVar.f55659t = rVar;
            mVar.f55660u = gVar;
            mVar.f55663x = 2;
            objB = rVar.b(gVar, mVar);
        }
        if (!z11) {
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:35:0x012b, code lost:
    
        if (r0 == r3) goto L36;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(g gVar, ContinuationImpl continuationImpl) throws Throwable {
        n nVar;
        Object objA;
        o7.d0 d0VarC;
        if (continuationImpl instanceof n) {
            nVar = (n) continuationImpl;
            int i5 = nVar.f55669x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                nVar.f55669x = i5 - Integer.MIN_VALUE;
            } else {
                nVar = new n(this, continuationImpl);
            }
        }
        Object objY = nVar.f55667v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = nVar.f55669x;
        try {
        } catch (Throwable th2) {
            int i12 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        if (i11 == 0) {
            ResultKt.b(objY);
            d0VarC = p7.s.c(this.f55690a);
            Intrinsics.f(d0VarC, "getInstance(...)");
            nVar.f55665t = this;
            nVar.f55666u = d0VarC;
            nVar.f55669x = 1;
            fl.l lVar = this.f55693d;
            objY = t70.m0.y((t70.c0) lVar.f55374b, new d0(gVar, lVar, null), nVar);
            if (objY != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objY);
            Intrinsics.f(objY, "result.await()");
            objA = (o7.x) objY;
            int i13 = Result.f71687b;
            return Boolean.valueOf(!(objA instanceof Result.Failure));
        }
        d0VarC = (o7.d0) nVar.f55666u;
        ResultKt.b(objY);
        String id2 = (String) objY;
        cw.r rVar = SendAnalyticsRequestV2Worker.f42579f;
        Intrinsics.g(id2, "id");
        Pair[] pairArr = {new Pair("data", id2)};
        vm.c cVar = new vm.c(19);
        Pair pair = pairArr[0];
        cVar.s(pair.f71684b, (String) pair.f71683a);
        o7.g gVarD = cVar.d();
        o7.f fVar = new o7.f(2, false, false, false, false, -1L, -1L, b70.g.N1(new LinkedHashSet()));
        o7.t tVar = new o7.t(SendAnalyticsRequestV2Worker.class);
        tVar.f79651d.add("SendAnalyticsRequestV2Worker");
        tVar.f79650c.f95175e = gVarD;
        o7.u uVar = (o7.u) ((o7.t) tVar.e(fVar)).a();
        int i14 = Result.f71687b;
        o7.y yVarA = d0VarC.a(uVar);
        Intrinsics.f(yVarA, "enqueue(...)");
        z7.j result = (z7.j) ((kl.q0) yVarA).f71630b;
        Intrinsics.f(result, "result");
        if (result.isDone()) {
            try {
                objY = result.get();
            } catch (ExecutionException e3) {
                Throwable cause = e3.getCause();
                if (cause == null) {
                    throw e3;
                }
                throw cause;
            }
        } else {
            nVar.f55665t = nVar;
            nVar.f55666u = result;
            nVar.f55669x = 2;
            t70.m mVar = new t70.m(1, IntrinsicsKt.b(nVar));
            mVar.t();
            result.b(new o(mVar, result, 0), o7.h.f79669a);
            mVar.v(new p(result, 0));
            objY = mVar.s();
        }
        Intrinsics.f(objY, "result.await()");
        objA = (o7.x) objY;
        int i132 = Result.f71687b;
        return Boolean.valueOf(!(objA instanceof Result.Failure));
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x0078  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(g gVar, ContinuationImpl continuationImpl) {
        q qVar;
        r rVar;
        g gVar2;
        r rVar2;
        Object objA;
        Throwable thA;
        if (continuationImpl instanceof q) {
            qVar = (q) continuationImpl;
            int i5 = qVar.f55687y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                qVar.f55687y = i5 - Integer.MIN_VALUE;
            } else {
                qVar = new q(this, continuationImpl);
            }
        }
        Object obj = qVar.f55685w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = qVar.f55687y;
        if (i11 == 0) {
            ResultKt.b(obj);
            try {
                int i12 = Result.f71687b;
                cw.r rVar3 = this.f55691b;
                qVar.f55682t = this;
                qVar.f55683u = gVar;
                qVar.f55684v = this;
                qVar.f55687y = 1;
                if (rVar3.r(gVar, qVar) == coroutineSingletons) {
                    return coroutineSingletons;
                }
                rVar = this;
                gVar2 = gVar;
                rVar2 = rVar;
            } catch (Throwable th2) {
                th = th2;
                rVar = this;
                int i13 = Result.f71687b;
                objA = ResultKt.a(th);
                thA = Result.a(objA);
                if (thA != null) {
                }
                return Unit.f71706a;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            rVar2 = qVar.f55684v;
            gVar2 = qVar.f55683u;
            rVar = qVar.f55682t;
            try {
                ResultKt.b(obj);
            } catch (Throwable th3) {
                th = th3;
                int i132 = Result.f71687b;
                objA = ResultKt.a(th);
                thA = Result.a(objA);
                if (thA != null) {
                }
                return Unit.f71706a;
            }
        }
        rVar2.f55692c.a("EVENT: " + gVar2.f55612a);
        objA = Unit.f71706a;
        int i14 = Result.f71687b;
        thA = Result.a(objA);
        if (thA != null) {
            rVar.f55692c.b("Exception while making analytics request", thA);
        }
        return Unit.f71706a;
    }
}
