package wv;

import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.stripe.android.stripe3ds2.transactions.ChallengeRequestData;
import com.stripe.android.stripe3ds2.transactions.ErrorData;
import com.vungle.ads.internal.protos.Sdk;
import java.util.concurrent.TimeUnit;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import t70.t0;
import w70.i2;
import w70.u1;

/* loaded from: classes4.dex */
public final class h implements p {

    /* renamed from: a, reason: collision with root package name */
    public final i f94724a;

    /* renamed from: b, reason: collision with root package name */
    public final ChallengeRequestData f94725b;

    /* renamed from: c, reason: collision with root package name */
    public final long f94726c;

    /* renamed from: d, reason: collision with root package name */
    public final i2 f94727d;

    /* renamed from: e, reason: collision with root package name */
    public final i2 f94728e;

    public h(int i5, i errorRequestExecutor, ChallengeRequestData creqData) {
        Intrinsics.g(errorRequestExecutor, "errorRequestExecutor");
        Intrinsics.g(creqData, "creqData");
        this.f94724a = errorRequestExecutor;
        this.f94725b = creqData;
        this.f94726c = TimeUnit.MINUTES.toMillis(i5);
        i2 i2VarC = u1.c(Boolean.FALSE);
        this.f94727d = i2VarC;
        this.f94728e = i2VarC;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(ContinuationImpl continuationImpl) {
        g gVar;
        h hVar;
        if (continuationImpl instanceof g) {
            gVar = (g) continuationImpl;
            int i5 = gVar.f94723w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                gVar.f94723w = i5 - Integer.MIN_VALUE;
            } else {
                gVar = new g(this, continuationImpl);
            }
        }
        Object obj = gVar.f94721u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = gVar.f94723w;
        if (i11 == 0) {
            ResultKt.b(obj);
            gVar.f94720t = this;
            gVar.f94723w = 1;
            if (t0.b(this.f94726c, gVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
            hVar = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            hVar = gVar.f94720t;
            ResultKt.b(obj);
        }
        i iVar = hVar.f94724a;
        ChallengeRequestData challengeRequestData = hVar.f94725b;
        String str = challengeRequestData.f45154b;
        String str2 = challengeRequestData.f45155c;
        xv.c cVar = xv.c.f96423c;
        String strValueOf = String.valueOf(TTAdConstant.AD_ID_IS_NULL_CODE);
        w.a aVar = xv.b.f96418b;
        ((n) iVar).a(new ErrorData(str, str2, strValueOf, "Transaction timed-out.", "Timeout expiry reached for the transaction", null, challengeRequestData.f45153a, challengeRequestData.f45156d, Sdk.SDKError.Reason.OMSDK_DOWNLOAD_JS_ERROR_VALUE));
        i2 i2Var = hVar.f94727d;
        Boolean bool = Boolean.TRUE;
        i2Var.getClass();
        i2Var.k(null, bool);
        return Unit.f71706a;
    }
}
