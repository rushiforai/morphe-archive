package w70;

import java.util.NoSuchElementException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;

/* loaded from: classes.dex */
public final class c1 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public int f93869t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f93870u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ m f93871v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ t70.s f93872w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c1(m mVar, t70.s sVar, Continuation continuation) {
        super(2, continuation);
        this.f93871v = mVar;
        this.f93872w = sVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        c1 c1Var = new c1(this.f93871v, this.f93872w, continuation);
        c1Var.f93870u = obj;
        return c1Var;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((c1) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        Ref.ObjectRef objectRef;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f93869t;
        t70.s sVar = this.f93872w;
        try {
            if (i5 == 0) {
                ResultKt.b(obj);
                t70.j0 j0Var = (t70.j0) this.f93870u;
                Ref.ObjectRef objectRef2 = new Ref.ObjectRef();
                m mVar = this.f93871v;
                b1 b1Var = new b1(objectRef2, j0Var, sVar);
                this.f93870u = objectRef2;
                this.f93869t = 1;
                if (mVar.collect(b1Var, this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
                objectRef = objectRef2;
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                objectRef = (Ref.ObjectRef) this.f93870u;
                ResultKt.b(obj);
            }
            if (objectRef.f71863a == null) {
                int i11 = Result.f71687b;
                sVar.X(new Result(ResultKt.a(new NoSuchElementException("Flow is empty"))));
            }
            return Unit.f71706a;
        } catch (Throwable th2) {
            sVar.j0(th2);
            throw th2;
        }
    }
}
