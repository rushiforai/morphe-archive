package com.stripe.android.customersheet;

import android.app.Application;
import com.stripe.android.PaymentConfiguration;
import com.stripe.android.customersheet.InternalCustomerSheetResult;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentSheetCardBrandFilter;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.PaymentMethodUpdateParams;
import com.stripe.android.model.o4;
import com.stripe.android.networking.PaymentAnalyticsEvent;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetailsCollectionConfiguration;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import com.stripe.android.paymentsheet.p0;
import cw.q;
import fl.l;
import h10.k1;
import h10.y0;
import h6.f1;
import h6.g1;
import h6.u0;
import hq.m;
import hv.s2;
import ir.i;
import iw.p;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import jr.b0;
import jr.c0;
import jr.d0;
import jr.e0;
import jr.f0;
import jr.g;
import jr.g0;
import jr.h0;
import jr.i0;
import jr.k;
import jr.l0;
import jr.n;
import jr.o;
import jr.o0;
import jr.q0;
import jr.r;
import jr.s;
import jr.t;
import jr.u;
import jr.w;
import jr.x;
import jr.y;
import jr.z;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kr.h;
import mt.j0;
import mt.n0;
import ps.v;
import r70.j;
import t70.k0;
import t70.m0;
import w70.i2;
import w70.u1;

/* loaded from: classes4.dex */
public final class d extends f1 {

    /* renamed from: a, reason: collision with root package name */
    public final PaymentSelection f42612a;

    /* renamed from: b, reason: collision with root package name */
    public final q.c f42613b;

    /* renamed from: c, reason: collision with root package name */
    public final q.c f42614c;

    /* renamed from: d, reason: collision with root package name */
    public final CustomerSheet$Configuration f42615d;

    /* renamed from: e, reason: collision with root package name */
    public final l f42616e;

    /* renamed from: f, reason: collision with root package name */
    public final CoroutineContext f42617f;

    /* renamed from: g, reason: collision with root package name */
    public final jr.f f42618g;

    /* renamed from: h, reason: collision with root package name */
    public final iu.f f42619h;

    /* renamed from: i, reason: collision with root package name */
    public final i f42620i;

    /* renamed from: j, reason: collision with root package name */
    public final i2 f42621j;

    /* renamed from: k, reason: collision with root package name */
    public final boolean f42622k;

    /* renamed from: l, reason: collision with root package name */
    public final i2 f42623l;

    /* renamed from: m, reason: collision with root package name */
    public final uw.c f42624m;
    public final i2 n;
    public final i2 o;

    /* renamed from: p, reason: collision with root package name */
    public final n0 f42625p;

    /* renamed from: q, reason: collision with root package name */
    public final i2 f42626q;

    /* renamed from: r, reason: collision with root package name */
    public final i2 f42627r;

    /* renamed from: s, reason: collision with root package name */
    public final uw.c f42628s;

