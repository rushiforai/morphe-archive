package f1;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class p extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public int f53828t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f53829u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ Function0 f53830v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ Function2 f53831w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p(Function0 function0, Function2 function2, Continuation continuation) {
        super(2, continuation);
        this.f53830v = function0;
        this.f53831w = function2;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        p pVar = new p(this.f53830v, this.f53831w, continuation);
        pVar.f53829u = obj;
        return pVar;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((p) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f53828t;
        if (i5 == 0) {
            ResultKt.b(obj);
            t70.j0 j0Var = (t70.j0) this.f53829u;
            Ref.ObjectRef objectRef = new Ref.ObjectRef();
            w70.p1 p1VarN = androidx.compose.runtime.d.n(this.f53830v);
            o oVar = new o(objectRef, j0Var, this.f53831w);
            this.f53828t = 1;
            if (p1VarN.collect(oVar, this) == coroutineSingletons) {
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
