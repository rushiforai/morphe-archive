package com.stripe.android.challenge.confirmation;

import com.stripe.android.challenge.confirmation.IntentConfirmationChallengeActivityResult;
import iq.n;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import w70.t1;

/* loaded from: classes4.dex */
public final class e extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public int f42503t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f42504u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ n f42505v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(n nVar, Continuation continuation) {
        super(2, continuation);
        this.f42505v = nVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        e eVar = new e(this.f42505v, continuation);
        eVar.f42504u = obj;
        return eVar;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((e) create((iq.e) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:14:0x0035, code lost:
    
        if (r8.emit(r0, r7) == r2) goto L25;
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x004b, code lost:
    
        if (r1.emit(r0, r7) == r2) goto L25;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x0061, code lost:
    
        if (r1.emit(r0, r7) == r2) goto L25;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x0063, code lost:
    
        return r2;
     */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(Object obj) {
        n nVar = this.f42505v;
        t1 t1Var = nVar.f67989e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f42503t;
        if (i5 == 0) {
            ResultKt.b(obj);
            iq.e eVar = (iq.e) this.f42504u;
            if (eVar instanceof iq.c) {
                t1 t1Var2 = nVar.f67987c;
                Unit unit = Unit.f71706a;
                this.f42503t = 1;
            } else if (eVar instanceof iq.d) {
                IntentConfirmationChallengeActivityResult.Success success = new IntentConfirmationChallengeActivityResult.Success(((iq.d) eVar).f67964a);
                this.f42503t = 2;
            } else {
                if (!(eVar instanceof iq.b)) {
                    throw new NoWhenBranchMatchedException();
                }
                IntentConfirmationChallengeActivityResult.Failed failed = new IntentConfirmationChallengeActivityResult.Failed(((iq.b) eVar).f67962a);
                this.f42503t = 3;
            }
        } else {
            if (i5 != 1 && i5 != 2 && i5 != 3) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        return Unit.f71706a;
    }
}
