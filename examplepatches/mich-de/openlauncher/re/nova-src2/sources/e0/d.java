package e0;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class d extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f49938t;

    /* renamed from: u, reason: collision with root package name */
    public int f49939u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ i0.k f49940v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ i0.i f49941w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d(i0.i iVar, i0.k kVar, Continuation continuation) {
        super(2, continuation);
        this.f49938t = 2;
        this.f49941w = iVar;
        this.f49940v = kVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f49938t) {
            case 0:
                return new d(this.f49940v, this.f49941w, continuation, 0);
            case 1:
                return new d(this.f49940v, this.f49941w, continuation, 1);
            default:
                return new d(this.f49941w, this.f49940v, continuation);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        t70.j0 j0Var = (t70.j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f49938t) {
        }
        return ((d) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f49938t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f49939u;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    i0.j jVar = new i0.j(this.f49940v);
                    this.f49939u = 1;
                    if (this.f49941w.a(jVar, this) == coroutineSingletons) {
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
                int i11 = this.f49939u;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    i0.l lVar = new i0.l(this.f49940v);
                    this.f49939u = 1;
                    if (this.f49941w.a(lVar, this) == coroutineSingletons2) {
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
                int i12 = this.f49939u;
                if (i12 == 0) {
                    ResultKt.b(obj);
                    this.f49939u = 1;
                    if (this.f49941w.a(this.f49940v, this) == coroutineSingletons3) {
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

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ d(i0.k kVar, i0.i iVar, Continuation continuation, int i5) {
        super(2, continuation);
        this.f49938t = i5;
        this.f49940v = kVar;
        this.f49941w = iVar;
    }
}
