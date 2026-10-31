package dq;

import android.content.Context;
import android.content.Intent;
import com.stripe.android.core.exception.StripeException;
import com.stripe.android.core.networking.ApiRequest$Options;
import com.stripe.android.model.ConfirmPaymentIntentParams;
import com.stripe.android.model.ConfirmSetupIntentParams;
import com.stripe.android.model.ConfirmStripeIntentParams;
import com.stripe.android.model.StripeIntent;
import com.stripe.android.networking.PaymentAnalyticsEvent;
import com.stripe.android.payments.PaymentFlowResult$Unvalidated;
import com.vungle.ads.internal.protos.Sdk;
import java.util.List;
import java.util.concurrent.TimeUnit;
import jt.z0;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import t70.m0;
import t70.y0;

/* loaded from: classes4.dex */
public final class e0 {

    /* renamed from: l, reason: collision with root package name */
    public static final List f49312l = ul.b.P("payment_method");

    /* renamed from: m, reason: collision with root package name */
    public static final long f49313m = TimeUnit.SECONDS.toMillis(2);

    /* renamed from: a, reason: collision with root package name */
    public final Function0 f49314a;

    /* renamed from: b, reason: collision with root package name */
    public final z0 f49315b;

    /* renamed from: c, reason: collision with root package name */
    public final fr.l f49316c;

    /* renamed from: d, reason: collision with root package name */
    public final jt.a f49317d;

    /* renamed from: e, reason: collision with root package name */
    public final CoroutineContext f49318e;

    /* renamed from: f, reason: collision with root package name */
    public final du.m f49319f;

    /* renamed from: g, reason: collision with root package name */
    public final du.q f49320g;

    /* renamed from: h, reason: collision with root package name */
    public final du.a f49321h;

    /* renamed from: i, reason: collision with root package name */
    public final boolean f49322i;

    /* renamed from: j, reason: collision with root package name */
    public final cw.c0 f49323j;

    /* renamed from: k, reason: collision with root package name */
    public final ju.a f49324k;

