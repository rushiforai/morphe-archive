package fv;

import com.stripe.android.PaymentConfiguration;
import com.stripe.android.core.exception.StripeException;
import com.stripe.android.core.networking.ApiRequest$Options;
import com.stripe.android.model.CheckoutSessionResponse;
import com.stripe.android.model.ElementsSessionParams;
import com.stripe.android.paymentsheet.PaymentSheet$CustomPaymentMethod;
import com.stripe.android.paymentsheet.PaymentSheet$CustomerAccessType;
import com.stripe.android.paymentsheet.PaymentSheet$CustomerConfiguration;
import com.stripe.android.paymentsheet.PaymentSheet$IntentConfiguration;
import com.stripe.android.paymentsheet.state.PaymentElementLoader$InitializationMode;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import jt.c1;
import jt.z0;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.collections.EmptyList;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import ou.t0;
import t70.m0;

/* loaded from: classes4.dex */
public final class r implements m {

    /* renamed from: a, reason: collision with root package name */
    public final c1 f56143a;

    /* renamed from: b, reason: collision with root package name */
    public final w60.a f56144b;

    /* renamed from: c, reason: collision with root package name */
    public final CoroutineContext f56145c;

    /* renamed from: d, reason: collision with root package name */
    public final av.a f56146d;

    /* renamed from: e, reason: collision with root package name */
    public final String f56147e;

    public r(c1 stripeRepository, w60.a lazyPaymentConfig, CoroutineContext workContext, av.a aVar, String appId) {
        Intrinsics.g(stripeRepository, "stripeRepository");
        Intrinsics.g(lazyPaymentConfig, "lazyPaymentConfig");
        Intrinsics.g(workContext, "workContext");
        Intrinsics.g(appId, "appId");
        this.f56143a = stripeRepository;
        this.f56144b = lazyPaymentConfig;
        this.f56145c = workContext;
        this.f56146d = aVar;
        this.f56147e = appId;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(ElementsSessionParams elementsSessionParams, Throwable th2, ContinuationImpl continuationImpl) {
        o oVar;
        if (continuationImpl instanceof o) {
            oVar = (o) continuationImpl;
            int i5 = oVar.f56133v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                oVar.f56133v = i5 - Integer.MIN_VALUE;
            } else {
                oVar = new o(this, continuationImpl);
            }
        }
        Object objY = oVar.f56131t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = oVar.f56133v;
        if (i11 == 0) {
            ResultKt.b(objY);
            p pVar = new p(elementsSessionParams, this, th2, null);
            oVar.f56133v = 1;
            objY = m0.y(this.f56145c, pVar, oVar);
            if (objY == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objY);
        }
        return ((Result) objY).f71688a;
    }

