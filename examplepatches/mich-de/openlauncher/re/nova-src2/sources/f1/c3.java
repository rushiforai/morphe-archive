package f1;

import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;

/* loaded from: classes2.dex */
public final class c3 {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f53423a;

    /* renamed from: b, reason: collision with root package name */
    public final y f53424b;

    public c3(d3 d3Var, y3.c cVar, Function1 function1, c0.m mVar, boolean z11) {
        this.f53423a = z11;
        this.f53424b = new y(d3Var, new cw.c0(cVar, 19), new d00.t(cVar, 21), mVar, function1);
        if (z11 && d3Var == d3.f53458c) {
            throw new IllegalArgumentException("The initial value must not be set to HalfExpanded if skipHalfExpanded is set to true.");
        }
    }

    public static Object a(c3 c3Var, d3 d3Var, SuspendLambda suspendLambda) {
        Object objU = p10.c0.u(c3Var.f53424b, d3Var, c3Var.f53424b.f54118h.m(), suspendLambda);
        return objU == CoroutineSingletons.f71806a ? objU : Unit.f71706a;
    }

    public final Object b(SuspendLambda suspendLambda) {
        Object objA = a(this, d3.f53456a, suspendLambda);
        return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
    }

    public final boolean c() {
        return ((p1.s2) this.f53424b.f54114d).getValue() != d3.f53456a;
    }
}
