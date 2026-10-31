package ou;

import com.stripe.android.lpmfoundations.paymentmethod.CustomerMetadata;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.PaymentMethodUpdateParams;
import com.stripe.android.model.o4;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import java.io.Serializable;
import kotlin.LazyKt;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function5;
import kotlin.jvm.internal.FunctionReferenceImpl;
import kotlin.jvm.internal.Intrinsics;
import kw.s3;
import l1.g4;
import w70.i2;

/* loaded from: classes4.dex */
public final class g2 {

    /* renamed from: a, reason: collision with root package name */
    public final Object f80881a;

    /* renamed from: b, reason: collision with root package name */
    public final ru.d f80882b;

    /* renamed from: c, reason: collision with root package name */
    public final t70.j0 f80883c;

    /* renamed from: d, reason: collision with root package name */
    public final CoroutineContext f80884d;

    /* renamed from: e, reason: collision with root package name */
    public final CoroutineContext f80885e;

    /* renamed from: f, reason: collision with root package name */
    public final fv.k f80886f;

    /* renamed from: g, reason: collision with root package name */
    public final w70.g2 f80887g;

    /* renamed from: h, reason: collision with root package name */
    public final FunctionReferenceImpl f80888h;

    /* renamed from: i, reason: collision with root package name */
    public final c f80889i;

    /* renamed from: j, reason: collision with root package name */
    public final SuspendLambda f80890j;

    /* renamed from: k, reason: collision with root package name */
    public final Function0 f80891k;

    /* renamed from: l, reason: collision with root package name */
    public final Function5 f80892l;

    /* renamed from: m, reason: collision with root package name */
    public final uw.c f80893m;
    public final uw.c n;
    public final uw.c o;

    /* renamed from: p, reason: collision with root package name */
    public final i2 f80894p;

    /* renamed from: q, reason: collision with root package name */
    public final i2 f80895q;

    /* JADX WARN: Multi-variable type inference failed */
    public g2(w70.g2 g2Var, ru.d eventReporter, t70.j0 coroutineScope, CoroutineContext workContext, CoroutineContext uiContext, fv.k customerRepository, w70.o1 selection, Function1 function1, c customerStateHolder, Function1 function12, Function0 function0, Function5 function5, w70.g2 isLinkEnabled, boolean z11) {
        Intrinsics.g(eventReporter, "eventReporter");
        Intrinsics.g(coroutineScope, "coroutineScope");
        Intrinsics.g(workContext, "workContext");
        Intrinsics.g(uiContext, "uiContext");
        Intrinsics.g(customerRepository, "customerRepository");
        Intrinsics.g(selection, "selection");
        Intrinsics.g(customerStateHolder, "customerStateHolder");
        Intrinsics.g(isLinkEnabled, "isLinkEnabled");
        this.f80881a = g2Var;
        this.f80882b = eventReporter;
        this.f80883c = coroutineScope;
        this.f80884d = workContext;
        this.f80885e = uiContext;
        this.f80886f = customerRepository;
        this.f80887g = selection;
        this.f80888h = (FunctionReferenceImpl) function1;
        this.f80889i = customerStateHolder;
        this.f80890j = (SuspendLambda) function12;
        this.f80891k = function0;
        this.f80892l = function5;
        this.f80893m = ps.v.j(customerStateHolder.f80804b, g2Var, new j00.k0(24, (byte) 0));
        kv.d dVar = (kv.d) LazyKt.a(new u1(this, isLinkEnabled, z11, 0)).getValue();
        uw.c cVarL = ps.v.l(dVar.f72291b, dVar.f72293d, dVar.f72292c, dVar.f72290a, new jv.h(dVar, 1));
        this.n = cVarL;
        this.o = ps.v.j(customerStateHolder.f80808f, cVarL, new hv.z1(this, 9));
        i2 i2VarC = w70.u1.c(Boolean.FALSE);
        this.f80894p = i2VarC;
        this.f80895q = i2VarC;
        Continuation continuation = null;
        t70.m0.t(coroutineScope, null, null, new w1(this, continuation, 0), 3);
        t70.m0.t(coroutineScope, null, null, new w1(this, continuation, 1), 3);
        t70.m0.t(coroutineScope, null, null, new w1(this, continuation, 2), 3);
    }

