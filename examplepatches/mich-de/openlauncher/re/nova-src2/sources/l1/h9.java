package l1;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class h9 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f73403t;

    /* renamed from: u, reason: collision with root package name */
    public int f73404u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ l9 f73405v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ float f73406w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ h9(l9 l9Var, float f11, Continuation continuation, int i5) {
        super(2, continuation);
        this.f73403t = i5;
        this.f73405v = l9Var;
        this.f73406w = f11;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f73403t) {
            case 0:
                return new h9(this.f73405v, this.f73406w, continuation, 0);
            default:
                return new h9(this.f73405v, this.f73406w, continuation, 1);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        t70.j0 j0Var = (t70.j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f73403t) {
        }
        return ((h9) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f73403t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f73404u;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    l9 l9Var = this.f73405v;
                    c0.e eVar = l9Var.f73616e;
                    if (eVar != null) {
                        Float f11 = new Float(this.f73406w);
                        c0.m mVar = l9Var.f73614c ? androidx.compose.material3.a.f14094f : androidx.compose.material3.a.f14095g;
                        this.f73404u = 1;
                        obj = c0.e.d(eVar, f11, mVar, null, this, 12);
                        if (obj == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                    }
                    return Unit.f71706a;
                }
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return Unit.f71706a;
            default:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i11 = this.f73404u;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    l9 l9Var2 = this.f73405v;
                    c0.e eVar2 = l9Var2.f73615d;
                    if (eVar2 == null) {
                        return Unit.f71706a;
                    }
                    Float f12 = new Float(this.f73406w);
                    c0.m mVar2 = l9Var2.f73614c ? androidx.compose.material3.a.f14094f : androidx.compose.material3.a.f14095g;
                    this.f73404u = 1;
                    obj = c0.e.d(eVar2, f12, mVar2, null, this, 12);
                    if (obj == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
        }
    }
}
