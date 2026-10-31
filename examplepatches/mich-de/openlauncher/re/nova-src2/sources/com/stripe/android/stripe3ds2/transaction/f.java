package com.stripe.android.stripe3ds2.transaction;

import com.stripe.android.stripe3ds2.transaction.ChallengeAction;
import com.stripe.android.stripe3ds2.transactions.ChallengeRequestData;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import t70.j0;

/* loaded from: classes4.dex */
public final class f extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public int f45127t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ g f45128u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ ChallengeAction f45129v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f(g gVar, ChallengeAction challengeAction, Continuation continuation) {
        super(2, continuation);
        this.f45128u = gVar;
        this.f45129v = challengeAction;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new f(this.f45128u, this.f45129v, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((f) create((j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        ChallengeRequestData challengeRequestDataA;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f45127t;
        if (i5 != 0) {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return obj;
        }
        ResultKt.b(obj);
        g gVar = this.f45128u;
        ChallengeRequestData challengeRequestData = gVar.f45131a;
        ChallengeRequestData challengeRequestData2 = new ChallengeRequestData(challengeRequestData.f45153a, challengeRequestData.f45154b, challengeRequestData.f45155c, challengeRequestData.f45156d, challengeRequestData.f45157e, challengeRequestData.f45161i, 3808);
        ChallengeAction challengeAction = this.f45129v;
        if (challengeAction instanceof ChallengeAction.NativeForm) {
            ChallengeAction.NativeForm nativeForm = (ChallengeAction.NativeForm) challengeAction;
            challengeRequestDataA = ChallengeRequestData.a(challengeRequestData2, nativeForm.f45066a, null, nativeForm.f45067b, 2015);
        } else if (challengeAction instanceof ChallengeAction.HtmlForm) {
            challengeRequestDataA = ChallengeRequestData.a(challengeRequestData2, null, ((ChallengeAction.HtmlForm) challengeAction).f45065a, null, 3967);
        } else if (challengeAction instanceof ChallengeAction.Oob) {
            challengeRequestDataA = ChallengeRequestData.a(challengeRequestData2, null, null, ((ChallengeAction.Oob) challengeAction).f45068a, 1535);
        } else if (challengeAction instanceof ChallengeAction.Resend) {
            challengeRequestDataA = ChallengeRequestData.a(challengeRequestData2, null, null, null, 3071);
        } else {
            if (!(challengeAction instanceof ChallengeAction.Cancel)) {
                throw new NoWhenBranchMatchedException();
            }
            xv.a aVar = xv.a.f96415b;
            challengeRequestDataA = ChallengeRequestData.a(challengeRequestData2, null, null, null, 4031);
        }
        this.f45127t = 1;
        Object objA = g.a(gVar, challengeRequestDataA, this);
        return objA == coroutineSingletons ? coroutineSingletons : objA;
    }
}
