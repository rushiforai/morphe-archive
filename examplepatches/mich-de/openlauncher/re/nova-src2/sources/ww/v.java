package ww;

import com.stripe.android.PaymentConfiguration;
import com.stripe.android.core.networking.ApiRequest$Options;
import com.stripe.android.model.MobileCardElementConfig;
import h6.f1;
import h6.g1;
import java.util.Map;
import jt.z0;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import t70.y0;
import w70.i2;
import w70.u1;

/* loaded from: classes4.dex */
public final class v extends f1 {

    /* renamed from: a, reason: collision with root package name */
    public final wm.b f94850a;

    /* renamed from: b, reason: collision with root package name */
    public final z0 f94851b;

    /* renamed from: c, reason: collision with root package name */
    public final t70.c0 f94852c;

    /* renamed from: d, reason: collision with root package name */
    public final i2 f94853d;

    /* renamed from: e, reason: collision with root package name */
    public final i2 f94854e;

    /* renamed from: f, reason: collision with root package name */
    public String f94855f;

    public v(wm.b bVar, z0 z0Var) {
        a80.e eVar = y0.f88884a;
        a80.d dispatcher = a80.d.f488c;
        Intrinsics.g(dispatcher, "dispatcher");
        this.f94850a = bVar;
        this.f94851b = z0Var;
        this.f94852c = dispatcher;
        i2 i2VarC = u1.c(Boolean.FALSE);
        this.f94853d = i2VarC;
        this.f94854e = i2VarC;
        t70.m0.t(g1.f(this), dispatcher, null, new tx.h0(this, null, 14), 2);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object e(v vVar, ContinuationImpl continuationImpl) {
        u uVar;
        Object objM;
        MobileCardElementConfig.CardBrandChoice cardBrandChoice;
        if (continuationImpl instanceof u) {
            uVar = (u) continuationImpl;
            int i5 = uVar.f94848v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                uVar.f94848v = i5 - Integer.MIN_VALUE;
            } else {
                uVar = new u(vVar, continuationImpl);
            }
        }
        Object obj = uVar.f94846t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = uVar.f94848v;
        if (i11 == 0) {
            ResultKt.b(obj);
            PaymentConfiguration paymentConfiguration = (PaymentConfiguration) vVar.f94850a.get();
            z0 z0Var = vVar.f94851b;
            ApiRequest$Options apiRequest$Options = new ApiRequest$Options(paymentConfiguration.f42440a, paymentConfiguration.f42441b, 4);
            String str = vVar.f94855f;
            Map mapN = str != null ? a80.m.n("on_behalf_of", str) : null;
            uVar.f94848v = 1;
            objM = z0Var.M(apiRequest$Options, mapN, uVar);
            if (objM == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            objM = ((Result) obj).f71688a;
        }
        int i12 = Result.f71687b;
        MobileCardElementConfig mobileCardElementConfig = (MobileCardElementConfig) (objM instanceof Result.Failure ? null : objM);
        return Boolean.valueOf((mobileCardElementConfig == null || (cardBrandChoice = mobileCardElementConfig.f43526a) == null) ? false : cardBrandChoice.f43527a);
    }
}
