package vt;

import android.content.Context;
import com.stripe.android.core.networking.ApiRequest$Options;
import com.stripe.android.model.ClientAttributionMetadata;
import com.stripe.android.model.ConfirmPaymentIntentParams;
import com.stripe.android.model.ConfirmationToken;
import com.stripe.android.model.ConfirmationTokenClientContextParams;
import com.stripe.android.model.ConfirmationTokenParams;
import com.stripe.android.model.DeferredIntentParams;
import com.stripe.android.model.MandateDataParams;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.PaymentMethodCreateParams;
import com.stripe.android.model.PaymentMethodOptionsParams;
import com.stripe.android.model.StripeIntent;
import com.stripe.android.model.l4;
import com.stripe.android.model.z2;
import com.stripe.android.paymentelement.confirmation.PaymentMethodConfirmationOption;
import com.stripe.android.paymentsheet.PaymentSheet$IntentConfiguration;
import jt.c1;
import jt.z0;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class k implements m0 {

    /* renamed from: a, reason: collision with root package name */
    public final PaymentSheet$IntentConfiguration f93072a;

    /* renamed from: b, reason: collision with root package name */
    public final String f93073b;

    /* renamed from: c, reason: collision with root package name */
    public final String f93074c;

    /* renamed from: d, reason: collision with root package name */
    public final ClientAttributionMetadata f93075d;

    /* renamed from: e, reason: collision with root package name */
    public final Context f93076e;

    /* renamed from: f, reason: collision with root package name */
    public final c1 f93077f;

    /* renamed from: g, reason: collision with root package name */
    public final ApiRequest$Options f93078g;

    /* renamed from: h, reason: collision with root package name */
    public final ir.i f93079h;

    public k(PaymentSheet$IntentConfiguration intentConfiguration, String str, String str2, ClientAttributionMetadata clientAttributionMetadata, Context context, c1 stripeRepository, ApiRequest$Options requestOptions, ir.i userFacingLogger) {
        Intrinsics.g(intentConfiguration, "intentConfiguration");
        Intrinsics.g(null, "createIntentCallback");
        Intrinsics.g(clientAttributionMetadata, "clientAttributionMetadata");
        Intrinsics.g(context, "context");
        Intrinsics.g(stripeRepository, "stripeRepository");
        Intrinsics.g(requestOptions, "requestOptions");
        Intrinsics.g(userFacingLogger, "userFacingLogger");
        this.f93072a = intentConfiguration;
        this.f93073b = str;
        this.f93074c = str2;
        this.f93075d = clientAttributionMetadata;
        this.f93076e = context;
        this.f93077f = stripeRepository;
        this.f93078g = requestOptions;
        this.f93079h = userFacingLogger;
        new zt.a(requestOptions.b());
    }

    /* JADX WARN: Code restructure failed: missing block: B:25:0x007e, code lost:
    
        if (r11 == r0) goto L26;
     */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    @Override // vt.m0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(StripeIntent stripeIntent, PaymentMethodConfirmationOption.New r92, ConfirmPaymentIntentParams.Shipping shipping, Continuation continuation) {
        i iVar;
        Object objM;
        k kVar;
        if (continuation instanceof i) {
            iVar = (i) continuation;
            int i5 = iVar.f93059y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                iVar.f93059y = i5 - Integer.MIN_VALUE;
            } else {
                iVar = new i(this, (ContinuationImpl) continuation);
            }
        }
        i iVar2 = iVar;
        Object objC = iVar2.f93057w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = iVar2.f93059y;
        if (i11 == 0) {
            ResultKt.b(objC);
            ConfirmationTokenParams confirmationTokenParamsD = d(r92, shipping, this.f93075d);
            iVar2.f93054t = this;
            iVar2.f93055u = stripeIntent;
            iVar2.f93056v = shipping;
            iVar2.f93059y = 1;
            objM = ((z0) this.f93077f).m(confirmationTokenParamsD, this.f93078g, iVar2);
            if (objM != coroutineSingletons) {
                kVar = this;
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
        shipping = iVar2.f93056v;
        stripeIntent = iVar2.f93055u;
        k kVar2 = iVar2.f93054t;
        ResultKt.b(objC);
        objM = ((Result) objC).f71688a;
        kVar = kVar2;
        ConfirmPaymentIntentParams.Shipping shipping2 = shipping;
        Throwable thA = Result.a(objM);
        if (thA != null) {
            return new mt.b(thA, p50.i.w(thA), mt.r.f76804a);
        }
        iVar2.f93054t = null;
        iVar2.f93055u = null;
        iVar2.f93056v = null;
        iVar2.f93059y = 2;
        objC = kVar.c(stripeIntent, (ConfirmationToken) objM, shipping2, null, iVar2);
    }

    /* JADX WARN: Code restructure failed: missing block: B:31:0x009f, code lost:
    
        if (r11 == r0) goto L32;
     */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    @Override // vt.m0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(StripeIntent stripeIntent, PaymentMethodConfirmationOption.Saved saved, ConfirmPaymentIntentParams.Shipping shipping, Continuation continuation) {
        j jVar;
        Object objM;
        k kVar;
        if (continuation instanceof j) {
            jVar = (j) continuation;
            int i5 = jVar.f93066z;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                jVar.f93066z = i5 - Integer.MIN_VALUE;
            } else {
                jVar = new j(this, (ContinuationImpl) continuation);
            }
        }
        j jVar2 = jVar;
        Object objC = jVar2.f93064x;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = jVar2.f93066z;
        if (i11 == 0) {
            ResultKt.b(objC);
            PaymentMethod paymentMethod = saved.f44143a;
            ConfirmationTokenParams confirmationTokenParamsD = d(saved, shipping, this.f93075d);
            String str = paymentMethod.f43575g;
            ApiRequest$Options apiRequest$OptionsA = this.f93078g;
            if (str != null) {
                String str2 = this.f93074c;
                if (str2 == null) {
                    this.f93079h.a("Ephemeral key secret is required to confirm with saved payment method");
                    Unit unit = Unit.f71706a;
                    str2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                }
                apiRequest$OptionsA = ApiRequest$Options.a(apiRequest$OptionsA, str2, 6);
            }
            jVar2.f93060t = this;
            jVar2.f93061u = stripeIntent;
            jVar2.f93062v = saved;
            jVar2.f93063w = shipping;
            jVar2.f93066z = 1;
            objM = ((z0) this.f93077f).m(confirmationTokenParamsD, apiRequest$OptionsA, jVar2);
            if (objM != coroutineSingletons) {
                kVar = this;
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
        shipping = jVar2.f93063w;
        saved = jVar2.f93062v;
        stripeIntent = jVar2.f93061u;
        kVar = jVar2.f93060t;
        ResultKt.b(objC);
        objM = ((Result) objC).f71688a;
        ConfirmPaymentIntentParams.Shipping shipping2 = shipping;
        Throwable thA = Result.a(objM);
        if (thA != null) {
            return new mt.b(thA, p50.i.w(thA), mt.r.f76804a);
        }
        String str3 = saved.f44146d;
        jVar2.f93060t = null;
        jVar2.f93061u = null;
        jVar2.f93062v = null;
        jVar2.f93063w = null;
        jVar2.f93066z = 2;
        objC = kVar.c(stripeIntent, (ConfirmationToken) objM, shipping2, str3, jVar2);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(StripeIntent stripeIntent, ConfirmationToken confirmationToken, ConfirmPaymentIntentParams.Shipping shipping, String str, ContinuationImpl continuationImpl) {
        h hVar;
        if (continuationImpl instanceof h) {
            hVar = (h) continuationImpl;
            int i5 = hVar.f93052v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                hVar.f93052v = i5 - Integer.MIN_VALUE;
            } else {
                hVar = new h(this, continuationImpl);
            }
        }
        Object obj = hVar.f93050t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = hVar.f93052v;
        if (i11 == 0) {
            ResultKt.b(obj);
            hVar.f93052v = 1;
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

    /* JADX WARN: Removed duplicated region for block: B:46:0x00b7  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x00fc  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x0105  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x010f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final ConfirmationTokenParams d(PaymentMethodConfirmationOption paymentMethodConfirmationOption, ConfirmPaymentIntentParams.Shipping shipping, ClientAttributionMetadata clientAttributionMetadata) {
        ft.d dVarA;
        PaymentMethod.Type typeA;
        boolean z11;
        String str;
        ConfirmationTokenClientContextParams confirmationTokenClientContextParams;
        ft.d dVar;
        ft.l0 l0Var;
        PaymentMethod paymentMethod;
        PaymentSheet$IntentConfiguration paymentSheet$IntentConfiguration = this.f93072a;
        PaymentMethodConfirmationOption paymentMethodConfirmationOptionP = paymentMethodConfirmationOption.P(paymentSheet$IntentConfiguration);
        Context context = this.f93076e;
        Intrinsics.g(context, "context");
        String packageName = context.getPackageName();
        Intrinsics.f(packageName, "getPackageName(...)");
        String strK = b.c0.k("stripesdk://payment_return_url/", packageName);
        boolean z12 = paymentMethodConfirmationOptionP instanceof PaymentMethodConfirmationOption.Saved;
        PaymentMethodConfirmationOption.Saved saved = z12 ? (PaymentMethodConfirmationOption.Saved) paymentMethodConfirmationOptionP : null;
        String str2 = (saved == null || (paymentMethod = saved.f44143a) == null) ? null : paymentMethod.f43569a;
        boolean z13 = paymentMethodConfirmationOptionP instanceof PaymentMethodConfirmationOption.New;
        PaymentMethodConfirmationOption.New r72 = z13 ? (PaymentMethodConfirmationOption.New) paymentMethodConfirmationOptionP : null;
        PaymentMethodCreateParams paymentMethodCreateParams = r72 != null ? r72.f44137a : null;
        PaymentMethodOptionsParams f44144b = paymentMethodConfirmationOptionP.getF44144b();
        if (f44144b == null || (dVarA = l4.a(f44144b)) == null) {
            ou.t0 f44603b = paymentSheet$IntentConfiguration.f44588a.getF44603b();
            dVarA = f44603b != null ? zt.c.a(f44603b) : null;
        }
        if (z13) {
            z2 z2Var = PaymentMethod.Type.f43637g;
            String str3 = ((PaymentMethodConfirmationOption.New) paymentMethodConfirmationOptionP).f44137a.f43680a;
            z2Var.getClass();
            typeA = z2.a(str3);
        } else {
            if (!z12) {
                throw new NoWhenBranchMatchedException();
            }
            typeA = ((PaymentMethodConfirmationOption.Saved) paymentMethodConfirmationOptionP).f44143a.f43573e;
        }
        if (z13) {
            z11 = ((PaymentMethodConfirmationOption.New) paymentMethodConfirmationOptionP).f44137a.f43681b;
        } else {
            if (!z12) {
                throw new NoWhenBranchMatchedException();
            }
            z11 = false;
        }
        PaymentMethodOptionsParams f44144b2 = paymentMethodConfirmationOptionP.getF44144b();
        ou.t0 f44603b2 = paymentSheet$IntentConfiguration.f44588a.getF44603b();
        MandateDataParams mandateDataParamsB = dq.d.b(typeA, z11, f44144b2, f44603b2 != null ? zt.c.a(f44603b2) : null);
        boolean zD0 = paymentMethodConfirmationOptionP.d0();
        if (paymentSheet$IntentConfiguration.f44592e) {
            PaymentMethodOptionsParams f44144b3 = paymentMethodConfirmationOptionP.getF44144b();
            PaymentMethodOptionsParams.Card card = f44144b3 instanceof PaymentMethodOptionsParams.Card ? (PaymentMethodOptionsParams.Card) f44144b3 : null;
            str = card != null ? card.f43736b : null;
        }
        if (this.f93078g.b()) {
            confirmationTokenClientContextParams = null;
        } else {
            PaymentMethodOptionsParams f44144b4 = paymentMethodConfirmationOptionP.getF44144b();
            DeferredIntentParams deferredIntentParamsA = com.stripe.android.paymentsheet.e.a(paymentSheet$IntentConfiguration);
            DeferredIntentParams.Mode mode = deferredIntentParamsA.f43371a;
            DeferredIntentParams.Mode.Payment payment = mode instanceof DeferredIntentParams.Mode.Payment ? (DeferredIntentParams.Mode.Payment) mode : null;
            String strA = mode.A();
            String f43380a = mode.getF43380a();
            if (f44144b4 == null || (dVarA = l4.a(f44144b4)) == null) {
                ou.t0 f44603b3 = paymentSheet$IntentConfiguration.f44588a.getF44603b();
                if (f44603b3 != null) {
                    ft.d dVarA2 = zt.c.a(f44603b3);
                    dVar = dVarA2;
                    confirmationTokenClientContextParams = new ConfirmationTokenClientContextParams(strA, f43380a, dVar, (payment == null || (l0Var = payment.f43378d) == null) ? null : l0Var.f55966a, deferredIntentParamsA.f43372b, deferredIntentParamsA.f43374d, deferredIntentParamsA.f43373c, this.f93073b, payment != null ? payment.f43379e : null);
                } else {
                    dVar = null;
                    if (payment == null) {
                        confirmationTokenClientContextParams = new ConfirmationTokenClientContextParams(strA, f43380a, dVar, (payment == null || (l0Var = payment.f43378d) == null) ? null : l0Var.f55966a, deferredIntentParamsA.f43372b, deferredIntentParamsA.f43374d, deferredIntentParamsA.f43373c, this.f93073b, payment != null ? payment.f43379e : null);
                    }
                }
            } else {
                dVar = dVarA2;
            }
        }
        return new ConfirmationTokenParams(str2, paymentMethodCreateParams, strK, dVarA, shipping, mandateDataParamsB, Boolean.valueOf(zD0), str, confirmationTokenClientContextParams, clientAttributionMetadata);
    }
}
