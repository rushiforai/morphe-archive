package l1;

import java.util.Map;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class w3 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f74159t;

    /* renamed from: u, reason: collision with root package name */
    public int f74160u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ f6 f74161v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ w3(f6 f6Var, Continuation continuation, int i5) {
        super(2, continuation);
        this.f74159t = i5;
        this.f74161v = f6Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f74159t) {
            case 0:
                return new w3(this.f74161v, continuation, 0);
            case 1:
                return new w3(this.f74161v, continuation, 1);
            case 2:
                return new w3(this.f74161v, continuation, 2);
            case 3:
                return new w3(this.f74161v, continuation, 3);
            case 4:
                return new w3(this.f74161v, continuation, 4);
            default:
                return new w3(this.f74161v, continuation, 5);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        t70.j0 j0Var = (t70.j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f74159t) {
        }
        return ((w3) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f74159t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f74160u;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    this.f74160u = 1;
                    if (this.f74161v.d(this) == coroutineSingletons) {
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
                int i11 = this.f74160u;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    this.f74160u = 1;
                    if (this.f74161v.b(this) == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 2:
                Object obj2 = CoroutineSingletons.f71806a;
                int i12 = this.f74160u;
                if (i12 == 0) {
                    ResultKt.b(obj);
                    this.f74160u = 1;
                    f6 f6Var = this.f74161v;
                    Map map = f6Var.f73301b.h().f75679a;
                    g6 g6Var = g6.f73350c;
                    if (!map.containsKey(g6Var)) {
                        g6Var = g6.f73349b;
                    }
                    Object objA = f6.a(f6Var, g6Var, this);
                    if (objA != obj2) {
                        objA = Unit.f71706a;
                    }
                    if (objA == obj2) {
                        return obj2;
                    }
                } else {
                    if (i12 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 3:
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                int i13 = this.f74160u;
                if (i13 == 0) {
                    ResultKt.b(obj);
                    this.f74160u = 1;
                    if (this.f74161v.b(this) == coroutineSingletons3) {
                        return coroutineSingletons3;
                    }
                } else {
                    if (i13 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 4:
                Object obj3 = CoroutineSingletons.f71806a;
                int i14 = this.f74160u;
                if (i14 == 0) {
                    ResultKt.b(obj);
                    this.f74160u = 1;
                    f1.y yVar = this.f74161v.f73301b;
                    Object objB = androidx.compose.material3.internal.a.b(yVar, g6.f73349b, yVar.f54118h.m(), this);
                    if (objB != obj3) {
                        objB = Unit.f71706a;
                    }
                    if (objB == obj3) {
                        return obj3;
                    }
                } else {
                    if (i14 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            default:
                CoroutineSingletons coroutineSingletons4 = CoroutineSingletons.f71806a;
                int i15 = this.f74160u;
                if (i15 == 0) {
                    ResultKt.b(obj);
                    this.f74160u = 1;
                    if (this.f74161v.d(this) == coroutineSingletons4) {
                        return coroutineSingletons4;
                    }
                } else {
                    if (i15 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
        }
    }
}
