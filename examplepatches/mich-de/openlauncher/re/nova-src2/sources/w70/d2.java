package w70;

import b.c9;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;

/* loaded from: classes5.dex */
public final class d2 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public int f93881t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f93882u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ x70.a0 f93883v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d2(x70.a0 a0Var, Continuation continuation) {
        super(2, continuation);
        this.f93883v = a0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        d2 d2Var = new d2(this.f93883v, continuation);
        d2Var.f93882u = obj;
        return d2Var;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) throws Throwable {
        ((d2) create((n) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
        return CoroutineSingletons.f71806a;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws Throwable {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f93881t;
        if (i5 != 0) {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            throw c9.o(obj);
        }
        ResultKt.b(obj);
        c2 c2Var = new c2(new Ref.BooleanRef(), (n) this.f93882u);
        this.f93881t = 1;
        this.f93883v.collect(c2Var, this);
        return coroutineSingletons;
    }
}