    /* JADX WARN: Code restructure failed: missing block: B:91:0x0242, code lost:
    
        if (r0 == r7) goto L92;
     */
    /* JADX WARN: Removed duplicated region for block: B:100:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001f  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x0221  */
    /* JADX WARN: Removed duplicated region for block: B:97:0x01ea A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(PaymentElementLoader$InitializationMode paymentElementLoader$InitializationMode, PaymentSheet$CustomerConfiguration paymentSheet$CustomerConfiguration, List customPaymentMethods, List externalPaymentMethods, String str, String str2, Set linkDisallowedFundingSourceCreation, ContinuationImpl continuationImpl) {
        q qVar;
        String str3;
        String str4;
        ElementsSessionParams checkoutSessionType;
        ElementsSessionParams elementsSessionParams;
        Object objO;
        r rVar;
        ElementsSessionParams elementsSessionParams2;
        Object objA;
        r rVar2;
        String str5;
        String str6;
        Throwable thA;
        Object objA2;
        if (continuationImpl instanceof q) {
            qVar = (q) continuationImpl;
            int i5 = qVar.f56142x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                qVar.f56142x = i5 - Integer.MIN_VALUE;
            } else {
                qVar = new q(this, continuationImpl);
            }
        }
        Object obj = qVar.f56140v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = qVar.f56142x;
        if (i11 == 0) {
            ResultKt.b(obj);
            String str7 = (String) this.f56146d.get();
            Intrinsics.g(paymentElementLoader$InitializationMode, "<this>");
            Intrinsics.g(customPaymentMethods, "customPaymentMethods");
            Intrinsics.g(externalPaymentMethods, "externalPaymentMethods");
            String appId = this.f56147e;
            Intrinsics.g(appId, "appId");
            Intrinsics.g(linkDisallowedFundingSourceCreation, "linkDisallowedFundingSourceCreation");
            if (paymentSheet$CustomerConfiguration != null) {
                PaymentSheet$CustomerAccessType paymentSheet$CustomerAccessType = paymentSheet$CustomerConfiguration.f44574c;
                if (paymentSheet$CustomerAccessType instanceof PaymentSheet$CustomerAccessType.CustomerSession) {
                    str6 = ((PaymentSheet$CustomerAccessType.CustomerSession) paymentSheet$CustomerAccessType).f44570a;
                } else {
                    if (!(paymentSheet$CustomerAccessType instanceof PaymentSheet$CustomerAccessType.LegacyCustomerEphemeralKey)) {
                        throw new NoWhenBranchMatchedException();
                    }
                    str6 = null;
                }
                str3 = str6;
            } else {
                str3 = null;
            }
            if (paymentSheet$CustomerConfiguration != null) {
                PaymentSheet$CustomerAccessType paymentSheet$CustomerAccessType2 = paymentSheet$CustomerConfiguration.f44574c;
                if (paymentSheet$CustomerAccessType2 instanceof PaymentSheet$CustomerAccessType.CustomerSession) {
                    str5 = null;
                } else {
                    if (!(paymentSheet$CustomerAccessType2 instanceof PaymentSheet$CustomerAccessType.LegacyCustomerEphemeralKey)) {
                        throw new NoWhenBranchMatchedException();
                    }
                    str5 = ((PaymentSheet$CustomerAccessType.LegacyCustomerEphemeralKey) paymentSheet$CustomerAccessType2).f44571a;
                }
                str4 = str5;
            } else {
                str4 = null;
            }
            List list = customPaymentMethods;
            ArrayList arrayList = new ArrayList(b70.c.u0(list, 10));
            Iterator it = list.iterator();
            while (it.hasNext()) {
                arrayList.add(((PaymentSheet$CustomPaymentMethod) it.next()).f44567a);
            }
            ElementsSessionParams.Link link = new ElementsSessionParams.Link(linkDisallowedFundingSourceCreation);
            if (paymentElementLoader$InitializationMode instanceof PaymentElementLoader$InitializationMode.PaymentIntent) {
                checkoutSessionType = new ElementsSessionParams.PaymentIntentType(((PaymentElementLoader$InitializationMode.PaymentIntent) paymentElementLoader$InitializationMode).f44969a, Locale.getDefault().toLanguageTag(), str3, str4, str, str7, arrayList, externalPaymentMethods, appId, link, str2);
            } else if (paymentElementLoader$InitializationMode instanceof PaymentElementLoader$InitializationMode.SetupIntent) {
                checkoutSessionType = new ElementsSessionParams.SetupIntentType(((PaymentElementLoader$InitializationMode.SetupIntent) paymentElementLoader$InitializationMode).f44970a, Locale.getDefault().toLanguageTag(), str3, str4, str, str7, arrayList, externalPaymentMethods, appId, link, str2);
            } else if (paymentElementLoader$InitializationMode instanceof PaymentElementLoader$InitializationMode.DeferredIntent) {
                PaymentSheet$IntentConfiguration paymentSheet$IntentConfiguration = ((PaymentElementLoader$InitializationMode.DeferredIntent) paymentElementLoader$InitializationMode).f44968a;
                checkoutSessionType = new ElementsSessionParams.DeferredIntentType(com.stripe.android.paymentsheet.e.a(paymentSheet$IntentConfiguration), arrayList, externalPaymentMethods, str, str3, str4, str7, appId, n.a(paymentSheet$IntentConfiguration), link, str2);
            } else if (paymentElementLoader$InitializationMode instanceof PaymentElementLoader$InitializationMode.CryptoOnramp) {
                PaymentSheet$IntentConfiguration.Mode.Setup setup = new PaymentSheet$IntentConfiguration.Mode.Setup(null, t0.f80981a);
                EmptyList paymentMethodTypes = EmptyList.f71733a;
                Intrinsics.g(paymentMethodTypes, "paymentMethodTypes");
                PaymentSheet$IntentConfiguration paymentSheet$IntentConfiguration2 = new PaymentSheet$IntentConfiguration(setup, paymentMethodTypes, null, null, false, PaymentSheet$IntentConfiguration.IntentBehavior.Default.f44594a);
                checkoutSessionType = new ElementsSessionParams.DeferredIntentType(com.stripe.android.paymentsheet.e.a(paymentSheet$IntentConfiguration2), arrayList, externalPaymentMethods, str, str3, str4, str7, appId, n.a(paymentSheet$IntentConfiguration2), link, str2);
            } else {
                if (!(paymentElementLoader$InitializationMode instanceof PaymentElementLoader$InitializationMode.CheckoutSession)) {
                    throw new NoWhenBranchMatchedException();
                }
                checkoutSessionType = new ElementsSessionParams.CheckoutSessionType(((PaymentElementLoader$InitializationMode.CheckoutSession) paymentElementLoader$InitializationMode).f44966a, str3, str4, str7, str, arrayList, externalPaymentMethods, appId, link, str2, 6);
            }
            elementsSessionParams = checkoutSessionType;
            boolean z11 = elementsSessionParams instanceof ElementsSessionParams.CheckoutSessionType;
            c1 c1Var = this.f56143a;
            if (z11) {
                ApiRequest$Options apiRequest$OptionsC = c();
                qVar.f56138t = this;
                qVar.f56139u = elementsSessionParams;
                qVar.f56142x = 1;
                Object objC = ((z0) c1Var).C((ElementsSessionParams.CheckoutSessionType) elementsSessionParams, apiRequest$OptionsC, qVar);
                if (objC != coroutineSingletons) {
                    elementsSessionParams2 = elementsSessionParams;
                    objA = objC;
                    rVar2 = this;
                    int i12 = Result.f71687b;
                    if (!(objA instanceof Result.Failure)) {
                    }
                    r rVar3 = rVar2;
                    objO = objA;
                    elementsSessionParams = elementsSessionParams2;
                    rVar = rVar3;
                    thA = Result.a(objO);
                    if (thA != null) {
                    }
                }
            } else {
                ApiRequest$Options apiRequest$OptionsC2 = c();
                qVar.f56138t = this;
                qVar.f56139u = elementsSessionParams;
                qVar.f56142x = 2;
                objO = ((z0) c1Var).O(elementsSessionParams, apiRequest$OptionsC2, qVar);
                if (objO != coroutineSingletons) {
                    rVar = this;
                    thA = Result.a(objO);
                    if (thA != null) {
                    }
                }
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            ElementsSessionParams elementsSessionParams3 = qVar.f56139u;
            r rVar4 = qVar.f56138t;
            ResultKt.b(obj);
            elementsSessionParams2 = elementsSessionParams3;
            objA = ((Result) obj).f71688a;
            rVar2 = rVar4;
            int i122 = Result.f71687b;
            if (!(objA instanceof Result.Failure)) {
                try {
                    objA = ((CheckoutSessionResponse) objA).f43179d;
                    if (objA == null) {
                        throw new IllegalStateException("CheckoutSession init response missing elements_session");
                    }
                } catch (Throwable th2) {
                    int i13 = Result.f71687b;
                    objA = ResultKt.a(th2);
                }
            }
            r rVar32 = rVar2;
            objO = objA;
            elementsSessionParams = elementsSessionParams2;
            rVar = rVar32;
            thA = Result.a(objO);
            if (thA != null) {
            }
        } else {
            if (i11 != 2) {
                if (i11 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                objA2 = ((Result) obj).f71688a;
                return objA2;
            }
            elementsSessionParams = qVar.f56139u;
            rVar = qVar.f56138t;
            ResultKt.b(obj);
            objO = ((Result) obj).f71688a;
            thA = Result.a(objO);
            if (thA != null) {
                return objO;
            }
            rVar.getClass();
            Throwable thA2 = Result.a(objO);
            StripeException stripeException = thA2 instanceof StripeException ? (StripeException) thA2 : null;
            if (stripeException == null || stripeException.f42565c < 500) {
                return objO;
            }
            qVar.f56138t = null;
            qVar.f56139u = null;
            qVar.f56142x = 3;
            objA2 = rVar.a(elementsSessionParams, thA, qVar);
        }
    }

    public final ApiRequest$Options c() {
        w60.a aVar = this.f56144b;
        return new ApiRequest$Options(((PaymentConfiguration) aVar.get()).f42440a, ((PaymentConfiguration) aVar.get()).f42441b, 4);
    }
}
