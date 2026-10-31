package du;

import android.content.Context;
import com.stripe.android.PaymentIntentResult;
import com.stripe.android.StripeIntentResult;
import com.stripe.android.core.networking.ApiRequest$Options;
import com.stripe.android.model.PaymentIntent;
import com.stripe.android.model.StripeIntent;
import dq.y;
import java.util.List;
import jt.c1;
import jt.z0;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class m extends i {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m(Context context, Function0 publishableKeyProvider, c1 stripeRepository, xq.c logger, CoroutineContext workContext) {
        super(context, new y(publishableKeyProvider, 1), stripeRepository, logger, workContext);
        Intrinsics.g(context, "context");
        Intrinsics.g(publishableKeyProvider, "publishableKeyProvider");
        Intrinsics.g(stripeRepository, "stripeRepository");
        Intrinsics.g(logger, "logger");
        Intrinsics.g(workContext, "workContext");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // du.i
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(ApiRequest$Options apiRequest$Options, String str, String str2, ContinuationImpl continuationImpl) {
        j jVar;
        if (continuationImpl instanceof j) {
            jVar = (j) continuationImpl;
            int i5 = jVar.f49563v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                jVar.f49563v = i5 - Integer.MIN_VALUE;
            } else {
                jVar = new j(this, continuationImpl);
            }
        }
        Object obj = jVar.f49561t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = jVar.f49563v;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return ((Result) obj).f71688a;
        }
        ResultKt.b(obj);
        jVar.f49563v = 1;
        Object objD = ((z0) this.f49557b).d(apiRequest$Options, str, str2, jVar);
        return objD == coroutineSingletons ? coroutineSingletons : objD;
    }

    @Override // du.i
    public final StripeIntentResult d(StripeIntent stripeIntent, int i5, String str) {
        return new PaymentIntentResult((PaymentIntent) stripeIntent, i5, str);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // du.i
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object f(String str, ApiRequest$Options apiRequest$Options, ContinuationImpl continuationImpl) {
        k kVar;
        if (continuationImpl instanceof k) {
            kVar = (k) continuationImpl;
            int i5 = kVar.f49566v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                kVar.f49566v = i5 - Integer.MIN_VALUE;
            } else {
                kVar = new k(this, continuationImpl);
            }
        }
        Object obj = kVar.f49564t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = kVar.f49566v;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return ((Result) obj).f71688a;
        }
        ResultKt.b(obj);
        kVar.f49566v = 1;
        Object objK = ((z0) this.f49557b).K(str, apiRequest$Options, kVar);
        return objK == coroutineSingletons ? coroutineSingletons : objK;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // du.i
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object g(String str, ApiRequest$Options apiRequest$Options, List list, ContinuationImpl continuationImpl) {
        l lVar;
        if (continuationImpl instanceof l) {
            lVar = (l) continuationImpl;
            int i5 = lVar.f49569v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                lVar.f49569v = i5 - Integer.MIN_VALUE;
            } else {
                lVar = new l(this, continuationImpl);
            }
        }
        Object obj = lVar.f49567t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = lVar.f49569v;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return ((Result) obj).f71688a;
        }
        ResultKt.b(obj);
        lVar.f49569v = 1;
        Object objQ = ((z0) this.f49557b).Q(str, apiRequest$Options, list, lVar);
        return objQ == coroutineSingletons ? coroutineSingletons : objQ;
    }
}
