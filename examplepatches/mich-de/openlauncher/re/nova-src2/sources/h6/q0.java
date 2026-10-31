package h6;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class q0 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public int f59417t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f59418u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ u f59419v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ t f59420w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ SuspendLambda f59421x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Multi-variable type inference failed */
    public q0(u uVar, t tVar, Function2 function2, Continuation continuation) {
        super(2, continuation);
        this.f59419v = uVar;
        this.f59420w = tVar;
        this.f59421x = (SuspendLambda) function2;
    }

    /* JADX WARN: Type inference failed for: r2v0, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function2] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        q0 q0Var = new q0(this.f59419v, this.f59420w, this.f59421x, continuation);
        q0Var.f59418u = obj;
        return q0Var;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((q0) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Type inference failed for: r8v8, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function2] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws Throwable {
        v vVar;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f59417t;
        if (i5 != 0) {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            vVar = (v) this.f59418u;
            try {
                ResultKt.b(obj);
                vVar.a();
                return obj;
            } catch (Throwable th2) {
                th = th2;
                vVar.a();
                throw th;
            }
        }
        ResultKt.b(obj);
        t70.r1 r1Var = (t70.r1) ((t70.j0) this.f59418u).getCoroutineContext().get(t70.q1.f88853a);
        if (r1Var == null) {
            throw new IllegalStateException("when[State] methods should have a parent job");
        }
        p0 p0Var = new p0();
        v vVar2 = new v(this.f59419v, this.f59420w, p0Var.f59413c, r1Var);
        try {
            ?? r82 = this.f59421x;
            this.f59418u = vVar2;
            this.f59417t = 1;
            obj = t70.m0.y(p0Var, r82, this);
            if (obj == coroutineSingletons) {
                return coroutineSingletons;
            }
            vVar = vVar2;
            vVar.a();
            return obj;
        } catch (Throwable th3) {
            th = th3;
            vVar = vVar2;
            vVar.a();
            throw th;
        }
    }
}
