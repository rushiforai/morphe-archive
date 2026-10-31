package vt;

import android.content.Context;
import com.stripe.android.core.networking.ApiRequest$Options;
import com.stripe.android.lpmfoundations.paymentmethod.IntegrationMetadata;
import com.stripe.android.model.ClientAttributionMetadata;
import com.stripe.android.paymentelement.confirmation.intent.CallbackNotFoundException;
import com.stripe.android.paymentsheet.PaymentSheet$IntentConfiguration;
import jt.c1;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class y implements l0 {

    /* renamed from: a, reason: collision with root package name */
    public final a0 f93153a;

    /* renamed from: b, reason: collision with root package name */
    public final r0 f93154b;

    /* renamed from: c, reason: collision with root package name */
    public final e0 f93155c;

    /* renamed from: d, reason: collision with root package name */
    public final l f93156d;

    /* renamed from: e, reason: collision with root package name */
    public final v0 f93157e;

    /* renamed from: f, reason: collision with root package name */
    public final g f93158f;

    public y(a0 deferredIntentCallbackRetriever, r0 intentFirstConfirmationInterceptorFactory, e0 deferredIntentConfirmationInterceptorFactory, l confirmationTokenConfirmationInterceptorFactory, v0 sharedPaymentTokenConfirmationInterceptorFactory, g checkoutSessionConfirmationInterceptorFactory) {
        Intrinsics.g(deferredIntentCallbackRetriever, "deferredIntentCallbackRetriever");
        Intrinsics.g(intentFirstConfirmationInterceptorFactory, "intentFirstConfirmationInterceptorFactory");
        Intrinsics.g(deferredIntentConfirmationInterceptorFactory, "deferredIntentConfirmationInterceptorFactory");
        Intrinsics.g(confirmationTokenConfirmationInterceptorFactory, "confirmationTokenConfirmationInterceptorFactory");
        Intrinsics.g(sharedPaymentTokenConfirmationInterceptorFactory, "sharedPaymentTokenConfirmationInterceptorFactory");
        Intrinsics.g(checkoutSessionConfirmationInterceptorFactory, "checkoutSessionConfirmationInterceptorFactory");
        this.f93153a = deferredIntentCallbackRetriever;
        this.f93154b = intentFirstConfirmationInterceptorFactory;
        this.f93155c = deferredIntentConfirmationInterceptorFactory;
        this.f93156d = confirmationTokenConfirmationInterceptorFactory;
        this.f93157e = sharedPaymentTokenConfirmationInterceptorFactory;
        this.f93158f = checkoutSessionConfirmationInterceptorFactory;
    }

    /* JADX WARN: Code restructure failed: missing block: B:50:0x019c, code lost:
    
        if (r2 == r4) goto L51;
     */
    /* JADX WARN: Removed duplicated region for block: B:32:0x00d2  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0102  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x0142  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0168  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x001c  */
    @Override // vt.l0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(IntegrationMetadata integrationMetadata, String str, String str2, ClientAttributionMetadata clientAttributionMetadata, Continuation continuation) throws CallbackNotFoundException {
        x xVar;
        PaymentSheet$IntentConfiguration paymentSheet$IntentConfiguration;
        v0 v0Var;
        PaymentSheet$IntentConfiguration paymentSheet$IntentConfiguration2;
        ClientAttributionMetadata clientAttributionMetadata2;
        e0 e0Var;
        PaymentSheet$IntentConfiguration paymentSheet$IntentConfiguration3;
        String str3;
        ClientAttributionMetadata clientAttributionMetadata3;
        String str4;
        l lVar;
        if (continuation instanceof x) {
            xVar = (x) continuation;
            int i5 = xVar.A;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                xVar.A = i5 - Integer.MIN_VALUE;
            } else {
                xVar = new x(this, (ContinuationImpl) continuation);
            }
        }
        x xVar2 = xVar;
        Object objA = xVar2.f93151y;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = xVar2.A;
        if (i11 != 0) {
            if (i11 == 1) {
                paymentSheet$IntentConfiguration3 = xVar2.f93150x;
                lVar = xVar2.f93149w;
                ClientAttributionMetadata clientAttributionMetadata4 = (ClientAttributionMetadata) xVar2.f93148v;
                String str5 = (String) xVar2.f93147u;
                String str6 = (String) xVar2.f93146t;
                ResultKt.b(objA);
                clientAttributionMetadata3 = clientAttributionMetadata4;
                str4 = str5;
                str3 = str6;
                PaymentSheet$IntentConfiguration paymentSheet$IntentConfiguration4 = paymentSheet$IntentConfiguration3;
                if (objA == null) {
                    throw new ClassCastException();
                }
                rs.h hVar = lVar.f93082a;
                return new k(paymentSheet$IntentConfiguration4, str3, str4, clientAttributionMetadata3, (Context) hVar.f86181a.get(), (c1) hVar.f86182b.get(), (ApiRequest$Options) hVar.f86183c.get(), (ir.i) hVar.f86184d.get());
            }
            if (i11 != 2) {
                if (i11 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                paymentSheet$IntentConfiguration = (PaymentSheet$IntentConfiguration) xVar2.f93147u;
                v0Var = (v0) xVar2.f93146t;
                ResultKt.b(objA);
                if (objA != null) {
                    throw new ClassCastException();
                }
                f fVar = v0Var.f93144a;
                return new u0(paymentSheet$IntentConfiguration, (iu.f) fVar.f93040a.get(), (c1) fVar.f93041b.get(), (ApiRequest$Options) fVar.f93042c.get());
            }
            paymentSheet$IntentConfiguration2 = (PaymentSheet$IntentConfiguration) xVar2.f93148v;
            e0Var = (e0) xVar2.f93147u;
            ClientAttributionMetadata clientAttributionMetadata5 = (ClientAttributionMetadata) xVar2.f93146t;
            ResultKt.b(objA);
            clientAttributionMetadata2 = clientAttributionMetadata5;
            PaymentSheet$IntentConfiguration paymentSheet$IntentConfiguration5 = paymentSheet$IntentConfiguration2;
            if (objA == null) {
                throw new ClassCastException();
            }
            f fVar2 = e0Var.f93039a;
            return new d0(paymentSheet$IntentConfiguration5, clientAttributionMetadata2, (c1) fVar2.f93040a.get(), (ApiRequest$Options) fVar2.f93041b.get(), ((Boolean) fVar2.f93042c.get()).booleanValue());
        }
        ResultKt.b(objA);
        if (integrationMetadata instanceof IntegrationMetadata.CustomerSheet) {
            throw new IllegalStateException("CustomerSheet not supported by default confirmation interceptor!");
        }
        if (Intrinsics.b(integrationMetadata, IntegrationMetadata.CryptoOnramp.f43086a)) {
            throw new IllegalStateException("No intent confirmation interceptor for CryptoOnramp.");
        }
        boolean z11 = integrationMetadata instanceof IntegrationMetadata.DeferredIntent.WithConfirmationToken;
        final a0 a0Var = this.f93153a;
        if (z11) {
            paymentSheet$IntentConfiguration3 = ((IntegrationMetadata.DeferredIntent.WithConfirmationToken) integrationMetadata).f43088a;
            xVar2.f93146t = str;
            xVar2.f93147u = str2;
            xVar2.f93148v = clientAttributionMetadata;
            l lVar2 = this.f93156d;
            xVar2.f93149w = lVar2;
            xVar2.f93150x = paymentSheet$IntentConfiguration3;
            xVar2.A = 1;
            a0Var.getClass();
            final int i12 = 1;
            Object objA2 = a0Var.a(iu.d.f68083j, iu.c.f68073z, kt.i.class.getSimpleName().concat(" must be implemented when using IntentConfiguration!"), "deferredIntentCallbackNotFound", new Function0() { // from class: vt.z
                @Override // kotlin.jvm.functions.Function0
                public final Object invoke() {
                    switch (i12) {
                        case 0:
                            a0Var.f93009c.get();
                            break;
                        case 1:
                            a0Var.f93010d.get();
                            break;
                        default:
                            a0Var.f93011e.get();
                            break;
                    }
                    return null;
                }
            }, xVar2);
            if (objA2 != coroutineSingletons) {
                str3 = str;
                clientAttributionMetadata3 = clientAttributionMetadata;
                objA = objA2;
                str4 = str2;
                lVar = lVar2;
                PaymentSheet$IntentConfiguration paymentSheet$IntentConfiguration42 = paymentSheet$IntentConfiguration3;
                if (objA == null) {
                }
            }
        } else if (integrationMetadata instanceof IntegrationMetadata.DeferredIntent.WithPaymentMethod) {
            paymentSheet$IntentConfiguration2 = ((IntegrationMetadata.DeferredIntent.WithPaymentMethod) integrationMetadata).f43089a;
            xVar2.f93146t = clientAttributionMetadata;
            e0 e0Var2 = this.f93155c;
            xVar2.f93147u = e0Var2;
            xVar2.f93148v = paymentSheet$IntentConfiguration2;
            xVar2.A = 2;
            a0Var.getClass();
            final int i13 = 0;
            objA = a0Var.a(iu.d.f68082i, iu.c.f68073z, ou.b.class.getSimpleName().concat(" must be implemented when using IntentConfiguration!"), "deferredIntentCallbackNotFound", new Function0() { // from class: vt.z
                @Override // kotlin.jvm.functions.Function0
                public final Object invoke() {
                    switch (i13) {
                        case 0:
                            a0Var.f93009c.get();
                            break;
                        case 1:
                            a0Var.f93010d.get();
                            break;
                        default:
                            a0Var.f93011e.get();
                            break;
                    }
                    return null;
                }
            }, xVar2);
            if (objA != coroutineSingletons) {
                clientAttributionMetadata2 = clientAttributionMetadata;
                e0Var = e0Var2;
                PaymentSheet$IntentConfiguration paymentSheet$IntentConfiguration52 = paymentSheet$IntentConfiguration2;
                if (objA == null) {
                }
            }
        } else {
            if (!(integrationMetadata instanceof IntegrationMetadata.DeferredIntent.WithSharedPaymentToken)) {
                if (integrationMetadata instanceof IntegrationMetadata.IntentFirst) {
                    return new q0(((IntegrationMetadata.IntentFirst) integrationMetadata).f43091a, clientAttributionMetadata, (ApiRequest$Options) this.f93154b.f93113a.f18527b.get());
                }
                if (!(integrationMetadata instanceof IntegrationMetadata.CheckoutSession)) {
                    throw new NoWhenBranchMatchedException();
                }
                String str7 = ((IntegrationMetadata.CheckoutSession) integrationMetadata).f43085a;
                f fVar3 = this.f93158f.f93048a;
                return new e(str7, clientAttributionMetadata, (Context) fVar3.f93040a.get(), (c1) fVar3.f93041b.get(), (ApiRequest$Options) fVar3.f93042c.get());
            }
            paymentSheet$IntentConfiguration = ((IntegrationMetadata.DeferredIntent.WithSharedPaymentToken) integrationMetadata).f43090a;
            v0Var = this.f93157e;
            xVar2.f93146t = v0Var;
            xVar2.f93147u = paymentSheet$IntentConfiguration;
            xVar2.A = 3;
            a0Var.getClass();
            final int i14 = 2;
            objA = a0Var.a(iu.d.f68084k, iu.c.A, kt.k.class.getSimpleName().concat(" must be implemented when using IntentConfiguration!"), "deferredIntentCallbackNotFound", new Function0() { // from class: vt.z
                @Override // kotlin.jvm.functions.Function0
                public final Object invoke() {
                    switch (i14) {
                        case 0:
                            a0Var.f93009c.get();
                            break;
                        case 1:
                            a0Var.f93010d.get();
                            break;
                        default:
                            a0Var.f93011e.get();
                            break;
                    }
                    return null;
                }
            }, xVar2);
        }
        return coroutineSingletons;
    }
}
