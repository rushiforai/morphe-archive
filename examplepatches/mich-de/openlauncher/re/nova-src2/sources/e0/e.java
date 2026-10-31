package e0;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class e extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f49961t;

    /* renamed from: u, reason: collision with root package name */
    public int f49962u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ g f49963v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ i0.k f49964w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ e(g gVar, i0.k kVar, Continuation continuation, int i5) {
        super(2, continuation);
        this.f49961t = i5;
        this.f49963v = gVar;
        this.f49964w = kVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f49961t) {
            case 0:
                return new e(this.f49963v, this.f49964w, continuation, 0);
            case 1:
                return new e(this.f49963v, this.f49964w, continuation, 1);
            default:
                return new e(this.f49963v, this.f49964w, continuation, 2);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        t70.j0 j0Var = (t70.j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f49961t) {
        }
        return ((e) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f49961t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f49962u;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    i0.i iVar = this.f49963v.f49980a;
                    if (iVar != null) {
                        i0.j jVar = new i0.j(this.f49964w);
                        this.f49962u = 1;
                        if (iVar.a(jVar, this) == coroutineSingletons) {
                            return coroutineSingletons;
                        }
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
                int i11 = this.f49962u;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    i0.i iVar2 = this.f49963v.f49980a;
                    if (iVar2 != null) {
                        this.f49962u = 1;
                        if (iVar2.a(this.f49964w, this) == coroutineSingletons2) {
                            return coroutineSingletons2;
                        }
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
                int i12 = this.f49962u;
                if (i12 == 0) {
                    ResultKt.b(obj);
                    i0.i iVar3 = this.f49963v.f49980a;
                    if (iVar3 != null) {
                        i0.l lVar = new i0.l(this.f49964w);
                        this.f49962u = 1;
                        if (iVar3.a(lVar, this) == coroutineSingletons3) {
                            return coroutineSingletons3;
                        }
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
