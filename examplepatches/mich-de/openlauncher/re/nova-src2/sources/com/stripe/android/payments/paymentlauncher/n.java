package com.stripe.android.payments.paymentlauncher;

import com.stripe.android.core.exception.StripeException;
import com.stripe.android.core.networking.ApiRequest$Options;
import com.stripe.android.model.ConfirmPaymentIntentParams;
import com.stripe.android.model.ConfirmSetupIntentParams;
import com.stripe.android.model.ConfirmStripeIntentParams;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.StripeIntent;
import com.stripe.android.networking.PaymentAnalyticsEvent;
import com.stripe.android.payments.paymentlauncher.InternalPaymentResult;
import h6.f1;
import h6.g1;
import h6.u0;
import java.util.List;
import java.util.Map;
import jt.z0;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.collections.MapsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationUnit;
import p10.y1;
import t70.m0;
import w70.i2;
import w70.u1;

/* loaded from: classes4.dex */
public final class n extends f1 {
    public static final List o = ul.b.P("payment_method");

    /* renamed from: a, reason: collision with root package name */
    public final boolean f44403a;

    /* renamed from: b, reason: collision with root package name */
    public final z0 f44404b;

    /* renamed from: c, reason: collision with root package name */
    public final ju.g f44405c;

    /* renamed from: d, reason: collision with root package name */
    public final du.a f44406d;

    /* renamed from: e, reason: collision with root package name */
    public final bs.e f44407e;

    /* renamed from: f, reason: collision with root package name */
    public final r40.a f44408f;

    /* renamed from: g, reason: collision with root package name */
    public final r40.a f44409g;

    /* renamed from: h, reason: collision with root package name */
    public final fr.l f44410h;

    /* renamed from: i, reason: collision with root package name */
    public final jt.a f44411i;

    /* renamed from: j, reason: collision with root package name */
    public final CoroutineContext f44412j;

    /* renamed from: k, reason: collision with root package name */
    public final u0 f44413k;

    /* renamed from: l, reason: collision with root package name */
    public final boolean f44414l;

    /* renamed from: m, reason: collision with root package name */
    public final ir.c f44415m;
    public final i2 n;

