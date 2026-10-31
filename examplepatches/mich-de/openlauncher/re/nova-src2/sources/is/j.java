package is;

import com.google.android.gms.internal.measurement.k2;
import com.stripe.android.core.model.CountryCode;
import com.stripe.android.link.LinkConfiguration;
import com.stripe.android.link.model.LinkAccount;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodSaveConsentBehavior;
import com.stripe.android.model.Address;
import com.stripe.android.model.ClientAttributionMetadata;
import com.stripe.android.model.ConsumerPaymentDetails;
import com.stripe.android.model.PaymentIntent;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.PaymentMethodCreateParams;
import com.stripe.android.model.SetupIntent;
import com.stripe.android.model.StripeIntent;
import com.stripe.android.model.z2;
import com.stripe.android.paymentelement.confirmation.ConfirmationHandler$Args;
import com.stripe.android.paymentelement.confirmation.ConfirmationHandler$Option;
import com.stripe.android.paymentelement.confirmation.PaymentMethodConfirmationOption;
import com.stripe.android.paymentelement.confirmation.link.LinkPassthroughConfirmationOption;
import ft.d0;
import java.util.List;
import java.util.Map;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import mt.n0;
import mt.t;
import mt.u;
import mt.v;

/* loaded from: classes4.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    public final LinkConfiguration f68040a;

    /* renamed from: b, reason: collision with root package name */
    public final PaymentMethodMetadata f68041b;

    /* renamed from: c, reason: collision with root package name */
    public final xq.c f68042c;

    /* renamed from: d, reason: collision with root package name */
    public final n0 f68043d;

    public j(LinkConfiguration configuration, PaymentMethodMetadata paymentMethodMetadata, xq.c logger, n0 confirmationHandler) {
        Intrinsics.g(configuration, "configuration");
        Intrinsics.g(paymentMethodMetadata, "paymentMethodMetadata");
        Intrinsics.g(logger, "logger");
        Intrinsics.g(confirmationHandler, "confirmationHandler");
        this.f68040a = configuration;
        this.f68041b = paymentMethodMetadata;
        this.f68042c = logger;
        this.f68043d = confirmationHandler;
        confirmationHandler.c(paymentMethodMetadata);
    }

    /* JADX WARN: Removed duplicated region for block: B:41:0x0087  */
    /* JADX WARN: Removed duplicated region for block: B:49:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(Function0 function0, ContinuationImpl continuationImpl) {
        i iVar;
        j jVar;
        j jVar2;
        j jVar3;
        Object objA;
        Throwable thA;
        if (continuationImpl instanceof i) {
            iVar = (i) continuationImpl;
            int i5 = iVar.f68039x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                iVar.f68039x = i5 - Integer.MIN_VALUE;
            } else {
                iVar = new i(this, continuationImpl);
            }
        }
        Object objB = iVar.f68037v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = iVar.f68039x;
        if (i11 == 0) {
            ResultKt.b(objB);
            try {
                int i12 = Result.f71687b;
                ConfirmationHandler$Args confirmationHandler$Args = (ConfirmationHandler$Args) function0.invoke();
                n0 n0Var = this.f68043d;
                iVar.f68035t = this;
                iVar.f68036u = this;
                iVar.f68039x = 1;
                if (n0Var.g(confirmationHandler$Args, iVar) != coroutineSingletons) {
                    jVar2 = this;
                    jVar3 = jVar2;
                }
                return coroutineSingletons;
            } catch (Throwable th2) {
                th = th2;
                jVar = this;
                int i13 = Result.f71687b;
                objA = ResultKt.a(th);
                thA = Result.a(objA);
                if (thA == null) {
                }
            }
        } else {
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                jVar2 = iVar.f68036u;
                jVar = iVar.f68035t;
                try {
                    ResultKt.b(objB);
                    objA = jVar2.c((v) objB);
                    int i14 = Result.f71687b;
                } catch (Throwable th3) {
                    th = th3;
                    int i132 = Result.f71687b;
                    objA = ResultKt.a(th);
                    thA = Result.a(objA);
                    if (thA == null) {
                    }
                }
                thA = Result.a(objA);
                if (thA == null) {
                    return objA;
                }
                jVar.f68042c.b("DefaultLinkConfirmationHandler: Failed to confirm payment", thA);
                return new m(zg.a.G(2132020022));
            }
            jVar2 = iVar.f68036u;
            jVar3 = iVar.f68035t;
            try {
                ResultKt.b(objB);
            } catch (Throwable th4) {
                th = th4;
                jVar = jVar3;
                int i1322 = Result.f71687b;
                objA = ResultKt.a(th);
                thA = Result.a(objA);
                if (thA == null) {
                }
            }
        }
        n0 n0Var2 = jVar2.f68043d;
        iVar.f68035t = jVar3;
        iVar.f68036u = jVar2;
        iVar.f68039x = 2;
        objB = n0Var2.b(iVar);
        if (objB != coroutineSingletons) {
            jVar = jVar3;
            objA = jVar2.c((v) objB);
            int i142 = Result.f71687b;
            thA = Result.a(objA);
            if (thA == null) {
            }
        }
        return coroutineSingletons;
    }

    public final ConfirmationHandler$Args b(ConsumerPaymentDetails.PaymentDetails selectedPaymentDetails, LinkAccount linkAccount, String str, String str2, PaymentMethodMetadata paymentMethodMetadata) {
        String str3;
        boolean zA;
        PaymentMethod.AllowRedisplay allowRedisplay;
        Address address;
        ConfirmationHandler$Option linkPassthroughConfirmationOption;
        LinkConfiguration linkConfiguration = this.f68040a;
        boolean z11 = linkConfiguration.f42902h;
        StripeIntent stripeIntent = linkConfiguration.f42895a;
        if (z11) {
            Intrinsics.g(selectedPaymentDetails, "paymentDetails");
            if (selectedPaymentDetails instanceof ConsumerPaymentDetails.BankAccount) {
                List f43534b = stripeIntent.getF43534b();
                z2 z2Var = PaymentMethod.Type.f43637g;
                boolean zContains = f43534b.contains("us_bank_account");
                if (linkConfiguration.f42912t != d0.f55931b || zContains) {
                    str3 = "bank_account";
                }
            } else if (!(selectedPaymentDetails instanceof ConsumerPaymentDetails.Card) && !(selectedPaymentDetails instanceof ConsumerPaymentDetails.Passthrough)) {
                throw new NoWhenBranchMatchedException();
            }
            str3 = "card";
        } else {
            z2 z2Var2 = PaymentMethod.Type.f43637g;
            str3 = "link";
        }
        if (stripeIntent instanceof PaymentIntent) {
            zA = ((PaymentIntent) stripeIntent).a(str3);
        } else {
            if (!(stripeIntent instanceof SetupIntent)) {
                throw new NoWhenBranchMatchedException();
            }
            zA = true;
        }
        if (zA || linkConfiguration.G) {
            PaymentMethodSaveConsentBehavior paymentMethodSaveConsentBehavior = linkConfiguration.F;
            if (paymentMethodSaveConsentBehavior instanceof PaymentMethodSaveConsentBehavior.Disabled) {
                allowRedisplay = ((PaymentMethodSaveConsentBehavior.Disabled) paymentMethodSaveConsentBehavior).f43116a;
            } else {
                if (!(paymentMethodSaveConsentBehavior instanceof PaymentMethodSaveConsentBehavior.Enabled) && !Intrinsics.b(paymentMethodSaveConsentBehavior, PaymentMethodSaveConsentBehavior.Legacy.f43118a)) {
                    throw new NoWhenBranchMatchedException();
                }
                allowRedisplay = null;
            }
            if (allowRedisplay == null) {
                allowRedisplay = PaymentMethod.AllowRedisplay.f43591c;
            }
        } else {
            allowRedisplay = PaymentMethod.AllowRedisplay.f43590b;
        }
        PaymentMethod.AllowRedisplay allowRedisplay2 = allowRedisplay;
        if (linkConfiguration.f42902h) {
            linkPassthroughConfirmationOption = new LinkPassthroughConfirmationOption(selectedPaymentDetails.getF43297c(), str3, str, str2, allowRedisplay2);
        } else {
            String consumerSessionClientSecret = linkAccount.f43015g;
            ClientAttributionMetadata clientAttributionMetadata = linkConfiguration.I;
            Intrinsics.g(selectedPaymentDetails, "selectedPaymentDetails");
            Intrinsics.g(consumerSessionClientSecret, "consumerSessionClientSecret");
            Intrinsics.g(clientAttributionMetadata, "clientAttributionMetadata");
            ConsumerPaymentDetails.BillingAddress f43300f = selectedPaymentDetails.getF43300f();
            if (f43300f != null) {
                String str4 = f43300f.f43280b;
                String str5 = f43300f.f43281c;
                String str6 = f43300f.f43284f;
                String str7 = f43300f.f43283e;
                String str8 = f43300f.f43282d;
                CountryCode countryCode = f43300f.f43285g;
                address = new Address(str7, countryCode != null ? countryCode.f42575a : null, str4, str5, str6, str8);
            } else {
                address = null;
            }
            String f43301g = selectedPaymentDetails.getF43301g();
            ConsumerPaymentDetails.BillingAddress f43300f2 = selectedPaymentDetails.getF43300f();
            PaymentMethod.BillingDetails billingDetails = new PaymentMethod.BillingDetails(address, f43301g, f43300f2 != null ? f43300f2.f43279a : null, str2);
            String paymentDetailsId = selectedPaymentDetails.getF43297c();
            PaymentMethod.BillingDetails billingDetails2 = !billingDetails.equals(new PaymentMethod.BillingDetails(null, null, 15)) ? billingDetails : null;
            Map mapO = str != null ? k2.o("card", a80.m.n("cvc", str)) : null;
            Intrinsics.g(paymentDetailsId, "paymentDetailsId");
            linkPassthroughConfirmationOption = new PaymentMethodConfirmationOption.New(new PaymentMethodCreateParams(PaymentMethod.Type.f43638h, null, null, new PaymentMethodCreateParams.Link(paymentDetailsId, consumerSessionClientSecret, mapO), null, billingDetails2, allowRedisplay2, clientAttributionMetadata, 1522686), null, null, false, false, false);
        }
        return new ConfirmationHandler$Args(linkPassthroughConfirmationOption, paymentMethodMetadata);
    }

    public final o c(v vVar) {
        if (vVar instanceof mt.l) {
            return l.f68048a;
        }
        boolean z11 = vVar instanceof t;
        xq.c cVar = this.f68042c;
        if (z11) {
            t tVar = (t) vVar;
            cVar.b("DefaultLinkConfirmationHandler: Failed to confirm payment", tVar.f76805a);
            return new m(tVar.f76806b);
        }
        if (vVar instanceof u) {
            return n.f68050a;
        }
        if (vVar != null) {
            throw new NoWhenBranchMatchedException();
        }
        cVar.b("DefaultLinkConfirmationHandler: Payment confirmation returned null", null);
        return new m(zg.a.G(2132020022));
    }
}
