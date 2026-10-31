package vt;

import android.os.Parcelable;
import com.stripe.android.lpmfoundations.paymentmethod.CustomerMetadata;
import com.stripe.android.lpmfoundations.paymentmethod.IntegrationMetadata;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import com.stripe.android.model.ClientAttributionMetadata;
import com.stripe.android.model.ConfirmPaymentIntentParams;
import com.stripe.android.model.ConfirmSetupIntentParams;
import com.stripe.android.model.ConfirmStripeIntentParams;
import com.stripe.android.model.StripeIntent;
import com.stripe.android.paymentelement.confirmation.ConfirmationHandler$Args;
import com.stripe.android.paymentelement.confirmation.ConfirmationHandler$Option;
import com.stripe.android.paymentelement.confirmation.PaymentMethodConfirmationOption;
import com.stripe.android.paymentelement.confirmation.intent.CallbackNotFoundException;
import com.stripe.android.payments.paymentlauncher.InternalPaymentResult;
import com.stripe.android.payments.paymentlauncher.PaymentLauncherContract;
import com.stripe.android.paymentsheet.addresselement.AddressDetails;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class k0 implements mt.j {

    /* renamed from: a, reason: collision with root package name */
    public final l0 f93080a;

    /* renamed from: b, reason: collision with root package name */
    public final n00.u f93081b;

    public k0(l0 l0Var, n00.u uVar) {
        this.f93080a = l0Var;
        this.f93081b = uVar;
    }

    @Override // mt.j
    public final void a(Object obj, Object obj2, ConfirmationHandler$Option confirmationHandler$Option, ConfirmationHandler$Args confirmationArgs) {
        nu.a aVar = (nu.a) obj;
        i0 arguments = (i0) obj2;
        PaymentMethodConfirmationOption confirmationOption = (PaymentMethodConfirmationOption) confirmationHandler$Option;
        Intrinsics.g(arguments, "arguments");
        Intrinsics.g(confirmationOption, "confirmationOption");
        Intrinsics.g(confirmationArgs, "confirmationArgs");
        if (!(arguments instanceof g0)) {
            if (!(arguments instanceof h0)) {
                throw new NoWhenBranchMatchedException();
            }
            StripeIntent intent = ((h0) arguments).f93053a;
            com.stripe.android.payments.paymentlauncher.r rVar = (com.stripe.android.payments.paymentlauncher.r) aVar;
            Intrinsics.g(intent, "intent");
            rVar.f44418c.a(new PaymentLauncherContract.Args.StripeIntentNextActionWithIntentArgs((String) rVar.f44416a.invoke(), (String) rVar.f44417b.invoke(), rVar.f44420e, rVar.f44421f, true, intent, rVar.f44419d), null);
            return;
        }
        ConfirmStripeIntentParams confirmStripeIntentParams = ((g0) arguments).f93049a;
        if (confirmStripeIntentParams instanceof ConfirmPaymentIntentParams) {
            com.stripe.android.payments.paymentlauncher.r rVar2 = (com.stripe.android.payments.paymentlauncher.r) aVar;
            rVar2.f44418c.a(new PaymentLauncherContract.Args.IntentConfirmationArgs((String) rVar2.f44416a.invoke(), (String) rVar2.f44417b.invoke(), rVar2.f44420e, rVar2.f44421f, true, (ConfirmPaymentIntentParams) confirmStripeIntentParams, rVar2.f44419d), null);
        } else {
            if (!(confirmStripeIntentParams instanceof ConfirmSetupIntentParams)) {
                throw new NoWhenBranchMatchedException();
            }
            com.stripe.android.payments.paymentlauncher.r rVar3 = (com.stripe.android.payments.paymentlauncher.r) aVar;
            rVar3.f44418c.a(new PaymentLauncherContract.Args.IntentConfirmationArgs((String) rVar3.f44416a.invoke(), (String) rVar3.f44417b.invoke(), rVar3.f44420e, rVar3.f44421f, true, (ConfirmSetupIntentParams) confirmStripeIntentParams, rVar3.f44419d), null);
        }
    }

    @Override // mt.j
    public final ConfirmationHandler$Option b(ConfirmationHandler$Option confirmationOption) {
        Intrinsics.g(confirmationOption, "confirmationOption");
        if (confirmationOption instanceof PaymentMethodConfirmationOption) {
            return (PaymentMethodConfirmationOption) confirmationOption;
        }
        return null;
    }

    @Override // mt.j
    public final Object c(j.b activityResultCaller, jt.e eVar) {
        Intrinsics.g(activityResultCaller, "activityResultCaller");
        return (nu.a) this.f93081b.invoke(activityResultCaller.registerForActivityResult(new PaymentLauncherContract(), new nt.a(eVar, 7)));
    }

    @Override // mt.j
    public final boolean e(ConfirmationHandler$Option confirmationHandler$Option, ConfirmationHandler$Args confirmationHandler$Args) {
        i30.j.l((PaymentMethodConfirmationOption) confirmationHandler$Option, confirmationHandler$Args);
        return true;
    }

    @Override // mt.j
    public final void f(PaymentMethodMetadata paymentMethodMetadata) {
        i30.j.k(paymentMethodMetadata);
    }

    @Override // mt.j
    public final /* bridge */ /* synthetic */ void g(Object obj) {
    }

    @Override // mt.j
    public final String getKey() {
        return "IntentConfirmation";
    }

    @Override // mt.j
    public final mt.i h(ConfirmationHandler$Option confirmationHandler$Option, ConfirmationHandler$Args confirmationArgs, f0 f0Var, Parcelable parcelable) {
        PaymentMethodConfirmationOption confirmationOption = (PaymentMethodConfirmationOption) confirmationHandler$Option;
        InternalPaymentResult result = (InternalPaymentResult) parcelable;
        Intrinsics.g(confirmationOption, "confirmationOption");
        Intrinsics.g(confirmationArgs, "confirmationArgs");
        Intrinsics.g(result, "result");
        if (result instanceof InternalPaymentResult.Completed) {
            return new mt.h(((InternalPaymentResult.Completed) result).f44349a, f0Var, true);
        }
        if (result instanceof InternalPaymentResult.Failed) {
            Throwable th2 = ((InternalPaymentResult.Failed) result).f44350a;
            return new mt.f(th2, p50.i.w(th2), mt.r.f76804a);
        }
        if (result instanceof InternalPaymentResult.Canceled) {
            return new mt.e(mt.k.f76772a);
        }
        throw new NoWhenBranchMatchedException();
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    @Override // mt.j
    /* renamed from: i, reason: merged with bridge method [inline-methods] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(PaymentMethodConfirmationOption paymentMethodConfirmationOption, ConfirmationHandler$Args confirmationHandler$Args, ContinuationImpl continuationImpl) {
        j0 j0Var;
        if (continuationImpl instanceof j0) {
            j0Var = (j0) continuationImpl;
            int i5 = j0Var.f93071x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                j0Var.f93071x = i5 - Integer.MIN_VALUE;
            } else {
                j0Var = new j0(this, continuationImpl);
            }
        }
        j0 j0Var2 = j0Var;
        Object objA = j0Var2.f93069v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = j0Var2.f93071x;
        try {
            if (i11 == 0) {
                ResultKt.b(objA);
                PaymentMethodMetadata paymentMethodMetadata = confirmationHandler$Args.f44129b;
                l0 l0Var = this.f93080a;
                IntegrationMetadata integrationMetadata = paymentMethodMetadata.H;
                CustomerMetadata customerMetadata = paymentMethodMetadata.f43105p;
                String str = customerMetadata != null ? customerMetadata.f43071a : null;
                String str2 = customerMetadata != null ? customerMetadata.f43072b : null;
                ClientAttributionMetadata clientAttributionMetadata = paymentMethodMetadata.D;
                j0Var2.f93067t = paymentMethodConfirmationOption;
                j0Var2.f93068u = confirmationHandler$Args;
                j0Var2.f93071x = 1;
                objA = l0Var.a(integrationMetadata, str, str2, clientAttributionMetadata, j0Var2);
                if (objA == coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 == 2) {
                    ResultKt.b(objA);
                    return objA;
                }
                if (i11 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(objA);
                return objA;
            }
            confirmationHandler$Args = j0Var2.f93068u;
            paymentMethodConfirmationOption = j0Var2.f93067t;
            ResultKt.b(objA);
            m0 m0Var = (m0) objA;
            if (paymentMethodConfirmationOption instanceof PaymentMethodConfirmationOption.New) {
                StripeIntent stripeIntent = confirmationHandler$Args.f44130c;
                PaymentMethodConfirmationOption.New r11 = (PaymentMethodConfirmationOption.New) paymentMethodConfirmationOption;
                AddressDetails addressDetails = confirmationHandler$Args.f44129b.f43103l;
                ConfirmPaymentIntentParams.Shipping shippingA = addressDetails != null ? pu.b.a(addressDetails) : null;
                j0Var2.f93067t = null;
                j0Var2.f93068u = null;
                j0Var2.f93071x = 2;
                Object objA2 = m0Var.a(stripeIntent, r11, shippingA, j0Var2);
                if (objA2 != coroutineSingletons) {
                    return objA2;
                }
            } else {
                if (!(paymentMethodConfirmationOption instanceof PaymentMethodConfirmationOption.Saved)) {
                    throw new NoWhenBranchMatchedException();
                }
                StripeIntent stripeIntent2 = confirmationHandler$Args.f44130c;
                PaymentMethodConfirmationOption.Saved saved = (PaymentMethodConfirmationOption.Saved) paymentMethodConfirmationOption;
                AddressDetails addressDetails2 = confirmationHandler$Args.f44129b.f43103l;
                ConfirmPaymentIntentParams.Shipping shippingA2 = addressDetails2 != null ? pu.b.a(addressDetails2) : null;
                j0Var2.f93067t = null;
                j0Var2.f93068u = null;
                j0Var2.f93071x = 3;
                Object objB = m0Var.b(stripeIntent2, saved, shippingA2, j0Var2);
                if (objB != coroutineSingletons) {
                    return objB;
                }
            }
            return coroutineSingletons;
        } catch (CallbackNotFoundException e3) {
            return new mt.b(new IllegalStateException(e3.getMessage()), e3.f44174f, mt.r.f76804a);
        }
    }
}