    public e0(Context context, Function0 function0, z0 z0Var, CoroutineContext coroutineContext, int i5) throws ClassNotFoundException {
        if ((i5 & 16) != 0) {
            a80.e eVar = y0.f88884a;
            coroutineContext = a80.d.f488c;
        }
        CoroutineContext workContext = coroutineContext;
        xq.c cVar = xq.d.f96224b;
        fr.l lVar = new fr.l(cVar, workContext);
        Context applicationContext = context.getApplicationContext();
        Intrinsics.f(applicationContext, "getApplicationContext(...)");
        jt.a aVar = new jt.a(applicationContext, new y(function0, 0));
        a80.e eVar2 = y0.f88884a;
        u70.d uiContext = y70.o.f96819a;
        Intrinsics.g(workContext, "workContext");
        Intrinsics.g(uiContext, "uiContext");
        this.f49314a = function0;
        this.f49315b = z0Var;
        this.f49316c = lVar;
        this.f49317d = aVar;
        this.f49318e = uiContext;
        this.f49319f = new du.m(context, function0, z0Var, cVar, workContext);
        this.f49320g = new du.q(context, function0, z0Var, cVar, workContext);
        String packageName = context.getPackageName();
        Intrinsics.f(packageName, "getPackageName(...)");
        this.f49321h = new du.a(packageName);
        boolean zD = t2.c.D(context);
        this.f49322i = zD;
        this.f49323j = new cw.c0(this, 6);
        this.f49324k = a.a.L(context, aVar, false, workContext, uiContext, function0, aVar.f69752j, zD, false);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(ConfirmPaymentIntentParams confirmPaymentIntentParams, ApiRequest$Options apiRequest$Options, ContinuationImpl continuationImpl) {
        z zVar;
        if (continuationImpl instanceof z) {
            zVar = (z) continuationImpl;
            int i5 = zVar.f49380v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                zVar.f49380v = i5 - Integer.MIN_VALUE;
            } else {
                zVar = new z(this, continuationImpl);
            }
        }
        Object obj = zVar.f49378t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = zVar.f49380v;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return ((Result) obj).f71688a;
        }
        ResultKt.b(obj);
        ConfirmPaymentIntentParams confirmPaymentIntentParamsJ0 = confirmPaymentIntentParams.J0();
        zVar.f49380v = 1;
        Object objH = this.f49315b.h(confirmPaymentIntentParamsJ0, apiRequest$Options, f49312l, zVar);
        return objH == coroutineSingletons ? coroutineSingletons : objH;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(ConfirmSetupIntentParams confirmSetupIntentParams, ApiRequest$Options apiRequest$Options, ContinuationImpl continuationImpl) {
        a0 a0Var;
        if (continuationImpl instanceof a0) {
            a0Var = (a0) continuationImpl;
            int i5 = a0Var.f49293v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                a0Var.f49293v = i5 - Integer.MIN_VALUE;
            } else {
                a0Var = new a0(this, continuationImpl);
            }
        }
        Object obj = a0Var.f49291t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = a0Var.f49293v;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return ((Result) obj).f71688a;
        }
        ResultKt.b(obj);
        ConfirmSetupIntentParams confirmSetupIntentParamsB = confirmSetupIntentParams.J0();
        a0Var.f49293v = 1;
        Object objJ = this.f49315b.j(confirmSetupIntentParamsB, apiRequest$Options, f49312l, a0Var);
        return objJ == coroutineSingletons ? coroutineSingletons : objJ;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(Intent intent, ContinuationImpl continuationImpl) {
        b0 b0Var;
        PaymentFlowResult$Unvalidated paymentFlowResult$Unvalidated;
        if (continuationImpl instanceof b0) {
            b0Var = (b0) continuationImpl;
            int i5 = b0Var.f49297v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                b0Var.f49297v = i5 - Integer.MIN_VALUE;
            } else {
                b0Var = new b0(this, continuationImpl);
            }
        }
        Object obj = b0Var.f49295t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = b0Var.f49297v;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return ((Result) obj).f71688a;
        }
        ResultKt.b(obj);
        if (intent == null || (paymentFlowResult$Unvalidated = (PaymentFlowResult$Unvalidated) intent.getParcelableExtra("extra_args")) == null) {
            paymentFlowResult$Unvalidated = new PaymentFlowResult$Unvalidated((String) null, 0, (StripeException) null, false, (String) null, (String) null, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE);
        }
        b0Var.f49297v = 1;
        Object objE = this.f49319f.e(paymentFlowResult$Unvalidated, b0Var);
        return objE == coroutineSingletons ? coroutineSingletons : objE;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(Intent intent, ContinuationImpl continuationImpl) {
        c0 c0Var;
        PaymentFlowResult$Unvalidated paymentFlowResult$Unvalidated;
        if (continuationImpl instanceof c0) {
            c0Var = (c0) continuationImpl;
            int i5 = c0Var.f49300v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c0Var.f49300v = i5 - Integer.MIN_VALUE;
            } else {
                c0Var = new c0(this, continuationImpl);
            }
        }
        Object obj = c0Var.f49298t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c0Var.f49300v;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return ((Result) obj).f71688a;
        }
        ResultKt.b(obj);
        if (intent == null || (paymentFlowResult$Unvalidated = (PaymentFlowResult$Unvalidated) intent.getParcelableExtra("extra_args")) == null) {
            paymentFlowResult$Unvalidated = new PaymentFlowResult$Unvalidated((String) null, 0, (StripeException) null, false, (String) null, (String) null, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE);
        }
        c0Var.f49300v = 1;
        Object objE = this.f49320g.e(paymentFlowResult$Unvalidated, c0Var);
        return objE == coroutineSingletons ? coroutineSingletons : objE;
    }

    /* JADX WARN: Code restructure failed: missing block: B:39:0x00c1, code lost:
    
        if (r4 == r6) goto L68;
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x00c5, code lost:
    
        r7 = r21;
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x00e0, code lost:
    
        if (r4 == r6) goto L68;
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x0104, code lost:
    
        if (r1 == r6) goto L68;
     */
    /* JADX WARN: Code restructure failed: missing block: B:67:0x013a, code lost:
    
        if (r1 == r6) goto L68;
     */
    /* JADX WARN: Code restructure failed: missing block: B:68:0x013c, code lost:
    
        return r6;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object e(ww.a aVar, ConfirmStripeIntentParams confirmStripeIntentParams, ApiRequest$Options apiRequest$Options, ContinuationImpl continuationImpl) throws Throwable {
        d0 d0Var;
        String f43190f;
        Object objB;
        e0 e0Var;
        int i5;
        ww.a aVar2 = aVar;
        ConfirmStripeIntentParams params = confirmStripeIntentParams;
        ApiRequest$Options apiRequest$Options2 = apiRequest$Options;
        if (continuationImpl instanceof d0) {
            d0Var = (d0) continuationImpl;
            int i11 = d0Var.f49307z;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                d0Var.f49307z = i11 - Integer.MIN_VALUE;
            } else {
                d0Var = new d0(this, continuationImpl);
            }
        }
        Object obj = d0Var.f49305x;
        Object obj2 = CoroutineSingletons.f71806a;
        int i12 = d0Var.f49307z;
        if (i12 == 0) {
            ResultKt.b(obj);
            String f43190f2 = params.getF43210d();
            du.a aVar3 = this.f49321h;
            this.f49316c.a(jt.a.c(this.f49317d, Intrinsics.b(f43190f2, aVar3.a()) ? PaymentAnalyticsEvent.A : f43190f2 == null ? PaymentAnalyticsEvent.f44096z : PaymentAnalyticsEvent.B, null, null, null, null, 62));
            if (this.f49322i) {
                f43190f = params.getF43210d();
            } else {
                f43190f = params.getF43210d();
                if (f43190f == null || r70.k.U0(f43190f)) {
                    f43190f = null;
                }
                if (f43190f == null) {
                    f43190f = aVar3.a();
                }
            }
            if (params instanceof ConfirmPaymentIntentParams) {
                ConfirmPaymentIntentParams confirmPaymentIntentParams = (ConfirmPaymentIntentParams) params;
                confirmPaymentIntentParams.f43190f = f43190f;
                d0Var.f49301t = this;
                d0Var.f49302u = aVar2;
                d0Var.f49303v = params;
                d0Var.f49304w = apiRequest$Options2;
                d0Var.f49307z = 1;
                objB = a(confirmPaymentIntentParams, apiRequest$Options2, d0Var);
            } else {
                if (!(params instanceof ConfirmSetupIntentParams)) {
                    throw new NoWhenBranchMatchedException();
                }
                ConfirmSetupIntentParams confirmSetupIntentParams = (ConfirmSetupIntentParams) params;
                confirmSetupIntentParams.f43210d = f43190f;
                d0Var.f49301t = this;
                d0Var.f49302u = aVar2;
                d0Var.f49303v = params;
                d0Var.f49304w = apiRequest$Options2;
                d0Var.f49307z = 2;
                objB = b(confirmSetupIntentParams, apiRequest$Options2, d0Var);
            }
        } else {
            if (i12 != 1 && i12 != 2) {
                if (i12 != 3 && i12 != 4) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return Unit.f71706a;
            }
            ApiRequest$Options apiRequest$Options3 = d0Var.f49304w;
            params = d0Var.f49303v;
            ww.a aVar4 = d0Var.f49302u;
            e0Var = d0Var.f49301t;
            ResultKt.b(obj);
            objB = ((Result) obj).f71688a;
            apiRequest$Options2 = apiRequest$Options3;
            aVar2 = aVar4;
        }
        ww.a aVar5 = aVar2;
        e0 e0Var2 = e0Var;
        Throwable thA = Result.a(objB);
        if (thA == null) {
            StripeIntent stripeIntent = (StripeIntent) objB;
            d0Var.f49301t = null;
            d0Var.f49302u = null;
            d0Var.f49303v = null;
            d0Var.f49304w = null;
            d0Var.f49307z = 3;
            Object objC = e0Var2.f49324k.b(stripeIntent).c(aVar5, stripeIntent, apiRequest$Options2, d0Var);
            if (objC != obj2) {
                objC = Unit.f71706a;
            }
        } else {
            Intrinsics.g(params, "params");
            if (params instanceof ConfirmPaymentIntentParams) {
                i5 = 50000;
            } else {
                if (!(params instanceof ConfirmSetupIntentParams)) {
                    throw new NoWhenBranchMatchedException();
                }
                i5 = 50001;
            }
            int i13 = i5;
            d0Var.f49301t = null;
            d0Var.f49302u = null;
            d0Var.f49303v = null;
            d0Var.f49304w = null;
            d0Var.f49307z = 4;
            Object objY = m0.y(e0Var2.f49318e, new com.stripe.android.d(e0Var2, aVar5, thA, i13, null), d0Var);
            if (objY != obj2) {
                objY = Unit.f71706a;
            }
        }
    }
}
