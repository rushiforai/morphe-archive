package w70;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Ref;

/* loaded from: classes.dex */
public final class r extends SuspendLambda implements Function1 {

    /* renamed from: t, reason: collision with root package name */
    public int f93993t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ n f93994u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f93995v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r(Continuation continuation, Ref.ObjectRef objectRef, n nVar) {
        super(1, continuation);
        this.f93994u = nVar;
        this.f93995v = objectRef;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Continuation continuation) {
        return new r(continuation, this.f93995v, this.f93994u);
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        return ((r) create((Continuation) obj)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f93993t;
        Ref.ObjectRef objectRef = this.f93995v;
        if (i5 == 0) {
            ResultKt.b(obj);
            w50.g gVar = x70.b.f95216b;
            Object obj2 = objectRef.f71863a;
            if (obj2 == gVar) {
                obj2 = null;
            }
            this.f93993t = 1;
            if (this.f93994u.emit(obj2, this) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        objectRef.f71863a = null;
        return Unit.f71706a;
    }
}
