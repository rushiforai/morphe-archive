package vt;

import com.stripe.android.core.networking.ApiRequest$Options;
import com.stripe.android.lpmfoundations.paymentmethod.IntegrationMetadata;
import com.stripe.android.model.ClientAttributionMetadata;
import com.stripe.android.model.ConfirmPaymentIntentParams;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.PaymentMethodCreateParams;
import com.stripe.android.model.SetupIntent;
import com.stripe.android.model.StripeIntent;
import com.stripe.android.paymentelement.confirmation.PaymentMethodConfirmationOption;
import jt.c1;
import jt.z0;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class p implements m0 {

    /* renamed from: a, reason: collision with root package name */
    public final ClientAttributionMetadata f93095a;

    /* renamed from: b, reason: collision with root package name */
    public final IntegrationMetadata.CustomerSheet f93096b;

    /* renamed from: c, reason: collision with root package name */
    public final c1 f93097c;

    /* renamed from: d, reason: collision with root package name */
    public final ApiRequest$Options f93098d;

    /* renamed from: e, reason: collision with root package name */
    public final nx.l f93099e;

    /* renamed from: f, reason: collision with root package name */
    public final t5.d0 f93100f;

    /* renamed from: g, reason: collision with root package name */
    public final xq.c f93101g;

    public p(ClientAttributionMetadata clientAttributionMetadata, IntegrationMetadata.CustomerSheet integrationMetadata, c1 stripeRepository, ApiRequest$Options requestOptions, nx.l setupIntentInterceptorFactory, t5.d0 attachPaymentMethodInterceptorFactory, xq.c logger) {
        Intrinsics.g(clientAttributionMetadata, "clientAttributionMetadata");
        Intrinsics.g(integrationMetadata, "integrationMetadata");
        Intrinsics.g(stripeRepository, "stripeRepository");
        Intrinsics.g(requestOptions, "requestOptions");
        Intrinsics.g(setupIntentInterceptorFactory, "setupIntentInterceptorFactory");
        Intrinsics.g(attachPaymentMethodInterceptorFactory, "attachPaymentMethodInterceptorFactory");
        Intrinsics.g(logger, "logger");
        this.f93095a = clientAttributionMetadata;
        this.f93096b = integrationMetadata;
        this.f93097c = stripeRepository;
        this.f93098d = requestOptions;
        this.f93099e = setupIntentInterceptorFactory;
        this.f93100f = attachPaymentMethodInterceptorFactory;
        this.f93101g = logger;
    }

    /* JADX WARN: Code restructure failed: missing block: B:52:0x0103, code lost:
    
        if (r11 == r0) goto L53;
     */
    /* JADX WARN: Removed duplicated region for block: B:42:0x0097 A[Catch: all -> 0x0032, TryCatch #0 {all -> 0x0032, blocks: (B:13:0x002c, B:19:0x003d, B:54:0x0106, B:22:0x0046, B:32:0x007b, B:34:0x0088, B:36:0x008c, B:42:0x0097, B:44:0x00a6, B:47:0x00b2, B:49:0x00d2, B:50:0x00d7, B:51:0x00d8, B:28:0x0064), top: B:61:0x0024 }] */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00a6 A[Catch: all -> 0x0032, TryCatch #0 {all -> 0x0032, blocks: (B:13:0x002c, B:19:0x003d, B:54:0x0106, B:22:0x0046, B:32:0x007b, B:34:0x0088, B:36:0x008c, B:42:0x0097, B:44:0x00a6, B:47:0x00b2, B:49:0x00d2, B:50:0x00d7, B:51:0x00d8, B:28:0x0064), top: B:61:0x0024 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // vt.m0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(StripeIntent stripeIntent, PaymentMethodConfirmationOption.New r92, ConfirmPaymentIntentParams.Shipping shipping, Continuation continuation) {
        o oVar;
        StripeIntent stripeIntent2;
        p pVar;
        boolean z11;
        if (continuation instanceof o) {
            oVar = (o) continuation;
            int i5 = oVar.f93094x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                oVar.f93094x = i5 - Integer.MIN_VALUE;
            } else {
                oVar = new o(this, (ContinuationImpl) continuation);
            }
        }
        Object objC = oVar.f93092v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = oVar.f93094x;
        try {
            if (i11 == 0) {
                ResultKt.b(objC);
                if (!(stripeIntent instanceof SetupIntent)) {
                    IllegalStateException illegalStateException = new IllegalStateException("Cannot use payment intents in Customer Sheet!");
                    return new mt.b(illegalStateException, p50.i.w(illegalStateException), mt.p.f76802a);
                }
                int i12 = Result.f71687b;
                PaymentMethodCreateParams paymentMethodCreateParams = r92.f44137a;
                oVar.f93090t = (SetupIntent) stripeIntent;
                oVar.f93091u = this;
                oVar.f93094x = 1;
                objC = c(paymentMethodCreateParams, oVar);
                if (objC == coroutineSingletons) {
                    return coroutineSingletons;
                }
                stripeIntent2 = stripeIntent;
                pVar = this;
            } else {
                if (i11 != 1) {
                    if (i11 == 2) {
                        ResultKt.b(objC);
                        return (mt.d) objC;
                    }
                    if (i11 != 3) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(objC);
                    return (mt.d) objC;
                }
                pVar = oVar.f93091u;
                stripeIntent2 = oVar.f93090t;
                ResultKt.b(objC);
            }
            PaymentMethod paymentMethod = (PaymentMethod) objC;
            Intrinsics.g(paymentMethod, "<this>");
            if (paymentMethod.f43573e == PaymentMethod.Type.L) {
                PaymentMethod.USBankAccount uSBankAccount = paymentMethod.f43583q;
                z11 = (uSBankAccount != null ? uSBankAccount.f43666f : null) == null;
                if (!z11) {
                    return new mt.a(SetupIntent.a((SetupIntent) stripeIntent2, paymentMethod, null, 262015), null, true);
                }
                int iOrdinal = pVar.f93096b.f43087a.ordinal();
                if (iOrdinal != 0) {
                    if (iOrdinal != 1) {
                        throw new NoWhenBranchMatchedException();
                    }
                    t5.d0 d0Var = pVar.f93100f;
                    d0Var.getClass();
                    oVar.f93090t = null;
                    oVar.f93091u = null;
                    oVar.f93094x = 3;
                    new u(qq.c.a(or.a.f80620b), (xq.c) d0Var.f88562b).a((SetupIntent) stripeIntent2, paymentMethod, oVar);
                    return coroutineSingletons;
                }
                nx.l lVar = pVar.f93099e;
                ClientAttributionMetadata clientAttributionMetadata = pVar.f93095a;
                lVar.getClass();
                Intrinsics.g(clientAttributionMetadata, "clientAttributionMetadata");
                oVar.f93090t = null;
                oVar.f93091u = null;
                oVar.f93094x = 2;
                objC = new w(qq.c.a(or.a.f80622d), (r0) lVar.f78644a, (xq.c) lVar.f78645b, clientAttributionMetadata).a((SetupIntent) stripeIntent2, paymentMethod, oVar);
            }
            if (!z11) {
            }
        } catch (Throwable th2) {
            int i13 = Result.f71687b;
            Object objA = ResultKt.a(th2);
            Throwable thA = Result.a(objA);
            if (thA != null) {
                return new mt.b(thA, p50.i.w(thA), mt.r.f76804a);
            }
            return null;
        }
    }

    @Override // vt.m0
    public final Object b(StripeIntent stripeIntent, PaymentMethodConfirmationOption.Saved saved, ConfirmPaymentIntentParams.Shipping shipping, Continuation continuation) {
        IllegalStateException illegalStateException = new IllegalStateException("Cannot use CustomerSheetConfirmationInterceptor with saved payment methods!");
        return new mt.b(illegalStateException, p50.i.w(illegalStateException), mt.p.f76802a);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(PaymentMethodCreateParams paymentMethodCreateParams, ContinuationImpl continuationImpl) {
        n nVar;
        Object objP;
        p pVar;
        if (continuationImpl instanceof n) {
            nVar = (n) continuationImpl;
            int i5 = nVar.f93087x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                nVar.f93087x = i5 - Integer.MIN_VALUE;
            } else {
                nVar = new n(this, continuationImpl);
            }
        }
        Object obj = nVar.f93085v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = nVar.f93087x;
        if (i11 == 0) {
            ResultKt.b(obj);
            nVar.f93083t = this;
            nVar.f93084u = paymentMethodCreateParams;
            nVar.f93087x = 1;
            objP = ((z0) this.f93097c).p(paymentMethodCreateParams, this.f93098d, nVar);
            if (objP == coroutineSingletons) {
                return coroutineSingletons;
            }
            pVar = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            paymentMethodCreateParams = nVar.f93084u;
            pVar = nVar.f93083t;
            ResultKt.b(obj);
            objP = ((Result) obj).f71688a;
        }
        Throwable thA = Result.a(objP);
        if (thA != null) {
            pVar.f93101g.b("Failed to create payment method for " + paymentMethodCreateParams.f43680a, thA);
        }
        ResultKt.b(objP);
        return objP;
    }
}
