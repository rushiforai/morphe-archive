package d20;

import g0.t2;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.RestrictedSuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;

/* loaded from: classes4.dex */
public final class m extends RestrictedSuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public int f48912t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f48913u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f48914v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m(Ref.ObjectRef objectRef, Continuation continuation) {
        super(2, continuation);
        this.f48914v = objectRef;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        m mVar = new m(this.f48914v, continuation);
        mVar.f48913u = obj;
        return mVar;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((m) create((v2.b) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f48912t;
        if (i5 == 0) {
            ResultKt.b(obj);
            v2.b bVar = (v2.b) this.f48913u;
            v2.n nVar = v2.n.f91980a;
            this.f48912t = 1;
            if (t2.c(bVar, this, 1) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        Function0 function0 = (Function0) this.f48914v.f71863a;
        if (function0 != null) {
            function0.invoke();
        }
        return Unit.f71706a;
    }
}
