package vt;

import com.stripe.android.core.exception.StripeException;
import com.stripe.android.core.networking.ApiRequest$Options;
import com.stripe.android.model.ConfirmPaymentIntentParams;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.PaymentMethodCreateParams;
import com.stripe.android.model.RadarSessionWithHCaptcha;
import com.stripe.android.model.StripeIntent;
import com.stripe.android.paymentelement.confirmation.PaymentMethodConfirmationOption;
import com.stripe.android.paymentsheet.PaymentSheet$IntentConfiguration;
import jt.c1;
import jt.z0;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class u0 implements m0 {

    /* renamed from: a, reason: collision with root package name */
    public final PaymentSheet$IntentConfiguration f93134a;

    /* renamed from: b, reason: collision with root package name */
    public final iu.f f93135b;

    /* renamed from: c, reason: collision with root package name */
    public final c1 f93136c;

    /* renamed from: d, reason: collision with root package name */
    public final ApiRequest$Options f93137d;

    public u0(PaymentSheet$IntentConfiguration intentConfiguration, iu.f errorReporter, c1 stripeRepository, ApiRequest$Options requestOptions) {
        Intrinsics.g(intentConfiguration, "intentConfiguration");
        Intrinsics.g(null, "handler");
        Intrinsics.g(errorReporter, "errorReporter");
        Intrinsics.g(stripeRepository, "stripeRepository");
        Intrinsics.g(requestOptions, "requestOptions");
        this.f93134a = intentConfiguration;
        this.f93135b = errorReporter;
        this.f93136c = stripeRepository;
        this.f93137d = requestOptions;
    }

    /* JADX WARN: Code restructure failed: missing block: B:23:0x0078, code lost:
    
        if (r9 == r1) goto L24;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // vt.m0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(StripeIntent stripeIntent, PaymentMethodConfirmationOption.New r72, ConfirmPaymentIntentParams.Shipping shipping, Continuation continuation) {
        s0 s0Var;
        Object objP;
        u0 u0Var;
        if (continuation instanceof s0) {
            s0Var = (s0) continuation;
            int i5 = s0Var.f93120y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                s0Var.f93120y = i5 - Integer.MIN_VALUE;
            } else {
                s0Var = new s0(this, (ContinuationImpl) continuation);
            }
        }
        Object objC = s0Var.f93118w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = s0Var.f93120y;
        if (i11 == 0) {
            ResultKt.b(objC);
            PaymentMethodCreateParams paymentMethodCreateParamsC = zt.c.c(r72.f44137a, this.f93134a);
            s0Var.f93115t = this;
            s0Var.f93116u = stripeIntent;
            s0Var.f93117v = shipping;
            s0Var.f93120y = 1;
            objP = ((z0) this.f93136c).p(paymentMethodCreateParamsC, this.f93137d, s0Var);
            if (objP != coroutineSingletons) {
                u0Var = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objC);
            return (mt.d) objC;
        }
        shipping = s0Var.f93117v;
        stripeIntent = s0Var.f93116u;
        u0Var = s0Var.f93115t;
        ResultKt.b(objC);
        objP = ((Result) objC).f71688a;
        Throwable thA = Result.a(objP);
        if (thA != null) {
            return new mt.b(thA, p50.i.w(thA), mt.r.f76804a);
        }
        s0Var.f93115t = null;
        s0Var.f93116u = null;
        s0Var.f93117v = null;
        s0Var.f93120y = 2;
        objC = u0Var.c(stripeIntent, (PaymentMethod) objP, shipping, s0Var);
    }

    @Override // vt.m0
    public final Object b(StripeIntent stripeIntent, PaymentMethodConfirmationOption.Saved saved, ConfirmPaymentIntentParams.Shipping shipping, Continuation continuation) {
        return c(stripeIntent, saved.f44143a, shipping, (ContinuationImpl) continuation);
    }

    /* JADX WARN: Removed duplicated region for block: B:40:0x008b  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x009e A[Catch: Exception -> 0x0036, TryCatch #2 {Exception -> 0x0036, blocks: (B:13:0x002a, B:41:0x0099, B:43:0x009e, B:44:0x00a2, B:45:0x00aa), top: B:52:0x0020 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(StripeIntent stripeIntent, PaymentMethod paymentMethod, ConfirmPaymentIntentParams.Shipping shipping, ContinuationImpl continuationImpl) {
        t0 t0Var;
        u0 u0Var;
        Object objQ;
        Object objA;
        Throwable thA;
        if (continuationImpl instanceof t0) {
            t0Var = (t0) continuationImpl;
            int i5 = t0Var.f93132y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                t0Var.f93132y = i5 - Integer.MIN_VALUE;
            } else {
                t0Var = new t0(this, continuationImpl);
            }
        }
        Object obj = t0Var.f93130w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = t0Var.f93132y;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                try {
                    int i12 = Result.f71687b;
                    c1 c1Var = this.f93136c;
                    String str = paymentMethod.f43569a;
                    ApiRequest$Options apiRequest$Options = this.f93137d;
                    t0Var.f93127t = this;
                    t0Var.f93128u = stripeIntent;
                    t0Var.f93129v = shipping;
                    t0Var.f93132y = 1;
                    try {
                        objQ = ((z0) c1Var).q(str, apiRequest$Options, t0Var);
                        if (objQ == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                        u0Var = this;
                    } catch (Throwable th2) {
                        th = th2;
                        u0Var = this;
                        int i13 = Result.f71687b;
                        objA = ResultKt.a(th);
                        thA = Result.a(objA);
                        if (thA != null) {
                        }
                        u0Var.getClass();
                        if (shipping != null) {
                        }
                        t0Var.f93127t = stripeIntent;
                        t0Var.f93128u = null;
                        t0Var.f93129v = null;
                        t0Var.f93132y = 2;
                        throw null;
                    }
                } catch (Throwable th3) {
                    th = th3;
                }
            } else {
                if (i11 != 1) {
                    if (i11 != 2) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    StripeIntent stripeIntent2 = (StripeIntent) t0Var.f93127t;
                    ResultKt.b(obj);
                    return new mt.a(stripeIntent2, f0.f93045d, false);
                }
                shipping = t0Var.f93129v;
                stripeIntent = t0Var.f93128u;
                u0Var = (u0) t0Var.f93127t;
                try {
                    ResultKt.b(obj);
                    objQ = ((Result) obj).f71688a;
                } catch (Throwable th4) {
                    th = th4;
                    int i132 = Result.f71687b;
                    objA = ResultKt.a(th);
                    thA = Result.a(objA);
                    if (thA != null) {
                    }
                    u0Var.getClass();
                    if (shipping != null) {
                    }
                    t0Var.f93127t = stripeIntent;
                    t0Var.f93128u = null;
                    t0Var.f93129v = null;
                    t0Var.f93132y = 2;
                    throw null;
                }
            }
            ResultKt.b(objQ);
            objA = (RadarSessionWithHCaptcha) objQ;
            int i14 = Result.f71687b;
            thA = Result.a(objA);
            if (thA != null) {
                iu.f fVar = u0Var.f93135b;
                iu.c cVar = iu.c.f68070w;
                int i15 = StripeException.f42562e;
                t2.c.L(fVar, cVar, p6.u.i(thA), null, 4);
            }
            u0Var.getClass();
            if (shipping != null) {
                String str2 = shipping.f43202a.f43129c;
            }
            t0Var.f93127t = stripeIntent;
            t0Var.f93128u = null;
            t0Var.f93129v = null;
            t0Var.f93132y = 2;
            throw null;
        } catch (Exception e3) {
            return new mt.b(e3, p6.p0.i(e3), mt.r.f76804a);
        }
    }
}
