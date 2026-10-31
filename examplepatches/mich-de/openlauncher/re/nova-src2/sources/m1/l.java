package m1;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;
import w70.p1;

/* loaded from: classes2.dex */
public final class l extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public int f75710t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f75711u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ Function0 f75712v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ Function2 f75713w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l(Function0 function0, Function2 function2, Continuation continuation) {
        super(2, continuation);
        this.f75712v = function0;
        this.f75713w = function2;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        l lVar = new l(this.f75712v, this.f75713w, continuation);
        lVar.f75711u = obj;
        return lVar;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((l) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f75710t;
        if (i5 == 0) {
            ResultKt.b(obj);
            t70.j0 j0Var = (t70.j0) this.f75711u;
            Ref.ObjectRef objectRef = new Ref.ObjectRef();
            p1 p1VarN = androidx.compose.runtime.d.n(this.f75712v);
            k kVar = new k(objectRef, j0Var, this.f75713w);
            this.f75710t = 1;
            if (p1VarN.collect(kVar, this) == coroutineSingletons) {
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
