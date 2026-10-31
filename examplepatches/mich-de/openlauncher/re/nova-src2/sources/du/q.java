package du;

import android.content.Context;
import com.stripe.android.SetupIntentResult;
import com.stripe.android.StripeIntentResult;
import com.stripe.android.core.networking.ApiRequest$Options;
import com.stripe.android.model.SetupIntent;
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
public final class q extends i {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public q(Context context, Function0 publishableKeyProvider, c1 stripeRepository, xq.c logger, CoroutineContext workContext) {
        super(context, new y(publishableKeyProvider, 2), stripeRepository, logger, workContext);
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
        n nVar;
        if (continuationImpl instanceof n) {
            nVar = (n) continuationImpl;
            int i5 = nVar.f49572v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                nVar.f49572v = i5 - Integer.MIN_VALUE;
            } else {
                nVar = new n(this, continuationImpl);
            }
        }
        Object obj = nVar.f49570t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = nVar.f49572v;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return ((Result) obj).f71688a;
        }
        ResultKt.b(obj);
        nVar.f49572v = 1;
        Object objE = ((z0) this.f49557b).e(apiRequest$Options, str, str2, nVar);
        return objE == coroutineSingletons ? coroutineSingletons : objE;
    }

    @Override // du.i
    public final StripeIntentResult d(StripeIntent stripeIntent, int i5, String str) {
        return new SetupIntentResult((SetupIntent) stripeIntent, i5, str);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // du.i
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object f(String str, ApiRequest$Options apiRequest$Options, ContinuationImpl continuationImpl) {
        o oVar;
        if (continuationImpl instanceof o) {
            oVar = (o) continuationImpl;
            int i5 = oVar.f49575v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                oVar.f49575v = i5 - Integer.MIN_VALUE;
            } else {
                oVar = new o(this, continuationImpl);
            }
        }
        Object obj = oVar.f49573t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = oVar.f49575v;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return ((Result) obj).f71688a;
        }
        ResultKt.b(obj);
        oVar.f49575v = 1;
        Object objL = ((z0) this.f49557b).L(str, apiRequest$Options, oVar);
        return objL == coroutineSingletons ? coroutineSingletons : objL;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // du.i
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object g(String str, ApiRequest$Options apiRequest$Options, List list, ContinuationImpl continuationImpl) {
        p pVar;
        if (continuationImpl instanceof p) {
            pVar = (p) continuationImpl;
            int i5 = pVar.f49578v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                pVar.f49578v = i5 - Integer.MIN_VALUE;
            } else {
                pVar = new p(this, continuationImpl);
            }
        }
        Object obj = pVar.f49576t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = pVar.f49578v;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return ((Result) obj).f71688a;
        }
        ResultKt.b(obj);
        pVar.f49578v = 1;
        Object objR = ((z0) this.f49557b).R(str, apiRequest$Options, list, pVar);
        return objR == coroutineSingletons ? coroutineSingletons : objR;
    }
}
