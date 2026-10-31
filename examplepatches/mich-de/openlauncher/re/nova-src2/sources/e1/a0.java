package e1;

import g0.t2;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.RestrictedSuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class a0 extends RestrictedSuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f51225t;

    /* renamed from: u, reason: collision with root package name */
    public int f51226u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f51227v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ Function1 f51228w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ a0(Function1 function1, Continuation continuation, int i5) {
        super(2, continuation);
        this.f51225t = i5;
        this.f51228w = function1;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f51225t) {
            case 0:
                a0 a0Var = new a0(this.f51228w, continuation, 0);
                a0Var.f51227v = obj;
                return a0Var;
            default:
                a0 a0Var2 = new a0(this.f51228w, continuation, 1);
                a0Var2.f51227v = obj;
                return a0Var2;
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        v2.b bVar = (v2.b) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f51225t) {
            case 0:
                ((a0) create(bVar, continuation)).invokeSuspend(Unit.f71706a);
                return CoroutineSingletons.f71806a;
            default:
                return ((a0) create(bVar, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x005d  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x008e A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:33:0x008f  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:33:0x008f -> B:34:0x0092). Please report as a decompilation issue!!! */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(Object obj) {
        v2.b bVar;
        Object objF;
        v2.b bVar2;
        v2.t tVar;
        int i5 = this.f51225t;
        Function1 function1 = this.f51228w;
        switch (i5) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i11 = this.f51226u;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    bVar = (v2.b) this.f51227v;
                    v2.n nVar = v2.n.f91980a;
                    this.f51227v = bVar;
                    this.f51226u = 1;
                    v2.j0 j0Var = (v2.j0) bVar;
                    objF = j0Var.f(nVar, this);
                    if (objF == coroutineSingletons) {
                    }
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    v2.b bVar3 = (v2.b) this.f51227v;
                    ResultKt.b(obj);
                    function1.invoke(Boolean.valueOf(!b0.d((v2.m) obj)));
                    bVar = bVar3;
                    v2.n nVar2 = v2.n.f91980a;
                    this.f51227v = bVar;
                    this.f51226u = 1;
                    v2.j0 j0Var2 = (v2.j0) bVar;
                    objF = j0Var2.f(nVar2, this);
                    if (objF == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    bVar3 = j0Var2;
                    obj = objF;
                    function1.invoke(Boolean.valueOf(!b0.d((v2.m) obj)));
                    bVar = bVar3;
                    v2.n nVar22 = v2.n.f91980a;
                    this.f51227v = bVar;
                    this.f51226u = 1;
                    v2.j0 j0Var22 = (v2.j0) bVar;
                    objF = j0Var22.f(nVar22, this);
                    if (objF == coroutineSingletons) {
                    }
                }
            default:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i12 = this.f51226u;
                if (i12 == 0) {
                    ResultKt.b(obj);
                    bVar2 = (v2.b) this.f51227v;
                    this.f51227v = bVar2;
                    this.f51226u = 1;
                    obj = ps.j0.k(bVar2, this);
                    if (obj == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i12 != 1) {
                        if (i12 != 2) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        ResultKt.b(obj);
                        tVar = (v2.t) obj;
                        if (tVar != null) {
                            tVar.a();
                        }
                        return Unit.f71706a;
                    }
                    bVar2 = (v2.b) this.f51227v;
                    ResultKt.b(obj);
                }
                v2.t tVar2 = (v2.t) obj;
                tVar2.a();
                function1.invoke(new h2.b(tVar2.f91992c));
                this.f51227v = null;
                this.f51226u = 2;
                g0.h0 h0Var = t2.f56708a;
                obj = t2.i(bVar2, v2.n.f91981b, this);
                if (obj == coroutineSingletons2) {
                    return coroutineSingletons2;
                }
                tVar = (v2.t) obj;
                if (tVar != null) {
                }
                return Unit.f71706a;
        }
    }
}
