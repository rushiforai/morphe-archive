package as;

import android.content.Context;
import com.google.android.gms.wallet.IsReadyToPayRequest;
import com.stripe.android.CardBrandFilter;
import com.stripe.android.CardFundingFilter;
import com.stripe.android.GooglePayJsonFactory$BillingAddressParameters;
import com.stripe.android.core.exception.StripeException;
import java.util.List;
import kotlin.LazyKt;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import t70.p2;

/* loaded from: classes4.dex */
public final class e implements c0 {

    /* renamed from: a, reason: collision with root package name */
    public final Context f15589a;

    /* renamed from: b, reason: collision with root package name */
    public final j f15590b;

    /* renamed from: c, reason: collision with root package name */
    public final GooglePayJsonFactory$BillingAddressParameters f15591c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f15592d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f15593e;

    /* renamed from: f, reason: collision with root package name */
    public final g f15594f;

    /* renamed from: g, reason: collision with root package name */
    public final iu.f f15595g;

    /* renamed from: h, reason: collision with root package name */
    public final xq.c f15596h;

    /* renamed from: i, reason: collision with root package name */
    public final List f15597i;

    /* renamed from: j, reason: collision with root package name */
    public final dq.i f15598j;

    /* renamed from: k, reason: collision with root package name */
    public final a70.d f15599k;

    public e(Context context, j environment, GooglePayJsonFactory$BillingAddressParameters googlePayJsonFactory$BillingAddressParameters, boolean z11, boolean z12, g gVar, iu.f errorReporter, xq.c logger, CardBrandFilter cardBrandFilter, CardFundingFilter cardFundingFilter, List additionalEnabledNetworks) {
        Intrinsics.g(context, "context");
        Intrinsics.g(environment, "environment");
        Intrinsics.g(errorReporter, "errorReporter");
        Intrinsics.g(logger, "logger");
        Intrinsics.g(cardBrandFilter, "cardBrandFilter");
        Intrinsics.g(cardFundingFilter, "cardFundingFilter");
        Intrinsics.g(additionalEnabledNetworks, "additionalEnabledNetworks");
        this.f15589a = context;
        this.f15590b = environment;
        this.f15591c = googlePayJsonFactory$BillingAddressParameters;
        this.f15592d = z11;
        this.f15593e = z12;
        this.f15594f = gVar;
        this.f15595g = errorReporter;
        this.f15596h = logger;
        this.f15597i = additionalEnabledNetworks;
        this.f15598j = new dq.i(new com.google.android.gms.internal.consent_sdk.w(context), additionalEnabledNetworks, cardBrandFilter, cardFundingFilter, 2);
        this.f15599k = LazyKt.a(new c(this, 0));
    }

