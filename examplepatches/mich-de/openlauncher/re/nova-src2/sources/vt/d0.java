package vt;

import com.stripe.android.core.networking.ApiRequest$Options;
import com.stripe.android.model.ClientAttributionMetadata;
import com.stripe.android.model.ConfirmPaymentIntentParams;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.PaymentMethodCreateParams;
import com.stripe.android.model.PaymentMethodOptionsParams;
import com.stripe.android.model.StripeIntent;
import com.stripe.android.model.l4;
import com.stripe.android.paymentelement.confirmation.PaymentMethodConfirmationOption;
import com.stripe.android.paymentsheet.PaymentSheet$IntentConfiguration;
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
public final class d0 implements m0 {

    /* renamed from: a, reason: collision with root package name */
    public final PaymentSheet$IntentConfiguration f93031a;

    /* renamed from: b, reason: collision with root package name */
    public final c1 f93032b;

    /* renamed from: c, reason: collision with root package name */
    public final ApiRequest$Options f93033c;

    public d0(PaymentSheet$IntentConfiguration intentConfiguration, ClientAttributionMetadata clientAttributionMetadata, c1 stripeRepository, ApiRequest$Options requestOptions, boolean z11) {
        Intrinsics.g(intentConfiguration, "intentConfiguration");
        Intrinsics.g(null, "createIntentCallback");
        Intrinsics.g(clientAttributionMetadata, "clientAttributionMetadata");
        Intrinsics.g(stripeRepository, "stripeRepository");
        Intrinsics.g(requestOptions, "requestOptions");
        this.f93031a = intentConfiguration;
        this.f93032b = stripeRepository;
        this.f93033c = requestOptions;
        new zt.a(requestOptions.b());
    }

    public static boolean e(PaymentMethodOptionsParams paymentMethodOptionsParams, PaymentSheet$IntentConfiguration paymentSheet$IntentConfiguration) {
        ou.t0 t0Var;
        ft.d dVarA;
        if (paymentMethodOptionsParams == null || (dVarA = l4.a(paymentMethodOptionsParams)) == null || !p3.i.v(dVarA)) {
            PaymentSheet$IntentConfiguration.Mode mode = paymentSheet$IntentConfiguration.f44588a;
            PaymentSheet$IntentConfiguration.Mode.Payment payment = mode instanceof PaymentSheet$IntentConfiguration.Mode.Payment ? (PaymentSheet$IntentConfiguration.Mode.Payment) mode : null;
            if (payment == null || (t0Var = payment.f44598c) == null || !p3.i.v(zt.c.a(t0Var))) {
                return false;
            }
        }
        return true;
    }

    @Override // vt.m0
    public final Object a(StripeIntent stripeIntent, PaymentMethodConfirmationOption.New r102, ConfirmPaymentIntentParams.Shipping shipping, Continuation continuation) {
        PaymentSheet$IntentConfiguration intentConfiguration = this.f93031a;
        Intrinsics.g(intentConfiguration, "intentConfiguration");
        PaymentMethodCreateParams paymentMethodCreateParamsC = zt.c.c(r102.f44137a, intentConfiguration);
        return d(intentConfiguration, stripeIntent, PaymentMethodConfirmationOption.New.a(r102, paymentMethodCreateParamsC, zt.c.b(r102.f44138b, paymentMethodCreateParamsC.f43680a, intentConfiguration), 60), shipping, r102.f44140d, (ContinuationImpl) continuation);
    }

