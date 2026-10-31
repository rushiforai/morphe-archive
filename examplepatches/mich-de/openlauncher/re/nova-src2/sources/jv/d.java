package jv;

import b.c9;
import kotlin.KotlinNothingValueException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import w70.g2;

/* loaded from: classes4.dex */
public final class d extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f69997t;

    /* renamed from: u, reason: collision with root package name */
    public int f69998u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ bo.c f69999v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ d(bo.c cVar, Continuation continuation, int i5) {
        super(2, continuation);
        this.f69997t = i5;
        this.f69999v = cVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f69997t) {
            case 0:
                return new d(this.f69999v, continuation, 0);
            default:
                return new d(this.f69999v, continuation, 1);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        t70.j0 j0Var = (t70.j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f69997t) {
            case 0:
                ((d) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
                break;
            default:
                ((d) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
                break;
        }
        return CoroutineSingletons.f71806a;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f69997t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f69998u;
                if (i5 != 0) {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    throw c9.o(obj);
                }
                ResultKt.b(obj);
                bo.c cVar = this.f69999v;
                uw.c cVar2 = (uw.c) cVar.f18342i;
                c cVar3 = new c(cVar, 0);
                this.f69998u = 1;
                cVar2.collect(cVar3, this);
                return coroutineSingletons;
            default:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i11 = this.f69998u;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    bo.c cVar4 = this.f69999v;
                    g2 g2Var = (g2) cVar4.f18334a;
                    c cVar5 = new c(cVar4, 1);
                    this.f69998u = 1;
                    if (g2Var.collect(cVar5, this) == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                throw new KotlinNothingValueException();
        }
    }
}
