package g0;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;

/* loaded from: classes2.dex */
public final class j0 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f56588t;

    /* renamed from: u, reason: collision with root package name */
    public int f56589u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f56590v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ k0 f56591w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ long f56592x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ j0(k0 k0Var, long j11, Continuation continuation, int i5) {
        super(2, continuation);
        this.f56588t = i5;
        this.f56591w = k0Var;
        this.f56592x = j11;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f56588t) {
            case 0:
                j0 j0Var = new j0(this.f56591w, this.f56592x, continuation, 0);
                j0Var.f56590v = obj;
                return j0Var;
            default:
                j0 j0Var2 = new j0(this.f56591w, this.f56592x, continuation, 1);
                j0Var2.f56590v = obj;
                return j0Var2;
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        t70.j0 j0Var = (t70.j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f56588t) {
        }
        return ((j0) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        int i5 = this.f56588t;
        long j11 = this.f56592x;
        k0 k0Var = this.f56591w;
        switch (i5) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i11 = this.f56589u;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    t70.j0 j0Var = (t70.j0) this.f56590v;
                    Function3 function3 = k0Var.f56606m;
                    h2.b bVar = new h2.b(j11);
                    this.f56589u = 1;
                    if (function3.invoke(j0Var, bVar, this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            default:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i12 = this.f56589u;
                if (i12 == 0) {
                    ResultKt.b(obj);
                    t70.j0 j0Var2 = (t70.j0) this.f56590v;
                    Function3 function32 = k0Var.n;
                    long jH = y3.r.h(k0Var.o ? -1.0f : 1.0f, j11);
                    d1 d1Var = k0Var.f56604k;
                    h0 h0Var = i0.f56576a;
                    Float f11 = new Float(d1Var == d1.f56493a ? y3.r.e(jH) : y3.r.d(jH));
                    this.f56589u = 1;
                    if (function32.invoke(j0Var2, f11, this) == coroutineSingletons2) {
                        return coroutineSingletons2;
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