    @Override // vt.m0
    public final Object b(StripeIntent stripeIntent, PaymentMethodConfirmationOption.Saved saved, ConfirmPaymentIntentParams.Shipping shipping, Continuation continuation) {
        PaymentSheet$IntentConfiguration paymentSheet$IntentConfiguration = this.f93031a;
        PaymentMethodConfirmationOption.Saved savedP = saved.P(paymentSheet$IntentConfiguration);
        PaymentMethod paymentMethod = saved.f44143a;
        String str = saved.f44146d;
        String str2 = saved.f44147e;
        e(savedP.f44144b, paymentSheet$IntentConfiguration);
        return c(stripeIntent, paymentSheet$IntentConfiguration, savedP, paymentMethod, shipping, str, str2, (ContinuationImpl) continuation);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(StripeIntent stripeIntent, PaymentSheet$IntentConfiguration paymentSheet$IntentConfiguration, PaymentMethodConfirmationOption paymentMethodConfirmationOption, PaymentMethod paymentMethod, ConfirmPaymentIntentParams.Shipping shipping, String str, String str2, ContinuationImpl continuationImpl) {
        b0 b0Var;
        if (continuationImpl instanceof b0) {
            b0Var = (b0) continuationImpl;
            int i5 = b0Var.f93016v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                b0Var.f93016v = i5 - Integer.MIN_VALUE;
            } else {
                b0Var = new b0(this, continuationImpl);
            }
        }
        Object obj = b0Var.f93014t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = b0Var.f93016v;
        if (i11 == 0) {
            ResultKt.b(obj);
            b0Var.f93016v = 1;
            throw null;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return obj;
        }
        ResultKt.b(obj);
        if (obj == null) {
            throw new NoWhenBranchMatchedException();
        }
        throw new ClassCastException();
    }

    /* JADX WARN: Code restructure failed: missing block: B:27:0x00a0, code lost:
    
        if (r1 == r2) goto L28;
     */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(PaymentSheet$IntentConfiguration paymentSheet$IntentConfiguration, StripeIntent stripeIntent, PaymentMethodConfirmationOption.New r15, ConfirmPaymentIntentParams.Shipping shipping, boolean z11, ContinuationImpl continuationImpl) {
        c0 c0Var;
        Object objP;
        PaymentSheet$IntentConfiguration paymentSheet$IntentConfiguration2;
        ConfirmPaymentIntentParams.Shipping shipping2;
        boolean z12;
        d0 d0Var;
        PaymentMethodConfirmationOption.New r62;
        if (continuationImpl instanceof c0) {
            c0Var = (c0) continuationImpl;
            int i5 = c0Var.B;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c0Var.B = i5 - Integer.MIN_VALUE;
            } else {
                c0Var = new c0(this, continuationImpl);
            }
        }
        c0 c0Var2 = c0Var;
        Object objC = c0Var2.f93026z;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c0Var2.B;
        if (i11 == 0) {
            ResultKt.b(objC);
            PaymentMethodCreateParams paymentMethodCreateParams = r15.f44137a;
            c0Var2.f93020t = this;
            c0Var2.f93021u = paymentSheet$IntentConfiguration;
            c0Var2.f93022v = stripeIntent;
            c0Var2.f93023w = r15;
            c0Var2.f93024x = shipping;
            c0Var2.f93025y = z11;
            c0Var2.B = 1;
            objP = ((z0) this.f93032b).p(paymentMethodCreateParams, this.f93033c, c0Var2);
            if (objP != coroutineSingletons) {
                paymentSheet$IntentConfiguration2 = paymentSheet$IntentConfiguration;
                shipping2 = shipping;
                z12 = z11;
                d0Var = this;
                r62 = r15;
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
        z12 = c0Var2.f93025y;
        ConfirmPaymentIntentParams.Shipping shipping3 = c0Var2.f93024x;
        PaymentMethodConfirmationOption.New r02 = c0Var2.f93023w;
        StripeIntent stripeIntent2 = c0Var2.f93022v;
        paymentSheet$IntentConfiguration2 = c0Var2.f93021u;
        d0 d0Var2 = c0Var2.f93020t;
        ResultKt.b(objC);
        objP = ((Result) objC).f71688a;
        shipping2 = shipping3;
        stripeIntent = stripeIntent2;
        d0Var = d0Var2;
        r62 = r02;
        Throwable thA = Result.a(objP);
        if (thA != null) {
            return new mt.b(thA, p50.i.w(thA), mt.r.f76804a);
        }
        PaymentMethod paymentMethod = (PaymentMethod) objP;
        if (!z12) {
            PaymentMethodOptionsParams paymentMethodOptionsParams = r62.f44138b;
            d0Var.getClass();
            e(paymentMethodOptionsParams, paymentSheet$IntentConfiguration2);
        }
        c0Var2.f93020t = null;
        c0Var2.f93021u = null;
        c0Var2.f93022v = null;
        c0Var2.f93023w = null;
        c0Var2.f93024x = null;
        c0Var2.B = 2;
        objC = d0Var.c(stripeIntent, paymentSheet$IntentConfiguration2, r62, paymentMethod, shipping2, null, null, c0Var2);
    }
}
