package vt;

import android.content.Context;
import com.stripe.android.core.networking.ApiRequest$Options;
import com.stripe.android.model.CheckoutSessionResponse;
import com.stripe.android.model.ClientAttributionMetadata;
import com.stripe.android.model.ConfirmPaymentIntentParams;
import com.stripe.android.model.PaymentIntent;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.PaymentMethodCreateParams;
import com.stripe.android.model.StripeIntent;
import com.stripe.android.paymentelement.confirmation.PaymentMethodConfirmationOption;
import jt.c1;
import jt.z0;
import kotlin.NotImplementedError;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class e implements m0 {

    /* renamed from: a, reason: collision with root package name */
    public final String f93034a;

    /* renamed from: b, reason: collision with root package name */
    public final ClientAttributionMetadata f93035b;

    /* renamed from: c, reason: collision with root package name */
    public final c1 f93036c;

    /* renamed from: d, reason: collision with root package name */
    public final ApiRequest$Options f93037d;

    /* renamed from: e, reason: collision with root package name */
    public final String f93038e;

    public e(String checkoutSessionId, ClientAttributionMetadata clientAttributionMetadata, Context context, c1 stripeRepository, ApiRequest$Options requestOptions) {
        Intrinsics.g(checkoutSessionId, "checkoutSessionId");
        Intrinsics.g(clientAttributionMetadata, "clientAttributionMetadata");
        Intrinsics.g(context, "context");
        Intrinsics.g(stripeRepository, "stripeRepository");
        Intrinsics.g(requestOptions, "requestOptions");
        this.f93034a = checkoutSessionId;
        this.f93035b = clientAttributionMetadata;
        this.f93036c = stripeRepository;
        this.f93037d = requestOptions;
        String packageName = context.getPackageName();
        Intrinsics.f(packageName, "getPackageName(...)");
        this.f93038e = "stripesdk://payment_return_url/" + packageName;
    }

    /* JADX WARN: Code restructure failed: missing block: B:23:0x0066, code lost:
    
        if (r6 == r7) goto L24;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // vt.m0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(StripeIntent stripeIntent, PaymentMethodConfirmationOption.New r52, ConfirmPaymentIntentParams.Shipping shipping, Continuation continuation) {
        d dVar;
        Object objP;
        e eVar;
        if (continuation instanceof d) {
            dVar = (d) continuation;
            int i5 = dVar.f93030w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                dVar.f93030w = i5 - Integer.MIN_VALUE;
            } else {
                dVar = new d(this, (ContinuationImpl) continuation);
            }
        }
        Object objC = dVar.f93028u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = dVar.f93030w;
        if (i11 == 0) {
            ResultKt.b(objC);
            PaymentMethodCreateParams paymentMethodCreateParams = r52.f44137a;
            dVar.f93027t = this;
            dVar.f93030w = 1;
            objP = ((z0) this.f93036c).p(paymentMethodCreateParams, this.f93037d, dVar);
            if (objP != coroutineSingletons) {
                eVar = this;
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
        eVar = dVar.f93027t;
        ResultKt.b(objC);
        objP = ((Result) objC).f71688a;
        Throwable thA = Result.a(objP);
        if (thA != null) {
            return new mt.b(thA, p50.i.w(thA), mt.r.f76804a);
        }
        dVar.f93027t = null;
        dVar.f93030w = 2;
        objC = eVar.c((PaymentMethod) objP, dVar);
    }

    @Override // vt.m0
    public final Object b(StripeIntent stripeIntent, PaymentMethodConfirmationOption.Saved saved, ConfirmPaymentIntentParams.Shipping shipping, Continuation continuation) {
        return new mt.b(new NotImplementedError("Saved payment methods not yet supported for checkout sessions"), zg.a.U(2132020022, new Object[0], EmptyList.f71733a), mt.p.f76802a);
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(PaymentMethod paymentMethod, ContinuationImpl continuationImpl) {
        c cVar;
        Object objG;
        if (continuationImpl instanceof c) {
            cVar = (c) continuationImpl;
            int i5 = cVar.f93019v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                cVar.f93019v = i5 - Integer.MIN_VALUE;
            } else {
                cVar = new c(this, continuationImpl);
            }
        }
        c cVar2 = cVar;
        Object obj = cVar2.f93017t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = cVar2.f93019v;
        if (i11 == 0) {
            ResultKt.b(obj);
            String str = paymentMethod.f43569a;
            cVar2.f93019v = 1;
            objG = ((z0) this.f93036c).g(this.f93034a, str, this.f93035b, this.f93038e, this.f93037d, cVar2);
            if (objG == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            objG = ((Result) obj).f71688a;
        }
        Throwable thA = Result.a(objG);
        mt.r rVar = mt.r.f76804a;
        if (thA != null) {
            return new mt.b(thA, p50.i.w(thA), rVar);
        }
        IllegalStateException illegalStateException = new IllegalStateException("No PaymentIntent in checkout session confirm response");
        PaymentIntent paymentIntent = ((CheckoutSessionResponse) objG).f43180e;
        if (paymentIntent == null) {
            return new mt.b(illegalStateException, p50.i.w(illegalStateException), rVar);
        }
        if (paymentIntent.w0()) {
            return new mt.a(paymentIntent, f0.f93044c, true);
        }
        if (paymentIntent.D()) {
            return new mt.c(new h0(paymentIntent), false, f0.f93044c);
        }
        IllegalStateException illegalStateException2 = new IllegalStateException("Intent has not attempted confirm.");
        return new mt.b(illegalStateException2, p50.i.w(illegalStateException2), rVar);
    }
}