    public n(boolean z11, z0 z0Var, ju.g nextActionHandlerRegistry, du.a defaultReturnUrl, bs.e eVar, r40.a lazyPaymentIntentFlowResultProcessor, r40.a lazySetupIntentFlowResultProcessor, fr.l lVar, jt.a aVar, CoroutineContext uiContext, u0 u0Var, boolean z12, ir.c durationProvider) {
        Intrinsics.g(nextActionHandlerRegistry, "nextActionHandlerRegistry");
        Intrinsics.g(defaultReturnUrl, "defaultReturnUrl");
        Intrinsics.g(lazyPaymentIntentFlowResultProcessor, "lazyPaymentIntentFlowResultProcessor");
        Intrinsics.g(lazySetupIntentFlowResultProcessor, "lazySetupIntentFlowResultProcessor");
        Intrinsics.g(uiContext, "uiContext");
        Intrinsics.g(durationProvider, "durationProvider");
        this.f44403a = z11;
        this.f44404b = z0Var;
        this.f44405c = nextActionHandlerRegistry;
        this.f44406d = defaultReturnUrl;
        this.f44407e = eVar;
        this.f44408f = lazyPaymentIntentFlowResultProcessor;
        this.f44409g = lazySetupIntentFlowResultProcessor;
        this.f44410h = lVar;
        this.f44411i = aVar;
        this.f44412j = uiContext;
        this.f44413k = u0Var;
        this.f44414l = z12;
        this.f44415m = durationProvider;
        this.n = u1.c(null);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object e(n nVar, ConfirmStripeIntentParams confirmStripeIntentParams, String str, ContinuationImpl continuationImpl) {
        nu.e eVar;
        bs.e eVar2 = nVar.f44407e;
        z0 z0Var = nVar.f44404b;
        if (continuationImpl instanceof nu.e) {
            eVar = (nu.e) continuationImpl;
            int i5 = eVar.f78585v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                eVar.f78585v = i5 - Integer.MIN_VALUE;
            } else {
                eVar = new nu.e(nVar, continuationImpl);
            }
        }
        Object obj = eVar.f78583t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = eVar.f78585v;
        if (i11 != 0) {
            if (i11 != 1 && i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return ((Result) obj).f71688a;
        }
        ResultKt.b(obj);
        confirmStripeIntentParams.I0(str);
        ConfirmStripeIntentParams confirmStripeIntentParamsJ0 = confirmStripeIntentParams.J0();
        boolean z11 = confirmStripeIntentParamsJ0 instanceof ConfirmPaymentIntentParams;
        List list = o;
        if (z11) {
            ApiRequest$Options apiRequest$Options = (ApiRequest$Options) eVar2.get();
            eVar.f78585v = 1;
            Object objH = z0Var.h((ConfirmPaymentIntentParams) confirmStripeIntentParamsJ0, apiRequest$Options, list, eVar);
            if (objH != coroutineSingletons) {
                return objH;
            }
        } else {
            if (!(confirmStripeIntentParamsJ0 instanceof ConfirmSetupIntentParams)) {
                throw new NoWhenBranchMatchedException();
            }
            ApiRequest$Options apiRequest$Options2 = (ApiRequest$Options) eVar2.get();
            eVar.f78585v = 2;
            Object objJ = z0Var.j((ConfirmSetupIntentParams) confirmStripeIntentParamsJ0, apiRequest$Options2, list, eVar);
            if (objJ != coroutineSingletons) {
                return objJ;
            }
        }
        return coroutineSingletons;
    }

    public static void g(n nVar, InternalPaymentResult internalPaymentResult, StripeIntent stripeIntent, Map map, int i5) {
        String str;
        Map mapB;
        PaymentMethod n;
        PaymentMethod.Type type;
        String f43539g;
        if ((i5 & 2) != 0) {
            stripeIntent = null;
        }
        int i11 = i5 & 4;
        Map mapE0 = b70.h.f17594a;
        if (i11 != 0) {
            map = mapE0;
        }
        i2 i2Var = nVar.n;
        if (i2Var.getValue() != null) {
            return;
        }
        Boolean bool = (Boolean) nVar.f44413k.a("confirm_action_requested");
        PaymentAnalyticsEvent paymentAnalyticsEvent = bool != null ? bool.booleanValue() : true ? PaymentAnalyticsEvent.f44087q : PaymentAnalyticsEvent.f44089s;
        if (internalPaymentResult instanceof InternalPaymentResult.Completed) {
            str = "succeeded";
        } else if (internalPaymentResult instanceof InternalPaymentResult.Canceled) {
            str = "canceled";
        } else {
            if (!(internalPaymentResult instanceof InternalPaymentResult.Failed)) {
                throw new NoWhenBranchMatchedException();
            }
            str = "failed";
        }
        Map mapZ = y1.z(MapsKt.j0(new Pair("intent_id", (stripeIntent == null || (f43539g = stripeIntent.getF43539g()) == null) ? null : r70.k.p1(f43539g, "_secret_", f43539g)), new Pair("status", str), new Pair("payment_method_type", (stripeIntent == null || (n = stripeIntent.getN()) == null || (type = n.f43573e) == null) ? null : type.f43655a)));
        if (internalPaymentResult instanceof InternalPaymentResult.Failed) {
            int i12 = StripeException.f42562e;
            mapB = iu.a.b(p6.u.i(((InternalPaymentResult.Failed) internalPaymentResult).f44350a));
        } else {
            mapB = mapE0;
        }
        Duration durationA = ((ir.a) nVar.f44415m).a(ir.b.f68002h);
        if (durationA != null) {
            mapE0 = b70.k.e0(new Pair("duration", Long.valueOf(Duration.q(durationA.f72041a, DurationUnit.f72046e))));
        }
        nVar.f44410h.a(nVar.f44411i.a(paymentAnalyticsEvent, MapsKt.m0(MapsKt.m0(MapsKt.m0(map, mapZ), mapB), mapE0)));
        i2Var.k(null, internalPaymentResult);
    }

    public final void f(String clientSecret, ww.a aVar) {
        Intrinsics.g(clientSecret, "clientSecret");
        Boolean bool = (Boolean) this.f44413k.a("key_has_started");
        if (bool != null ? bool.booleanValue() : false) {
            return;
        }
        m0.t(g1.f(this), null, null, new androidx.room.p(this, clientSecret, aVar, (Continuation) null, 29), 3);
    }
}
