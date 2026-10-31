package com.stripe.android.challenge.confirmation;

import com.stripe.android.challenge.confirmation.IntentConfirmationChallengeActivityResult;
import iq.n;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import t70.j0;
import w70.t1;

/* loaded from: classes4.dex */
public final class d extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public int f42500t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ n f42501u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ iq.a f42502v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d(n nVar, iq.a aVar, Continuation continuation) {
        super(2, continuation);
        this.f42501u = nVar;
        this.f42502v = aVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new d(this.f42501u, this.f42502v, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((d) create((j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f42500t;
        if (i5 == 0) {
            ResultKt.b(obj);
            t1 t1Var = this.f42501u.f67989e;
            IntentConfirmationChallengeActivityResult.Failed failed = new IntentConfirmationChallengeActivityResult.Failed(this.f42502v);
            this.f42500t = 1;
            if (t1Var.emit(failed, this) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        return Unit.f71706a;
    }
}
