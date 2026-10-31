package l1;

import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;

/* loaded from: classes2.dex */
public final class f6 {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f73300a;

    /* renamed from: b, reason: collision with root package name */
    public final f1.y f73301b;

    public f6(boolean z11, y3.c cVar, g6 g6Var, Function1 function1) {
        this.f73300a = z11;
        if (z11 && g6Var == g6.f73350c) {
            throw new IllegalArgumentException("The initial value must not be set to PartiallyExpanded if skipPartiallyExpanded is set to true.");
        }
        this.f73301b = new f1.y(g6Var, new androidx.fragment.app.p(cVar, 21), new c3.c1(cVar, 16), (c0.m) d6.f73191b, function1);
    }

    public static Object a(f6 f6Var, g6 g6Var, SuspendLambda suspendLambda) {
        f1.y yVar = f6Var.f73301b;
        Object objB = androidx.compose.material3.internal.a.b(yVar, g6Var, yVar.f54118h.m(), suspendLambda);
        return objB == CoroutineSingletons.f71806a ? objB : Unit.f71706a;
    }

    public final Object b(SuspendLambda suspendLambda) {
        Object objA = a(this, g6.f73348a, suspendLambda);
        return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
    }

    public final boolean c() {
        return ((p1.s2) this.f73301b.f54114d).getValue() != g6.f73348a;
    }

    public final Object d(SuspendLambda suspendLambda) {
        if (this.f73300a) {
            throw new IllegalStateException("Attempted to animate to partial expanded when skipPartiallyExpanded was enabled. Set skipPartiallyExpanded to false to use this function.");
        }
        Object objA = a(this, g6.f73350c, suspendLambda);
        return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
    }
}
