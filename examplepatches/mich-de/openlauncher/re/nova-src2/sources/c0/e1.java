package c0;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import p1.s2;

/* loaded from: classes2.dex */
public final class e1 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public int f18767t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f18768u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ Object f18769v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ Object f18770w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ i1 f18771x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ c2 f18772y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ float f18773z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e1(Object obj, Object obj2, i1 i1Var, c2 c2Var, float f11, Continuation continuation) {
        super(2, continuation);
        this.f18769v = obj;
        this.f18770w = obj2;
        this.f18771x = i1Var;
        this.f18772y = c2Var;
        this.f18773z = f11;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        e1 e1Var = new e1(this.f18769v, this.f18770w, this.f18771x, this.f18772y, this.f18773z, continuation);
        e1Var.f18768u = obj;
        return e1Var;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((e1) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f18767t;
        i1 i1Var = this.f18771x;
        if (i5 == 0) {
            ResultKt.b(obj);
            t70.j0 j0Var = (t70.j0) this.f18768u;
            Object obj2 = this.f18769v;
            Object obj3 = this.f18770w;
            Continuation continuation = null;
            if (Intrinsics.b(obj2, obj3)) {
                i1Var.R = null;
                if (Intrinsics.b(((s2) i1Var.f18831l).getValue(), obj2)) {
                    return Unit.f71706a;
                }
            } else {
                i1.j(i1Var);
            }
            boolean zB = Intrinsics.b(obj2, obj3);
            float f11 = this.f18773z;
            if (!zB) {
                c2 c2Var = this.f18772y;
                c2Var.q(obj2);
                c2Var.o(0L);
                ((s2) i1Var.f18830f).setValue(obj2);
                c2Var.k(f11);
            }
            i1Var.v(f11);
            if (i1Var.Q.e()) {
                t70.m0.t(j0Var, null, null, new a60.a(i1Var, continuation, 29), 3);
            } else {
                i1Var.P = Long.MIN_VALUE;
            }
            this.f18767t = 1;
            if (i1.m(i1Var, this) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        i1Var.u();
        return Unit.f71706a;
    }
}
