package com.stripe.android.stripe3ds2.transaction;

import com.stripe.android.stripe3ds2.transaction.ChallengeRequestResult;
import com.stripe.android.stripe3ds2.transactions.ChallengeRequestData;
import java.util.concurrent.TimeUnit;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import t70.t0;

/* loaded from: classes4.dex */
public final class g implements wv.b {

    /* renamed from: e, reason: collision with root package name */
    public static final long f45130e = TimeUnit.SECONDS.toMillis(1);

    /* renamed from: a, reason: collision with root package name */
    public final ChallengeRequestData f45131a;

    /* renamed from: b, reason: collision with root package name */
    public final tv.d f45132b;

    /* renamed from: c, reason: collision with root package name */
    public final a0 f45133c;

    /* renamed from: d, reason: collision with root package name */
    public final CoroutineContext f45134d;

    public g(ChallengeRequestData creqData, tv.d errorReporter, wv.c creqExecutorFactory, CoroutineContext workContext) {
        Intrinsics.g(creqData, "creqData");
        Intrinsics.g(errorReporter, "errorReporter");
        Intrinsics.g(creqExecutorFactory, "creqExecutorFactory");
        Intrinsics.g(workContext, "workContext");
        a0 a0VarA = ((y) creqExecutorFactory).a(errorReporter, workContext);
        this.f45131a = creqData;
        this.f45132b = errorReporter;
        this.f45133c = a0VarA;
        this.f45134d = workContext;
    }

    /* JADX WARN: Can't wrap try/catch for region: R(9:0|2|(2:4|(1:6)(1:7))(0)|8|(1:(1:(8:12|40|13|27|32|(1:34)|35|(1:44)(2:38|39))(2:17|18))(1:19))(3:20|(0)|25)|42|23|(6:26|27|32|(0)|35|(0)(0))|25) */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x006e, code lost:
    
        r9 = th;
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x006f, code lost:
    
        r6 = r8;
        r8 = r7;
        r7 = r6;
     */
    /* JADX WARN: Removed duplicated region for block: B:34:0x007e  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00b2  */
    /* JADX WARN: Removed duplicated region for block: B:44:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(g gVar, ChallengeRequestData challengeRequestData, ContinuationImpl continuationImpl) {
        wv.a aVar;
        g gVar2;
        ChallengeRequestData challengeRequestData2;
        Object objA;
        Throwable thA;
        gVar.getClass();
        if (continuationImpl instanceof wv.a) {
            aVar = (wv.a) continuationImpl;
            int i5 = aVar.f94703x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                aVar.f94703x = i5 - Integer.MIN_VALUE;
            } else {
                aVar = new wv.a(gVar, continuationImpl);
            }
        }
        Object objB = aVar.f94701v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = aVar.f94703x;
        if (i11 == 0) {
            ResultKt.b(objB);
            aVar.f94699t = gVar;
            aVar.f94700u = challengeRequestData;
            aVar.f94703x = 1;
            if (t0.b(f45130e, aVar) != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            challengeRequestData2 = aVar.f94700u;
            gVar2 = aVar.f94699t;
            try {
                ResultKt.b(objB);
                objA = (ChallengeRequestResult) objB;
                int i12 = Result.f71687b;
            } catch (Throwable th2) {
                th = th2;
                int i13 = Result.f71687b;
                objA = ResultKt.a(th);
                thA = Result.a(objA);
                if (thA != null) {
                }
                Throwable thA2 = Result.a(objA);
                if (thA2 != null) {
                }
            }
            thA = Result.a(objA);
            if (thA != null) {
                tv.d dVar = gVar2.f45132b;
                challengeRequestData2.getClass();
                ((tv.c) dVar).c(new RuntimeException(r70.f.o0("\n                            Failed to execute challenge request.\n\n                            CReq = " + ChallengeRequestData.a(challengeRequestData2, null, null, null, 3935) + "\n                        "), thA));
            }
            Throwable thA22 = Result.a(objA);
            return thA22 != null ? objA : new ChallengeRequestResult.RuntimeError(thA22);
        }
        challengeRequestData = aVar.f94700u;
        gVar = aVar.f94699t;
        ResultKt.b(objB);
        int i14 = Result.f71687b;
        a0 a0Var = gVar.f45133c;
        aVar.f94699t = gVar;
        aVar.f94700u = challengeRequestData;
        aVar.f94703x = 2;
        objB = a0Var.b(challengeRequestData, aVar);
        if (objB != coroutineSingletons) {
            ChallengeRequestData challengeRequestData3 = challengeRequestData;
            gVar2 = gVar;
            challengeRequestData2 = challengeRequestData3;
            objA = (ChallengeRequestResult) objB;
            int i122 = Result.f71687b;
            thA = Result.a(objA);
            if (thA != null) {
            }
            Throwable thA222 = Result.a(objA);
            if (thA222 != null) {
            }
        }
        return coroutineSingletons;
    }
}