    public d(Application application, PaymentSelection paymentSelection, CustomerSheet$Configuration configuration, jr.e integrationType, xq.c logger, l eventReporter, CoroutineContext workContext, PaymentConfiguration paymentConfiguration, Set productUsage, j0 confirmationHandlerFactory, jr.f customerSheetLoader, iu.f errorReporter, u0 savedStateHandle, i userFacingLogger) {
        Intrinsics.g(application, "application");
        Intrinsics.g(configuration, "configuration");
        Intrinsics.g(integrationType, "integrationType");
        Intrinsics.g(logger, "logger");
        Intrinsics.g(eventReporter, "eventReporter");
        Intrinsics.g(workContext, "workContext");
        Intrinsics.g(paymentConfiguration, "paymentConfiguration");
        Intrinsics.g(productUsage, "productUsage");
        Intrinsics.g(confirmationHandlerFactory, "confirmationHandlerFactory");
        Intrinsics.g(customerSheetLoader, "customerSheetLoader");
        Intrinsics.g(errorReporter, "errorReporter");
        Intrinsics.g(savedStateHandle, "savedStateHandle");
        Intrinsics.g(userFacingLogger, "userFacingLogger");
        q.c cVarA = qq.c.a(or.a.f80620b);
        q.c cVarA2 = qq.c.a(or.a.f80621c);
        this.f42612a = paymentSelection;
        this.f42613b = cVarA;
        this.f42614c = cVarA2;
        this.f42615d = configuration;
        this.f42616e = eventReporter;
        this.f42617f = workContext;
        this.f42618g = customerSheetLoader;
        this.f42619h = errorReporter;
        this.f42620i = userFacingLogger;
        new m(application, productUsage);
        EmptyList emptyList = EmptyList.f71733a;
        PaymentSelection paymentSelection2 = this.f42612a;
        tq.a aVar = tq.a.f89560b;
        i2 i2VarC = u1.c(new b0(emptyList, paymentSelection2, new jr.a(), configuration));
        this.f42621j = i2VarC;
        String str = paymentConfiguration.f42440a;
        int i5 = 0;
        int i11 = 1;
        this.f42622k = !j.I0(str, "pk_test", false);
        i2 i2VarC2 = u1.c(ul.b.P(new jr.n0(i())));
        this.f42623l = i2VarC2;
        uw.c cVarU = v.u(i2VarC2, new p(6));
        this.f42624m = cVarU;
        Continuation continuation = null;
        i2 i2VarC3 = u1.c(null);
        this.n = i2VarC3;
        this.o = i2VarC3;
        this.f42625p = confirmationHandlerFactory.a(g1.f(this));
        i2 i2VarC4 = u1.c(Boolean.FALSE);
        this.f42626q = i2VarC4;
        i2 i2VarC5 = u1.c(new c0(false, null));
        this.f42627r = i2VarC5;
        int i12 = 3;
        this.f42628s = v.k(i2VarC, i2VarC5, i2VarC4, new c1.f(this, i12));
        new ArrayList();
        new q(false, configuration.f42600k, savedStateHandle);
        p0.b(configuration.f42590a);
        eventReporter.m(new kr.f(configuration, integrationType));
        boolean z11 = cVarU.f91586b.invoke() instanceof jr.n0;
        int i13 = 2;
        if (z11) {
            m0.t(g1.f(this), workContext, null, new z(this, continuation, i5), 2);
        }
        m0.t(g1.f(this), null, null, new z(this, continuation, i11), 3);
        m0.t(g1.f(this), null, null, new z(this, continuation, i13), 3);
        m0.t(g1.f(this), null, null, new z(this, continuation, i12), 3);
    }