    /* JADX WARN: Removed duplicated region for block: B:42:0x0106  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001b  */
    /* JADX WARN: Type inference failed for: r3v2, types: [java.lang.Object, w70.g2] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(PaymentMethod paymentMethod, a aVar, Function1 function1, ContinuationImpl continuationImpl) {
        z1 z1Var;
        CustomerMetadata customerMetadata;
        g2 g2Var;
        Object obj;
        Function1 function12;
        Object objA;
        g2 g2Var2;
        Throwable thA;
        PaymentMethod paymentMethod2 = paymentMethod;
        a aVar2 = aVar;
        if (continuationImpl instanceof z1) {
            z1Var = (z1) continuationImpl;
            int i5 = z1Var.f81027z;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                z1Var.f81027z = i5 - Integer.MIN_VALUE;
            } else {
                z1Var = new z1(this, continuationImpl);
            }
        }
        Object obj2 = z1Var.f81025x;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = z1Var.f81027z;
        if (i11 == 0) {
            ResultKt.b(obj2);
            PaymentMethodMetadata paymentMethodMetadata = (PaymentMethodMetadata) this.f80881a.getValue();
            if (paymentMethodMetadata == null || (customerMetadata = paymentMethodMetadata.f43105p) == null) {
                int i12 = Result.f71687b;
                return ResultKt.a(new IllegalStateException("Could not update payment method because CustomerConfiguration was not found! Make sure it is provided as part of PaymentSheet.Configuration"));
            }
            fv.j jVar = new fv.j(customerMetadata.f43071a, customerMetadata.f43072b, customerMetadata.f43073c);
            String str = paymentMethod2.f43569a;
            ft.b bVar = aVar2.f80788c;
            PaymentMethodUpdateParams.Card cardA = o4.a(aVar2.f80786a, aVar2.f80787b, bVar != null ? new PaymentMethodUpdateParams.Card.Networks(bVar.f55897a) : null, aVar2.f80789d, ab.e0.U("PaymentSheet"));
            z1Var.f81021t = this;
            z1Var.f81022u = paymentMethod2;
            z1Var.f81023v = aVar2;
            z1Var.f81024w = function1;
            z1Var.f81027z = 1;
            Object objF = ((fv.i) this.f80886f).f(jVar, str, cardA, z1Var);
            if (objF != coroutineSingletons) {
                g2Var = this;
                obj = objF;
                function12 = function1;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            objA = z1Var.f81023v;
            aVar2 = (a) z1Var.f81022u;
            g2Var2 = z1Var.f81021t;
            ResultKt.b(obj2);
            ru.d dVar = g2Var2.f80882b;
            ft.b bVar2 = aVar2.f80788c;
            ru.a aVar3 = (ru.a) dVar;
            aVar3.getClass();
            ru.a.i(aVar3, new ru.q(bVar2));
            g2Var = g2Var2;
            thA = Result.a(objA);
            if (thA != null) {
                ru.d dVar2 = g2Var.f80882b;
                ft.b bVar3 = aVar2.f80788c;
                ru.a aVar4 = (ru.a) dVar2;
                aVar4.getClass();
                ru.a.i(aVar4, new ru.p(bVar3, thA));
            }
            return objA;
        }
        Function1 function13 = z1Var.f81024w;
        aVar2 = (a) z1Var.f81023v;
        PaymentMethod paymentMethod3 = (PaymentMethod) z1Var.f81022u;
        g2Var = z1Var.f81021t;
        ResultKt.b(obj2);
        Object obj3 = ((Result) obj2).f71688a;
        function12 = function13;
        paymentMethod2 = paymentMethod3;
        obj = obj3;
        int i13 = Result.f71687b;
        objA = !(obj instanceof Result.Failure) ? PaymentMethod.a((PaymentMethod) obj, null, paymentMethod2.f43584r, paymentMethod2.f43585s, 655359) : obj;
        if (!(objA instanceof Result.Failure)) {
            CoroutineContext coroutineContext = g2Var.f80885e;
            a2 a2Var = new a2(g2Var, (PaymentMethod) objA, function12, null);
            z1Var.f81021t = g2Var;
            z1Var.f81022u = aVar2;
            z1Var.f81023v = objA;
            z1Var.f81024w = null;
            z1Var.f81027z = 2;
            if (t70.m0.y(coroutineContext, a2Var, z1Var) != coroutineSingletons) {
                g2Var2 = g2Var;
                ru.d dVar3 = g2Var2.f80882b;
                ft.b bVar22 = aVar2.f80788c;
                ru.a aVar32 = (ru.a) dVar3;
                aVar32.getClass();
                ru.a.i(aVar32, new ru.q(bVar22));
                g2Var = g2Var2;
            }
            return coroutineSingletons;
        }
        thA = Result.a(objA);
        if (thA != null) {
        }
        return objA;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Serializable b(PaymentMethod paymentMethod, ContinuationImpl continuationImpl) {
        c2 c2Var;
        String str;
        Object objC;
        g2 g2Var;
        if (continuationImpl instanceof c2) {
            c2Var = (c2) continuationImpl;
            int i5 = c2Var.f80820x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c2Var.f80820x = i5 - Integer.MIN_VALUE;
            } else {
                c2Var = new c2(this, continuationImpl);
            }
        }
        Object obj = c2Var.f80818v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c2Var.f80820x;
        if (i11 == 0) {
            ResultKt.b(obj);
            str = paymentMethod.f43569a;
            c2Var.f80816t = this;
            c2Var.f80817u = str;
            c2Var.f80820x = 1;
            objC = c(str, c2Var);
            if (objC == coroutineSingletons) {
                return coroutineSingletons;
            }
            g2Var = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            str = c2Var.f80817u;
            g2Var = c2Var.f80816t;
            ResultKt.b(obj);
            objC = ((Result) obj).f71688a;
        }
        int i12 = Result.f71687b;
        if (!(objC instanceof Result.Failure)) {
            t70.m0.t(g2Var.f80883c, g2Var.f80885e, null, new g4(g2Var, str, null, 21), 2);
        }
        return Result.a(objC);
    }

    /* JADX WARN: Code restructure failed: missing block: B:35:0x009f, code lost:
    
        if (t70.m0.y(r9.f80885e, r6, r0) == r1) goto L40;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r11v2, types: [java.lang.Object, w70.g2] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(String str, ContinuationImpl continuationImpl) {
        d2 d2Var;
        CustomerMetadata customerMetadata;
        boolean zBooleanValue;
        g2 g2Var;
        if (continuationImpl instanceof d2) {
            d2Var = (d2) continuationImpl;
            int i5 = d2Var.f80845z;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                d2Var.f80845z = i5 - Integer.MIN_VALUE;
            } else {
                d2Var = new d2(this, continuationImpl);
            }
        }
        Object obj = d2Var.f80843x;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = d2Var.f80845z;
        Continuation continuation = null;
        if (i11 == 0) {
            ResultKt.b(obj);
            PaymentMethodMetadata paymentMethodMetadata = (PaymentMethodMetadata) this.f80881a.getValue();
            if (paymentMethodMetadata == null || (customerMetadata = paymentMethodMetadata.f43105p) == null) {
                int i12 = Result.f71687b;
                return ResultKt.a(new IllegalStateException("Could not remove payment method because CustomerConfiguration was not found! Make sure it is provided as part of PaymentSheet.Configuration"));
            }
            zBooleanValue = ((Boolean) this.f80889i.f80807e.f91586b.invoke()).booleanValue();
            Object value = this.f80887g.getValue();
            PaymentSelection.Saved saved = value instanceof PaymentSelection.Saved ? (PaymentSelection.Saved) value : null;
            PaymentMethod paymentMethod = saved != null ? saved.f44846a : null;
            if (Intrinsics.b(paymentMethod != null ? paymentMethod.f43569a : null, str)) {
                iv.b bVar = new iv.b(this, continuation, 15);
                d2Var.f80839t = this;
                d2Var.f80840u = str;
                d2Var.f80841v = customerMetadata;
                d2Var.f80842w = zBooleanValue;
                d2Var.f80845z = 1;
            }
            g2Var = this;
        } else {
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return ((Result) obj).f71688a;
            }
            boolean z11 = d2Var.f80842w;
            customerMetadata = d2Var.f80841v;
            String str2 = d2Var.f80840u;
            g2Var = d2Var.f80839t;
            ResultKt.b(obj);
            zBooleanValue = z11;
            str = str2;
        }
        fv.k kVar = g2Var.f80886f;
        fv.j jVar = new fv.j(customerMetadata.f43071a, customerMetadata.f43072b, customerMetadata.f43073c);
        d2Var.f80839t = null;
        d2Var.f80840u = null;
        d2Var.f80841v = null;
        d2Var.f80845z = 2;
        Object objA = ((fv.i) kVar).a(jVar, str, zBooleanValue, d2Var);
        return objA == coroutineSingletons ? coroutineSingletons : objA;
    }

    /* JADX WARN: Removed duplicated region for block: B:40:0x00c0  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00d7  */
    /* JADX WARN: Removed duplicated region for block: B:48:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r12v2, types: [java.lang.Object, w70.g2] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(PaymentMethod paymentMethod, Continuation continuation) {
        e2 e2Var;
        CustomerMetadata customerMetadata;
        PaymentMethod paymentMethod2;
        Object obj;
        g2 g2Var;
        PaymentMethod paymentMethod3;
        g2 g2Var2;
        if (continuation instanceof e2) {
            e2Var = (e2) continuation;
            int i5 = e2Var.f80857y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                e2Var.f80857y = i5 - Integer.MIN_VALUE;
            } else {
                e2Var = new e2(this, continuation);
            }
        }
        Object obj2 = e2Var.f80855w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = e2Var.f80857y;
        if (i11 == 0) {
            ResultKt.b(obj2);
            PaymentMethodMetadata paymentMethodMetadata = (PaymentMethodMetadata) this.f80881a.getValue();
            if (paymentMethodMetadata == null || (customerMetadata = paymentMethodMetadata.f43105p) == null) {
                int i12 = Result.f71687b;
                return ResultKt.a(new IllegalStateException("Unable to set default payment method when customer is null."));
            }
            fv.j jVar = new fv.j(customerMetadata.f43071a, customerMetadata.f43072b, customerMetadata.f43073c);
            String str = paymentMethod.f43569a;
            e2Var.f80852t = this;
            e2Var.f80853u = paymentMethod;
            e2Var.f80857y = 1;
            Object objE = ((fv.i) this.f80886f).e(jVar, str, e2Var);
            if (objE != coroutineSingletons) {
                paymentMethod2 = paymentMethod;
                obj = objE;
                g2Var = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            obj = e2Var.f80854v;
            paymentMethod3 = e2Var.f80853u;
            g2Var2 = e2Var.f80852t;
            ResultKt.b(obj2);
            ru.d dVar = g2Var2.f80882b;
            PaymentMethod.Type type = paymentMethod3.f43573e;
            String str2 = type != null ? type.f43655a : null;
            ru.a aVar = (ru.a) dVar;
            aVar.getClass();
            ru.a.i(aVar, new ru.n(str2, 8));
            int i13 = Result.f71687b;
            if (!(obj instanceof Result.Failure)) {
                return obj;
            }
            return Unit.f71706a;
        }
        PaymentMethod paymentMethod4 = e2Var.f80853u;
        g2Var = e2Var.f80852t;
        ResultKt.b(obj2);
        Object obj3 = ((Result) obj2).f71688a;
        paymentMethod2 = paymentMethod4;
        obj = obj3;
        Throwable thA = Result.a(obj);
        if (thA != null) {
            ru.d dVar2 = g2Var.f80882b;
            PaymentMethod.Type type2 = paymentMethod2.f43573e;
            String str3 = type2 != null ? type2.f43655a : null;
            ru.a aVar2 = (ru.a) dVar2;
            aVar2.getClass();
            ru.a.i(aVar2, new ru.p(str3, thA));
        }
        if (!(obj instanceof Result.Failure)) {
            CoroutineContext coroutineContext = g2Var.f80885e;
            f2 f2Var = new f2(g2Var, paymentMethod2, null);
            e2Var.f80852t = g2Var;
            e2Var.f80853u = paymentMethod2;
            e2Var.f80854v = obj;
            e2Var.f80857y = 2;
            if (t70.m0.y(coroutineContext, f2Var, e2Var) != coroutineSingletons) {
                paymentMethod3 = paymentMethod2;
                g2Var2 = g2Var;
                ru.d dVar3 = g2Var2.f80882b;
                PaymentMethod.Type type3 = paymentMethod3.f43573e;
                if (type3 != null) {
                }
                ru.a aVar3 = (ru.a) dVar3;
                aVar3.getClass();
                ru.a.i(aVar3, new ru.n(str2, 8));
            }
            return coroutineSingletons;
        }
        int i132 = Result.f71687b;
        if (!(obj instanceof Result.Failure)) {
        }
    }

    public final void e() {
        i2 i2Var;
        do {
            i2Var = this.f80894p;
        } while (!i2Var.i(i2Var.getValue(), Boolean.valueOf(!((Boolean) r1).booleanValue())));
    }

    public final void f(j displayableSavedPaymentMethod) {
        Intrinsics.g(displayableSavedPaymentMethod, "displayableSavedPaymentMethod");
        PaymentMethod paymentMethod = displayableSavedPaymentMethod.f80905b;
        Continuation continuation = null;
        this.f80892l.invoke(displayableSavedPaymentMethod, this.f80889i.f80808f.f91586b.invoke(), new a1.c(this, paymentMethod, continuation, 3), new s3(this, paymentMethod, continuation, 24), new h10.k1(2, this, g2.class, "setDefaultPaymentMethod", "setDefaultPaymentMethod-gIAlu-s$paymentsheet_release(Lcom/stripe/android/model/PaymentMethod;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", 0, 14));
    }
}
