package ju;

import b.c0;
import com.google.android.gms.internal.consent_sdk.k0;
import com.stripe.android.core.networking.ApiRequest$Options;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.StripeIntent;
import com.stripe.android.model.z2;
import com.stripe.android.model.z5;
import com.stripe.android.networking.PaymentAnalyticsEvent;
import dq.e0;
import java.util.List;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import t70.m0;

/* loaded from: classes4.dex */
public final class n extends e {

    /* renamed from: a, reason: collision with root package name */
    public final Function1 f69975a;

    /* renamed from: b, reason: collision with root package name */
    public final fr.l f69976b;

    /* renamed from: c, reason: collision with root package name */
    public final jt.a f69977c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f69978d;

    /* renamed from: e, reason: collision with root package name */
    public final CoroutineContext f69979e;

    /* renamed from: f, reason: collision with root package name */
    public final Function0 f69980f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f69981g;

    /* renamed from: h, reason: collision with root package name */
    public final du.a f69982h;

    /* renamed from: i, reason: collision with root package name */
    public final io.sentry.internal.debugmeta.c f69983i;

    public n(Function1 paymentBrowserAuthStarterFactory, fr.l analyticsRequestExecutor, jt.a paymentAnalyticsRequestFactory, boolean z11, CoroutineContext uiContext, Function0 publishableKeyProvider, boolean z12, du.a defaultReturnUrl, io.sentry.internal.debugmeta.c redirectResolver) {
        Intrinsics.g(paymentBrowserAuthStarterFactory, "paymentBrowserAuthStarterFactory");
        Intrinsics.g(analyticsRequestExecutor, "analyticsRequestExecutor");
        Intrinsics.g(paymentAnalyticsRequestFactory, "paymentAnalyticsRequestFactory");
        Intrinsics.g(uiContext, "uiContext");
        Intrinsics.g(publishableKeyProvider, "publishableKeyProvider");
        Intrinsics.g(defaultReturnUrl, "defaultReturnUrl");
        Intrinsics.g(redirectResolver, "redirectResolver");
        this.f69975a = paymentBrowserAuthStarterFactory;
        this.f69976b = analyticsRequestExecutor;
        this.f69977c = paymentAnalyticsRequestFactory;
        this.f69978d = z11;
        this.f69979e = uiContext;
        this.f69980f = publishableKeyProvider;
        this.f69981g = z12;
        this.f69982h = defaultReturnUrl;
        this.f69983i = redirectResolver;
    }