    /* JADX WARN: Code restructure failed: missing block: B:20:0x0066, code lost:
    
        if (t70.m0.y(r2, r4, r0) == r1) goto L21;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object e(d dVar, ContinuationImpl continuationImpl) throws Throwable {
        d0 d0Var;
        if (continuationImpl instanceof d0) {
            d0Var = (d0) continuationImpl;
            int i5 = d0Var.f69655w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                d0Var.f69655w = i5 - Integer.MIN_VALUE;
            } else {
                d0Var = new d0(dVar, continuationImpl);
            }
        }
        Object objY = d0Var.f69653u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = d0Var.f69655w;
        Continuation continuation = null;
        if (i11 == 0) {
            ResultKt.b(objY);
            CoroutineContext coroutineContext = dVar.f42617f;
            z zVar = new z(dVar, continuation, 4);
            d0Var.f69652t = dVar;
            d0Var.f69655w = 1;
            objY = m0.y(coroutineContext, zVar, d0Var);
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
        dVar = d0Var.f69652t;
        ResultKt.b(objY);
        Object obj = ((Result) objY).f71688a;
        CoroutineContext coroutineContext2 = g1.f(dVar).f76013a;
        c cVar = new c(obj, dVar, null);
        d0Var.f69652t = null;
        d0Var.f69655w = 2;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void f(d dVar, PaymentMethod paymentMethod, Continuation continuation) {
        g0 g0Var;
        dVar.getClass();
        if (continuation instanceof g0) {
            g0Var = (g0) continuation;
            int i5 = g0Var.f69666v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                g0Var.f69666v = i5 - Integer.MIN_VALUE;
            } else {
                g0Var = new g0(dVar, continuation);
            }
        }
        Object obj = g0Var.f69664t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = g0Var.f69666v;
        if (i11 == 0) {
            ResultKt.b(obj);
            g0Var.f69666v = 1;
            dVar.l(paymentMethod, g0Var);
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            if (obj != null) {
                throw new ClassCastException();
            }
            vh.a.u();
            throw null;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void g(d dVar, PaymentMethod paymentMethod, ou.a aVar, Continuation continuation) {
        l0 l0Var;
        dVar.getClass();
        if (continuation instanceof l0) {
            l0Var = (l0) continuation;
            int i5 = l0Var.f69688v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                l0Var.f69688v = i5 - Integer.MIN_VALUE;
            } else {
                l0Var = new l0(dVar, continuation);
            }
        }
        Object obj = l0Var.f69686t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = l0Var.f69688v;
        if (i11 == 0) {
            ResultKt.b(obj);
            l0Var.f69688v = 1;
            dVar.j(paymentMethod, aVar, l0Var);
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            if (obj != null) {
                throw new ClassCastException();
            }
            throw new NoWhenBranchMatchedException();
        }
    }

    public final void h(y viewAction) {
        Object value;
        ArrayList arrayList;
        Object value2;
        ArrayList arrayList2;
        Object value3;
        ArrayList arrayList3;
        Object value4;
        ArrayList arrayList4;
        Object value5;
        ArrayList arrayList5;
        Object value6;
        Object value7;
        Intrinsics.g(viewAction, "viewAction");
        boolean z11 = viewAction instanceof jr.p;
        i2 i2Var = this.n;
        if (z11) {
            do {
                value7 = i2Var.getValue();
            } while (!i2Var.i(value7, new InternalCustomerSheetResult.Canceled(this.f42612a)));
            return;
        }
        if (viewAction instanceof g) {
            n(false);
            throw null;
        }
        boolean z12 = viewAction instanceof jr.m;
        l lVar = this.f42616e;
        if (z12) {
            lVar.getClass();
            lVar.m(new kr.d(0));
            return;
        }
        if (viewAction instanceof o) {
            ft.b brand = ((o) viewAction).f69710a;
            lVar.getClass();
            Intrinsics.g(brand, "brand");
            lVar.m(new kr.c(brand));
            return;
        }
        if (viewAction instanceof jr.i) {
            PaymentAnalyticsEvent paymentAnalyticsEvent = PaymentAnalyticsEvent.f44074b;
            lVar.getClass();
            m0.t(k0.a((CoroutineContext) lVar.f55375c), null, null, new iv.b(lVar, null), 3);
            return;
        }
        if (viewAction instanceof n) {
            gs.g gVar = ((n) viewAction).f69708a;
            lVar.getClass();
            lVar.m(gVar);
            return;
        }
        if (viewAction instanceof jr.j) {
            k();
            return;
        }
        boolean z13 = viewAction instanceof jr.q;
        i2 i2Var2 = this.f42626q;
        i2 i2Var3 = this.f42621j;
        if (z13) {
            if (((b0) i2Var3.getValue()).f69644g) {
                boolean zBooleanValue = ((Boolean) i2Var2.getValue()).booleanValue();
                if (zBooleanValue) {
                    lVar.getClass();
                    lVar.m(new kr.d(1));
                } else {
                    lVar.getClass();
                    lVar.m(new kr.d(2));
                }
                i2Var2.k(null, Boolean.valueOf(!zBooleanValue));
                return;
            }
            return;
        }
        boolean z14 = viewAction instanceof u;
        int i5 = 10;
        i2 i2Var4 = this.f42623l;
        if (z14) {
            ou.j jVar = ((u) viewAction).f69743a;
            b0 b0Var = (b0) i2Var3.getValue();
            boolean zI = i();
            boolean z15 = b0Var.f69642e;
            CustomerSheet$Configuration customerSheet$Configuration = this.f42615d;
            PaymentSheet$BillingDetailsCollectionConfiguration paymentSheet$BillingDetailsCollectionConfiguration = customerSheet$Configuration.f42594e;
            jr.p0 p0Var = new jr.p0(new hv.p0(zI, z15, jVar, new PaymentSheetCardBrandFilter(b0Var.f69641d.f42599j), paymentSheet$BillingDetailsCollectionConfiguration.f44516d, paymentSheet$BillingDetailsCollectionConfiguration.b(), false, tq.a.f89562d.a(customerSheet$Configuration.f42595f), false, false, new k1(2, this, d.class, "removeExecutor", "removeExecutor(Lcom/stripe/android/model/PaymentMethod;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", 0, 7), new fx.f(3, this, d.class, "updatePaymentMethodExecutor", "updatePaymentMethodExecutor-0E7RQCE(Lcom/stripe/android/model/PaymentMethod;Lcom/stripe/android/paymentsheet/CardUpdateParams;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", 0, 1), new f0(2, null), new y0(this, i5), new fr.b0(this, 14)), i());
            if (p0Var instanceof jr.p0) {
                kr.j jVar2 = kr.j.f72144c;
                lVar.getClass();
                lVar.m(new h(jVar2, 1));
            }
            do {
                value6 = i2Var4.getValue();
            } while (!i2Var4.i(value6, b70.g.u1((List) value6, p0Var)));
            return;
        }
        if (viewAction instanceof t) {
            PaymentSelection paymentSelection = ((t) viewAction).f69738a;
            if (!(paymentSelection instanceof PaymentSelection.GooglePay) && !(paymentSelection instanceof PaymentSelection.Saved)) {
                throw new IllegalStateException(("Unsupported payment selection " + paymentSelection).toString());
            }
            if (((Boolean) i2Var2.getValue()).booleanValue()) {
                return;
            }
            b0 state = (b0) i2Var3.getValue();
            Intrinsics.g(state, "state");
            List paymentMethods = state.f69638a;
            jr.a aVar = state.f69640c;
            CustomerSheet$Configuration configuration = state.f69641d;
            Intrinsics.g(paymentMethods, "paymentMethods");
            Intrinsics.g(configuration, "configuration");
            i2Var3.k(null, new b0(paymentMethods, paymentSelection, aVar, configuration));
            return;
        }
        boolean z16 = viewAction instanceof jr.v;
        uw.c cVar = this.f42624m;
        if (z16) {
            q0 q0Var = (q0) cVar.f91586b.invoke();
            if (q0Var instanceof jr.m0) {
                s2 s2Var = ((jr.m0) q0Var).f69702q;
                if (s2Var != null) {
                    s2Var.f60583c.invoke();
                    return;
                }
                ((b0) i2Var3.getValue()).getClass();
                t2.c.L(this.f42619h, iu.e.B, null, null, 6);
                InternalCustomerSheetResult.Error error = new InternalCustomerSheetResult.Error(new IllegalStateException("No customer metadata available on confirmation!"));
                i2Var.getClass();
                i2Var.k(null, error);
                return;
            }
            if (!(q0Var instanceof o0)) {
                throw new IllegalStateException((cVar.f91586b.invoke() + " is not supported").toString());
            }
            i2 i2Var5 = this.f42627r;
            c0 state2 = (c0) i2Var5.getValue();
            Intrinsics.g(state2, "state");
            i2Var5.k(null, new c0(true, state2.f69649b));
            PaymentSelection paymentSelection2 = ((o0) q0Var).f69713e;
            if (paymentSelection2 instanceof PaymentSelection.GooglePay) {
                ((b0) i2Var3.getValue()).getClass();
                m0.t(g1.f(this), this.f42617f, null, new i0(this, null, null), 2);
                return;
            } else if (paymentSelection2 instanceof PaymentSelection.Saved) {
                m((PaymentSelection.Saved) paymentSelection2);
                return;
            } else {
                if (paymentSelection2 == null) {
                    m(null);
                    return;
                }
                throw new IllegalStateException((paymentSelection2 + " is not supported").toString());
            }
        }
        if (viewAction instanceof jr.h) {
            bt.g gVar2 = ((jr.h) viewAction).f69667a;
            Object objInvoke = cVar.f91586b.invoke();
            jr.m0 m0Var = objInvoke instanceof jr.m0 ? (jr.m0) objInvoke : null;
            if (m0Var == null || !m0Var.f69690c.equals(gVar2.f18480a)) {
                ((b0) i2Var3.getValue()).getClass();
                throw new IllegalArgumentException("Required value was null.");
            }
            return;
        }
        if (viewAction instanceof s) {
            ((b0) i2Var3.getValue()).getClass();
            return;
        }
        if (viewAction instanceof w) {
            do {
                value5 = i2Var4.getValue();
                List<q0> list = (List) value5;
                arrayList5 = new ArrayList(b70.c.u0(list, 10));
                for (q0 q0Var2 : list) {
                    if (q0Var2 instanceof jr.m0) {
                        throw null;
                    }
                    arrayList5.add(q0Var2);
                }
            } while (!i2Var4.i(value5, arrayList5));
            return;
        }
        if (viewAction instanceof x) {
            do {
                value4 = i2Var4.getValue();
                List<Object> list2 = (List) value4;
                arrayList4 = new ArrayList(b70.c.u0(list2, 10));
                for (Object objC : list2) {
                    if (objC instanceof jr.m0) {
                        objC = jr.m0.c((jr.m0) objC, null, null, null, null, null, false, false, null, null, false, null, null, false, false, null, 950271);
                    }
                    arrayList4.add(objC);
                }
            } while (!i2Var4.i(value4, arrayList4));
            return;
        }
        if (viewAction instanceof k) {
            do {
                value3 = i2Var4.getValue();
                List<Object> list3 = (List) value3;
                arrayList3 = new ArrayList(b70.c.u0(list3, 10));
                for (Object objC2 : list3) {
                    if (objC2 instanceof jr.m0) {
                        objC2 = jr.m0.c((jr.m0) objC2, null, null, null, null, null, false, false, null, zg.a.G(2132019759), false, null, null, false, false, null, 782335);
                    }
                    arrayList3.add(objC2);
                }
            } while (!i2Var4.i(value3, arrayList3));
            return;
        }
        if (viewAction instanceof r) {
            do {
                value2 = i2Var4.getValue();
                List<Object> list4 = (List) value2;
                arrayList2 = new ArrayList(b70.c.u0(list4, 10));
                for (Object objC3 : list4) {
                    if (objC3 instanceof jr.m0) {
                        objC3 = jr.m0.c((jr.m0) objC3, null, null, null, null, null, false, false, null, null, false, null, null, false, false, null, 1047551);
                    }
                    arrayList2.add(objC3);
                }
            } while (!i2Var4.i(value2, arrayList2));
            return;
        }
        if (!(viewAction instanceof jr.l)) {
            throw new NoWhenBranchMatchedException();
        }
        do {
            value = i2Var4.getValue();
            List<Object> list5 = (List) value;
            arrayList = new ArrayList(b70.c.u0(list5, 10));
            for (Object objC4 : list5) {
                if (objC4 instanceof jr.m0) {
                    objC4 = jr.m0.c((jr.m0) objC4, null, null, null, null, null, false, false, null, null, false, null, null, false, false, null, 917503);
                }
                arrayList.add(objC4);
            }
        } while (!i2Var4.i(value, arrayList));
    }

    public final boolean i() {
        ((b0) this.f42621j.getValue()).getClass();
        return this.f42622k;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void j(PaymentMethod paymentMethod, ou.a aVar, ContinuationImpl continuationImpl) {
        e0 e0Var;
        d dVar;
        if (continuationImpl instanceof e0) {
            e0Var = (e0) continuationImpl;
            int i5 = e0Var.f69662y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                e0Var.f69662y = i5 - Integer.MIN_VALUE;
            } else {
                e0Var = new e0(this, continuationImpl);
            }
        }
        Object objH = e0Var.f69660w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = e0Var.f69662y;
        if (i11 == 0) {
            ResultKt.b(objH);
            e0Var.f69657t = this;
            e0Var.f69658u = paymentMethod;
            e0Var.f69659v = aVar;
            e0Var.f69662y = 1;
            objH = this.f42613b.h(e0Var);
            if (objH == coroutineSingletons) {
                return;
            } else {
                dVar = this;
            }
        } else {
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(objH);
                if (objH != null) {
                    throw new ClassCastException();
                }
                vh.a.u();
                throw null;
            }
            aVar = e0Var.f69659v;
            paymentMethod = (PaymentMethod) e0Var.f69658u;
            dVar = e0Var.f69657t;
            ResultKt.b(objH);
        }
        if (objH != null) {
            throw new ClassCastException();
        }
        String str = paymentMethod.f43569a;
        ft.b bVar = aVar.f80788c;
        o4.a(aVar.f80786a, aVar.f80787b, bVar != null ? new PaymentMethodUpdateParams.Card.Networks(bVar.f55897a) : null, aVar.f80789d, ab.e0.U("CustomerSheet"));
        e0Var.f69657t = dVar;
        e0Var.f69658u = aVar;
        e0Var.f69659v = null;
        e0Var.f69662y = 2;
        throw null;
    }

    public final void k() {
        Object value;
        List list;
        i2 i2Var = this.f42623l;
        if (((List) i2Var.getValue()).size() == 1) {
            InternalCustomerSheetResult.Canceled canceled = new InternalCustomerSheetResult.Canceled(this.f42612a);
            i2 i2Var2 = this.n;
            i2Var2.getClass();
            i2Var2.k(null, canceled);
            return;
        }
        do {
            value = i2Var.getValue();
            list = (List) value;
            q0 q0Var = (q0) b70.g.h1(list);
            kr.j jVar = q0Var instanceof jr.m0 ? kr.j.f72142a : q0Var instanceof o0 ? kr.j.f72143b : q0Var instanceof jr.p0 ? kr.j.f72144c : null;
            if (jVar != null) {
                l lVar = this.f42616e;
                lVar.getClass();
                if (kr.k.f72146a[jVar.ordinal()] == 1) {
                    lVar.m(new h(jVar, 0));
                }
            }
        } while (!i2Var.i(value, b70.g.R0(list)));
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void l(PaymentMethod paymentMethod, ContinuationImpl continuationImpl) {
        h0 h0Var;
        d dVar;
        if (continuationImpl instanceof h0) {
            h0Var = (h0) continuationImpl;
            int i5 = h0Var.f69672x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                h0Var.f69672x = i5 - Integer.MIN_VALUE;
            } else {
                h0Var = new h0(this, continuationImpl);
            }
        }
        Object objH = h0Var.f69670v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = h0Var.f69672x;
        if (i11 == 0) {
            ResultKt.b(objH);
            h0Var.f69668t = this;
            h0Var.f69669u = paymentMethod;
            h0Var.f69672x = 1;
            objH = this.f42613b.h(h0Var);
            if (objH == coroutineSingletons) {
                return;
            } else {
                dVar = this;
            }
        } else {
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(objH);
                if (objH != null) {
                    throw new ClassCastException();
                }
                vh.a.u();
                throw null;
            }
            paymentMethod = h0Var.f69669u;
            dVar = h0Var.f69668t;
            ResultKt.b(objH);
        }
        if (objH != null) {
            throw new ClassCastException();
        }
        String str = paymentMethod.f43569a;
        h0Var.f69668t = dVar;
        h0Var.f69669u = paymentMethod;
        h0Var.f69672x = 2;
        throw null;
    }

    public final void m(PaymentSelection.Saved saved) {
        ((b0) this.f42621j.getValue()).getClass();
        m0.t(g1.f(this), null, null, new jr.k0(this, saved, null, null), 3);
    }

    public final void n(boolean z11) {
        ((b0) this.f42621j.getValue()).getClass();
        throw new IllegalArgumentException("Required value was null.");
    }
}
