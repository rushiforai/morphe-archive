package gx;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final class s extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f58186t;

    /* renamed from: u, reason: collision with root package name */
    public int f58187u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ b0 f58188v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ String f58189w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ s(b0 b0Var, String str, Continuation continuation, int i5) {
        super(2, continuation);
        this.f58186t = i5;
        this.f58188v = b0Var;
        this.f58189w = str;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f58186t) {
            case 0:
                return new s(this.f58188v, this.f58189w, continuation, 0);
            case 1:
                return new s(this.f58188v, this.f58189w, continuation, 1);
            default:
                return new s(this.f58188v, this.f58189w, continuation, 2);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        t70.j0 j0Var = (t70.j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f58186t) {
        }
        return ((s) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f58186t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f58187u;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    ex.y yVar = this.f58188v.f58034i;
                    this.f58187u = 1;
                    Object objB = yVar.b(this.f58189w, this);
                    if (objB != coroutineSingletons) {
                        objB = Unit.f71706a;
                    }
                    if (objB == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 1:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i11 = this.f58187u;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    ex.y yVar2 = this.f58188v.f58034i;
                    this.f58187u = 1;
                    Object objB2 = yVar2.b(this.f58189w, this);
                    if (objB2 != coroutineSingletons2) {
                        objB2 = Unit.f71706a;
                    }
                    if (objB2 == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            default:
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                int i12 = this.f58187u;
                if (i12 == 0) {
                    ResultKt.b(obj);
                    ex.y yVar3 = this.f58188v.f58034i;
                    this.f58187u = 1;
                    Object objB3 = yVar3.b(this.f58189w, this);
                    if (objB3 != coroutineSingletons3) {
                        objB3 = Unit.f71706a;
                    }
                    if (objB3 == coroutineSingletons3) {
                        return coroutineSingletons3;
                    }
                } else {
                    if (i12 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
        }
    }
}
