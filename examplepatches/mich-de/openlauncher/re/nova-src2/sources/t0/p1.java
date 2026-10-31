package t0;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function3;

/* loaded from: classes2.dex */
public final class p1 extends SuspendLambda implements Function3 {

    /* renamed from: t, reason: collision with root package name */
    public int f88167t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ g0.e1 f88168u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ long f88169v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ t70.j0 f88170w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ p1.e1 f88171x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ i0.i f88172y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p1(t70.j0 j0Var, p1.e1 e1Var, i0.i iVar, Continuation continuation) {
        super(3, continuation);
        this.f88170w = j0Var;
        this.f88171x = e1Var;
        this.f88172y = iVar;
    }

    @Override // kotlin.jvm.functions.Function3
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        long j11 = ((h2.b) obj2).f59016a;
        p1.e1 e1Var = this.f88171x;
        i0.i iVar = this.f88172y;
        p1 p1Var = new p1(this.f88170w, e1Var, iVar, (Continuation) obj3);
        p1Var.f88168u = (g0.e1) obj;
        p1Var.f88169v = j11;
        return p1Var.invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f88167t;
        t70.j0 j0Var = this.f88170w;
        if (i5 == 0) {
            ResultKt.b(obj);
            g0.e1 e1Var = this.f88168u;
            t70.m0.t(j0Var, null, null, new e0.b(this.f88171x, this.f88169v, this.f88172y, (Continuation) null, 10), 3);
            this.f88167t = 1;
            obj = e1Var.tryAwaitRelease(this);
            if (obj == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        t70.m0.t(j0Var, null, null, new b30.d(this.f88171x, ((Boolean) obj).booleanValue(), this.f88172y, (Continuation) null), 3);
        return Unit.f71706a;
    }
}
