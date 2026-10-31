package ku;

import com.stripe.android.core.exception.StripeException;
import com.stripe.android.core.networking.ApiRequest$Options;
import com.stripe.android.stripe3ds2.transaction.ChallengeResult;
import fr.n0;
import jt.c1;
import jt.z0;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import t70.t0;

/* loaded from: classes4.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public final c1 f72228a;

    /* renamed from: b, reason: collision with root package name */
    public final fr.l f72229b;

    /* renamed from: c, reason: collision with root package name */
    public final jt.a f72230c;

    /* renamed from: d, reason: collision with root package name */
    public final n0 f72231d;

    /* renamed from: e, reason: collision with root package name */
    public final xq.c f72232e;

    /* renamed from: f, reason: collision with root package name */
    public final CoroutineContext f72233f;

    public d(c1 stripeRepository, fr.l analyticsRequestExecutor, jt.a paymentAnalyticsRequestFactory, n0 retryDelaySupplier, xq.c logger, CoroutineContext workContext) {
        Intrinsics.g(stripeRepository, "stripeRepository");
        Intrinsics.g(analyticsRequestExecutor, "analyticsRequestExecutor");
        Intrinsics.g(paymentAnalyticsRequestFactory, "paymentAnalyticsRequestFactory");
        Intrinsics.g(retryDelaySupplier, "retryDelaySupplier");
        Intrinsics.g(logger, "logger");
        Intrinsics.g(workContext, "workContext");
        this.f72228a = stripeRepository;
        this.f72229b = analyticsRequestExecutor;
        this.f72230c = paymentAnalyticsRequestFactory;
        this.f72231d = retryDelaySupplier;
        this.f72232e = logger;
        this.f72233f = workContext;
    }

    /* JADX WARN: Code restructure failed: missing block: B:27:0x009a, code lost:
    
        if (r11 == r0) goto L28;
     */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(ChallengeResult challengeResult, ApiRequest$Options apiRequest$Options, int i5, ContinuationImpl continuationImpl) {
        a aVar;
        Object objF;
        d dVar;
        if (continuationImpl instanceof a) {
            aVar = (a) continuationImpl;
            int i11 = aVar.f72216z;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                aVar.f72216z = i11 - Integer.MIN_VALUE;
            } else {
                aVar = new a(this, continuationImpl);
            }
        }
        a aVar2 = aVar;
        Object objB = aVar2.f72214x;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = aVar2.f72216z;
        if (i12 == 0) {
            ResultKt.b(objB);
            String str = challengeResult.getF45105c().f45115b;
            aVar2.f72210t = this;
            aVar2.f72211u = challengeResult;
            aVar2.f72212v = apiRequest$Options;
            aVar2.f72213w = i5;
            aVar2.f72216z = 1;
            objF = ((z0) this.f72228a).f(str, apiRequest$Options, aVar2);
            if (objF != coroutineSingletons) {
                dVar = this;
            }
            return coroutineSingletons;
        }
        if (i12 != 1) {
            if (i12 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objB);
            Boolean bool = (Boolean) objB;
            bool.getClass();
            return bool;
        }
        i5 = aVar2.f72213w;
        apiRequest$Options = aVar2.f72212v;
        challengeResult = aVar2.f72211u;
        dVar = aVar2.f72210t;
        ResultKt.b(objB);
        objF = ((Result) objB).f71688a;
        ApiRequest$Options apiRequest$Options2 = apiRequest$Options;
        int i13 = i5;
        Throwable thA = Result.a(objF);
        if (thA == null) {
            dVar.f72232e.a("3DS2 challenge completion request was successful. " + (3 - i13) + " retries attempted.");
            return Boolean.TRUE;
        }
        aVar2.f72210t = null;
        aVar2.f72211u = null;
        aVar2.f72212v = null;
        aVar2.f72216z = 2;
        objB = dVar.b(challengeResult, apiRequest$Options2, i13, thA, aVar2);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(ChallengeResult challengeResult, ApiRequest$Options apiRequest$Options, int i5, Throwable th2, ContinuationImpl continuationImpl) {
        b bVar;
        d dVar;
        if (continuationImpl instanceof b) {
            bVar = (b) continuationImpl;
            int i11 = bVar.f72223z;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                bVar.f72223z = i11 - Integer.MIN_VALUE;
            } else {
                bVar = new b(this, continuationImpl);
            }
        }
        Object obj = bVar.f72221x;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = bVar.f72223z;
        if (i12 == 0) {
            ResultKt.b(obj);
            xq.c cVar = this.f72232e;
            cVar.b("3DS2 challenge completion request failed. Remaining retries: " + i5, th2);
            boolean z11 = th2 instanceof StripeException ? ((StripeException) th2).f42566d : false;
            if (i5 <= 0 || !z11) {
                cVar.a("Did not make a successful 3DS2 challenge completion request after retrying.");
                return Boolean.FALSE;
            }
            long jA = this.f72231d.a(i5);
            bVar.f72217t = this;
            bVar.f72218u = challengeResult;
            bVar.f72219v = apiRequest$Options;
            bVar.f72220w = i5;
            bVar.f72223z = 1;
            if (t0.c(jA, bVar) != coroutineSingletons) {
                dVar = this;
            }
        }
        if (i12 != 1) {
            if (i12 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return obj;
        }
        i5 = bVar.f72220w;
        apiRequest$Options = bVar.f72219v;
        challengeResult = bVar.f72218u;
        dVar = bVar.f72217t;
        ResultKt.b(obj);
        bVar.f72217t = null;
        bVar.f72218u = null;
        bVar.f72219v = null;
        bVar.f72223z = 2;
        Object objA = dVar.a(challengeResult, apiRequest$Options, i5 - 1, bVar);
        return objA == coroutineSingletons ? coroutineSingletons : objA;
    }
}