    /* JADX WARN: Code restructure failed: missing block: B:53:0x014d, code lost:
    
        if (r1 != r4) goto L55;
     */
    /* JADX WARN: Removed duplicated region for block: B:48:0x0115  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x014b  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    @Override // ju.e
    /* renamed from: e, reason: merged with bridge method [inline-methods] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(ww.a aVar, StripeIntent stripeIntent, ApiRequest$Options apiRequest$Options, Continuation continuation) throws Throwable {
        l lVar;
        ApiRequest$Options apiRequest$Options2;
        j jVar;
        n nVar;
        StripeIntent stripeIntent2;
        ww.a aVar2;
        j jVar2;
        ww.a aVar3;
        n nVar2;
        String f43539g;
        Object objY;
        StripeIntent stripeIntent3 = stripeIntent;
        if (continuation instanceof l) {
            lVar = (l) continuation;
            int i5 = lVar.f69970z;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                lVar.f69970z = i5 - Integer.MIN_VALUE;
            } else {
                lVar = new l(this, (ContinuationImpl) continuation);
            }
        }
        Object objF = lVar.f69968x;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = lVar.f69970z;
        if (i11 == 0) {
            ResultKt.b(objF);
            Object f43553w = stripeIntent3.getF43553w();
            if (f43553w instanceof StripeIntent.NextActionData.RedirectToUrl) {
                lVar.f69964t = this;
                aVar3 = aVar;
                lVar.f69965u = aVar3;
                lVar.f69966v = stripeIntent3;
                apiRequest$Options2 = apiRequest$Options;
                lVar.f69967w = apiRequest$Options2;
                lVar.f69970z = 1;
                objF = f((StripeIntent.NextActionData.RedirectToUrl) f43553w, stripeIntent3, lVar);
                if (objF != coroutineSingletons) {
                    nVar2 = this;
                }
                return coroutineSingletons;
            }
            apiRequest$Options2 = apiRequest$Options;
            if (f43553w instanceof StripeIntent.NextActionData.AlipayRedirect) {
                StripeIntent.NextActionData.AlipayRedirect alipayRedirect = (StripeIntent.NextActionData.AlipayRedirect) f43553w;
                this.f69976b.a(jt.a.c(this.f69977c, PaymentAnalyticsEvent.M, null, null, null, null, 62));
                String string = alipayRedirect.f43934c.toString();
                Intrinsics.f(string, "toString(...)");
                jVar = new j(60, string, alipayRedirect.f43935d, null);
            } else if (f43553w instanceof z5) {
                String f43943c = ((z5) f43553w).getF43943c();
                Intrinsics.d(f43943c);
                if (f43943c.length() <= 0) {
                    f43943c = null;
                }
                if (f43943c == null) {
                    StripeIntent.NextActionType nextActionTypeX = stripeIntent3.X();
                    throw new IllegalArgumentException(c0.k("null hostedVoucherUrl for ", nextActionTypeX != null ? nextActionTypeX.f43979a : null));
                }
                jVar = new j(52, f43943c, null, null);
            } else {
                boolean z11 = f43553w instanceof StripeIntent.NextActionData.CashAppRedirect;
                du.a aVar4 = this.f69982h;
                if (z11) {
                    jVar = new j(52, ((StripeIntent.NextActionData.CashAppRedirect) f43553w).f43937a, aVar4.a(), null);
                } else {
                    if (!(f43553w instanceof StripeIntent.NextActionData.SwishRedirect)) {
                        throw new IllegalArgumentException("WebAuthenticator can't process nextActionData: " + f43553w);
                    }
                    jVar = new j(52, ((StripeIntent.NextActionData.SwishRedirect) f43553w).f43959a, aVar4.a(), null);
                }
            }
            nVar = this;
            stripeIntent2 = stripeIntent3;
            aVar2 = aVar;
            jVar2 = jVar;
            List list = e0.f49312l;
            int iQ = k0.q(stripeIntent2);
            f43539g = stripeIntent2.getF43539g();
            if (f43539g == null) {
                f43539g = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            String str = f43539g;
            String str2 = jVar2.f69952a;
            String str3 = apiRequest$Options2.f42577b;
            String str4 = jVar2.f69953b;
            boolean z12 = jVar2.f69954c;
            String str5 = jVar2.f69955d;
            boolean z13 = jVar2.f69956e;
            lVar.f69964t = null;
            lVar.f69965u = null;
            lVar.f69966v = null;
            lVar.f69967w = null;
            lVar.f69970z = 2;
            objY = m0.y(nVar.f69979e, new k(nVar, aVar2, stripeIntent2, iQ, str, str2, str4, str3, z12, str5, z13, null), lVar);
            if (objY != coroutineSingletons) {
                objY = Unit.f71706a;
            }
        } else {
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(objF);
                return Unit.f71706a;
            }
            ApiRequest$Options apiRequest$Options3 = lVar.f69967w;
            StripeIntent stripeIntent4 = lVar.f69966v;
            ww.a aVar5 = lVar.f69965u;
            n nVar3 = lVar.f69964t;
            ResultKt.b(objF);
            apiRequest$Options2 = apiRequest$Options3;
            stripeIntent3 = stripeIntent4;
            aVar3 = aVar5;
            nVar2 = nVar3;
        }
        jVar2 = (j) objF;
        stripeIntent2 = stripeIntent3;
        aVar2 = aVar3;
        nVar = nVar2;
        List list2 = e0.f49312l;
        int iQ2 = k0.q(stripeIntent2);
        f43539g = stripeIntent2.getF43539g();
        if (f43539g == null) {
        }
        String str6 = f43539g;
        String str22 = jVar2.f69952a;
        String str32 = apiRequest$Options2.f42577b;
        String str42 = jVar2.f69953b;
        boolean z122 = jVar2.f69954c;
        String str52 = jVar2.f69955d;
        boolean z132 = jVar2.f69956e;
        lVar.f69964t = null;
        lVar.f69965u = null;
        lVar.f69966v = null;
        lVar.f69967w = null;
        lVar.f69970z = 2;
        objY = m0.y(nVar.f69979e, new k(nVar, aVar2, stripeIntent2, iQ2, str6, str22, str42, str32, z122, str52, z132, null), lVar);
        if (objY != coroutineSingletons) {
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:23:0x008c, code lost:
    
        if (r2 == r4) goto L31;
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x00c3, code lost:
    
        if (r2 == r4) goto L31;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object f(StripeIntent.NextActionData.RedirectToUrl redirectToUrl, StripeIntent stripeIntent, ContinuationImpl continuationImpl) throws Throwable {
        m mVar;
        String string;
        StripeIntent.NextActionData.RedirectToUrl redirectToUrl2 = redirectToUrl;
        if (continuationImpl instanceof m) {
            mVar = (m) continuationImpl;
            int i5 = mVar.f69974w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                mVar.f69974w = i5 - Integer.MIN_VALUE;
            } else {
                mVar = new m(this, continuationImpl);
            }
        }
        Object objY = mVar.f69972u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = mVar.f69974w;
        Continuation continuation = null;
        if (i11 == 0) {
            ResultKt.b(objY);
            this.f69976b.a(jt.a.c(this.f69977c, PaymentAnalyticsEvent.M, null, null, null, null, 62));
            PaymentMethod n = stripeIntent.getN();
            String str = n != null ? n.f43572d : null;
            z2 z2Var = PaymentMethod.Type.f43637g;
            boolean zB = Intrinsics.b(str, "wechat_pay");
            int i12 = 19;
            io.sentry.internal.debugmeta.c cVar = this.f69983i;
            if (zB) {
                String string2 = redirectToUrl2.f43946a.toString();
                Intrinsics.f(string2, "toString(...)");
                mVar.f69971t = redirectToUrl2;
                mVar.f69974w = 1;
                objY = m0.y((CoroutineContext) cVar.f67328b, new b10.k(string2, cVar, continuation, i12), mVar);
            } else {
                string = redirectToUrl2.f43946a.toString();
                Intrinsics.f(string, "toString(...)");
                if (r70.k.K0(string, "followRedirectsInSDK=true", false)) {
                    mVar.f69971t = redirectToUrl2;
                    mVar.f69974w = 2;
                    objY = m0.y((CoroutineContext) cVar.f67328b, new b10.k(string, cVar, continuation, i12), mVar);
                }
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            redirectToUrl2 = mVar.f69971t;
            ResultKt.b(objY);
            return new j(4, (String) objY, redirectToUrl2.f43947b, redirectToUrl2.f43946a.toString());
        }
        if (i11 != 2) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        redirectToUrl2 = mVar.f69971t;
        ResultKt.b(objY);
        string = (String) objY;
        return new j(60, string, redirectToUrl2.f43947b, null);
    }
}
