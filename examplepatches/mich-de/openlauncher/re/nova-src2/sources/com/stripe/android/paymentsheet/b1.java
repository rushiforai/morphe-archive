package com.stripe.android.paymentsheet;

import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.link.LinkConfiguration;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import com.stripe.android.paymentsheet.PaymentSheetContract;
import com.stripe.android.paymentsheet.PaymentSheetResult;
import com.stripe.android.paymentsheet.analytics.EventReporter$Mode;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import com.stripe.android.paymentsheet.state.PaymentElementLoader$State;
import com.stripe.android.paymentsheet.state.PaymentSheetState$Full;
import e00.v3;
import java.util.Collection;
import java.util.List;
import jv.q1;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import l1.g4;
import ou.f1;
import ou.g1;
import ou.i1;
import ou.j1;
import ou.k1;
import ou.l1;
import ou.n1;
import w70.g2;
import w70.i2;
import w70.o1;
import w70.t1;
import w70.u1;

/* loaded from: classes4.dex */
public final class b1 extends kv.c {
    public final PaymentSheetContract.Args C;
    public final gv.g0 D;
    public final xq.c E;
    public final iu.f F;
    public final su.a G;
    public final cv.z H;
    public final t1 I;
    public final t1 J;
    public final i2 K;
    public g1 L;
    public final uw.c M;
    public ou.x N;
    public final uw.c O;
    public final uw.c P;
    public final uw.c Q;
    public final uw.c R;
    public final mt.n0 S;
    public final uw.c T;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b1(PaymentSheetContract.Args args, ru.d eventReporter, gv.g0 paymentElementLoader, fv.k customerRepository, xq.c logger, CoroutineContext workContext, h6.u0 savedStateHandle, ou.q linkHandler, mt.j0 confirmationHandlerFactory, hq.m cardAccountRangeRepositoryFactory, iu.f errorReporter, su.a cvcRecollectionHandler, cv.z cvcRecollectionInteractorFactory, b6.b tapToAddCollectionHandler, EventReporter$Mode mode) {
        super(args.f44664b, eventReporter, customerRepository, workContext, savedStateHandle, linkHandler, cardAccountRangeRepositoryFactory, true, tapToAddCollectionHandler, mode);
        Intrinsics.g(args, "args");
        Intrinsics.g(eventReporter, "eventReporter");
        Intrinsics.g(paymentElementLoader, "paymentElementLoader");
        Intrinsics.g(customerRepository, "customerRepository");
        Intrinsics.g(logger, "logger");
        Intrinsics.g(workContext, "workContext");
        Intrinsics.g(savedStateHandle, "savedStateHandle");
        Intrinsics.g(linkHandler, "linkHandler");
        Intrinsics.g(confirmationHandlerFactory, "confirmationHandlerFactory");
        Intrinsics.g(cardAccountRangeRepositoryFactory, "cardAccountRangeRepositoryFactory");
        Intrinsics.g(errorReporter, "errorReporter");
        Intrinsics.g(cvcRecollectionHandler, "cvcRecollectionHandler");
        Intrinsics.g(cvcRecollectionInteractorFactory, "cvcRecollectionInteractorFactory");
        Intrinsics.g(tapToAddCollectionHandler, "tapToAddCollectionHandler");
        Intrinsics.g(mode, "mode");
        this.C = args;
        this.D = paymentElementLoader;
        this.E = logger;
        this.F = errorReporter;
        this.G = cvcRecollectionHandler;
        this.H = cvcRecollectionInteractorFactory;
        PaymentSheet$Configuration paymentSheet$Configuration = this.f72266a;
        uw.c cVar = this.f72278m.f96342g;
        uw.c cVar2 = this.B;
        i2 i2Var = this.f72277l;
        o1 o1Var = this.f72279p;
        i2 i2Var2 = this.f72282s;
        i2 i2Var3 = this.f72287x;
        kv.g gVar = new kv.g(paymentSheet$Configuration, cVar, cVar2, i2Var, o1Var, i2Var2, i2Var3, new k5.d(15, this, eventReporter), new y0(0, 0, b1.class, this, "onDisabledClick", "onDisabledClick()V"));
        t1 t1VarB = u1.b(1, 0, null, 6);
        this.I = t1VarB;
        this.J = t1VarB;
        i2 i2VarC = u1.c(null);
        this.K = i2VarC;
        this.L = g1.f80879b;
        uw.c cVarU = ps.v.u(i2VarC, new f1(this, 0));
        this.M = cVarU;
        this.O = ps.v.r(ps.v.i(new jv.j(gVar, 1), cVar, cVar2, i2Var, o1Var, i2Var2, i2Var3), new kotlinx.serialization.protobuf.schema.d(5));
        this.P = ps.v.u(cVarU, new nq.a(11));
        this.Q = ps.v.l(linkHandler.f80959c, ((com.stripe.android.link.f0) linkHandler.f80957a).f42979c, this.B, this.f72277l, new jv.h(this, 3));
        this.R = ps.v.u(i2VarC, new f1(this, 1));
        mt.n0 n0VarA = confirmationHandlerFactory.a(h6.g1.f(this));
        this.S = n0VarA;
        this.T = ps.v.u(n0VarA.f76800k, new nq.a(12));
        com.stripe.android.analytics.c.a(this, savedStateHandle);
        ru.a aVar = (ru.a) eventReporter;
        aVar.h(new ru.q(aVar.f86337a), null);
        t70.m0.t(h6.g1.f(this), workContext, null, new v0(this, null), 2);
    }