    /* JADX WARN: Removed duplicated region for block: B:41:0x00b9  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00d3  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(e eVar, ContinuationImpl continuationImpl) {
        d dVar;
        Object objA;
        e eVar2;
        Throwable th2;
        Object objA2;
        Throwable thA;
        boolean zBooleanValue;
        if (continuationImpl instanceof d) {
            dVar = (d) continuationImpl;
            int i5 = dVar.f15586x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                dVar.f15586x = i5 - Integer.MIN_VALUE;
            } else {
                dVar = new d(eVar, continuationImpl);
            }
        }
        Object objE = dVar.f15584v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = dVar.f15586x;
        Continuation continuation = null;
        if (i11 == 0) {
            ResultKt.b(objE);
            try {
                int i12 = Result.f71687b;
                String string = eVar.f15598j.b(eVar.f15591c, Boolean.valueOf(eVar.f15592d), Boolean.valueOf(eVar.f15593e)).toString();
                IsReadyToPayRequest isReadyToPayRequest = new IsReadyToPayRequest();
                sg.w.i(string, "isReadyToPayRequestJson cannot be null!");
                isReadyToPayRequest.f33849k = string;
                objA = isReadyToPayRequest;
            } catch (Throwable th3) {
                int i13 = Result.f71687b;
                objA = ResultKt.a(th3);
            }
            Throwable thA2 = Result.a(objA);
            if (thA2 != null) {
                iu.f fVar = eVar.f15595g;
                iu.e eVar3 = iu.e.f68091f;
                int i14 = StripeException.f42562e;
                t2.c.L(fVar, eVar3, p6.u.i(thA2), null, 4);
                eVar.f15596h.b("Google Pay json parsing failed.", thA2);
                return Boolean.FALSE;
            }
            IsReadyToPayRequest isReadyToPayRequest2 = (IsReadyToPayRequest) objA;
            try {
                Duration.Companion companion = Duration.f72038b;
                long jG = DurationKt.g(30, DurationUnit.f72046e);
                ar.a aVar = new ar.a(eVar, isReadyToPayRequest2, continuation, 19);
                dVar.f15582t = eVar;
                dVar.f15583u = eVar;
                dVar.f15586x = 1;
                objE = p2.e(jG, aVar, dVar);
                if (objE == coroutineSingletons) {
                    return coroutineSingletons;
                }
                eVar2 = eVar;
            } catch (Throwable th4) {
                eVar2 = eVar;
                th2 = th4;
                int i15 = Result.f71687b;
                objA2 = ResultKt.a(th2);
                thA = Result.a(objA2);
                if (thA != null) {
                }
                Boolean bool = Boolean.FALSE;
                if (objA2 instanceof Result.Failure) {
                }
                Boolean bool2 = (Boolean) objA2;
                boolean zBooleanValue2 = bool2.booleanValue();
                eVar2.f15596h.c("Google Pay ready? " + zBooleanValue2);
                return bool2;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            eVar = dVar.f15583u;
            eVar2 = dVar.f15582t;
            try {
                ResultKt.b(objE);
            } catch (Throwable th5) {
                th2 = th5;
                int i152 = Result.f71687b;
                objA2 = ResultKt.a(th2);
                thA = Result.a(objA2);
                if (thA != null) {
                }
                Boolean bool3 = Boolean.FALSE;
                if (objA2 instanceof Result.Failure) {
                }
                Boolean bool22 = (Boolean) objA2;
                boolean zBooleanValue22 = bool22.booleanValue();
                eVar2.f15596h.c("Google Pay ready? " + zBooleanValue22);
                return bool22;
            }
        }
        Boolean bool4 = (Boolean) objE;
        if (bool4 != null) {
            zBooleanValue = bool4.booleanValue();
        } else {
            t2.c.L(eVar.f15595g, iu.c.f68055f, null, null, 6);
            zBooleanValue = false;
        }
        objA2 = Boolean.valueOf(zBooleanValue);
        int i16 = Result.f71687b;
        thA = Result.a(objA2);
        if (thA != null) {
            iu.f fVar2 = eVar2.f15595g;
            iu.c cVar = iu.c.f68054e;
            int i17 = StripeException.f42562e;
            t2.c.L(fVar2, cVar, p6.u.i(thA), null, 4);
            eVar2.f15596h.b("Google Pay check failed.", thA);
        }
        Boolean bool32 = Boolean.FALSE;
        if (objA2 instanceof Result.Failure) {
            objA2 = bool32;
        }
        Boolean bool222 = (Boolean) objA2;
        boolean zBooleanValue222 = bool222.booleanValue();
        eVar2.f15596h.c("Google Pay ready? " + zBooleanValue222);
        return bool222;
    }

    public e(Context context, j jVar, GooglePayJsonFactory$BillingAddressParameters googlePayJsonFactory$BillingAddressParameters, boolean z11, boolean z12, iu.f fVar, xq.c cVar, CardBrandFilter cardBrandFilter, CardFundingFilter cardFundingFilter) {
        this(context, jVar, googlePayJsonFactory$BillingAddressParameters, z11, z12, new g(context), fVar, cVar, cardBrandFilter, cardFundingFilter, EmptyList.f71733a);
    }
}