    /* JADX WARN: Code restructure failed: missing block: B:22:0x0076, code lost:
    
        if (r11.y(r5, r0) == r1) goto L23;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object u(b1 b1Var, ContinuationImpl continuationImpl) throws Throwable {
        n1 n1Var;
        if (continuationImpl instanceof n1) {
            n1Var = (n1) continuationImpl;
            int i5 = n1Var.f80945w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                n1Var.f80945w = i5 - Integer.MIN_VALUE;
            } else {
                n1Var = new n1(b1Var, continuationImpl);
            }
        }
        Object objY = n1Var.f80943u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = n1Var.f80945w;
        if (i11 == 0) {
            ResultKt.b(objY);
            CoroutineContext coroutineContext = b1Var.f72268c;
            x0 x0Var = new x0(b1Var, null);
            n1Var.f80942t = b1Var;
            n1Var.f80945w = 1;
            objY = t70.m0.y(coroutineContext, x0Var, n1Var);
            if (objY != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objY);
            return Unit.f71706a;
        }
        b1Var = n1Var.f80942t;
        ResultKt.b(objY);
        Object obj = ((Result) objY).f71688a;
        Throwable thA = Result.a(obj);
        if (thA == null) {
            PaymentElementLoader$State state = (PaymentElementLoader$State) obj;
            Intrinsics.g(state, "state");
            PaymentSheetState$Full paymentSheetState$Full = new PaymentSheetState$Full(state.f44971a, state.f44972b, state.f44973c, state.f44974d, state.f44975e);
            n1Var.f80942t = null;
            n1Var.f80945w = 2;
        } else {
            b1Var.f72276k.j(null);
            b1Var.E.b("Payment Sheet error", thA);
            b1Var.I.c(new PaymentSheetResult.Failed(thA));
        }
        return Unit.f71706a;
    }

    public static final void v(b1 b1Var, mt.v vVar) {
        b1Var.getClass();
        h6.u0 u0Var = b1Var.f72269d;
        if (vVar instanceof mt.u) {
            mt.u uVar = (mt.u) vVar;
            b1Var.x(uVar.f76809b, false, uVar.f76808a.getF43533a());
        } else if (vVar instanceof mt.t) {
            mt.t tVar = (mt.t) vVar;
            mt.s sVar = tVar.f76807c;
            ResolvableString resolvableString = tVar.f76806b;
            if (sVar.equals(mt.r.f76804a) || sVar.equals(mt.m.f76786a) || (sVar instanceof mt.o)) {
                ru.j jVarZ = zg.a.Z(tVar);
                if (jVarZ != null) {
                    PaymentSelection paymentSelection = (PaymentSelection) u0Var.a("IN_PROGRESS_PAYMENT_SELECTION");
                    if (paymentSelection != null) {
                        ((ru.a) b1Var.f72267b).m(paymentSelection, jVarZ);
                    }
                    b1Var.B(resolvableString);
                }
            } else if (sVar.equals(mt.n.f76789a)) {
                Throwable th2 = tVar.f76805a;
                b1Var.E.b("Payment Sheet error", th2);
                b1Var.I.c(new PaymentSheetResult.Failed(th2));
            } else {
                if (!sVar.equals(mt.q.f76803a) && !sVar.equals(mt.p.f76802a)) {
                    throw new NoWhenBranchMatchedException();
                }
                b1Var.B(resolvableString);
            }
        } else {
            if (!(vVar instanceof mt.l)) {
                throw new NoWhenBranchMatchedException();
            }
            b1Var.B(null);
        }
        u0Var.d("IN_PROGRESS_PAYMENT_SELECTION", null);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object A(PaymentSheetState$Full paymentSheetState$Full, ContinuationImpl continuationImpl) {
        k1 k1Var;
        b1 b1Var;
        if (continuationImpl instanceof k1) {
            k1Var = (k1) continuationImpl;
            int i5 = k1Var.f80923w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                k1Var.f80923w = i5 - Integer.MIN_VALUE;
            } else {
                k1Var = new k1(this, continuationImpl);
            }
        }
        Object obj = k1Var.f80921u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = k1Var.f80923w;
        Continuation continuation = null;
        if (i11 == 0) {
            ResultKt.b(obj);
            a80.e eVar = t70.y0.f88884a;
            u70.d dVar = y70.o.f96819a.f90673f;
            v3 v3Var = new v3(this, paymentSheetState$Full, (Continuation) null);
            k1Var.f80920t = this;
            k1Var.f80923w = 1;
            if (t70.m0.y(dVar, v3Var, k1Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            b1Var = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            b1Var = k1Var.f80920t;
            ResultKt.b(obj);
        }
        t70.m0.t(h6.g1.f(b1Var), null, null, new l1(b1Var, continuation, 0), 3);
        return Unit.f71706a;
    }

    public final void B(ResolvableString resolvableString) {
        wu.e eVar = new wu.e(resolvableString != null ? new wu.g(resolvableString) : null);
        i2 i2Var = this.K;
        i2Var.getClass();
        i2Var.k(null, eVar);
        this.f72269d.d("processing", Boolean.FALSE);
    }

    @Override // kv.c
    public final void e() {
        i2 i2Var = this.K;
        if (i2Var.getValue() instanceof wu.e) {
            wu.e eVar = new wu.e(null);
            i2Var.getClass();
            i2Var.k(null, eVar);
        }
    }

    @Override // kv.c
    public final g2 f() {
        return this.P;
    }

    @Override // kv.c
    public final ou.x h() {
        return this.N;
    }

    @Override // kv.c
    public final uw.c j() {
        return this.O;
    }

    @Override // kv.c
    public final g2 k() {
        return this.R;
    }

    @Override // kv.c
    public final g2 l() {
        return this.Q;
    }

    @Override // kv.c
    public final void n(PaymentSelection paymentSelection) {
        if (Intrinsics.b(paymentSelection, this.f72279p.f93973a.getValue())) {
            return;
        }
        t(paymentSelection);
        if (paymentSelection != null) {
            ((ru.a) this.f72267b).s(paymentSelection);
        }
    }

    @Override // kv.c
    public final void o(ResolvableString resolvableString) {
        B(resolvableString);
    }

    @Override // kv.c
    public final void q() {
        ru.a aVar = (ru.a) this.f72267b;
        aVar.getClass();
        ru.a.i(aVar, new ru.m(2));
        this.I.c(new PaymentSheetResult.Canceled(true));
    }

    @Override // kv.c
    public final void r(ou.x xVar) {
        this.N = xVar;
    }

    public final void w(PaymentSelection paymentSelection, g1 g1Var) {
        this.L = g1Var;
        t70.m0.t(h6.g1.f(this), this.f72268c, null, new i1(this, paymentSelection, null, 0), 2);
    }

    public final void x(vt.f0 f0Var, boolean z11, String str) {
        h6.u0 u0Var = this.f72269d;
        PaymentSelection paymentSelection = (PaymentSelection) u0Var.a("IN_PROGRESS_PAYMENT_SELECTION");
        if (paymentSelection != null) {
            ((ru.a) this.f72267b).p(paymentSelection, f0Var, str);
        }
        Continuation continuation = null;
        if (paymentSelection != null && com.stripe.android.paymentsheet.model.o.b(paymentSelection)) {
            ou.q qVar = this.f72270e;
            LinkConfiguration linkConfiguration = (LinkConfiguration) qVar.f80961e.f93973a.getValue();
            if (linkConfiguration != null) {
                t70.m0.t(t70.l1.f88818a, null, null, new g4(qVar, linkConfiguration, continuation, 17), 3);
            }
        }
        u0Var.d("IN_PROGRESS_PAYMENT_SELECTION", null);
        if (z11) {
            this.I.c(new PaymentSheetResult.Completed(true));
        } else {
            wu.d dVar = new wu.d(new n0.w(this, 4));
            i2 i2Var = this.K;
            i2Var.getClass();
            i2Var.k(null, dVar);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object y(PaymentSheetState$Full paymentSheetState$Full, ContinuationImpl continuationImpl) {
        j1 j1Var;
        b1 b1Var;
        b1 b1Var2;
        if (continuationImpl instanceof j1) {
            j1Var = (j1) continuationImpl;
            int i5 = j1Var.f80915x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                j1Var.f80915x = i5 - Integer.MIN_VALUE;
            } else {
                j1Var = new j1(this, continuationImpl);
            }
        }
        Object objB = j1Var.f80913v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = j1Var.f80915x;
        if (i11 == 0) {
            ResultKt.b(objB);
            j1Var.f80911t = this;
            j1Var.f80912u = paymentSheetState$Full;
            j1Var.f80915x = 1;
            objB = this.S.b(j1Var);
            if (objB != coroutineSingletons) {
                b1Var = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            paymentSheetState$Full = j1Var.f80912u;
            b1Var2 = j1Var.f80911t;
            ResultKt.b(objB);
            b1Var2.S.c(paymentSheetState$Full.f44980e);
            return Unit.f71706a;
        }
        paymentSheetState$Full = j1Var.f80912u;
        b1Var = j1Var.f80911t;
        ResultKt.b(objB);
        mt.v vVar = (mt.v) objB;
        if (vVar instanceof mt.u) {
            mt.u uVar = (mt.u) vVar;
            b1Var.x(uVar.f76809b, true, uVar.f76808a.getF43533a());
        } else {
            gv.q0 q0Var = paymentSheetState$Full.f44979d;
            if (q0Var == null) {
                j1Var.f80911t = b1Var;
                j1Var.f80912u = paymentSheetState$Full;
                j1Var.f80915x = 2;
                if (b1Var.A(paymentSheetState$Full, j1Var) != coroutineSingletons) {
                    b1Var2 = b1Var;
                    b1Var2.S.c(paymentSheetState$Full.f44980e);
                }
                return coroutineSingletons;
            }
            b1Var.f72276k.j(null);
            b1Var.E.b("Payment Sheet error", q0Var);
            b1Var.I.c(new PaymentSheetResult.Failed(q0Var));
        }
        return Unit.f71706a;
    }

    public final void z(PaymentMethodMetadata paymentMethodMetadata, ResolvableString resolvableString) {
        Object iVar;
        List listP;
        xu.f fVar = this.f72278m;
        if (Intrinsics.b((xu.v) fVar.f96342g.f91586b.invoke(), xu.m.f96372a)) {
            B(resolvableString);
            ou.v0 v0VarI = i();
            ou.v0 v0Var = ou.v0.f80991a;
            ou.c cVar = this.f72289z;
            if (v0VarI != v0Var) {
                listP = q1.a(this, paymentMethodMetadata, cVar);
            } else {
                if (((Collection) cVar.f80805c.f91586b.invoke()).isEmpty()) {
                    iVar = new xu.i(t2.c.q(this, paymentMethodMetadata));
                } else {
                    hv.i0 i0VarG = wh.f.G(this, paymentMethodMetadata, cVar, this.A);
                    PaymentMethodMetadata paymentMethodMetadata2 = (PaymentMethodMetadata) this.f72277l.getValue();
                    iVar = new xu.r(i0VarG, paymentMethodMetadata2 != null ? ((su.b) this.G).a(paymentMethodMetadata2.f43092a) : false ? new xu.p(this.f72285v) : xu.o.f96382a);
                }
                listP = ul.b.P(iVar);
            }
            fVar.d(listP);
        }
    }
}
